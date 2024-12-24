INSERT INTO Calendrier (ClefDate, Date, Jour, Semaine, Mois, Trimestre, Annee, Ferie)
SELECT ClefDate, Date, Jour, Semaine, Mois, Trimestre, Annee, Ferie
FROM StagingCalendrier;

INSERT INTO Temps (ClefTemps, Temps, Heure, Minute, AM_PM, JourNuit, HeureCreuse)
SELECT ClefTemps, Temps, Heure, Minute, AM_PM, JourNuit, HeureCreuse
FROM StagingTemps;

INSERT INTO Caisse (ClefCaisse, NumeroCaisse, TypeCaisse)
SELECT ClefCaisse, NumeroCaisse, TypeCaisse
FROM StagingCaisse;

INSERT INTO Magasin (ClefMagasin, NomMagasin, Rue, Ville, Pays, Directeur, Zone, DatePremiereOuverture, DateDerniereRenovation)
SELECT ClefMagasin, NomMagasin, Rue, Ville, Pays, Directeur, Zone, DatePremiereOuverture, DateDerniereRenovation
FROM StagingMagasin;

INSERT INTO Promotion (ClefPromotion, CodePromotion, NomPromotion, TypePromotion, DateDebut, DateFin)
SELECT ClefPromotion, CodePromotion, NomPromotion, TypePromotion, DateDebut, DateFin
FROM StagingPromotion;

INSERT INTO Produit (ClefProduit, CodeProduit, DescriptionProduit, MarqueProduit, CategorieProduit, Rayon, PrixProduitRecommande)
SELECT ClefProduit, CodeProduit, DescriptionProduit, MarqueProduit, CategorieProduit, Rayon, PrixProduitRecommande
FROM StagingProduit;

INSERT INTO Client (ClefClient, NomClient, PrenomClient, NumeroCarteClient, VilleClient, SexeClient, Age, RevenusFoyer)
SELECT ClefClient, NomClient, PrenomClient, NumeroCarteClient, VilleClient, SexeClient, Age, RevenusFoyer
FROM StagingClient;

INSERT INTO ModePaiement (ClefModePaiement, CodePaiement, Description, TypePaiement)
SELECT ClefModePaiement, CodePaiement, Description, TypePaiement
FROM StagingModePaiement;