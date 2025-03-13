page 90025 "CatRTPTE"
{
    PageType = Card;
    SourceTable = "CatRTPTE";
    Caption = 'Cat';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.") { }
                field(Name; Rec.Name) { }
                field(Breed; Rec.Breed) { }
            }
            group(BiographyGroup)
            {
                Caption = 'Biography';

                field(Biography; BiographyVar)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    ShowCaption = false;
                    InstructionalText = 'Enter the biography about the cat.';

                    trigger OnValidate()
                    begin
                        Rec.SetCatBiography(BiographyVar);
                    end;
                }
            }
        }
    }
    var
        BiographyVar: Text;

    trigger OnAfterGetRecord()
    begin
        BiographyVar := Rec.GetCatBiography();
    end;
}


