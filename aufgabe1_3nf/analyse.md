# Analyse

## Attribute
- Bestellnummer
- Bestelldatum
- Kundennummer
- Kundenname
- Kundenadresse
- Produktnummer
- Produktbezeichnung
- Menge
- Einzelpreis
- Hersteller
- Hersteller-Land
- Versandkosten
- Gesamtkosten

## Funktionale Abhängigkeiten
- Bestellnummer → Bestelldatum, Kundennummer, Versandkosten
- Kundennummer → Kundenname, Kundenadresse
- Hersteller → Land
  (transitiv: Produktnummer → Hersteller → Hersteller-Land)
- {Bestellnummer, Produktnummer} → Menge, Einzelpreis

## Redundanzen & Anomalien
- **Redundanz:** Die Daten zu Kundennummer, Produktnummer, 
Hersteller und Bestellnummer werden mehrfach gespeichert.
- **Änderungsanomalie:** Ändern sich Kunden-, Produkt- oder Herstellerdaten, 
müssen sie in mehreren Zeilen geändert werden. 
Beispiel: Die Adresse von K001 steht in 6 Zeilen. 
Wird eine Zeile vergessen, entstehen widersprüchliche Daten.
- **Löschanomalie:** Wird eine Bestellung gelöscht, gehen auch Daten verloren, 
die nur in dieser Bestellung vorkommen. Beispiel: Wird Bestellung 1016 gelöscht, 
gehen Kunde K009, die Produkte P11 und P12 sowie die Hersteller Dell und Nvidia verloren.
- **Einfügeanomalie:** Ein neuer Kunde, ein neues Produkt oder ein neuer Hersteller
kann nicht angelegt werden, solange keine Bestellung existiert.
- **Gesamtkosten:** werden berechnet (Menge × Einzelpreis + Versandkosten) und nicht gespeichert. 
Beispiel 1007: berechnet 303.99, gespeichert 293.99 → Inkonsistenz.

## Tabellen in 3NF
- **Bestellungen** (Bestellnummer PK, Bestelldatum, Kundennummer FK, Versandkosten)
- **Kunden** (Kundennummer PK, Kundenname, Kundenadresse)
- **Produkte** (Produktnummer PK, Produktbezeichnung, Hersteller FK)
- **Hersteller** (Hersteller PK, Land)
- **Bestellpositionen** (Bestellnummer PK/FK, Produktnummer PK/FK, Menge, Einzelpreis)