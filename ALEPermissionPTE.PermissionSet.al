permissionset 90000 ALEPermissionPTE
{
    Assignable = true;
    Permissions = tabledata CatPTE = RIMD,
        table CatPTE = X,
        report CatProfilePTE = X,
        codeunit ListDictionariesPTE = X,
        page CatCardPTE = X,
        page CatPicturePTE = X,
        page CatsPTE = X,
        tabledata "Cat ActivityPTE" = RIMD,
        tabledata "Cat SchedulePTE" = RIMD,
        table "Cat ActivityPTE" = X,
        table "Cat SchedulePTE" = X,
        page "Cat Activity ListPTE" = X,
        page UtilitiesPTE = X;
}