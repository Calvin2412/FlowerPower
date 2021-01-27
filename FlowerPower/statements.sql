create database flowerpower;
USE flowerpower;

create table Klant(
	Klantcode int,
    Voorletters varchar(20),
    Tussenvoegsels varchar(20),
    Achternaam varchar(255),
    Adres varchar(80),
    Postcode varchar(50),
    Woonplaats varchar(255),
    Geboortedatum date,
    Gebruikersnaam varchar(32),
    Wachtwoord varchar(64),
    primary key(Klantcode)
);

create table Factuur(
	Factuurnummer int,
    Factuurdatum date,
    Klantcode int,
    primary key(Factuurnummer),
    FOREIGN KEY (Klantcode) REFERENCES Klant(Klantcode)
);

create table Artikel(
	Artikelcode int,
    Artikel varchar(50),
    Prijs decimal,
    primary key(Artikelcode)
);

create table Medewerker(
	Medewerkerscode int,
    Voorletters varchar(20),
    Voorvoegsels varchar(20),
    Achternaam varchar(255),
    Gebruikersnaam varchar(255),
    Wachtwoord varchar(64),
    primary key(Medewerkerscode)
);

create table Winkel(
	Winkelcode int,
    Winkelnaam varchar(255),
    Winkeladres varchar(80),
    Winkelpostcode varchar(50),
    Vestigingsplaats varchar(255),
    Telefoonnummer varchar(22),
    primary key(Winkelcode)
);

create table Factuurregel(
	Factuurnummer int,
    Artikelcode int,
    Aantal int,
    Prijs decimal,
    FOREIGN KEY (Factuurnummer) REFERENCES Factuur(Factuurnummer),
    FOREIGN KEY (Artikelcode) REFERENCES Artikel(Artikelcode)  
);

create table Bestelling(
	Artikelcode int,
    Winkelcode int,
    Aantal int,
    Klantcode int,
    Medewerkerscode int,
    Afgehaald varchar(255),
    FOREIGN KEY (Artikelcode) REFERENCES Artikel(Artikelcode),
    FOREIGN KEY (Winkelcode) REFERENCES Winkel(Winkelcode),
    FOREIGN KEY (Klantcode) REFERENCES Klant(Klantcode),
    FOREIGN KEY (Medewerkerscode) REFERENCES Medewerker(Medewerkerscode)    
);