namespace ALEvolution.ALEvolution;

page 90005 "Cat BreedsPTE"
{
    ApplicationArea = All;
    Caption = 'Cat Breeds';
    PageType = List;
    SourceTable = "Cat BreedPTE";
    CardPageId = "Cat BreedPTE";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Breed Code"; Rec."Breed Code")
                {
                    ToolTip = 'Specifies the value of the Breed Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        rec.CalcFields("Breed Description");
                    end;
                }
                field("Breed Description"; Rec."Breed Description")
                {
                    ToolTip = 'Specifies the value of the Breed Description field.', Comment = '%';
                }
            }
        }
    }
}
