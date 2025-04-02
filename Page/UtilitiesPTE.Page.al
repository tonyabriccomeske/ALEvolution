namespace ALEvolution.ALEvolution;

page 90001 UtilitiesPTE
{
    ApplicationArea = All;
    Caption = 'Utilities for Cat People';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Dinosaur)
            {
                ApplicationArea = All;
                Caption = 'Dinosaur';
                ToolTip = 'Display code from an array like a Dinosaur.';
                Image = PrintForm;

                trigger OnAction()
                var
                begin
                    ListDictionariesPTE.DoSomethingLikeADinosaur();
                end;
            }
        }
    }

    var
        ListDictionariesPTE: Codeunit ListDictionariesPTE;
}
