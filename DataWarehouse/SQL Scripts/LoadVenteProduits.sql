-- Transform and load data into VenteProduits fact table
INSERT INTO VenteProduits (
    ClefDatePaiement, ClefHeurePaiement, ClefCaisse, ClefMagasin, ClefPromotion, ClefProduit, ClefClient, ClefModePaiement,
    IDPaiement, Quantite, MontantUnitaire, CoutAchat, Montant, Reduction, MontantFinal
)
SELECT 
    sv.ClefDate AS ClefDatePaiement,
    sv.ClefTemps AS ClefHeurePaiement,
    sv.IDCaissier AS ClefCaisse,
    sv.IDMagasin AS ClefMagasin,
    sv.IDPromotion AS ClefPromotion,
    sv.IDProduit AS ClefProduit,
    sv.IDClient AS ClefClient,
    sv.IDModePaiement AS ClefModePaiement,
    sv.IDVente AS IDPaiement,
    sv.Quantite,
    sv.PrixUnitaire AS MontantUnitaire,
    sv.CoutAchat,
    sv.Quantite * sv.PrixUnitaire AS Montant,
    sv.Remise AS Reduction,
    (sv.Quantite * sv.PrixUnitaire) - sv.Remise AS MontantFinal
FROM SourceVentes sv
JOIN Calendrier c ON c.ClefDate = sv.ClefDate
JOIN Temps t ON t.ClefTemps = sv.ClefTemps
JOIN Caisse cr ON cr.ClefCaisse = sv.IDCaissier
JOIN Magasin s ON s.ClefMagasin = sv.IDMagasin
JOIN Promotion p ON p.ClefPromotion = sv.IDPromotion
JOIN Produit pr ON pr.ClefProduit = sv.IDProduit
JOIN Client cl ON cl.ClefClient = sv.IDClient
JOIN ModePaiement pm ON pm.ClefModePaiement = sv.IDModePaiement;