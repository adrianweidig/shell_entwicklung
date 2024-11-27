#!/bin/sh
# Dieses Skript erklärt die Verwendung von SED (Stream Editor).
# SED wird verwendet, um Textströme zu bearbeiten, zu transformieren oder zu extrahieren.

# 1. ASCII Tabelle der SED Parameter und Optionen:
# -----------------------------------------------------------------------------
# | Option         | Bedeutung                                                  |
# -----------------------------------------------------------------------------
# | -e             | Führt einen SED-Ausdruck aus, der in der Argumentenliste folgt. 
# | -f             | Liest SED-Ausdrücke aus einer Datei.                         
# | -i             | Bearbeitet Dateien direkt (in-place).                        
# | -n             | Unterdrückt die Ausgabe, nur explizit durch 'p' erzeugte Zeilen werden ausgegeben. 
# | s/old/new/     | Ersetzt die erste Instanz von 'old' mit 'new'.               
# | s/old/new/g    | Ersetzt alle Instanzen von 'old' mit 'new'.                 
# | p              | Gibt die Zeile aus, die geändert wurde (wird meist mit -n verwendet). 
# | d              | Löscht eine Zeile.                                           
# | /pattern/      | Wendet den Befehl nur auf Zeilen an, die mit 'pattern' übereinstimmen. 
# | -e 'command'   | Führt mehrere SED-Befehle in einer Zeile aus.                 
# | -f filename    | Führt SED-Befehle aus einer Datei aus.                        
# | -i[SUFFIX]     | Bearbeitet Dateien direkt und legt ein optionales Suffix für Backup fest. 
# | -r             | Aktiviert erweiterte reguläre Ausdrücke (extgrep-kompatibel).
# | -s             | Verhindert den Versuch, das Muster zu ersetzen, wenn es nicht gefunden wird. 
# | y/abc/xyz/     | Ersetzt einzelne Zeichen, 'a' wird zu 'x', 'b' wird zu 'y' und 'c' wird zu 'z'. 
# | -u             | Gibt nur geänderte Zeilen aus.                               
# | -v             | Umkehrt den Test. Nur Zeilen, die das Muster nicht enthalten, werden verarbeitet. 
# | w filename     | Schreibt die geänderten Zeilen in eine Datei.                
# -----------------------------------------------------------------------------

# 2. Beispiel für die einfache Textersetzung
echo "### Beispiel 1: Einfache Ersetzung ###"
echo "Dies ist der alte Text." | sed 's/alte/neue/'
# Ausgabe: Dies ist der neue Text.

# 3. Beispiel für Ersetzung in einer Datei
echo "### Beispiel 2: Ersetzung in einer Datei ###"
echo "alte Zeile" > datei.txt
sed -i 's/alte/neue/' datei.txt
cat datei.txt
# Ausgabe: neue Zeile

# 4. Beispiel für Ersetzung aller Vorkommen eines Textes
echo "### Beispiel 3: Alle Vorkommen ersetzen ###"
echo "Dies ist der alte Text, der Text ist alt." | sed 's/alt/neuw/g'
# Ausgabe: Dies ist der neue Text, der Text ist neu.

# 5. Beispiel für das Löschen von Zeilen
echo "### Beispiel 4: Zeilen löschen ###"
echo -e "Zeile 1\nZeile 2\nZeile 3" | sed '2d'
# Ausgabe: Zeile 1
#         Zeile 3

# 6. Beispiel für das Extrahieren von Zeilen mit einem bestimmten Muster
echo "### Beispiel 5: Zeilen extrahieren ###"
echo -e "Zeile 1\nZeile 2\nZeile 3" | sed -n '/2/p'
# Ausgabe: Zeile 2

# 7. Beispiel für die Verwendung von SED mit regulären Ausdrücken
echo "### Beispiel 6: Reguläre Ausdrücke in SED ###"
echo "abc123" | sed 's/[a-z]\{3\}[0-9]\{3\}/XYZ/'
# Ausgabe: XYZ

# 8. Beispiel für mehrere SED-Befehle in einer Zeile
echo "### Beispiel 7: Mehrere Befehle in einer Zeile ###"
echo -e "abc 123\nabc 456" | sed -e 's/abc/XYZ/' -e 's/123/789/'
# Ausgabe: XYZ 789
#         XYZ 456

