report 50100 "Customer Sales Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'CustomerSalesReport.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Customer_No; "No.") { }
            column(Customer_Name; Name) { }

            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Sell-to Customer No." = field("No.");

                column(Document_No; "Document No.") { }
                column(Item_No; "No.") { }
                column(Quantity; Quantity) { }
                column(Line_Amount; "Line Amount") { }
            }
        }
    }
}