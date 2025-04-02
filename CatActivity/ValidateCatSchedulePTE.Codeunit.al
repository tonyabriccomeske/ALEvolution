namespace ALEvolution.ALEvolution;
using System.Utilities;

codeunit 90001 "Validate Cat SchedulePTE"
{
    TableNo = CatPTE;

    trigger OnRun()
    begin
        ValidateCatScheduleLikeADinosaur(Rec);
    end;

    procedure ValidateCatScheduleLikeADinosaur(Cat: Record CatPTE)
    var
        CatSchedule: Record "Cat SchedulePTE";
        ThereIsNoScheduleForCatErr: Label 'There is no Shedule for Cat %1 %2', Comment = '%1: Cat.No - %2 Cat.Name';

    begin
        if not GetCatSchedule(Cat, CatSchedule) then
            error(ThereIsNoScheduleForCatErr, Cat."No.", Cat.Name);
    end;

    procedure ValidateCatScheduleLikeAFriend(Cat: Record CatPTE)
    var
        CatSchedule: Record "Cat SchedulePTE";

    begin
        if not GetCatSchedule(Cat, CatSchedule) then
            Error(NoScheduleExistsErrorInfo(Cat));
    end;

    procedure ValidateCatScheduleLikeAFriendWaitThereIsMore(Cat: Record CatPTE)
    var
        CatSchedule: Record "Cat SchedulePTE";
        ErrorInfo: ErrorInfo;

        CreateDefaultScheduleForOutdoorCatLbl: Label 'Create Outdoor Schedule';
        CreatesDefaultScheduleForOutdoorCatLbl: Label 'Creates Default Schedule for Outdoor Cat';

    begin
        if not GetCatSchedule(Cat, CatSchedule) then begin
            ErrorInfo := NoScheduleExistsErrorInfo(Cat);
            ErrorInfo.AddAction(
                CreateDefaultScheduleForOutdoorCatLbl,
                Codeunit::"Create Default Cat SchedulePTE",
                'CreateDefaultOutdoorCatSchedule',
                CreatesDefaultScheduleForOutdoorCatLbl);

            Error(ErrorInfo);
        end;
    end;

    local procedure NoScheduleExistsErrorInfo(Cat: Record CatPTE): ErrorInfo
    var
        ErrorMessageManagement: Codeunit "Error Message Management";

        TheCatDoesNotHaveAScheduleLbl: Label 'The Cat does not have a Schedule!';
        CatNeedsToHaveAScheduleLbl: Label 'Cat %1 %2 needs to have a Schedule', Comment = '%1: Cat.No - %2 Cat.Name';
        CreateDefaultScheduleLbl: Label 'Create Schedule';
        CreatesDefaultScheduleForCatLbl: Label 'Creates default schedule for Cat';

    begin
        Exit(ErrorMessageManagement.BuildActionableErrorInfo(
            TheCatDoesNotHaveAScheduleLbl,
            StrSubstNo(CatNeedsToHaveAScheduleLbl, Cat."No.", Cat.Name),
            Cat.RecordId(),
            CreateDefaultScheduleLbl,
            Codeunit::"Create Default Cat SchedulePTE",
            'CreateDefaultCatSchedule',
            CreatesDefaultScheduleForCatLbl));

    end;

    local procedure GetCatSchedule(Cat: Record CatPTE; Var CatSchedule: Record "Cat SchedulePTE"): Boolean
    begin
        CatSchedule.reset();
        CatSchedule.SetRange("Cat No.", Cat."No.");
        exit(CatSchedule.findset());
    end;
}
