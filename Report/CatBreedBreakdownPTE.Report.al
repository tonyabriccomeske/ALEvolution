namespace ALEvolution.ALEvolution;

using System.Utilities;

report 90001 CatBreedBreakdownPTE
{
    ApplicationArea = All;
    Caption = 'Cat Breed Breakdown';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Layout1;

    dataset
    {
        dataitem(Integer; "Integer")
        {
            RequestFilterFields =;
            column(No; CatAnalysisByBreed."No") { }
            column(Name; CatAnalysisByBreed.Name) { }
            column(Adopted; CatAnalysisByBreed.Adopted) { }
            column(Pedigree; CatAnalysisByBreed.Pedigree) { }
            column(Sex; CatAnalysisByBreed.Sex) { }
            column(BreedCode; CatAnalysisByBreed."BreedCode") { }
            column(Breed_Description; CatAnalysisByBreed."Breed_Description") { }

            trigger OnPreDataItem()
            begin
                if BreedFilter <> '' then
                    CatAnalysisByBreed.SetFilter("BreedCode", BreedFilter);
                CatAnalysisByBreed.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not CatAnalysisByBreed.Read() then
                    CurrReport.Break();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(BreedFilterField; BreedFilter)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Filter by breed.';
                        Caption = 'Breed Filter';
                        ShowCaption = true;

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            BreedList: Page "Breed ListPTE";
                        begin
                            BreedList.LookupMode(true);
                            if BreedList.RunModal() = Action::LookupOK then
                                BreedFilter := BreedList.GetSelectionFilter();
                        end;
                    }
                }
            }
        }
    }
    rendering
    {
        layout(Layout1)
        {
            Type = RDLC;
            LayoutFile = '.\Report\CatBreedBreakdownPTE.rdl';
        }
    }
    labels
    {
        ReportTitle = 'Cat Breed Breakdown';
    }

    var
        CatAnalysisByBreed: Query CatAnalysisByBreedPTE;
        BreedFilter: Text;

}
