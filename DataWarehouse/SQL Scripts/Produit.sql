CREATE TABLE Produit (
    ClefProduit INT PRIMARY KEY,
    CodeProduit NVARCHAR(50),
    DescriptionProduit NVARCHAR(255),
    MarqueProduit NVARCHAR(100),
    SousSousCatProduit NVARCHAR(100),
    SousCategorieProduit NVARCHAR(100),
    CategorieProduit NVARCHAR(100),
    Rayon NVARCHAR(50),
    PrixProduitRecommande DECIMAL(15, 2),
    Rangee NVARCHAR(50),
    Secteur NVARCHAR(50),
    Etagere NVARCHAR(50)
);