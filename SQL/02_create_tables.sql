drop table if exists transaktion;
drop table if exists benutzer_konto;
drop table if exists kategorie;
drop table if exists art_transfer;
drop table if exists benutzer;
drop table if exists konto;


create table benutzer (
b_id int identity primary key,
vorname varchar(15),
nachname varchar(15)
);

create table konto (
k_id int identity primary key,
bez varchar(30),
k_stand Decimal (15,2)
);

create table art_transfer (
at_id int identity primary key,
art_trans_bez varchar(30)
);


create table benutzer_konto (
ben_id int,
kon_id int,
Primary key (ben_id, kon_id), 
Foreign key (ben_id) references benutzer (b_id),
Foreign Key (kon_id) references konto(k_id)
);

create table kategorie (
kat_id int identity primary key,
kat_name varchar(30),
art_id int,
Foreign key (art_id) references art_transfer (at_id)
);

create table transaktion (
trans_id int identity Primary key,
date_zeit Datetime,
summe Decimal(15,2),
konto_id int,
art_id int,
kategorie_id int, 
Foreign key (konto_id) references konto (k_id),
Foreign Key (art_id) references art_transfer (at_id),
Foreign Key (kategorie_id) references kategorie (kat_id));

-----------------------------------------------------------------------------
alter table art_transfer ADD 
art_wert int;
select * from art_transfer

--begin try 
--update art_transfer set art_transfer.art_wert = 1 
--where art_transfer.art_trans_bez = 'Einnahme'
--update art_transfer set art_transfer.art_wert = -1 
--where art_transfer.art_trans_bez = 'Ausgabe'



----------------------------------------------------------------------------------