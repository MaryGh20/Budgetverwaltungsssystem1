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
    -----------------------------------------------------------
    SELECT
    k.bez 'Konto name',
    k.k_stand 'Kontostand'
    FROM Konto k
      

--ein Gemeinsamer Kontostand
select sum(k.k_stand) 'ein Gemeinsamer Kontostand'  from konto k;

----------------------------------TRANSACTION--------------------------------------
--------------INNERE TRANSAKTION -------------------------
-- 1. Transaktion explizit starten
DECLARE @KontoID INT = 1;              -- Um welches Konto geht es? (K_id)
DECLARE @KategorieID INT = 4;
DECLARE @Betrag DECIMAL(15,2) = 500.00; -- Wie viel Geld?

DECLARE @ArtID INT = (                         -- Transaktionsart (z.B. 2 = 'Ausgabe')
                       select k.art_id from kategorie k where k.kat_id=@KategorieID
                      );              

                
DECLARE @ArtType INT = (
                        select DISTINCT art_transfer.art_wert from art_transfer  --statt art_transfer.at_id schreib  statt art_transfer.zeichen
                        join transaktion t on t.art_id=art_transfer.at_id
                        --where t.konto_id =1-- @KontoID
                        where t.art_id = @ArtID
                        );
--DECLARE @ArtType INT =-1
select konto.k_stand from konto where konto.k_id=@KontoID
;

BEGIN TRANSACTION;

BEGIN TRY
    -- Schritt A: Die Transaktion in die Tabelle "Transaktion" eintragen
    -- (id_trans wird hier als IDENTITY/Autowert angenommen, Data_Zeit kriegt das aktuelle Datum)
    INSERT INTO transaktion (date_zeit, Summe, Konto_id, Art_id, kategorie_id)
    VALUES (GETDATE(), @Betrag, @KontoID, @ArtID, @KategorieID);
    UPDATE konto 
    SET konto.k_stand = konto.k_stand + @Betrag*@ArtType
    WHERE  konto.k_id = @KontoID 

   -- Wenn beide Befehle ohne Fehler geklappt haben: Speichern!

    COMMIT TRANSACTION;
    PRINT 'Transaktion erfolgreich gebucht und Kontostand aktualisiert.';

    END TRY
BEGIN CATCH
    -- Falls irgendetwas schiefgeht (z.B. KontoID existiert nicht -> Foreign Key Error):
    -- Alles komplett zurücksetzen!
    ROLLBACK TRANSACTION;
    
    PRINT 'Fehler beim Buchen! Die Datenbank wurde zurückgesetzt.';
    
    -- Fehlerdetails anzeigen
    SELECT 
        ERROR_NUMBER() AS FehlerNummer,
        ERROR_MESSAGE() AS FehlerText;
END CATCH;
select konto.k_stand from konto where konto.k_id=@KontoID

-------------------------TRANSAKTION ZWISCHEN INNERE KONTO------------------------------------------------


---------------------------unten von Mariam-----------------------------------------
-- überprüfen wir Transaktion + Kategorie
set dateformat ymd;
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
--where month(t.date_zeit) = '06' and year(t.date_zeit)='2026'
--Where t.date_zeit between '2026.06.01' and '2026.07.01';  
where t.date_zeit >= '2026-06-01'
and t.date_zeit < '2026-07-01'
order by t.date_zeit desc;


-- berprufen Einnahme und Ausgabe

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

---------------------------------------Aida-------------------------------------------------

SELECT
   b.vorname,
   b.nachname,
   SUM(t.summe) AS ausgaben_juni
FROM benutzer b
JOIN benutzer_konto bk
   ON b.b_id = bk.ben_id
JOIN konto k
   ON bk.kon_id = k.k_id
JOIN transaktion t
   ON k.k_id = t.konto_id
JOIN art_transfer a
   ON t.art_id = a.at_id
WHERE b.vorname = 'John'
 AND b.nachname = 'Cena'
 AND a.art_trans_bez = 'Ausgabe'
 AND t.date_zeit >= '20260601'
 AND t.date_zeit < '20260701'
GROUP BY b.vorname, b.nachname;