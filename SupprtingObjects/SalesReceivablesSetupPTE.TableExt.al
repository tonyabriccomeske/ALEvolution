tableextension 90025 SalesReceivablesSetupPTE extends "Sales & Receivables Setup"
{
    fields
    {
        field(90025; CatNoSeriesPTE; Code[10])
        {
            Caption = 'Cat No. Series';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the No. Series to be used to identify Cats.';
            TableRelation = "No. Series";
        }
    }
}