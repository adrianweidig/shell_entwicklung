#!/bin/sh
# ============================================
# Tutorial: Verwendung von xargs
# ============================================
# Hinweis: 
# - `xargs` ist ein vielseitiges Kommandozeilenwerkzeug, das häufig verwendet wird, um Eingaben aus einer Datei oder von einem anderen Befehl in einem anderen Befehl zu verwenden.
# - Es hilft dabei, Eingabedaten in mehrere Argumente umzuwandeln, die dann an ein anderes Kommando übergeben werden.
#
# Parameter von xargs:
#
# | Parameter      | Beschreibung                                                             |
# |----------------|---------------------------------------------------------------------------|
# | -n NUM         | Bestimmt die Anzahl der Argumente, die pro Ausführung des Befehls übergeben werden. |
# | -I PLACEHOLDER | Ersetzt das Platzhalterwort (z. B. `{}`) in den übergebenen Befehlen. |
# | -d DELIM       | Gibt das Trennzeichen an, das `xargs` für die Eingabe verwenden soll (standardmäßig Leerzeichen oder neue Zeile). |
# | -p             | Fordert den Benutzer zur Bestätigung auf, bevor jeder Befehl ausgeführt wird. |
# | -t             | Zeigt den Befehl an, der ausgeführt wird, bevor er tatsächlich ausgeführt wird. |
# | --max-args NUM | Gibt an, wie viele Argumente insgesamt übergeben werden dürfen, bevor `xargs` den Befehl ausführt. |
# ============================================

# ===============================
# Setze den Basis-Pfad auf das Verzeichnis, in dem das Skript ausgeführt wird
# ===============================
SCRIPT_DIR=$(pwd)
TEMP_DIR="${SCRIPT_DIR}/temp_entwicklung"

# Erstelle das temporäre Verzeichnis, falls es nicht existiert
mkdir -p "$TEMP_DIR"
echo "Das Verzeichnis $TEMP_DIR wird erstellt, falls es noch nicht existiert."

# ===============================
# Beispiele zur Verwendung von xargs
# ===============================

echo "${RED}ACHTUNG: Alle Beispiele zeigen verschiedene Anwendungen von xargs.${RESET}"

# Beispiel 1: Verwendung von xargs ohne Parameter
echo "Beispiel 1: Einfache Verwendung von xargs"
# Mit xargs werden alle Eingaben als Argumente für `echo` übergeben.
echo -e "apple\nbanana\ncherry" | xargs echo
# Erwartete Ausgabe: apple banana cherry

# Beispiel 2: Verwendung des Parameters -n
echo "Beispiel 2: Verwendung von -n NUM"
# Hier wird xargs so konfiguriert, dass nur 2 Argumente pro Ausführung an `echo` übergeben werden.
echo -e "apple\nbanana\ncherry\ndate" | xargs -n 2 echo
# Erwartete Ausgabe:
# apple banana
# cherry date

# Beispiel 3: Platzhalter verwenden mit -I
echo "Beispiel 3: Verwendung von -I für Platzhalter"
# Hier wird xargs so konfiguriert, dass es `mkdir` verwendet, um Verzeichnisse mit den eingegebenen Namen zu erstellen.
echo -e "dir1\ndir2\ndir3" | xargs -I {} mkdir "${TEMP_DIR}/{}"
# Es werden die Verzeichnisse dir1, dir2 und dir3 im Verzeichnis temp_entwicklung erstellt.

# Beispiel 4: Verwenden von -p zur Bestätigung
echo "Beispiel 4: Verwenden von -p zur Bestätigung"
# Hier wird xargs vor der Ausführung des Befehls eine Bestätigung vom Benutzer verlangen.
echo -e "apple\nbanana\ncherry" | xargs -p echo
# xargs wird den Benutzer fragen, ob der Befehl ausgeführt werden soll, bevor er ausgeführt wird.

