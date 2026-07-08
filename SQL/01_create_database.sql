-- schauen wir alle transaktionen mit name und konto
SELECT
    --b.b_id,
    b.Vorname,
    b.Nachname,
    k.bez,
    k.k_stand,
    t.summe,
    t.date_zeit
    --t.Beschreibung
FROM Benutzer b
JOIN Benutzer_Konto bk 
    ON b.b_id = bk.bk_id
JOIN Konto k 
    ON bk.bk_id = k.k_id
JOIN Transaktion t 
    ON k.k_id = t.konto_id;

-- überprüfen wir Transaktion + Kategorie

SELECT
    t.trans_id,
    t.summe,
    t.date_zeit,
    k.Name AS Kategorie
FROM Transaktion t
JOIN art_transfer a
    ON t.trans_id = a.at_id
JOIN Kategorie k
    ON k.kat_id = a.at_id;

-- überprufen Einnahme und Ausgabe

SELECT
    t.summe,
    t.date_zeit,
    a.art_trans_bez AS TransferArt
FROM Transaktion t
JOIN Art_Transfer a
    ON t.trans_id = a.art_trans_bez;

--Budgetbericht
SELECT
    b.Vorname,
    b.Nachname,
    k.k_id,
    t.summe,
    a.art_trans_bez,
    kat.Name,
    t.date_zeit
FROM Benutzer b
JOIN Benutzer_Konto bk
    ON b.b_id = bk.bkonto_id
JOIN Konto k
    ON bk.bkonto_id = k.k_id
JOIN Transaktion t
    ON k.k_id = t.konto_id
JOIN Art_Transfer a
    ON t.trans_id = a.art_trans_bez
JOIN Kategorie kat
    ON t.art_id = kat.art_id;

--Die Kosten berechnen

SELECT
    kat.Name,
    SUM(t.summe)
FROM Transaktion t
JOIN Art_Transfer a
    ON t.trans_id = a.art_trans_bez
JOIN Kategorie kat
    ON t.art_id = kat.art_id
WHERE t.summe < 0
GROUP BY kat.Name;

