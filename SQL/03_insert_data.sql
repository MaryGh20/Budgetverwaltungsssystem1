

insert into benutzer values 

('John', 'Cena'),
('SpongeBob', 'SquarePants'),
('Light', 'Yagami'),
('Bilbo', 'Baggins'); 

insert into konto (bez, k_stand) values

('Gemeinschaftskonto', 4000.00),
('John Girokonto', 100000.00),
('John Bargeld', 0.00),
('SpongeBob Girokonto', 60.00),
('SpongeBob Bargeld', 900.00),
('Light Girokonto', 100.00),
('Light Bargeld', 450.00),
('Bilbo Girokonto', 35.75),
( 'Bilbo Bargeld', 450.00);


INSERT INTO benutzer_konto VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8);

insert into art_transfer values
('Einnahme'),
('Ausgabe');


INSERT INTO kategorie VALUES
('Gehalt', 1),
('Geschenk', 1),
('Essen', 2),
('Miete', 2),
('Drogerie', 2),
('Freizeit', 2),
('Medizin', 2),
('Auszahlung', 2),
('Einzahlung', 1);

INSERT INTO transaktion (date_zeit, summe, konto_id, art_id, kategorie_id) VALUES
('2026-07-01 09:15:00', 2500.00, 2, 1, 1),
('2026-07-01 10:30:00', 850.00, 4, 1, 1),
('2026-07-01 11:00:00', 1200.00, 6, 1, 1),
('2026-07-02 14:20:00', 45.80, 1, 2, 3),
('2026-07-02 16:45:00', 12.95, 2, 2, 5),
('2026-07-03 08:10:00', 25.00, 5, 2, 6),
('2026-07-03 18:30:00', 60.00, 1, 2, 4),
('2026-07-05 15:40:00', 18.50, 7, 2, 3),
('2026-07-05 19:10:00', 9.99, 8, 2, 6),
('2026-07-06 09:00:00', 100.00, 9, 2, 7),
('2026-07-06 15:40:00', 200.00, 6, 2, 8),
('2026-07-06 15:40:00', 200.00, 7, 1, 9);

select * from transaktion
select * from benutzer_konto
select * from kategorie
select * from  art_transfer
select * from  benutzer
select * from  konto