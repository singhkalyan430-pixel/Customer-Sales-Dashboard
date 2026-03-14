page 50101 "Top Customers"
{
    PageType = List;
    SourceTable = Customer;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
                field(Balance; Rec.Balance) { ApplicationArea = All; }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Balance);
    end;
}