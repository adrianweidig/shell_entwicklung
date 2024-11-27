#!/bin/sh
# ============================================
# Tutorial: Funktionen in Bash
# ============================================
# Hinweis: 
# - Funktionen in Bash helfen dabei, wiederverwendbare Codeblöcke zu erstellen, die modular und gut strukturiert sind.
# - Sie ermöglichen es, wiederkehrende Aufgaben zu kapseln und zu organisieren.
#
# Parameter zu Funktionen in Bash:
#
# | Parameter        | Beschreibung                                                            |
# |------------------|-------------------------------------------------------------------------|
# | function name()  | Definiert eine Funktion mit dem Namen "name".                            |
# | return           | Gibt einen Wert aus der Funktion zurück (optional).                     |
# | $1, $2, ...      | Zugriff auf die Funktionsparameter.                                     |
# | "$@"             | Repräsentiert alle Argumente der Funktion als separate Strings.        |
# | $FUNCNAME        | Gibt den Namen der aktuellen Funktion zurück.                           |
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
# Beispiele zur Verwendung von Funktionen
# ===============================

echo "${RED}ACHTUNG: Alle Beispiele zeigen verschiedene Anwendungen von Funktionen in Bash.${RESET}"

# Beispiel 1: Einfache Funktion ohne Parameter
echo "Beispiel 1: Einfache Funktion ohne Parameter"
# Eine einfache Funktion, die eine Nachricht ausgibt
simple_function() {
    echo "Dies ist eine einfache Funktion."
}

# Funktionsaufruf
simple_function
# Erwartete Ausgabe: Dies ist eine einfache Funktion.

# Beispiel 2: Funktion mit Parametern
echo "Beispiel 2: Funktion mit Parametern"
# Funktion, die zwei Parameter entgegen nimmt und sie addiert
add_numbers() {
    sum=$(( $1 + $2 ))
    echo "Die Summe von $1 und $2 ist: $sum"
}

# Funktionsaufruf mit Argumenten
add_numbers 5 7
# Erwartete Ausgabe: Die Summe von 5 und 7 ist: 12

# Beispiel 3: Funktion mit Rückgabewert
echo "Beispiel 3: Funktion mit Rückgabewert"
# Eine Funktion, die einen Wert zurückgibt
multiply_numbers() {
    result=$(( $1 * $2 ))
    return $result
}

# Funktionsaufruf und Rückgabewert abholen
multiply_numbers 3 4
# Die Rückgabe eines Funktionswertes kann über den Statuscode abgefragt werden (dabei ist der Rückgabewert als Exit-Code verfügbar):
echo "Das Ergebnis der Multiplikation ist: $?"
# Erwartete Ausgabe: Das Ergebnis der Multiplikation ist: 12

# Beispiel 4: Funktion mit mehreren Parametern
echo "Beispiel 4: Funktion mit mehreren Parametern"
# Funktion, die alle Parameter durchgeht und anzeigt
show_all_params() {
    echo "Alle Parameter sind: $@"
}

# Funktionsaufruf mit mehreren Parametern
show_all_params "Apfel" "Banane" "Kirsche"
# Erwartete Ausgabe: Alle Parameter sind: Apfel Banane Kirsche

# Beispiel 5: Funktion mit benannten Parametern und Default-Werten
echo "Beispiel 5: Funktion mit benannten Parametern und Default-Werten"
# Funktion, die Parameter entgegennimmt und Default-Werte verwendet, falls keine angegeben werden
greet_user() {
    name="${1:-Benutzer}"
    echo "Hallo, $name!"
}

# Funktionsaufruf mit Parameter
greet_user "Alice"
# Erwartete Ausgabe: Hallo, Alice!

# Funktionsaufruf ohne Parameter (Verwendung des Default-Wertes)
greet_user
# Erwartete Ausgabe: Hallo, Benutzer!

# Beispiel 6: Rekursive Funktion
echo "Beispiel 6: Rekursive Funktion"
# Eine rekursive Funktion zur Berechnung der Fakultät
factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        prev=$(factorial $(( $1 - 1 )))
        echo $(( $1 * prev ))
    fi
}

# Funktionsaufruf für Fakultät von 5
result=$(factorial 5)
echo "Die Fakultät von 5 ist: $result"
# Erwartete Ausgabe: Die Fakultät von 5 ist: 120

# Beispiel 7: Funktionsdefinition mit variabler Anzahl an Argumenten
echo "Beispiel 7: Funktionsdefinition mit variabler Anzahl an Argumenten"
# Funktion, die alle übergebenen Argumente zählt und ausgibt
count_args() {
    echo "Anzahl der übergebenen Argumente: $#"
    echo "Alle Argumente: $@"
}

# Funktionsaufruf mit mehreren Argumenten
count_args "Apfel" "Banane" "Kirsche" "Daten"
# Erwartete Ausgabe:
# Anzahl der übergebenen Argumente: 4
# Alle Argumente: Apfel Banane Kirsche Daten

# Beispiel 8: Verwenden von Funktionen mit exit-Status und $? (Exit-Code)
echo "Beispiel 8: Verwenden von Funktionen mit exit-Status"
# Eine Funktion, die den Exit-Status setzt
exit_status_function() {
    return 42
}

# Funktionsaufruf und Prüfung des Exit-Codes
exit_status_function
echo "Der Exit-Status der Funktion ist: $?"
# Erwartete Ausgabe: Der Exit-Status der Funktion ist: 42

# Beispiel 9: Verwendung von Funktionen mit Dateinamen als Argumenten
echo "Beispiel 9: Verwendung von Funktionen mit Dateinamen als Argumenten"
# Funktion, die den Inhalt einer Datei anzeigt
display_file_content() {
    if [ -f "$1" ]; then
        cat "$1"
    else
        echo "Die Datei $1 existiert nicht."
    fi
}

# Erstelle eine Testdatei
echo "Dies ist ein Testinhalt." > "${SCRIPT_DIR}/testfile.txt"
# Funktionsaufruf zur Anzeige des Datei-Inhalts
display_file_content "${SCRIPT_DIR}/testfile.txt"
# Erwartete Ausgabe: Dies ist ein Testinhalt.

# Beispiel 10: Verwendung von Funktionen mit Pipe und xargs
echo "Beispiel 10: Verwendung von Funktionen mit Pipe und xargs"
# Eine Funktion, die eine Liste von Dateien entgegennimmt und deren Inhalte anzeigt
show_file_contents() {
    cat "$1"
}

# Erstelle einige Testdateien
echo "Inhalt von file1" > "${SCRIPT_DIR}/file1.txt"
echo "Inhalt von file2" > "${SCRIPT_DIR}/file2.txt"

# Verwende `find` und `xargs`, um mehrere Dateien an die Funktion zu übergeben
find "${SCRIPT_DIR}" -name "*.txt" | xargs -I {} sh -c 'show_file_contents {}'
# Erwartete Ausgabe: Inhalt von file1 und Inhalt von file2

# ===============================
# Aufräumen: Löschen der temporären Dateien
# ===============================
echo "Aufräumen: Temporäre Dateien werden gelöscht."

# Beispielhafte temporäre Dateien entfernen, wenn sie existieren
rm -f "${SCRIPT_DIR}/testfile.txt" "${SCRIPT_DIR}/file1.txt" "${SCRIPT_DIR}/file2.txt"
rm -rf "${TEMP_DIR}"
echo "Aufräumen abgeschlossen. Das Tutorial ist beendet."
