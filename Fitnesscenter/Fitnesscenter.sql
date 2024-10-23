CREATE DATABASE FitnessCenter;

GO

USE FitnessCenter;

CREATE TABLE Orte (
    OrtId int IDENTITY(1,1) not null, 
    PLZ varchar(10), 
    Ortname varchar(50) not null, 
    Kanton char(2), 
    CONSTRAINT pk_Orte PRIMARY KEY(OrtId)
)

CREATE TABLE Kunden (
    Kundennummer int IDENTITY(1,1) not null,
    Vorname varchar(30) not null,
    Nachname varchar(30) not null, 
    Geschlecht char(1),
    Geburtsdatum smalldatetime, 
    Wohnort int, 
    CONSTRAINT pk_Kunden PRIMARY KEY (Kundennummer), 
    CONSTRAINT fk_KundenOrte FOREIGN KEY (Wohnort) REFERENCES Orte(OrtId)
)

CREATE TABLE Mitarbeiter (
    Personalnummer int IDENTITY(1,1),
    Vorname varchar(30) NOT NULL, 
    Nachname varchar(30) NOT NULL, 
    CONSTRAINT pk_Mitarbeiter PRIMARY KEY(Personalnummer)
);

CREATE TABLE Betreuung (
    Kundennummer int NOT NULL,
    Personalnummer int NOT NULL,
    CONSTRAINT pk_Betreuung PRIMARY KEY(Kundennummer, Personalnummer),
    CONSTRAINT fk_BetreuungKunden FOREIGN KEY(Kundennummer) REFERENCES Kunden(Kundennummer) ON DELETE CASCADE, 
    CONSTRAINT fk_BetreuungMitarbeiter FOREIGN KEY(Personalnummer) REFERENCES Mitarbeiter(Personalnummer) 
);

ALTER TABLE Betreuung ADD Notiz varchar(500) NULL
ALTER TABLE Betreuung ADD VonKKBezahlt bit DEFAULT 0
ALTER TABLE Kunden ADD Krankenkasse varchar(20)
ALTER TABLE Mitarbeiter ADD Monatslohn int null



INSERT INTO Mitarbeiter (Vorname, Nachname, Monatslohn) VALUES ('Rafael', 'Szanislo', '5500');
INSERT INTO Mitarbeiter (Vorname, Nachname, Monatslohn) VALUES ('Jürg', 'Müller', '5200');
INSERT INTO Mitarbeiter (Vorname, Nachname, Monatslohn) VALUES ('Markus', 'Meister', '4800');
INSERT INTO Mitarbeiter (Vorname, Nachname, Monatslohn) VALUES ('Franco', 'Dell Amore', '4800');





CREATE TABLE tmp_Ort
(
    ONRP               int NOT NULL PRIMARY KEY, 
    PLZTyp             tinyint NOT NULL,
    PLZ                smallint NOT NULL, 
    PLZZusatz          smallint NOT NULL, 
    Ortsbezeichnung18  varchar(18) NOT NULL,
    Ortsbezeichnung27  varchar(27) NOT NULL,
    Kanton             char(2) NOT NULL
 );

 BULK INSERT tmp_Ort 
    FROM "C:\Users\ÜK-G8\Documents\Basislehrjahr\1. Semester\Datenstrukturieren\SQL Aufgaben\Aufgaben_SQL\Verzeichnis-PLZ-light.csv"
    WITH 
    (
        FIELDTERMINATOR = ';',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2 , 
        CODEPAGE = 'RAW'
    );

INSERT INTO Orte (PLZ, Ortname, Kanton) 
   SELECT PLZ, Ortsbezeichnung27, Kanton 
   FROM tmp_Ort WHERE PLZTyp = 10 OR PLZTyp = 20 


DROP TABLE tmp_Ort;


INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Beatrix', 'Hugentobler', 'w', '19630324', (SELECT OrtId FROM Orte WHERE PLZ='6032'), 'CSS Versicherung');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Viktor', 'Meyer', 'm', '19601218', (SELECT OrtId FROM Orte WHERE PLZ='6012'), 'Group Mutuel');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Yanick', 'Merz', 'm', '19960803', (SELECT OrtId FROM Orte WHERE PLZ='6043'), NULL);

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Joshua', 'Pfister', 'm', '20010528', (SELECT OrtId FROM Orte WHERE PLZ='6030'), 'Concordia');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Franziska', 'Tobler', 'w', '19750304', (SELECT OrtId FROM Orte WHERE PLZ='6000'), 'CSS Versicherung');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Michele', 'dAngelo', 'm', '20020630', (SELECT OrtId FROM Orte WHERE PLZ='6003'), 'CSS Versicherung');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Petra', 'Nussbaumer', 'w', '19690825', (SELECT OrtId FROM Orte WHERE PLZ='6016'), 'Group Mutuel');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Admir', 'Smajic', 'm', '19630907', (SELECT OrtId FROM Orte WHERE PLZ='6020'), 'CSS Versicherung');

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Lars', 'Ramseier', 'm', '19990125', (SELECT OrtId FROM Orte WHERE Ortname='Gisikon'), NULL);

INSERT INTO Kunden (Vorname, Nachname, Geschlecht, Geburtsdatum, Wohnort, Krankenkasse) VALUES ('Erna', 'Tschurtschenthaler', 'w', '19891113', (SELECT OrtId FROM Orte WHERE PLZ='6024'), 'CSS Versicherung');




INSERT INTO Betreuung (Kundennummer, Personalnummer, VonKKBezahlt, Notiz) VALUES ((SELECT Kundennummer FROM Kunden WHERE Vorname='Yanick'), (SELECT Personalnummer FROM Mitarbeiter WHERE Vorname='Rafael'), 0, 'Muskelaufbau' );

INSERT INTO Betreuung (Kundennummer, Personalnummer, VonKKBezahlt, Notiz) VALUES ((SELECT Kundennummer FROM Kunden WHERE Vorname='Erna'), (SELECT Personalnummer FROM Mitarbeiter WHERE Vorname='Markus'), 1, 'Rehabilitation einer Verletzung beim Sportunfall' );

INSERT INTO Betreuung (Kundennummer, Personalnummer, VonKKBezahlt, Notiz) VALUES ((SELECT Kundennummer FROM Kunden WHERE Vorname='Viktor'), (SELECT Personalnummer FROM Mitarbeiter WHERE Vorname='Markus'), 0, 'Koordinations probleme' );

INSERT INTO Betreuung (Kundennummer, Personalnummer, VonKKBezahlt, Notiz) VALUES ((SELECT Kundennummer FROM Kunden WHERE Vorname='Viktor'), (SELECT Personalnummer FROM Mitarbeiter WHERE Vorname='Jürg'), 1, 'Bandscheiben vorfall, Rückenübungen' );

