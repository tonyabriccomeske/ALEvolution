table 90001 "Cat SchedulePTE"
{
    Caption = 'Cat Schedule';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Cat No."; Code[20])
        {
            Caption = 'Cat No.';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(2; "Time"; Time)
        {
            Caption = 'Time';
            NotBlank = true;
        }
        field(3; "Activity Code"; Code[10])
        {
            Caption = 'Activity Code';
            TableRelation = "Cat ActivityPTE";
            ValidateTableRelation = true;

            trigger OnValidate()
            var
                CatActivity: Record "Cat ActivityPTE";
            begin
                if CatActivity.get(Rec."Activity Code") then begin
                    Rec."Activity Category" := CatActivity.Category;
                    Rec."Activity Description" := CatActivity.Description;
                end;
            end;

        }
        field(4; "Activity Category"; Enum "Cat Activity CategoryPTE")
        {
            Caption = 'Activity Category';
        }
        field(5; "Activity Description"; Text[50])
        {
            Caption = 'Activity Description';
        }
        field(6; Comment; Text[50])
        {
            Caption = 'Comment';
        }
    }
    keys
    {
        key(PK; "Cat No.", "Time")
        {
            Clustered = true;
        }
    }
}
