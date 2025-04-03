namespace ALEvolution.ALEvolution;

query 90000 CatAnalysisByBreedPTE
{
    Caption = 'Cat Analysis by Breed';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;
    QueryCategory = 'Cat';

    elements
    {
        dataitem(CatPTE; CatPTE)
        {
            column(No; "No.") { }
            column(Name; Name) { }
            column(Adopted; Adopted) { }
            column(Pedigree; Pedigree) { }
            column(Sex; Sex) { }

            dataitem(Cat_BreedPTE; "Cat BreedPTE")
            {
                DataItemLink = "Cat No." = CatPTE."No.";

                column(BreedCode; "Breed Code") { }
                column(Breed_Description; "Breed Description") { }
            }
        }
    }
}
