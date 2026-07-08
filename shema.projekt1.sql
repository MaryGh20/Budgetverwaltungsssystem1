

create table Benutzer (
B_id int identity primary key,
vorname varchar(15),
nachname varchar(15)
);


create table Konto (
K_id int primary key,
Bezeichnung varchar(30),
Kontostand Decimal (15,2)
);

create table Benutzer_konto (
Benutzer_id int,
Konto_id int,
Primary key (Benutzer_id, Konto_id), 
Foreign key (Benutzer_id) references Benutzer (B_id),
Foreign Key (Konto_id) references Konto(K_id)
);

create table transaktion (
trans_id int,
Date_Zeit Datetime,
Summe Decimal(15,2),
Konto_id int,
art_id int,
Primary key (trans_id), 
Foreign key (Konto_id) references Konto (K_id),
Foreign Key (Art_id) references Art_Transfer (A_id)
);

create table Art_Transfer (
A_id int primary key,
Art_bez varchar(30)
);

create table Kategorie (
Kat_id int,
Name varchar(10),
Art_id int,
Primary key (Kat_id),
Foreign key (Art_id) references Art_Transfer (A_id)
);

