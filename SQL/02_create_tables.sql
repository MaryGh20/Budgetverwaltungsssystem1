drop table if exists transaktion;
drop table if exists benutzer;
drop table if exists konto;
drop table if exists art_transfer;
drop table if exists benutzer_konto;
drop table if exists kategorie;

create table benutzer (
b_id int identity primary key,
vorname varchar(15),
nachname varchar(15)
);

create table konto (
k_id int primary key,
bez varchar(30),
k_stand Decimal (15,2)
);

create table art_transfer (
at_id int primary key,
art_trans_bez varchar(30)
);

create table benutzer_konto (
bk_id int,
bkonto_id int,
Primary key (bk_id, bkonto_id), 
Foreign key (bk_id) references Benutzer (b_id),
Foreign Key (bkonto_id) references konto(k_id)
);

create table transaktion (
trans_id int,
date_zeit Datetime,
summe Decimal(15,2),
konto_id int,
art_id int,
Primary key (trans_id), 
Foreign key (konto_id) references konto (k_id),
Foreign Key (art_id) references art_transfer (at_id)
);


create table kategorie (
kat_id int,
Name varchar(10),
art_id int,
Primary key (kat_id),
Foreign key (art_id) references art_transfer (at_id)
);

