table 90004 "Cat BreedPTE"
{
    Caption = 'Cat Breed';
    DataClassification = ToBeClassified;
    LookupPageId = "Cat BreedsPTE";
    DrillDownPageId = "Cat BreedsPTE";

    fields
    {
        field(1; "Cat No."; Code[20])
        {
            Caption = 'Cat No.';
            NotBlank = true;
            TableRelation = CatPTE."No.";
            ValidateTableRelation = true;
        }
        field(2; "Breed Code"; Code[10])
        {
            Caption = 'Breed Code';
            NotBlank = true;
            TableRelation = BreedPTE.Code;
            ValidateTableRelation = true;
        }

        field(3; "Breed Description"; Text[50])
        {
            Caption = 'Breed Description';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(BreedPTE.Description where(Code = field("Breed Code")));
        }
    }
    keys
    {
        key(PK; "Cat No.", "Breed Code")
        {
            Clustered = true;
        }
    }
}
