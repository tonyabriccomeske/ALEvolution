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
            action(GetListOfUniqueBreedsOfAdoptedCats)
            {
                ApplicationArea = All;
                Caption = 'Get List of Unique Breeds of Adopted Cats';
                ToolTip = 'Get a list of unique breeds of adopted cats.';
                Image = List;

                trigger OnAction()
                var
                begin
                    ListDictionariesPTE.GetListOfUniqueBreedsOfAdoptedCats();
                end;
            }
            action(GetAdoptedBreedDictionaryWithListOfCats)
            {
                ApplicationArea = All;
                Caption = 'Get Adopted Breed Dictionary with List of Cats';
                ToolTip = 'Get a dictionary of adopted breeds with a list of cats.';
                Image = ShowList;

                trigger OnAction()
                var
                begin
                    ListDictionariesPTE.GetAdoptedBreedDictionaryWithListOfCats();
                end;
            }
        }
    }

    var
        ListDictionariesPTE: Codeunit ListDictionariesPTE;
}
