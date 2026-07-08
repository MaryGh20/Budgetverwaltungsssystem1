insert into benutzer values 

('John', 'Cena'),
('SpongeBob', 'SquarePants'),
('Light', 'Yagami'),
('Bilbo', 'Baggins'); 

insert into konto (k_id, bez, k_stand) values

(1, 'Gemeinschaftskonto', 4000.00),
(2, 'John Girokonto', 100000.00),
(3, 'John Bargeld', 0.00),
(4, 'SpongeBob Girokonto', 60.00),
(5, 'SpongeBob Bargeld', 900.00),
(6, 'Light Girokonto', 100.00),
(7, 'Light Bargeld', 450.00),
(8, 'Bilbo Girokonto', 35.75),
(9, 'Bilbo Bargeld', 450.00);


INSERT INTO benutzer_konto (ben_id, kon_id) VALUES
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

insert into art_transfer (at_id, art_trans_bez) values
(1, 'Einnahme'),
(2, 'Ausgabe'),
(3, 'Umbuchung');

INSERT INTO kategorie (kat_id, Name, art_id) VALUES
(1, 'Gehalt', 1),
(2, 'Geschenk', 1),
(3, 'Essen', 2),
(4, 'Miete', 2),
(5, 'Drogerie', 2),
(6, 'Freizeit', 2),
(7, 'Medizin', 2),
(8, 'Sparen', 3);

INSERT INTO transaktion (trans_id, date_zeit, summe, konto_id, art_id, kategorie_id) VALUES
(1, '2026-07-01 09:15:00', 2500.00, 2, 1, 1),
(2, '2026-07-01 10:30:00', 850.00, 4, 1, 1),
(3, '2026-07-01 11:00:00', 1200.00, 6, 1, 1),
(4, '2026-07-02 14:20:00', 45.80, 1, 2, 3),
(5, '2026-07-02 16:45:00', 12.95, 2, 2, 5),
(6, '2026-07-03 08:10:00', 25.00, 5, 2, 6),
(7, '2026-07-03 18:30:00', 60.00, 1, 2, 4),
(8, '2026-07-04 12:00:00', 200.00, 2, 3, 8),
(9, '2026-07-04 12:05:00', 200.00, 3, 3, 8),
(10, '2026-07-05 15:40:00', 18.50, 7, 2, 3),
(11, '2026-07-05 19:10:00', 9.99, 8, 2, 6),
(12, '2026-07-06 09:00:00', 100.00, 9, 2, 7);
