-- Empty Staging Tables
TRUNCATE TABLE StagingCalendrier;
TRUNCATE TABLE StagingTemps;
TRUNCATE TABLE StagingCaisse;
TRUNCATE TABLE StagingMagasin;
TRUNCATE TABLE StagingPromotion;
TRUNCATE TABLE StagingProduit;
TRUNCATE TABLE StagingClient;
TRUNCATE TABLE StagingModePaiement;
TRUNCATE TABLE StagingVenteProduits;

-- Drop Staging Tables
DROP TABLE IF EXISTS StagingCalendrier;
DROP TABLE IF EXISTS StagingTemps;
DROP TABLE IF EXISTS StagingCaisse;
DROP TABLE IF EXISTS StagingMagasin;
DROP TABLE IF EXISTS StagingPromotion;
DROP TABLE IF EXISTS StagingProduit;
DROP TABLE IF EXISTS StagingClient;
DROP TABLE IF EXISTS StagingModePaiement;
DROP TABLE IF EXISTS StagingVenteProduits;