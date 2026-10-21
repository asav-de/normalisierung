CREATE DATABASE IF NOT EXISTS online_shop
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE online_shop;

CREATE TABLE kunden (
  kundennummer VARCHAR(100) NOT NULL,
  kundenname VARCHAR(100) NOT NULL,
  kundenadresse VARCHAR(255) NOT NULL,
  PRIMARY KEY (kundennummer)
);
CREATE TABLE bestellungen (
  bestellnummer INT NOT NULL,
  bestelldatum DATE NOT NULL,
  kundennummer VARCHAR(100) NOT NULL,
  versandkosten DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (bestellnummer),
  CONSTRAINT FK_Bestellungen_Kunden FOREIGN KEY (kundennummer) REFERENCES kunden(kundennummer)
);
CREATE TABLE hersteller (
  herstellerId INT NOT NULL,
  herstellerName VARCHAR(255) NOT NULL,
  herstellerLand VARCHAR(255) NOT NULL,
  PRIMARY KEY (herstellerId)
);
CREATE TABLE produkte (
  produktnummer VARCHAR(100) NOT NULL,
  produktbezeichnung VARCHAR(100) NOT NULL,
  herstellerId INT NOT NULL,
  PRIMARY KEY(produktnummer),
  CONSTRAINT FK_Produkte_Hersteller FOREIGN KEY(herstellerId) REFERENCES hersteller(herstellerId)
);
CREATE TABLE bestellpositionen (
  bestellnummer INT NOT NULL,
  produktnummer VARCHAR(100) NOT NULL,
  menge INT NOT NULL,
  einzelpreis DECIMAL(10,2) NOT NULL,
  PRIMARY KEY(bestellnummer, produktnummer),
  CONSTRAINT FK_Bestellpositionen_Bestellungen FOREIGN KEY(bestellnummer) REFERENCES bestellungen(bestellnummer),
  CONSTRAINT FK_Bestellpositionen_Produkte FOREIGN KEY(produktnummer) REFERENCES produkte(produktnummer)
);
