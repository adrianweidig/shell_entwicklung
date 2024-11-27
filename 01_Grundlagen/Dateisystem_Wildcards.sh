#!/bin/sh
# Dieses Skript zeigt, wie man mit relativen und absoluten Pfaden im Dateisystem arbeitet
# und Wildcards verwendet, um mit Dateien zu interagieren.
# Das Skript erstellt eine Datei, befüllt sie mit Beispieltext und löscht sie am Ende.

# 1. Erstelle eine Beispieldatei
echo "Erstelle eine Datei mit Beispieltext zur Demonstration." > beispiel.txt
echo "Dies ist eine Beispieldatei." >> beispiel.txt
echo "Beispieltext zur Verwendung von Wildcards und grep." >> beispiel.txt
echo "Beispieltext mit den Wörtern Beispiel und Wildcard." >> beispiel.txt
echo "Test mit verschiedenen Wildcards und Texten." >> beispiel.txt

# 2. Absoluter Pfad
# Ein absoluter Pfad zeigt den vollständigen Pfad von der Wurzel (/) bis zu einer Datei oder einem Verzeichnis.
# Beispiel für einen absoluten Pfad:
echo "Ein absoluter Pfad ist der vollständige Pfad vom Wurzelverzeichnis, z.B. /home/user/dokumente/."

# Der absolute Pfad zum aktuellen Verzeichnis:
echo "Der absolute Pfad zum aktuellen Verzeichnis: $(pwd)"

# 3. Relativer Pfad
# Ein relativer Pfad zeigt den Pfad relativ zum aktuellen Arbeitsverzeichnis.
# Beispiel für einen relativen Pfad:
echo "Ein relativer Pfad ist der Pfad relativ zum aktuellen Verzeichnis, z.B. ./dokumente/ oder ../bilder/."

# Beispiel für den relativen Pfad zum aktuellen Verzeichnis:
echo "Relativer Pfad zum aktuellen Verzeichnis: ./"

# Beispiel für den relativen Pfad zum übergeordneten Verzeichnis:
echo "Relativer Pfad zum übergeordneten Verzeichnis: ../"

# 4. Wildcards (Platzhalter)
# Wildcards sind Platzhalter, die für ein oder mehrere Zeichen stehen, z.B. * für beliebige Zeichen.
# Sie werden verwendet, um mit mehreren Dateien gleichzeitig zu arbeiten.

# Beispiel 1: Verwendung von `*` zum Auffinden von Dateien:
# Wildcard '*' steht für beliebig viele Zeichen.
echo "Verwendung von Wildcard '*' für Dateien mit der Endung .txt:"
ls *.txt 2>/dev/null  # Listet alle .txt-Dateien im aktuellen Verzeichnis auf, unterdrückt Fehlerausgaben.

# Beispiel 2: Verwendung von `?` für ein beliebiges einzelnes Zeichen:
# Wildcard '?' steht für genau ein beliebiges Zeichen.
echo "Verwendung von Wildcard '?' für ein einzelnes Zeichen:"
ls datei? 2>/dev/null  # Listet Dateien mit genau fünf Zeichen, die mit 'datei' beginnen, auf.

# Beispiel 3: Verwendung von `[]` für eine Zeichenklasse:
# Wildcard '[]' steht für ein beliebiges Zeichen aus der angegebenen Menge.
echo "Verwendung von Wildcard '[]' für eine Zeichenklasse:"
ls datei[a-z] 2>/dev/null  # Listet alle Dateien mit 'datei' und einem beliebigen Buchstaben von a-z am Ende auf.

# 5. Absoluter und relativer Pfad zu einer Datei oder einem Verzeichnis
# Hier wird gezeigt, wie man mit absoluten und relativen Pfaden auf Dateien zugreifen kann.
# Angenommen, wir haben eine Datei "beispiel.txt" im aktuellen Verzeichnis:

echo "Absoluter Pfad zu einer Datei: $(pwd)/beispiel.txt"
echo "Relativer Pfad zu einer Datei im aktuellen Verzeichnis: ./beispiel.txt"
echo "Relativer Pfad zu einer Datei im übergeordneten Verzeichnis: ../beispiel.txt"

# 6. Mit `grep` Dateien durchsuchen
# `grep` wird verwendet, um Inhalte in Dateien zu durchsuchen.
# Hier ein Beispiel, um nach dem Wort 'Beispiel' in der Datei beispiel.txt zu suchen:
echo "Durchsuchen der Datei beispiel.txt nach dem Wort 'Beispiel':"
grep "Beispiel" beispiel.txt 2>/dev/null  # Durchsucht die Datei beispiel.txt nach 'Beispiel', Fehler werden unterdrückt.

# 7. Wildcards und `ls` kombinieren
# Man kann `ls` und Wildcards kombinieren, um Dateien nach Mustern zu suchen.
echo "Liste von Dateien, die mit 'datei' beginnen und mit einer Zahl enden:"
ls datei[0-9] 2>/dev/null  # Listet Dateien auf, die mit 'datei' beginnen und mit einer Zahl enden.

# 8. Auflisten von Dateien und Verzeichnissen
# Der `ls`-Befehl listet Dateien und Verzeichnisse im aktuellen Verzeichnis auf.
echo "Auflisten aller Dateien und Verzeichnisse im aktuellen Verzeichnis:"
ls 2>/dev/null  # Listet alle Dateien und Verzeichnisse im aktuellen Verzeichnis auf, Fehler werden unterdrückt.

# 9. Weitere Wildcard-Beispiele
# Verwenden von Wildcards, um gezielt Dateien zu finden:
echo "Verwendung von Wildcard '*' und 'grep' zum Filtern von Dateinamen mit 'bericht':"
ls *bericht* 2>/dev/null  # Listet alle Dateien auf, die 'bericht' im Namen enthalten, Fehler werden unterdrückt.

# 10. Löschen der Beispieldatei
# Am Ende des Skripts wird die Beispieldatei gelöscht.
echo "Die Beispieldatei wird jetzt gelöscht."
rm -f beispiel.txt  # Löscht die Datei beispiel.txt.

# Ende des Skripts
# Dieses Skript hat grundlegende Konzepte zu relativen und absoluten Pfaden sowie Wildcards im Dateisystem veranschaulicht.
