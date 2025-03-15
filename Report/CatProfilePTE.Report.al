report 90025 CatProfilePTE
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = CatProfile_RDLC;
    Caption = 'Cat Profile';

    dataset
    {
        dataitem(Cat; CatPTE)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(No; "No.") { }
            column(Name; Name) { }
            column(Breed; Breed) { }
            column(Biography; GetCatBiography()) { }
            column(Picture; Picture) { }
            column(Weight; Weight) { }
            column(Adopted; Adopted) { }

            trigger OnPreDataItem()
            begin
                SetAutoCalcFields(Picture);
            end;
        }
    }

    rendering
    {
        layout(CatProfile_RDLC)
        {
            Type = RDLC;
            LayoutFile = '.\Report\CatProfilePTE.rdl';
        }
    }

    labels
    {
        CatNoLbl = 'No.';
        NameLbl = 'Name';
        BreedLbl = 'Breed';
        BiographyLbl = 'Biography';
        WeightLbl = 'Weight (lbs)';
        AdoptedLbl = 'Adopted';
        ReportCaptionLbl = 'Cat Profile';

    }
}