# Beispiel 5: Verwenden von -d für ein anderes Trennzeichen
echo "Beispiel 5: Verwenden von -d für benutzerdefinierte Trennzeichen"
# In diesem Beispiel verwenden wir das Komma als Trennzeichen anstelle von Leerzeichen oder neuen Zeilen.
echo "apple,banana,cherry,date" | xargs -d ',' echo
# Erwartete Ausgabe: apple banana cherry date

# Beispiel 6: Verwenden von --max-args
echo "Beispiel 6: Verwenden von --max-args NUM"
# In diesem Beispiel wird xargs angewiesen, maximal 2 Argumente pro Ausführung zu verwenden.
echo -e "apple\nbanana\ncherry\ndate" | xargs --max-args=2 echo
# Erwartete Ausgabe:
# apple banana
# cherry date

# Beispiel 7: Anwendung mit find und xargs
echo "Beispiel 7: Anwendung mit find und xargs"
# Hier verwenden wir `find`, um alle .txt-Dateien zu finden und diese in den TEMP_DIR-Pfad zu schreiben.
echo "Erstelle testdateien im aktuellen Verzeichnis zur Demonstration."
touch "${SCRIPT_DIR}/file1.txt" "${SCRIPT_DIR}/file2.txt" "${SCRIPT_DIR}/file3.txt"
# Jetzt verwenden wir `find` und `xargs`, um den Inhalt dieser Dateien anzuzeigen.
find "${SCRIPT_DIR}" -name "*.txt" | xargs cat
# Erwartete Ausgabe: Der Inhalt der .txt-Dateien im aktuellen Verzeichnis.

# Beispiel 8: Anwendung von xargs mit tar zum Archivieren von Dateien
echo "Beispiel 8: Anwendung von xargs mit tar"
# Hier suchen wir nach allen .log-Dateien und archivieren sie mit tar.
echo "Erstelle testdateien im aktuellen Verzeichnis zur Demonstration (log-Dateien)."
touch "${SCRIPT_DIR}/logfile1.log" "${SCRIPT_DIR}/logfile2.log"
find "${SCRIPT_DIR}" -name "*.log" | xargs tar -czf "${TEMP_DIR}/logs_archive.tar.gz"
# Alle .log-Dateien werden in einer tar.gz-Datei archiviert.

# Beispiel 9: xargs mit grep
echo "Beispiel 9: xargs in Verbindung mit grep"
# In diesem Beispiel verwenden wir `xargs`, um eine Liste von Dateien zu übergeben und `grep` nach einem bestimmten Muster zu suchen.
echo "Erstelle eine testdatei file1.txt und füge Muster ein."
echo "Fehler in der ersten Zeile" > "${SCRIPT_DIR}/file1.txt"
echo -e "file1.txt\nfile2.txt\nfile3.txt" | xargs grep "Fehler"
# Hier würde grep in allen angegebenen Dateien nach dem Muster "Fehler" suchen.

# Beispiel 10: Verwenden von xargs, um mehrere Befehle zu kombinieren
echo "Beispiel 10: Kombinierte Verwendung von xargs mit mehreren Befehlen"
# In diesem Beispiel suchen wir nach .txt-Dateien und löschen sie, nachdem wir ihren Inhalt angezeigt haben.
find "${SCRIPT_DIR}" -name "*.txt" | xargs -I {} sh -c 'cat {} && rm {}'
# Dieser Befehl zeigt den Inhalt der .txt-Dateien an und löscht sie anschließend.

# ===============================
# Aufräumen: Löschen der temporären Dateien
# ===============================
echo "Aufräumen: Temporäre Dateien werden gelöscht."

# Beispielhafte temporäre Dateien entfernen, wenn sie existieren
rm -f "${SCRIPT_DIR}/file1.txt" "${SCRIPT_DIR}/file2.txt" "${SCRIPT_DIR}/file3.txt"
rm -f "${SCRIPT_DIR}/logfile1.log" "${SCRIPT_DIR}/logfile2.log"
rm -rf "${TEMP_DIR}"
echo "Aufräumen abgeschlossen. Das Tutorial ist beendet."
