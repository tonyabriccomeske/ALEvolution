namespace ALEvolution.ALEvolution;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

pageextension 90000 "Customer List PMPTE" extends "Customer List"
{
    layout
    {
        //addfirst(factboxes)
        addafter(SalesHistSelltoFactBox)
        {
            part(SalesHistSelltoFactBoxPMPTE; "Sales Hist. Sell-to Fact PMPTE")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");

            }
        }
    }
}