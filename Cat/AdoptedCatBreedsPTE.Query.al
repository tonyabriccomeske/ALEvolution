namespace ALEvolution.ALEvolution;

query 90002 AdoptedCatBreedsPTE
{
    Caption = 'Adopted Cat Breeds';
    UsageCategory = ReportsAndAnalysis;
    QueryType = Normal;
    QueryCategory = 'Cat';

    elements
    {
        dataitem(CatPTE; CatPTE)
        {
            column(Adopted; Adopted) { }

            dataitem(Cat_BreedPTE; "Cat BreedPTE")
            {
                DataItemLink = "Cat No." = CatPTE."No.";

                dataitem(BreedPTE; BreedPTE)
                {
                    DataItemLink = Code = Cat_BreedPTE."Breed Code";

                    column("Code"; "Code") { }
                    column(Description; Description) { }

                    column(CountCats)
                    {
                        Method = Count;
                        Caption = 'Count of Cats';
                    }
                }
            }

        }
    }
}
