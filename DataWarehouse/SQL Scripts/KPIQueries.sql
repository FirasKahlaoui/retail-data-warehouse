-- Total Sales Amount
SELECT SUM(MontantFinal) AS TotalSalesAmount
FROM VenteProduits;

-- Total Quantity Sold
SELECT SUM(Quantite) AS TotalQuantitySold
FROM VenteProduits;


-- Average Sales Amount per Transaction
SELECT AVG(MontantFinal) AS AvgSalesAmount
FROM VenteProduits;

-- Number of Unique Customers
SELECT COUNT(DISTINCT ClefClient) AS UniqueCustomers
FROM VenteProduits;

-- Top Selling Products
SELECT ClefProduit, SUM(Quantite) AS TotalQuantity
FROM VenteProduits
GROUP BY ClefProduit
ORDER BY TotalQuantity DESC;

-- Chiffre d'affaires par magasin et par mois
SELECT 
    m.NomMagasin,
    c.Annee,
    c.Mois,
    SUM(vp.MontantFinal) AS ChiffreAffaires
FROM VenteProduits vp
JOIN Magasin m ON vp.ClefMagasin = m.ClefMagasin
JOIN Calendrier c ON vp.ClefDatePaiement = c.ClefDate
GROUP BY m.NomMagasin, c.Annee, c.Mois
ORDER BY m.NomMagasin, c.Annee, c.Mois;

-- Répartition des modes de paiement par ville
SELECT 
    m.Ville,
    mp.Description AS ModePaiement,
    COUNT(vp.IDPaiement) AS NombrePaiements
FROM VenteProduits vp
JOIN Magasin m ON vp.ClefMagasin = m.ClefMagasin
JOIN ModePaiement mp ON vp.ClefModePaiement = mp.ClefModePaiement
GROUP BY m.Ville, mp.Description
ORDER BY m.Ville, mp.Description;

-- Taux de réduction moyen par catégorie de produit
SELECT 
    p.CategorieProduit,
    AVG(vp.Reduction / (vp.Quantite * vp.MontantUnitaire)) * 100 AS TauxReductionMoyen
FROM VenteProduits vp
JOIN Produit p ON vp.ClefProduit = p.ClefProduit
GROUP BY p.CategorieProduit
ORDER BY TauxReductionMoyen DESC;

-- Nombre de clients par tranche d'âge et par ville
SELECT 
    CASE 
        WHEN cl.Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN cl.Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN cl.Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN cl.Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN cl.Age > 55 THEN '55+'
    END AS TrancheAge,
    m.Ville,
    COUNT(DISTINCT vp.ClefClient) AS NombreClients
FROM VenteProduits vp
JOIN Client cl ON vp.ClefClient = cl.ClefClient
JOIN Magasin m ON vp.ClefMagasin = m.ClefMagasin
GROUP BY 
    CASE 
        WHEN cl.Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN cl.Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN cl.Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN cl.Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN cl.Age > 55 THEN '55+'
    END,
    m.Ville
ORDER BY TrancheAge, m.Ville;

-- Analyse des performances des promotions
SELECT 
    p.NomPromotion,
    COUNT(vp.IDPaiement) AS NombreVentes,
    SUM(vp.MontantFinal) AS ChiffreAffaires,
    AVG(vp.Reduction / (vp.Quantite * vp.MontantUnitaire)) * 100 AS TauxReductionMoyen
FROM VenteProduits vp
JOIN Promotion p ON vp.ClefPromotion = p.ClefPromotion
GROUP BY p.NomPromotion
ORDER BY ChiffreAffaires DESC;