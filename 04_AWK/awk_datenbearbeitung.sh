#!/bin/sh
# Dieses Skript erklärt die Verwendung von AWK zur Datenbearbeitung.
# AWK wird häufig verwendet, um Daten zu analysieren, zu bearbeiten und zu formatieren,
# insbesondere bei der Arbeit mit Tabellen oder Textdateien, bei denen Daten durch Trennzeichen getrennt sind.

# 1. ASCII-Tabelle der AWK Parameter und Optionen
# -----------------------------------------------------------------------------
# | Parameter      | Bedeutung                                                |
# -----------------------------------------------------------------------------
# | $1, $2, ...     | Zugriff auf die Felder der aktuellen Zeile. $1 ist das erste Feld, $2 das zweite, usw. |
# | $NF            | Zugriff auf das letzte Feld der aktuellen Zeile.           |
# | FS             | Eingabefeldtrennzeichen (Field Separator). Standardmäßig ist dies ein Leerzeichen oder Tabulator. |
# | OFS            | Ausgabe-Feldtrennzeichen (Output Field Separator).        |
# | NR             | Aktuelle Zeilennummer.                                    |
# | NF             | Anzahl der Felder in der aktuellen Zeile.                  |
# | $0             | Die gesamte aktuelle Zeile.                               |
# | BEGIN          | Block, der vor der Verarbeitung von Eingabedaten ausgeführt wird. |
# | END            | Block, der nach der Verarbeitung von Eingabedaten ausgeführt wird. |
# | print          | Gibt Daten aus, kann in Kombination mit Formatierung verwendet werden. |
# | { ... }        | Anweisungen, die auf jede Eingabezeile angewendet werden. |
# -----------------------------------------------------------------------------

# 2. Beispiel: Zugriff auf Felder und Datensätze

echo "### Beispiel 1: Zugriff auf Felder ###"
echo -e "Name Alter Ort\nMax 25 Berlin\nEva 30 Hamburg" | awk '{ print $1, $2 }'
# Ausgabe:
# Name Alter
# Max 25
# Eva 30

# 3. Beispiel: Zugriff auf das letzte Feld ($NF)

echo "### Beispiel 2: Zugriff auf das letzte Feld (NF) ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg" | awk '{ print $NF }'
# Ausgabe:
# Berlin
# Hamburg

# 4. Beispiel: Arbeiten mit Trennzeichen (FS und OFS)

echo "### Beispiel 3: Anpassen von FS und OFS ###"
echo -e "Name,Alter,Ort\nMax,25,Berlin\nEva,30,Hamburg" | awk 'BEGIN { FS=","; OFS=" | " } { print $1, $2, $3 }'
# Ausgabe:
# Name | Alter | Ort
# Max | 25 | Berlin
# Eva | 30 | Hamburg

# 5. Beispiel: Filtern von Daten mit Bedingungen

echo "### Beispiel 4: Daten filtern ###"
echo -e "Name Alter Ort\nMax 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '$2 > 25 { print $1, $2, $3 }'
# Ausgabe:
# Eva 30 Hamburg

# 6. Beispiel: Nur Zeilen mit einem bestimmten Muster ausgeben

echo "### Beispiel 5: Filter nach Muster ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '/Hamburg/ { print $1, $2 }'
# Ausgabe:
# Eva 30

# 7. Beispiel: Formatierte Ausgabe

echo "### Beispiel 6: Formatierte Ausgabe mit print ###"
echo -e "Name Alter Ort\nMax 25 Berlin\nEva 30 Hamburg" | awk '{ printf "Name: %-5s | Alter: %-3s | Ort: %-10s\n", $1, $2, $3 }'
# Ausgabe:
# Name: Max   | Alter: 25  | Ort: Berlin    
# Name: Eva   | Alter: 30  | Ort: Hamburg   

# 8. Beispiel: Berechnung mit Feldern

echo "### Beispiel 7: Berechnungen mit Feldern ###"
echo -e "Produkt Preis Menge\nApfel 2 10\nBirne 3 5\nBanane 1 20" | awk '{ gesamt = $2 * $3; print $1, "Gesamtpreis:", gesamt }'
# Ausgabe:
# Apfel Gesamtpreis: 20
# Birne Gesamtpreis: 15
# Banane Gesamtpreis: 20

# 9. Beispiel: Zeilen mit einer bestimmten Anzahl von Feldern verarbeiten

echo "### Beispiel 8: Verarbeitung nach Anzahl der Felder ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22" | awk 'NF == 3 { print $1, $2, $3 }'
# Ausgabe:
# Max 25 Berlin
# Eva 30 Hamburg

# 10. Beispiel: Verwenden von BEGIN und END

echo "### Beispiel 9: BEGIN und END Blöcke ###"
echo -e "Name Alter Ort\nMax 25 Berlin\nEva 30 Hamburg" | awk 'BEGIN { print "Start der Ausgabe:" } { print $1, $2, $3 } END { print "Ende der Ausgabe." }'
# Ausgabe:
# Start der Ausgabe:
# Max 25 Berlin
# Eva 30 Hamburg
# Ende der Ausgabe.

# 11. Beispiel: Daten in einer Datei bearbeiten (angenommen, die Datei existiert)
# In diesem Beispiel gehen wir davon aus, dass eine Datei 'daten.txt' existiert, die die folgenden Daten enthält:
# Name, Alter, Ort
# Max, 25, Berlin
# Eva, 30, Hamburg
# John, 22, Köln
echo "### Beispiel 10: Bearbeiten einer Datei mit AWK ###"
# awk 'BEGIN { FS=","; OFS=" | " } { print $1, $2, $3 }' daten.txt
# Das Skript würde aus der Datei 'daten.txt' die Felder im CSV-Format auslesen und sie mit ' | ' trennen.

# Ende des Skripts
echo "Dieses Skript hat die grundlegende Verwendung von AWK zur Datenbearbeitung gezeigt, einschließlich des Zugriffs auf Felder, der Verwendung von Trennzeichen und der Filterung von Daten."
