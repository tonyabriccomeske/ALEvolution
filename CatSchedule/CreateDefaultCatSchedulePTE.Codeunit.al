namespace ALEvolution.ALEvolution;

codeunit 90002 "Create Default Cat SchedulePTE"
{
    TableNo = CatPTE;

    trigger OnRun()
    begin
        DoCreateDefaultCatSchedule(Rec);
    end;

    procedure CreateDefaultCatSchedule(ErrorInfo: ErrorInfo)
    var
        Cat: Record CatPTE;
    begin
        Cat.Get(ErrorInfo.RecordId);
        DoCreateDefaultCatSchedule((Cat));
    end;

    procedure CreateDefaultOutdoorCatSchedule(ErrorInfo: ErrorInfo)
    var
        Cat: Record CatPTE;
    begin
        Cat.Get(ErrorInfo.RecordId);
        DoCreateDefaultOutdoorCatSchedule((Cat));
    end;

    local procedure DoCreateDefaultCatSchedule(Cat: Record CatPTE);
    var
        CatSchedule: Record "Cat SchedulePTE";

    begin

    end;

    local procedure DoCreateDefaultOutDoorCatSchedule(Cat: Record CatPTE);
    var
        CatSchedule: Record "Cat SchedulePTE";

    begin

    end;

}
