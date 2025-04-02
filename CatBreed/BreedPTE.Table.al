table 90003 BreedPTE
{
    Caption = 'Breed';
    DataClassification = SystemMetadata;
    DataCaptionFields = Code, Description;
    LookupPageId = "Breed ListPTE";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Description) { }
    }
}
