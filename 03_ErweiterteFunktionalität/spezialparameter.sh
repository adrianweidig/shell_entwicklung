#!/bin/sh
# Dieses Skript erklärt die Verwendung von Spezialparametern in Shell-Skripten.
# Es behandelt Systemvariablen wie $# und $0 sowie andere nützliche Parameter.

# 1. Einführung in Spezialparameter
# Spezialparameter und Systemvariablen bieten wertvolle Informationen über das Skript und seine Ausführung.

# 2. Übersicht über die wichtigsten Spezialparameter

echo "### Übersicht der Spezialparameter ###"

# ASCII-Tabelle der wichtigsten Spezialparameter
echo "
+-------------------------+----------------------------------------------------------+
| Parameter               | Beschreibung                                            |
+-------------------------+----------------------------------------------------------+
| \$0                      | Name des Skriptes bzw. Programms                        |
| \$#                      | Anzahl der übergebenen Positionalen Parameter            |
| \$@                      | Alle übergebenen Positionalen Parameter (als Liste)      |
| \$*                      | Alle übergebenen Positionalen Parameter (als einzelner String) |
| \$1, \$2, ..., \$n       | Der n-te Positionalparameter                             |
| \$?                      | Exit-Status des letzten Befehls                          |
| \$!                      | Prozess-ID des letzten Hintergrundprozesses              |
| \$_                      | Der letzte Parameter des letzten Befehls (z.B. bei einer Pipe) |
| \$-                      | Optionseinstellungen des aktuellen Shell-Prozesses       |
| \${#variablenname}       | Länge des Werts einer Variablen                          |
| \$RANDOM                 | Zufallszahl (zwischen 0 und 32767)                       |
| \$HOSTNAME               | Name des Hosts                                           |
| \$USER                   | Benutzername des aktuellen Nutzers                       |
| \$HOME                   | Home-Verzeichnis des aktuellen Nutzers                   |
| \$PWD                    | Aktuelles Arbeitsverzeichnis                             |
| \$IFS                    | Internal Field Separator (Trennzeichen für Eingabefelder) |
| \$SECONDS                | Anzahl der Sekunden seit Beginn der Skriptausführung     |
+-------------------------+----------------------------------------------------------+"

# 3. Praktische Beispiele für die Verwendung von Spezialparametern

## a. Verwendung von \$0 (Skriptname)
echo "### Beispiel 1: \$0 (Skriptname) ###"
echo "Der Name dieses Skriptes lautet: $0"

# Beispiel: Skriptname auswerten und Bedingungen darauf basierend verwenden
if [ "$0" = "./mein_skript.sh" ]; then
  echo "Das Skript wurde mit dem erwarteten Namen aufgerufen."
fi

## b. Verwendung von \$# (Anzahl der Parameter)
echo "### Beispiel 2: \$# (Anzahl der Parameter) ###"
echo "Es wurden $# Positionalparameter übergeben."

# Beispiel: Überprüfen, ob genügend Parameter übergeben wurden
if [ "$#" -lt 2 ]; then
  echo "Es wurden nicht genügend Parameter übergeben. Mindestens 2 werden benötigt."
else
  echo "Es wurden ausreichend Parameter übergeben."
fi

## c. Verwendung von \$@ und \$* (Alle Parameter)
echo "### Beispiel 3: \$@ und \$* (Alle Parameter) ###"
echo "Die übergebenen Parameter mit \$@: $@"
echo "Die übergebenen Parameter mit \$*: $*"

# Beispiel: Schleifen über alle Parameter
for param in "$@"; do
  echo "Parameter: $param"
done

## d. Verwendung von \$? (Exit-Status des letzten Befehls)
echo "### Beispiel 4: \$? (Exit-Status) ###"
echo "Überprüfen des Exit-Status des letzten Befehls:"
echo "Die Ausgabe von 'ls /nonexistent':"
ls /nonexistent
echo "Der Exit-Status des letzten Befehls (\$?) war: $?"

# Beispiel: Verzweigung basierend auf Exit-Status
if [ "$?" -ne 0 ]; then
  echo "Es gab einen Fehler beim letzten Befehl."
fi

## e. Verwendung von \$! (Prozess-ID des letzten Hintergrundprozesses)
echo "### Beispiel 5: \$! (Prozess-ID des letzten Hintergrundprozesses) ###"
echo "Führen eines Hintergrundprozesses aus und Abfragen seiner Prozess-ID."
sleep 5 &
echo "Die Prozess-ID des letzten Hintergrundprozesses war: $!"

# Beispiel: Warten auf den Hintergrundprozess und die Ausgabe der Prozess-ID
pid=$!
echo "Der Hintergrundprozess läuft mit der PID: $pid"
wait $pid
echo "Der Hintergrundprozess mit der PID $pid ist abgeschlossen."

## f. Verwendung von \$- (Shell-Optionen)
echo "### Beispiel 6: \$- (Shell-Optionen) ###"
echo "Die aktuellen Shell-Optionen sind: $-"

# Beispiel: Überprüfen, ob das Skript im interaktiven Modus läuft
if [[ "$-" == *i* ]]; then
  echo "Das Skript läuft im interaktiven Modus."
else
  echo "Das Skript läuft nicht im interaktiven Modus."
fi

## g. Verwendung von \$SECONDS (Sekunden seit Skriptstart)
echo "### Beispiel 7: \$SECONDS (Sekunden seit Start) ###"
echo "Das Skript läuft bereits seit $SECONDS Sekunden."

# Beispiel: Timeout basierend auf der Dauer der Skriptausführung
if [ "$SECONDS" -gt 10 ]; then
  echo "Das Skript läuft schon länger als 10 Sekunden."
fi

## h. Verwendung von \${#variablenname} (Länge einer Variablen)
echo "### Beispiel 8: \${#variablenname} (Länge einer Variablen) ###"
string="Hallo Welt"
echo "Die Länge des Strings '$string' ist: ${#string}"

# Beispiel: Überprüfen, ob eine Variable leer ist
if [ ${#string} -eq 0 ]; then
  echo "Die Variable ist leer."
else
  echo "Die Variable enthält etwas."
fi

## i. Verwendung von \$RANDOM (Zufallszahl)
echo "### Beispiel 9: \$RANDOM (Zufallszahl) ###"
zufallszahl=$RANDOM
echo "Eine zufällige Zahl: $zufallszahl"

# Beispiel: Verwenden von \$RANDOM, um eine Zahl innerhalb eines Bereichs zu generieren
min=1
max=100
zufallszahl=$(( (RANDOM % (max - min + 1)) + min ))
echo "Eine zufällige Zahl zwischen $min und $max: $zufallszahl"

## j. Verwendung von \$HOSTNAME (Hostname)
echo "### Beispiel 10: \$HOSTNAME (Hostname) ###"
echo "Der Name dieses Hosts ist: $HOSTNAME"

# Beispiel: Überprüfen des Hostnamens und unterschiedliche Ausgaben basierend darauf
if [ "$HOSTNAME" = "mein-server" ]; then
  echo "Der Hostname ist korrekt."
else
  echo "Der Hostname stimmt nicht überein."
fi

## k. Verwendung von \$USER (Benutzername)
echo "### Beispiel 11: \$USER (Benutzername) ###"
echo "Der aktuelle Benutzer ist: $USER"

# Beispiel: Begrüßung des Benutzers
echo "Willkommen, $USER!"

## l. Verwendung von \$HOME (Home-Verzeichnis)
echo "### Beispiel 12: \$HOME (Home-Verzeichnis) ###"
echo "Das Home-Verzeichnis des aktuellen Nutzers ist: $HOME"

# Beispiel: Überprüfen, ob eine Datei im Home-Verzeichnis existiert
dateiname="$HOME/testdatei.txt"
if [ -e "$dateiname" ]; then
  echo "Die Datei $dateiname existiert im Home-Verzeichnis."
else
  echo "Die Datei $dateiname existiert nicht im Home-Verzeichnis."
fi

## m. Verwendung von \$PWD (Arbeitsverzeichnis)
echo "### Beispiel 13: \$PWD (Arbeitsverzeichnis) ###"
echo "Das aktuelle Arbeitsverzeichnis ist: $PWD"

# Beispiel: Navigieren zu einem anderen Verzeichnis und zurück
cd /tmp
echo "Nach dem Wechsel: Das neue Arbeitsverzeichnis ist: $PWD"
cd $OLDPWD
echo "Zurück zum vorherigen Arbeitsverzeichnis: $PWD"

## n. Verwendung von \$IFS (Internal Field Separator)
echo "### Beispiel 14: \$IFS (Internal Field Separator) ###"
echo "Das aktuelle IFS ist: '$IFS'"

# Beispiel: Verwenden von IFS zum Trennen einer Liste
IFS=":" read -r benutzername passwort <<< "user1:pass123"
echo "Benutzername: $benutzername, Passwort: $passwort"

# Ende des Skripts
# Dieses Skript hat die wichtigsten Spezialparameter in Shell-Skripten erklärt und verschiedene Beispiele gegeben.

exit 0
