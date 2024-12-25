-- Staging Table: Calendrier
CREATE TABLE Staging_Calendrier (
    ClefDate INT,
    Date DATE,
    Jour NVARCHAR(50),
    Semaine INT,
    Mois INT,
    Trimestre INT,
    Annee INT,
    Ferie NVARCHAR(3)
);

-- Staging Table: Temps
CREATE TABLE Staging_Temps (
    ClefTemps INT,
    Temps NVARCHAR(50),
    Heure INT,
    Minute INT,
    AM_PM NVARCHAR(2),
    JourNuit NVARCHAR(10),
    HeureCreuse NVARCHAR(3)
);

-- Staging Table: Caisse
CREATE TABLE Staging_Caisse (
    ClefCaisse INT,
    NumeroCaisse INT,
    TypeCaisse NVARCHAR(50)
);

-- Staging Table: Magasin
CREATE TABLE Staging_Magasin (
    ClefMagasin INT,
    NomMagasin NVARCHAR(100),
    Rue NVARCHAR(255),
    Ville NVARCHAR(100),
    Pays NVARCHAR(50),
    Directeur NVARCHAR(100),
    Zone NVARCHAR(50),
    DatePremiereOuverture DATE,
    DateDerniereRenovation DATE
);

-- Staging Table: Promotion
CREATE TABLE Staging_Promotion (
    ClefPromotion INT,
    CodePromotion NVARCHAR(50),
    NomPromotion NVARCHAR(100),
    TypePromotion NVARCHAR(50),
    DateDebut DATE,
    DateFin DATE
);

-- Staging Table: Produit
CREATE TABLE Staging_Produit (
    ClefProduit INT,
    CodeProduit NVARCHAR(50),
    DescriptionProduit NVARCHAR(255),
    MarqueProduit NVARCHAR(100),
    CategorieProduit NVARCHAR(100),
    Rayon NVARCHAR(50),
    PrixProduitRecommande DECIMAL(15, 2)
);

-- Staging Table: Client
CREATE TABLE Staging_Client (
    ClefClient INT,
    NomClient NVARCHAR(100),
    PrenomClient NVARCHAR(100),
    NumeroCarteClient NVARCHAR(50),
    VilleClient NVARCHAR(100),
    SexeClient NVARCHAR(10),
    Age INT,
    RevenusFoyer DECIMAL(15, 2)
);

-- Staging Table: Mode Paiement
CREATE TABLE Staging_ModePaiement (
    ClefModePaiement INT,
    CodePaiement NVARCHAR(50),
    Description NVARCHAR(255),
    TypePaiement NVARCHAR(50)
);

-- Staging Table: Vente Produits
CREATE TABLE Staging_VenteProduits (
    ClefDatePaiement INT,
    ClefHeurePaiement INT,
    ClefCaisse INT,
    ClefMagasin INT,
    ClefPromotion INT,
    ClefProduit INT,
    ClefClient INT,
    ClefModePaiement INT,
    IDPaiement NVARCHAR(50),
    Quantite INT,
    MontantUnitaire DECIMAL(15, 2),
    CoutAchat DECIMAL(15, 2),
    Montant DECIMAL(15, 2),
    Reduction DECIMAL(15, 2),
    MontantFinal DECIMAL(15, 2)
);