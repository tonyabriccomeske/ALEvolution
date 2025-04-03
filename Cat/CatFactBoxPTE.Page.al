namespace ALEvolution.ALEvolution;
using Microsoft.Utilities;

page 90007 "Cat FactBoxPTE"
{
    ApplicationArea = All;
    Caption = 'Cat FactBox';
    PageType = CardPart;
    SourceTable = CatPTE;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(NoOfBreedsOld; Rec."No. of Breeds")
                {
                    ToolTip = 'Specifies the value of the No. of Breeds field.', Comment = '%';
                }
                field("No. of Breeds"; Rec."No. of Breeds")
                {
                    ToolTip = 'Specifies the value of the No. of Breeds field.', Comment = '%';

                    trigger OnDrillDown()
                    var
                        CatBreed: Record "Cat BreedPTE";
                        PageManagement: Codeunit "Page Management";

                    begin
                        CatBreed.SetRange("Cat No.", Rec."No.");
                        if Rec."No. of Breeds" = 1 then
                            CatBreed.FindFirst();

                        PageManagement.PageRunModal(CatBreed);

                    end;

                }
            }
        }
    }
}
