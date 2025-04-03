namespace ALEvolution.ALEvolution;

query 90001 CatBreedAnalysisPTE
{
    Caption = 'Cat Breed Analysis';
    UsageCategory = ReportsAndAnalysis;
    QueryType = Normal;
    QueryCategory = 'Cat';

    elements
    {
        dataitem(BreedPTE; BreedPTE)
        {
            column("Code"; "Code") { }
            column(Description; Description) { }

            dataitem(Cat_BreedPTE; "Cat BreedPTE")
            {
                DataItemLink = "Breed Code" = BreedPTE."Code";

                column(CountCats)
                {
                    Method = Count;
                    Caption = 'Count of Cats';
                }
            }
        }
    }
}
