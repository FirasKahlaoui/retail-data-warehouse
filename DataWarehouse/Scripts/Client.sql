CREATE TABLE Client (
    ClefClient INT PRIMARY KEY,
    NomClient NVARCHAR(100),
    PrenomClient NVARCHAR(100),
    NumeroCarteClient NVARCHAR(50),
    CodePostalClient NVARCHAR(20),
    VilleClient NVARCHAR(100),
    AdresseClient NVARCHAR(255),
    DateCarteFideliteClient DATE,
    DateNaissanceClient DATE,
    SexeClient NVARCHAR(10),
    Age INT,
    StatutMarital NVARCHAR(50),
    NombreEnfants INT,
    RevenusFoyer DECIMAL(15, 2)
);