table 90025 "CatPTE"
{
    Caption = 'Cat';
    DataClassification = CustomerContent;
    LookupPageId = CatsPTE;
    DrillDownPageId = "CatCardPTE";
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the Identification No. of the Cat.';
        }
        field(5; Picture; Blob)
        {
            Caption = 'Picture';
            Subtype = Bitmap;
            ToolTip = 'Specifies the Picture of the Cat.';
        }
        field(10; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the Name of the Cat.';
        }
        field(20; Breed; Text[50])
        {
            Caption = 'Breed';
            ToolTip = 'Specifies the Breed of the Cat.';
        }
        field(21; "No. of Breeds"; Integer)
        {
            Caption = 'No. of Breeds';
            ToolTip = 'Shows the number of breeds of the Cat.';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count("Cat BreedPTE" where("Cat No." = field("No.")));
        }
        field(30; Weight; Decimal)
        {
            Caption = 'Weight';
            ToolTip = 'Specifies the Weight of the Cat.';
        }
        field(40; Adopted; Boolean)
        {
            Caption = 'Adopted';
            ToolTip = 'Indicates whether or not the cat was adopted.';
        }
        field(100; Biography; Blob)
        {
            Caption = 'Biography';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name) { }
    }

    var
        ReadingDataSkippedMsg: Label 'Loading field %1 will be skipped because there was an error when reading the data.\To fix the current data, contact your administrator.\Alternatively, you can overwrite the current data by entering data in the field.', Comment = '%1=field caption';

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesSetup.Get();
        SalesSetup.TestField(CatNoSeriesPTE);
        Rec."No." := NoSeries.GetNextNo(SalesSetup.CatNoSeriesPTE);
    end;

    procedure SetCatBiography(NewBiography: Text)
    var
        OutStream: OutStream;
    begin
        Clear(Rec.Biography);
        Rec.Biography.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewBiography);
        Rec.Modify();
    end;

    procedure GetCatBiography() BiographyText: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        Rec.CalcFields(Biography);
        Rec.Biography.CreateInStream(InStream, TEXTENCODING::UTF8);
        if not TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), BiographyText) then
            Message(ReadingDataSkippedMsg, FieldCaption(Rec.Biography));
    end;

    /// <summary>
    /// The user is prompted to confirm if they want to feed the cat.
    /// If the user confirms, feed the cat with a random amount of food.
    /// </summary>
    procedure FeedCat()
    var
        ConfirmManagement: Codeunit "Confirm Management";
        FeedCatQst: Label 'Do you want to feed the cat %1?', Comment = '%1=Cat Name';
    begin
        if ConfirmManagement.GetResponseOrDefault(StrSubstNo(FeedCatQst, Rec.Name), true) then begin
            Rec.Weight += 0.01 + Random(90) / 1000;
            if GuiAllowed then
                Message('The cat %1 has been fed.', Rec.Name);
        end
        else
            if GuiAllowed then
                Message('The cat %1 will not be fed.', Rec.Name);
    end;
}

