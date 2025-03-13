pageextension 90025 SalesReceivableSetupPTE extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field(CatNoSeriesPTE; Rec.CatNoSeriesPTE)
            {
                ApplicationArea = All;
            }
        }
    }
}