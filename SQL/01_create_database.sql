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



---------------------------------------Aida-------------------------------------------------
DECLARE @Benutzer_NName VARCHAR(15) = 'Cena'
DECLARE @Benutzer_VName VARCHAR(15) = 'John'
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
WHERE b.vorname = @Benutzer_VName
 AND b.nachname = @Benutzer_NName
 AND a.art_trans_bez = 'Ausgabe'
 AND t.date_zeit >= '20260701'
 AND t.date_zeit < '20260801'
GROUP BY b.vorname, b.nachname;