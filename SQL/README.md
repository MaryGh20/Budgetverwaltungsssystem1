1. Einleitung
1.1 Projektumfeld
Das Projekt entsteht im Rahmen einer Umschulung im Bereich Fachinformatik / Datenbankentwicklung. Ziel ist es, ein System zu entwickeln, mit dem eine Familie ihre Konten, Benutzer und Transaktionen strukturiert verwalten kann. Das Modell soll sowohl Lernzwecken dienen als auch zeigen, wie relationale Datenbanken reale Prozesse abbilden.
1.2 Projektauslöser
Im Alltag entstehen viele finanzielle Bewegungen, die oft unübersichtlich werden. Familien benötigen eine einfache Möglichkeit, Konten gemeinsam zu nutzen, Transaktionen zu kategorisieren und Verantwortlichkeiten klar zuzuordnen. Der Auslöser war der Wunsch nach Transparenz und einer strukturierten Datenbasis.
1.3 Projektziel
Ziel ist die Entwicklung eines funktionalen Datenbankmodells, das:
•	Benutzer einer Familie verwaltet
•	Gemeinsame und individuelle Konten abbildet
•	Transaktionen speichert und kategorisiert
•	Eine klare Struktur für spätere Erweiterungen bietet
2. Planung
2.1 Zeitplanung
•	Analysephase: 1 Tag
•	Entwurf des ER Modells: 1 Tag
•	Implementierung der Tabellen: 2 Tage
•	Testen & Fehlerbehebung: 1 Tag
•	Dokumentation & Präsentation: 1 Tag
2.2 IST Analyse
Im IST Zustand existiert kein strukturiertes System. Finanzdaten werden manuell oder gar nicht dokumentiert. Es gibt keine Zuordnung zwischen Benutzer, Konto und Transaktion. 2.3 SOLL Konzept
Das SOLL System besteht aus klar getrennten Entitäten:
•	Familie: Gruppiert Benutzer
•	Benutzer: Personen mit Zugriff
•	Konto: Finanzkonten
•	Benutzer Konto: Zuordnungstabelle für gemeinsame Nutzung
•	Transaktion: Buchungen mit Datum, Betrag und Art
•	Art_transf: Typ der Transaktion (z. B. Ein  oder Auszahlung)
•	Kategorie: Klassifizierung (z. B. Lebensmittel, Freizeit)
2.4 Kosten
Da es ein Ausbildungsprojekt ist, entstehen keine finanziellen Kosten. Zeitaufwand und Lernleistung sind die Hauptfaktoren.
3. Durchführung
3.1 Entwurf
Das ER Modell wurde erstellt, um alle Beziehungen klar darzustellen. Primär  und Fremdschlüssel wurden definiert, um Datenintegrität sicherzustellen.
3.2 Implementierung
Die Tabellen wurden gemäß ER Modell in SQL umgesetzt. Wichtige Punkte:
•	Verwendung von Fremdschlüsseln zur Sicherstellung der Konsistenz
•	Dezimalwerte für Kontostände und Summen
•	Join Tabellen für n:m Beziehungen (Benutzer ↔ Konto)
3.3 Tests
Es wurden Testdatensätze eingefügt, um:
•	Benutzer Konto Verknüpfungen zu prüfen
•	Transaktionen korrekt zu speichern
•	Kategorien und Arten richtig zuzuordnen
•	Joins und Abfragen zu validieren 3.4 Probleme und Lösungen
•	Problem: Mehrere Benutzer pro Konto → Lösung: n:1 Tabelle Ben_Konto
•	Problem: Unterschiedliche Transaktionsarten → Lösung: eigene Tabelle Art_transf
•	Problem: Kategorisierung von Transaktionen → Lösung: Fremdschlüssel in Kategorie
4. Abschluss
4.1 Zeitvergleich
Die geplante Zeit wurde weitgehend eingehalten. Lediglich die Testphase dauerte etwas länger, da mehrere Beziehungen geprüft werden mussten.
4.2 Fazit
Das Projekt zeigt, wie ein strukturiertes Datenbankmodell komplexe Alltagsprozesse abbilden kann. Die klare Trennung der Entitäten ermöglicht Erweiterbarkeit, z. B. für Budgetplanung oder Auswertungen. Das System ist funktional, logisch aufgebaut und erfüllt die Projektziele vollständig.