# 9. Beispiel für das Ersetzen nur bestimmter Zeilen
echo "### Beispiel 8: Ersetzung nur für bestimmte Zeilen ###"
echo -e "Dies ist eine Zeile\nDiese Zeile soll ersetzt werden" | sed '/ersetzt/s/Zeile/ Text/'
# Ausgabe: Dies ist eine Zeile
#         Diese Text soll ersetzt werden

# 10. Beispiel für das Bearbeiten von mehreren Dateien
echo "### Beispiel 9: Ersetzung in mehreren Dateien ###"
echo "alte Datei" > datei1.txt
echo "alte Datei" > datei2.txt
sed -i 's/alte/neue/' datei1.txt datei2.txt
cat datei1.txt
cat datei2.txt
# Ausgabe: neue Datei
#         neue Datei

# 11. Beispiel für das Verwenden von erweiterten regulären Ausdrücken
echo "### Beispiel 10: Erweiterte reguläre Ausdrücke ###"
echo "abc 123" | sed -r 's/[a-z]+/XYZ/'
# Ausgabe: XYZ 123

# 12. Beispiel für das Umkehren eines Musters
echo "### Beispiel 11: Muster umkehren ###"
echo "abc 123" | sed -v '/abc/'
# Ausgabe: Keine Ausgabe (da umgekehrter Test - nur Zeilen ohne 'abc')

# 13. Beispiel für das Ersetzen mit Zeichenübersetzungen
echo "### Beispiel 12: Zeichenübersetzung ###"
echo "abc" | sed 'y/abc/xyz/'
# Ausgabe: xyz

# 14. Beispiel für das Hinzufügen von Zeilen vor einem Muster
echo "### Beispiel 13: Zeile vor einem Muster hinzufügen ###"
echo -e "Zeile 1\nZeile 2" | sed '/Zeile 2/i Vor Zeile 2'
# Ausgabe: Zeile 1
#         Vor Zeile 2
#         Zeile 2

# 15. Beispiel für das Ersetzen eines Textes am Anfang der Zeile
echo "### Beispiel 14: Ersetzen am Anfang der Zeile ###"
echo "abc 123" | sed 's/^abc/XYZ/'
# Ausgabe: XYZ 123

# 16. Beispiel für das Ersetzen eines Textes am Ende der Zeile
echo "### Beispiel 15: Ersetzen am Ende der Zeile ###"
echo "abc 123" | sed 's/123$/789/'
# Ausgabe: abc 789

# 17. Beispiel für das Entfernen von Leerzeichen am Anfang und Ende der Zeile
echo "### Beispiel 16: Entfernen von Leerzeichen ###"
echo "   abc 123   " | sed 's/^[ \t]*//;s/[ \t]*$//'
# Ausgabe: abc 123

# 18. Beispiel für das Behalten von Zeilen, die das Muster enthalten
echo "### Beispiel 17: Nur Zeilen mit Muster anzeigen ###"
echo -e "abc 123\nxyz 456" | sed -n '/123/p'
# Ausgabe: abc 123

# 19. Beispiel für das Ersetzen mehrerer Wörter
echo "### Beispiel 18: Ersetzen mehrerer Wörter ###"
echo "abc 123 def 456" | sed 's/abc/XYZ/; s/def/UVW/'
# Ausgabe: XYZ 123 UVW 456

# 20. Beispiel für das Ersetzen, wenn das Muster auftritt (in-place Bearbeitung)
echo "### Beispiel 19: In-place Ersetzung ###"
echo "abc" > datei.txt
sed -i 's/abc/XYZ/' datei.txt
cat datei.txt
# Ausgabe: XYZ

# 21. Beispiel für das Ersetzen mit einem Backup
echo "### Beispiel 20: In-place mit Backup ###"
echo "abc" > datei.txt
sed -i'.bak' 's/abc/XYZ/' datei.txt
cat datei.txt
cat datei.txt.bak
# Ausgabe: XYZ
#         abc

# Am Ende löschen wir alle erstellten Dateien
rm -f datei.txt datei1.txt datei2.txt datei.txt.bak
