namespace ALEvolution.ALEvolution;

page 90002 "Cat Activity ListPTE"
{
    ApplicationArea = All;
    Caption = 'Cat Activity List';
    PageType = List;
    SourceTable = "Cat ActivityPTE";
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
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
            }
        }
    }
}
