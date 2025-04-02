namespace ALEvolution.ALEvolution;

page 90006 "Cat BreedPTE"
{
    ApplicationArea = All;
    Caption = 'Cat Breed';
    PageType = Card;
    SourceTable = "Cat BreedPTE";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Breed Code"; Rec."Breed Code")
                {
                    ToolTip = 'Specifies the value of the Breed Code field.', Comment = '%';
                }
                field("Breed Description"; Rec."Breed Description")
                {
                    ToolTip = 'Specifies the value of the Breed Description field.', Comment = '%';
                }
            }
        }
    }
}
