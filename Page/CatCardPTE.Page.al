page 90025 "CatCardPTE"
{
    PageType = Card;
    SourceTable = "CatPTE";
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
                field(Weight; Rec.Weight) { }
                field(Adopted; Rec.Adopted) { }
                field(Picture; Rec.Picture) { }
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
                begin
                    Cat.SetRange("No.", Rec."No.");
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

    var
        BiographyVar: Text;

    trigger OnAfterGetRecord()
    begin
        BiographyVar := Rec.GetCatBiography();
    end;
}


