namespace ALEvolution.ALEvolution;

page 90004 "Breed ListPTE"
{
    ApplicationArea = All;
    Caption = 'Breed List';
    PageType = List;
    SourceTable = BreedPTE;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
