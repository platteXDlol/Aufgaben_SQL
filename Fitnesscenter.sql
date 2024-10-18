CREATE DATABASE FitnessCenter;

GO

USE FitnessCenter;

CREATE TABLE Orte (
    OrtId int not null, 
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