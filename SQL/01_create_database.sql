-- schauen wir alle kontozustand für alle konto
SELECT
    b.Vorname,
    b.Nachname,

    k.bez 'Konto name',
    k.k_stand 'Kontostand'
FROM benutzer_konto bk
JOIN Benutzer b 
    ON b.b_id = bk.ben_id

JOIN Konto k 
    ON bk.kon_id = k.k_id
    

--ein Gemeinsamer Kontostand
select sum(k.k_stand) 'ein Gemeinsamer Kontostand'  from konto k;



-- überprüfen wir Transaktion + Kategorie
set dateformat ydm;
SELECT
    t.date_zeit,
    a.art_trans_bez,
    k.kat_name Kategorie,
    t.summe
FROM Transaktion t
JOIN art_transfer a
    ON t.art_id = a.at_id
JOIN Kategorie k
    ON k.kat_id = t.kategorie_id
where month(t.date_zeit) = '06' --and year(t.date_zeit)='2026'
--Where t.date_zeit between '2026.06.01' and '2026.07.01'  
/*where t.date_zeit >= '2026-06-01'
and t.date_zeit < '2026-07-01'
order by t.date_zeit;*/


-- �berprufen Einnahme und Ausgabe

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

