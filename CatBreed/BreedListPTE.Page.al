namespace ALEvolution.ALEvolution;
using System.Text;

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
    actions
    {
        area(Reporting)
        {
            action(CatBreedBreakdown)
            {
                ApplicationArea = All;
                Caption = 'Cat Breed Breakdown';
                ToolTip = 'View the breakdown of cats by breed.';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CatBreedBreakdownReport: Report CatBreedBreakdownPTE;
                begin
                    CatBreedBreakdownReport.RunModal();
                end;
            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        Breed: Record BreedPTE;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
        RecRef: RecordRef;
        SelectionFilterForBreed: Text;
    begin
        CurrPage.SetSelectionFilter(Breed);
        RecRef.GetTable(Breed);
        SelectionFilterForBreed := SelectionFilterManagement.GetSelectionFilter(RecRef, Breed.FieldNo(Code));

        exit(SelectionFilterForBreed);
    end;

}
