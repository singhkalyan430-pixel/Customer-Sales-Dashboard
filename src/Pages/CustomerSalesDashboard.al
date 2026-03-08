page 50100 "Customer Sales Dashboard"
{
    PageType = Card;
    SourceTable = Customer;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(SalesSummary)
            {
                Caption = 'Sales Summary';

                field("Customer No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(TotalSales; TotalSales)
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales Amount';
                }

                field(TotalQuantity; TotalQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Total Quantity Sold';
                }
            }
        }
    }

    var
        SalesLine: Record "Sales Line";
        TotalSales: Decimal;
        TotalQuantity: Decimal;

    trigger OnAfterGetRecord()
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Sell-to Customer No.", Rec."No.");

        if SalesLine.FindSet() then
            repeat
                TotalSales += SalesLine.Amount;
                TotalQuantity += SalesLine.Quantity;
            until SalesLine.Next() = 0;
    end;
}