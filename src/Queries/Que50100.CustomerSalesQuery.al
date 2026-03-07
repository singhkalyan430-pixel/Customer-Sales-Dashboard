namespace CustomerSalesDashboard.CustomerSalesDashboard;

using Microsoft.Sales.Customer;

query 50100 CustomerSalesQuery
{
    Caption = 'CustomerSalesQuery';
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            /*dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";

                column(Amount; Amount)
                {
                }
                column(Quantity; Quantity)
                {
                }
            }*/
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
