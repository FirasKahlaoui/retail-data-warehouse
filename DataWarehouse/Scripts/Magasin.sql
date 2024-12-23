CREATE TABLE Magasin (
    ClefMagasin INT PRIMARY KEY,
    NomMagasin NVARCHAR(100),
    NumeroMagasin INT NOT NULL,
    Rue NVARCHAR(255),
    Ville NVARCHAR(100),
    Departement NVARCHAR(100),
    Pays NVARCHAR(50),
    CodePostal NVARCHAR(20),
    Directeur NVARCHAR(100),
    Zone NVARCHAR(50),
    ZonePrecedente NVARCHAR(50),
    Region NVARCHAR(50),
    RegionPrecedente NVARCHAR(50),
    DatePremiereOuverture DATE,
    DateDerniereRenovation DATE
);