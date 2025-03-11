// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Sales.Document;

using Microsoft.Sales.Customer;
using Microsoft.Utilities;
using Microsoft.Sales.History;

page 90000 "Sales Hist. Sell-to Fact PMPTE"
{
    Caption = 'Sell-to Customer Sales History (Better)';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
                ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

                trigger OnDrillDown()
                begin
                    ShowDetails();
                end;
            }
            group(Control23)
            {
                ShowCaption = false;
                Visible = false;
                field("No. of Quotes"; Rec."No. of Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Quotes';
                    ToolTip = 'Specifies the number of sales quotes that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        PageManagement: Codeunit "Page Management";
                        SalesHeader: Record "Sales Header";
                    begin
                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
                        SalesHeader.SetRange("Sell-to Customer No.", Rec."No.");
                        if Rec."No. of Quotes" = 1 then
                            SalesHeader.FindFirst();

                        PageManagement.PageRunModal(SalesHeader);
                    end;

                }
                field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Ongoing Sales Blanket Orders';
                    ToolTip = 'Specifies the number of sales blanket orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Blanket Order", Rec."No. of Blanket Orders");
                    end;
                }
                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Orders';
                    ToolTip = 'Specifies the number of sales orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Order", Rec."No. of Orders");
                    end;
                }
                field("No. of Invoices"; Rec."No. of Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Invoices';
                    ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Invoice", Rec."No. of Invoices");
                    end;
                }
                field("No. of Return Orders"; Rec."No. of Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Ongoing Sales Return Orders';
                    ToolTip = 'Specifies the number of sales return orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Return Order", Rec."No. of Return Orders");
                    end;
                }
                field("No. of Credit Memos"; Rec."No. of Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Credit Memos';
                    ToolTip = 'Specifies the number of unposted sales credit memos that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Credit Memo", Rec."No. of Credit Memos");
                    end;
                }
                field("No. of Pstd. Shipments"; Rec."No. of Pstd. Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    DrillDownPageID = "Posted Sales Shipments";
                    ToolTip = 'Specifies the number of posted sales shipments that have been registered for the customer.';
                }
                field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    DrillDownPageID = "Posted Sales Invoices";
                    ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';
                }
                field("No. of Pstd. Return Receipts"; Rec."No. of Pstd. Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Sales Return Receipts';
                    DrillDownPageID = "Posted Return Receipts";
                    ToolTip = 'Specifies the number of posted sales return receipts that have been registered for the customer.';
                }
                field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    DrillDownPageID = "Posted Sales Credit Memos";
                    ToolTip = 'Specifies the number of posted sales credit memos that have been registered for the customer.';
                }
            }
            cuegroup(Control2)
            {
                ShowCaption = false;
                field(NoofQuotesTile; Rec."No. of Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Quotes';
                    ToolTip = 'Specifies the number of sales quotes that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Quote", Rec."No. of Quotes");
                    end;
                }
                field(NoofBlanketOrdersTile; Rec."No. of Blanket Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Ongoing Sales Blanket Orders';
                    ToolTip = 'Specifies the number of sales blanket orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Blanket Order", Rec."No. of Blanket Orders");
                    end;
                }
                field(NoofOrdersTile; Rec."No. of Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Orders';
                    ToolTip = 'Specifies the number of sales orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Order", Rec."No. of Orders");
                    end;
                }
                field(NoofInvoicesTile; Rec."No. of Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Invoices';
                    ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Invoice", Rec."No. of Invoices");
                    end;
                }
                field(NoofReturnOrdersTile; Rec."No. of Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Ongoing Sales Return Orders';
                    ToolTip = 'Specifies the number of sales return orders that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Return Order", Rec."No. of Return Orders");
                    end;
                }
                field(NoofCreditMemosTile; Rec."No. of Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Credit Memos';
                    ToolTip = 'Specifies the number of unposted sales credit memos that have been registered for the customer.';
                    trigger OnDrillDown()
                    var
                        DocumentType: Enum "Sales Document Type";
                    begin
                        SalesHeaderDrillDown(DocumentType::"Credit memo", Rec."No. of Credit Memos");
                    end;
                }
                field(NoofPstdShipmentsTile; Rec."No. of Pstd. Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Shipments';
                    DrillDownPageID = "Posted Sales Shipments";
                    ToolTip = 'Specifies the number of posted sales shipments that have been registered for the customer.';
                }
                field(NoofPstdInvoicesTile; Rec."No. of Pstd. Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    DrillDownPageID = "Posted Sales Invoices";
                    ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';
                }
                field(NoofPstdReturnReceiptsTile; Rec."No. of Pstd. Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Sales Return Receipts';
                    DrillDownPageID = "Posted Return Receipts";
                    ToolTip = 'Specifies the number of posted sales return receipts that have been registered for the customer.';
                }
                field(NoofPstdCreditMemosTile; Rec."No. of Pstd. Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    DrillDownPageID = "Posted Sales Credit Memos";
                    ToolTip = 'Specifies the number of posted sales credit memos that have been registered for the customer.';
                }
            }
        }
    }

    actions
    {
    }

    local procedure ShowDetails()
    begin
        PAGE.Run(PAGE::"Customer Card", Rec);
    end;

    local procedure SalesHeaderDrillDown(DocumentType: Enum "Sales Document Type"; DrillDownQuantity: Integer)
    var
        PageManagement: Codeunit "Page Management";
        SalesHeader: Record "Sales Header";
    begin
        if DrillDownQuantity = 0 then
            exit;

        SalesHeader.SetRange("Document Type", DocumentType);
        SalesHeader.SetRange("Sell-to Customer No.", Rec."No.");

        if Confirm(SalesHeader.getfilters()) then;

        if DrillDownQuantity = 1 then
            SalesHeader.FindFirst();

        PageManagement.PageRunModal(SalesHeader);
    end;
}

