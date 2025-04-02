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
                Ellipsis = true;

                trigger OnAction()
                var
                    Cat: Record CatPTE;
                begin
                    Cat.SetRange("No.", Rec."No.");
                    Report.Run(Report::CatProfilePTE, true, true, Cat);
                end;
            }
        }

        area(Processing)
        {
            action(ViewBiographyText)
            {
                ApplicationArea = All;
                Caption = 'View Biography Text';
                ToolTip = 'View the biography text of the cat how it is stored in the Blob field.';
                Image = View;

                trigger OnAction()
                begin
                    Message(BiographyVar);
                end;
            }

            group(ValidateSchedule)
            {
                Caption = 'Validate Schedule';

                action(ValidateCatScheduleLikeADinosaur)
                {
                    ApplicationArea = All;
                    Caption = 'Like a Dinosaur';
                    ToolTip = 'Gives a simple `ERROR`';

                    trigger OnAction()
                    var
                        ValidateCatSchedule: Codeunit "Validate Cat SchedulePTE";

                    begin
                        ValidateCatSchedule.ValidateCatScheduleLikeADinosaur(Rec);
                    end;
                }

                action(ValidateCatScheduleLikeAFriend)
                {
                    ApplicationArea = All;
                    Caption = 'Like a Friend';
                    ToolTip = 'Gives the user a helping hand';

                    trigger OnAction()
                    var
                        ValidateCatSchedule: Codeunit "Validate Cat SchedulePTE";

                    begin
                        ValidateCatSchedule.ValidateCatScheduleLikeAFriend(Rec);
                    end;
                }

                action(ValidateCatScheduleLikeAFriendWaitThereIsMore)
                {
                    ApplicationArea = All;
                    Caption = 'Like a Friend - Wait there is more!';
                    ToolTip = 'Gives the user a helping hand - and options';

                    trigger OnAction()
                    var
                        ValidateCatSchedule: Codeunit "Validate Cat SchedulePTE";

                    begin
                        ValidateCatSchedule.ValidateCatScheduleLikeAFriendWaitThereIsMore(Rec);
                    end;
                }

            }
        }

        area(Navigation)
        {
            action(ViewCatSchedule)
            {
                ApplicationArea = All;
                Caption = 'Cat Schedule';
                ToolTip = 'View the Cat Schedule';
                Image = Timeline;

                RunObject = page "Cat SchedulePTE";
                RunPageLink = "Cat No." = field("No.");
            }
        }

        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PrintProfile_Promoted; PrintProfile) { }
                actionref(ViewBiographyText_Promoted; ViewBiographyText) { }
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


