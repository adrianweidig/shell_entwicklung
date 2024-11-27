#!/bin/sh
# Dieses Skript zeigt grundlegende Techniken zur Textausgabe und einfachen Formatierung
# in einer Standard-Shell-Umgebung unter Verwendung von `/bin/sh`.

# 1. Einfache Textausgabe
# Der Befehl `echo` gibt den Text aus, der ihm übergeben wird.
echo "Hallo, Welt!"

# 2. Verwendung von Variablen in der Textausgabe
# Variablen können in Ausgaben verwendet werden, indem sie mit `$` referenziert werden.
NAME="Anfänger"
echo "Willkommen, $NAME!"

# 3. Escape-Sequenzen in der Textausgabe
# `echo` interpretiert Escape-Sequenzen wie `\n` oder `\t` nicht ohne spezielle Optionen.
echo "Zeile1\nZeile2"  # So wird `\n` direkt als Text angezeigt.
# Stattdessen verwenden wir `printf` für solche Zwecke:
printf "Zeile1\nZeile2\n"

# 4. Formatierte Textausgabe mit `printf`
# `printf` bietet mehr Kontrolle über die Formatierung von Texten.
printf "Name: %s\nAlter: %d Jahre\n" "Max" 25
# Platzhalter wie %s (Zeichenkette) und %d (Zahl) ermöglichen präzise Formatierung.

# 5. Datum und Uhrzeit in der Textausgabe
# Das Kommando `date` liefert die aktuelle Systemzeit und das Datum.
echo "Das aktuelle Datum ist: $(date)"

# 6. Umleitung von Ausgaben in Dateien
# Mit `>` wird die Ausgabe in eine Datei geschrieben und existierender Inhalt überschrieben.
echo "Dies ist eine Beispielausgabe" > output.txt
# Mit `>>` wird die Ausgabe an eine bestehende Datei angehängt.
echo "Eine weitere Zeile" >> output.txt

# 7. Fehlerausgabe auf den Standardfehlerkanal
# Mit `>&2` wird die Ausgabe explizit auf den Fehlerkanal geleitet.
echo "Dies ist eine Fehlermeldung" >&2

# Ende des Skripts
# Dieses Skript zeigt die grundlegenden Techniken für die Textausgabe in der Shell.
