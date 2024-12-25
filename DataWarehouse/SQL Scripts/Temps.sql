CREATE TABLE Temps (
    ClefTemps INT PRIMARY KEY,
    Temps TIME NOT NULL,
    Heure INT,
    Minute INT,
    AM_PM NVARCHAR(2),
    JourNuit NVARCHAR(10),
    HeureCreuse BIT
);