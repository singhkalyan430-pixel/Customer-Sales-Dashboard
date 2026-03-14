page 50100 "Customer Sales Dashboard"
{
    PageType = Card;
    SourceTable = Customer;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Sales Summary")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(TotalSalesAmount; TotalSalesAmount)
                {
                    Caption = 'Total Sales Amount';
                    ApplicationArea = All;
                }

                field(TotalQuantity; TotalQuantity)
                {
                    Caption = 'Total Quantity Sold';
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        SalesLine: Record "Sales Invoice Line";
        TotalSalesAmount: Decimal;
        TotalQuantity: Decimal;

    trigger OnAfterGetRecord()
    begin
        CalculateSales();
    end;

    procedure CalculateSales()
    begin
        Clear(TotalSalesAmount);
        Clear(TotalQuantity);

        SalesLine.Reset();
        SalesLine.SetRange("Sell-to Customer No.", Rec."No.");

        if SalesLine.FindSet() then
            repeat
                TotalSalesAmount += SalesLine."Line Amount";
                TotalQuantity += SalesLine.Quantity;
            until SalesLine.Next() = 0;
    end;
}