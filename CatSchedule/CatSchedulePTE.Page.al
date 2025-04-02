namespace ALEvolution.ALEvolution;

page 90003 "Cat SchedulePTE"
{
    ApplicationArea = All;
    Caption = 'Cat Schedule';
    PageType = List;
    SourceTable = "Cat SchedulePTE";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                    ShowMandatory = true;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ToolTip = 'Specifies the value of the Activity Code field.', Comment = '%';
                }
                field("Activity Category"; Rec."Activity Category")
                {
                    ToolTip = 'Specifies the value of the Activity Category field.', Comment = '%';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ToolTip = 'Specifies the value of the Activity Description field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
            }
        }
    }
}
