INSERT INTO Calendrier (ClefDate, Date, Jour, Semaine, Mois, Trimestre, Annee, Ferie)
SELECT ClefDate, Date, 
       CASE 
           WHEN Jour = 'Monday' THEN 1
           WHEN Jour = 'Tuesday' THEN 2
           WHEN Jour = 'Wednesday' THEN 3
           WHEN Jour = 'Thursday' THEN 4
           WHEN Jour = 'Friday' THEN 5
           WHEN Jour = 'Saturday' THEN 6
           WHEN Jour = 'Sunday' THEN 7
           ELSE NULL
       END AS Jour,
       Semaine, Mois, Trimestre, Annee, 
       CASE 
           WHEN Ferie = 'Oui' THEN 1
           WHEN Ferie = 'Non' THEN 0
           ELSE NULL
       END AS Ferie
FROM StagingCalendrier;

INSERT INTO Temps (ClefTemps, Temps, Heure, Minute, AM_PM, JourNuit, HeureCreuse)
SELECT ClefTemps, Temps, Heure, Minute, AM_PM, JourNuit, 
       CASE 
           WHEN HeureCreuse = 'Oui' THEN 1
           WHEN HeureCreuse = 'Non' THEN 0
           ELSE NULL
       END AS HeureCreuse
FROM StagingTemps;

INSERT INTO Caisse (ClefCaisse, NumeroCaisse, TypeCaisse)
SELECT ClefCaisse, NumeroCaisse, TypeCaisse
FROM StagingCaisse;

INSERT INTO Magasin (ClefMagasin, NomMagasin, Rue, Ville, Pays, Directeur, Zone, DatePremiereOuverture, DateDerniereRenovation, NumeroMagasin)
SELECT ClefMagasin, NomMagasin, Rue, Ville, Pays, Directeur, Zone, DatePremiereOuverture, DateDerniereRenovation,
       CASE 
           WHEN NumeroMagasin IS NULL THEN 0
           ELSE NumeroMagasin
       END AS NumeroMagasin
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