page 90024 CatsRTPTE
{
    Caption = 'Cats';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    SourceTable = CatRTPTE;
    CardPageId = CatRTPTE;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name) { }
                field(Breed; Rec.Breed) { }
            }
        }
    }
}