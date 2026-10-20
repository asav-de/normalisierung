CREATE DATABASE IF NOT EXISTS online_shop
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE online_shop;

CREATE TABLE kunden (
  kundennummer VARCHAR(100),
  kundenname VARCHAR(100),
  kundenadresse VARCHAR(255),
  PRIMARY KEY (kundennummer)
);
CREATE TABLE bestellungen (
  bestellnummer INT,
  bestelldatum DATE,
  kundennummer VARCHAR(100),
  versandkosten DECIMAL(10,2),
  PRIMARY KEY (bestellnummer),
  FOREIGN KEY (kundennummer) REFERENCES kunden(kundennummer)
);
CREATE TABLE hersteller (
  hersteller VARCHAR(100),
  land VARCHAR(100),
  PRIMARY KEY (hersteller)
);
CREATE TABLE produkte (
  produktnummer VARCHAR(100),
  produktbezeichnung VARCHAR(100),
  hersteller VARCHAR(100),
  PRIMARY KEY(produktnummer),
  FOREIGN KEY(hersteller) REFERENCES hersteller(hersteller)
);
CREATE TABLE bestellpositionen (
  bestellnummer INT,
  produktnummer VARCHAR(100),
  menge INT,
  einzelpreis DECIMAL(10,2),
  PRIMARY KEY(bestellnummer, produktnummer),
  FOREIGN KEY(bestellnummer) REFERENCES bestellungen(bestellnummer),
  FOREIGN KEY(produktnummer) REFERENCES produkte(produktnummer)
);