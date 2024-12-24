-- Transform and load data into VenteProduits fact table
INSERT INTO VenteProduits (
    ClefDatePaiement, ClefHeurePaiement, ClefCaisse, ClefMagasin, ClefPromotion, ClefProduit, ClefClient, ClefModePaiement,
    IDPaiement, Quantite, MontantUnitaire, CoutAchat, Montant, Reduction, MontantFinal
)
SELECT 
    c.ClefDate,
    t.ClefTemps,
    cr.ClefCaisse,
    s.ClefMagasin,
    p.ClefPromotion,
    pr.ClefProduit,
    cl.ClefClient,
    pm.ClefModePaiement,
    sv.IDVente,
    sv.Quantite,
    sv.PrixUnitaire,
    sv.CoutAchat,
    sv.Quantite * sv.PrixUnitaire AS Montant,
    sv.Remise,
    (sv.Quantite * sv.PrixUnitaire) - sv.Remise AS MontantFinal
FROM SourceVentes sv
JOIN Calendrier c ON c.Date = CAST(sv.DateVente AS DATE)
JOIN Temps t ON t.Temps = FORMAT(sv.DateVente, 'HH:mm')
JOIN Caisse cr ON cr.NumeroCaisse = sv.IDCaissier
JOIN Magasin s ON s.NumeroMagasin = sv.IDMagasin
JOIN Promotion p ON p.ClefPromotion = sv.IDPromotion
JOIN Produit pr ON pr.ClefProduit = sv.IDProduit
JOIN Client cl ON cl.ClefClient = sv.IDClient
JOIN ModePaiement pm ON pm.ClefModePaiement = sv.IDModePaiement;