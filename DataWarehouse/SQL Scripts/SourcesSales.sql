CREATE TABLE SourceVentes (
    IDVente NVARCHAR(50),
    DateVente DATETIME,
    IDCaissier INT,
    IDMagasin INT,
    IDPromotion INT,
    IDProduit INT,
    IDClient INT,
    IDModePaiement INT,
    Quantite INT,
    PrixUnitaire DECIMAL(15, 2),
    CoutAchat DECIMAL(15, 2),
    Remise DECIMAL(15, 2)
);