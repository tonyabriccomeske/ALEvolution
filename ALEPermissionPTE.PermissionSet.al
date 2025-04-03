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
        page UtilitiesPTE = X,
        tabledata BreedPTE = RIMD,
        tabledata "Cat BreedPTE" = RIMD,
        table BreedPTE = X,
        table "Cat BreedPTE" = X,
        codeunit "Create Default Cat SchedulePTE" = X,
        codeunit "Validate Cat SchedulePTE" = X,
        page "Breed ListPTE" = X,
        page "Cat BreedPTE" = X,
        page "Cat BreedsPTE" = X,
        page "Cat FactBoxPTE" = X,
        page "Cat SchedulePTE" = X;
}