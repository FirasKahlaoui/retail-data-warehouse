CREATE TABLE Calendrier (
    ClefDate INT PRIMARY KEY,
    Date DATE NOT NULL,
    Jour INT,
    Semaine INT,
    SemaineDeAnnee INT,
    Mois INT,
    MoisDeAnnee INT,
    Trimestre INT,
    TrimestreDeAnnee INT,
    Annee INT,
    Ferie BIT
);