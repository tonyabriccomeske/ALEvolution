page 90023 "CatPicturePTE"
{
    Caption = 'Cat Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = CatPTE;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Picture; Rec.Picture)
            {
                ShowCaption = false;
                ToolTip = 'Specifies the picture of the cat.';
            }
        }
    }
}