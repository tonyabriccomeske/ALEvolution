page 90024 CatsPTE
{
    Caption = 'Cats';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    SourceTable = CatPTE;
    CardPageId = "CatCardPTE";
    QueryCategory = 'Cat';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field(Breed; Rec.Breed) { }
            }
        }
        area(FactBoxes)
        {
            part(CatFactBoxPTE; "Cat FactBoxPTE")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
            part(CatPicture; "CatPicturePTE")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
    actions
    {
        area(Reporting)
        {
            action(PrintProfile)
            {
                ApplicationArea = All;
                Caption = 'Print Profile';
                ToolTip = 'Print the profile of the cat.';
                Image = Print;

                trigger OnAction()
                var
                    Cat: Record CatPTE;
                    SelectionFilterMgt: Codeunit SelectionFilterManagement;
                    RecRef: RecordRef;
                begin
                    Currpage.SetSelectionFilter(Cat);
                    RecRef.GetTable(Cat);
                    Cat.SetFilter("No.", SelectionFilterMgt.GetSelectionFilter(RecRef, Rec.FieldNo("No.")));
                    Report.Run(Report::CatProfilePTE, true, true, Cat);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PrintProfile_Promoted; PrintProfile) { }
            }
        }
    }
}