codeunit 90025 ListDictionariesPTE
{
    procedure DoSomething()
    var
        SalesLine: Record "Sales Line";
        ProcessedOrders: Dictionary of [Code[20], List of [Integer]];
        LineNumbers: List of [Integer];
    begin
        SalesLine.SetFilter("Qty. to Ship", '>%1', 0);
        if SalesLine.FindSet(false) then
            repeat
                if not ProcessedOrders.ContainsKey(SalesLine."Document No.") then begin
                    Clear(LineNumbers);
                    ProcessedOrders.Add(SalesLine."Document No.", LineNumbers);
                end else
                    LineNumbers := ProcessedOrders.Get(SalesLine."Document No.");

                if not LineNumbers.Contains(SalesLine."Line No.") then begin
                    // Do some processing here
                    LineNumbers.Add(SalesLine."Line No.");
                    ProcessedOrders.Set(SalesLine."Document No.", LineNumbers);
                end;
            until SalesLine.Next() = 0;
    end;

    procedure GetCatWeightForDictionary() CatWeight: Dictionary of [Code[20], Decimal]
    var
        CatPTE: Record "CatPTE";
    begin
        if CatPTE.FindSet() then
            repeat
                if not CatWeight.ContainsKey(CatPTE."No.") then
                    CatWeight.Add(CatPTE."No.", CatPTE.Weight)
                else
                    CatWeight.Set(CatPTE."No.", CatPTE.Weight);
            until CatPTE.Next() = 0;
    end;

    procedure GetListOfUniqueBreedsOfAdoptedCats()
    var
        CatPTE: Record "CatPTE";
        CatBreed: Record "Cat BreedPTE";
        UniqueBreeds: List of [Code[10]];
    begin
        CatPTE.SetRange(Adopted, true);
        if CatPTE.FindSet(false) then
            repeat
                CatBreed.SetRange("Cat No.", CatPTE."No.");
                if CatBreed.FindSet(false) then
                    repeat
                        if not UniqueBreeds.Contains(CatBreed."Breed Code") then
                            UniqueBreeds.Add(CatBreed."Breed Code");
                    until CatBreed.Next() = 0;
            until CatPTE.Next() = 0;

        Message('Unique Breeds Count: %1', UniqueBreeds.Count());
    end;

    procedure GetAdoptedBreedDictionaryWithListOfCats()
    var
        CatPTE: Record "CatPTE";
        CatBreed: Record "Cat BreedPTE";
        BreedDictionary: Dictionary of [Code[10], List of [Code[20]]];
        CatList: List of [Code[20]];
        TotalWeight: Decimal;
    begin
        CatPTE.SetRange(Adopted, true);
        if CatPTE.FindSet(false) then
            repeat
                CatBreed.SetRange("Cat No.", CatPTE."No.");
                if CatBreed.FindSet(false) then
                    repeat
                        if not BreedDictionary.ContainsKey(CatBreed."Breed Code") then begin
                            Clear(CatList);
                            BreedDictionary.Add(CatBreed."Breed Code", CatList);
                        end else
                            CatList := BreedDictionary.Get(CatBreed."Breed Code");

                        if not CatList.Contains(CatPTE."No.") then begin
                            // Do some processing here
                            TotalWeight += CatPTE.Weight;
                            CatList.Add(CatPTE."No.");
                            BreedDictionary.Set(CatBreed."Breed Code", CatList);
                        end;
                    until CatBreed.Next() = 0;
            until CatPTE.Next() = 0;

        Message('Unique Breeds Count: %1. Total Weight: %2', BreedDictionary.Count(), TotalWeight);
    end;

    procedure DoSomethingLikeADinosaur()
    var
        SomeArray: Array[8] of Text[20];
        SomeValueLbl: Label 'SomeValue - %1', Comment = '%1 = Counter';
        tb: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 8 do
            SomeArray[i] := StrSubstNo(SomeValueLbl, Format(i));

        for i := 1 to 8 do
            tb.AppendLine(SomeArray[i]);

        Message(tb.ToText());
    end;

    procedure HandlePackages()
    var
        SalesShipmentLine: Record "Sales Shipment Line";
        PackageList: List of [Text[50]];
        TotalWeight: Decimal;
    begin
        SalesShipmentLine.SetRange(Type, SalesShipmentLine.Type::Item);
        if SalesShipmentLine.FindSet(false) then
            repeat
                TotalWeight := GetShipmentLineItemWeight(SalesShipmentLine);
                if not PackageList.Contains(SalesShipmentLine."Package Tracking No.") then
                    PackageList.Add(SalesShipmentLine."Package Tracking No.");
            until SalesShipmentLine.Next() = 0;

        Message('Package Count: %1, Shipment Total Weight: %2', PackageList.Count(), Format(TotalWeight));
    end;

    local procedure GetShipmentLineItemWeight(SalesShipmentLine: Record "Sales Shipment Line"): Decimal
    begin
        // Calculate the weight of the shipment line
    end;
}