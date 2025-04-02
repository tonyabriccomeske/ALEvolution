table 90002 "Cat ActivityPTE"
{
    Caption = 'Cat Activity';
    DataClassification = SystemMetadata;

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
        field(3; Category; Enum "Cat Activity CategoryPTE")
        {
            Caption = 'Category';
        }
        field(10; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
