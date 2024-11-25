#!/bin/sh
# Dieses Skript erklärt die Verwendung des 'set'-Befehls und der Positionsparameter in der Shell.
# Alle genutzten Dateien werden zu Beginn erstellt und am Ende gelöscht.
# Das Skript wird immer mit Code 0 abgeschlossen, auch bei Fehlern.

# 1. Erstellen von Beispieldateien für das Skript
echo "Dies ist eine Beispieldatei, die das Verhalten des 'set'-Befehls verdeutlicht." > set_example.txt
echo "Zeile 1: Apfel" > fruit_list.txt
echo "Zeile 2: Banane" >> fruit_list.txt
echo "Zeile 3: Orange" >> fruit_list.txt
echo "Dies ist eine Beispieldatei, die das Verhalten von Positionsparametern erklärt." > positionsparameter_example.txt

# 2. Verwendung von 'set' in Shell-Skripten
echo "Beispiel für 'set' und Shell-Optionen:"

# a. 'set -x' (Debugging-Modus)
# Mit 'set -x' wird die Shell angewiesen, alle Befehle vor ihrer Ausführung anzuzeigen.
echo "Aktivieren des Debugging-Modus mit 'set -x'"

set -x  # Aktiviert den Debugging-Modus

echo "Dies ist eine Beispielausgabe."
echo "Debugging wird angezeigt, da set -x aktiv ist."

set +x  # Deaktiviert den Debugging-Modus

echo "Debugging-Modus wurde deaktiviert."

# b. 'set -e' (Beendet das Skript bei Fehlern)
# Mit 'set -e' wird das Skript gestoppt, wenn ein Befehl mit einem Fehlercode beendet wird (also mit einem Status ungleich Null).
echo "Aktivieren des 'set -e' Modus, um das Skript bei einem Fehler zu beenden."

set +e  # Deaktiviert das Beenden bei Fehlern, damit das Skript weiterläuft

# Beispiel, das zu einem Fehler führen sollte
echo "Dieser Befehl wird einen Fehler verursachen:"
non_existing_command  # Dieser Befehl existiert nicht und verursacht einen Fehler

echo "Das Skript läuft trotzdem weiter."

# c. 'set -u' (Beendet das Skript bei ungesetzten Variablen)
# Mit 'set -u' wird das Skript gestoppt, wenn eine nicht gesetzte Variable verwendet wird.

echo "Aktivieren des 'set -u' Modus, um das Skript bei Verwendung einer nicht gesetzten Variablen zu beenden."

set +u  # Deaktiviert den Modus, der das Skript bei Verwendung einer nicht gesetzten Variablen beendet

echo "Versuch, auf eine nicht gesetzte Variable zuzugreifen: $unset_variable"  # Dies wird zu einem Fehler führen

# d. 'set -o pipefail' (Fehlerbehandlung in Pipes)
# Mit 'set -o pipefail' wird das Skript gestoppt, wenn ein Befehl innerhalb einer Pipe fehlschlägt.

echo "Aktivieren des 'set -o pipefail' Modus für die Fehlerbehandlung in Pipes."

set -o pipefail  # Aktiviert die Fehlerbehandlung in Pipes

# Beispiel, das zu einem Fehler führen sollte
echo "Dies ist ein Test, der eine Pipe enthält:" | non_existing_command

echo "Der Fehler in der Pipe wird nicht zum Abbruch des Skripts führen."

# e. 'set +e' (Deaktiviert das Beenden bei Fehlern)
# Mit 'set +e' wird das Verhalten von 'set -e' deaktiviert, sodass das Skript nicht bei Fehlern gestoppt wird.

echo "Deaktivieren des 'set -e' Modus mit 'set +e', sodass das Skript auch bei Fehlern weiterläuft."

set +e  # Deaktiviert das Beenden bei Fehlern

# Beispiel: Der Fehler wird ignoriert und das Skript wird fortgesetzt
non_existing_command  # Dieser Befehl existiert nicht und führt zu einem Fehler

echo "Das Skript wurde trotz des Fehlers fortgesetzt."

# 3. Erklärung der Positionsparameter

echo "Positionsparameter in der Shell:"
echo "Positionsparameter sind spezielle Variablen, die den Argumenten eines Skripts oder Befehls zugewiesen werden."
echo "Sie beginnen mit \$0 für den Skriptnamen und gehen bis \$9 für die ersten 9 Argumente."
echo "Ab \$10 werden die Parameter mit \${10}, \${11} usw. aufgerufen."

echo "Beispiel für Positionsparameter:"

# a. Positionsparameter $0 bis $9
echo "1. \$0 (Skriptname):"
echo "Der Wert von \$0 ist der Name des Skripts, das ausgeführt wird."

echo "Das Skript wurde ausgeführt mit: \$0 = $0"

# Beispiel für weitere Positionsparameter
echo "2. \$1 bis \$9 (Argumente des Skripts):"
echo "Die Werte von \$1 bis \$9 sind die ersten neun Argumente, die beim Aufruf des Skripts übergeben werden."

# Hier benutzen wir Argumente, die beim Aufruf des Skripts übergeben werden
echo "Bitte übergeben Sie 3 Argumente beim Ausführen des Skripts."

# Wenn das Skript mit Argumenten ausgeführt wird, z. B.:
# ./positionsparameter.sh Argument1 Argument2 Argument3
# Dann werden die folgenden Argumente angezeigt
echo "Argument 1: \$1 = $1"
echo "Argument 2: \$2 = $2"
echo "Argument 3: \$3 = $3"
echo "Argument 4: \$4 = $4"

# b. Verwendung von \$* und \$@
echo "3. Verwendung von \$* und \$@:"

echo "Der Wert von \$* und \$@ gibt alle Argumente als eine einzige Zeichenkette aus."
echo "\$* gibt die Argumente als eine einzelne Zeichenkette aus, wobei die Argumente durch ein Leerzeichen getrennt sind."
echo "\$@ gibt die Argumente als separate Strings aus, wobei jedes Argument als eigenes Element betrachtet wird."

echo "Wert von \$*: \$* = $*"
echo "Wert von \$@: \$@ = $@"

# c. Verwendung von \${10}, \${11} usw. (ab dem 10. Argument)
echo "4. Zugriff auf Parameter ab \$10:"
echo "Für Argumente ab \$10 müssen geschweifte Klammern verwendet werden, z. B. \${10}, \${11}, usw."

# Beispiel: Wenn beim Aufruf des Skripts mehr als 9 Argumente übergeben werden, können sie wie folgt referenziert werden.
echo "Wenn mehr als 9 Argumente übergeben werden, greifen wir auf sie zu:"
echo "Beispiel für \${10}: \${10} = ${10}"
echo "Beispiel für \${11}: \${11} = ${11}"

# d. Beispiel für ein Skript, das mehrere Argumente nutzt
echo "5. Beispiel für ein Skript, das mehrere Argumente nutzt:"

# Wenn beim Ausführen des Skripts mehrere Argumente übergeben werden, kann das Skript mit einer Schleife die Argumente anzeigen.
echo "Alle übergebenen Argumente:"
for arg in "$@"; do
    echo "$arg"
done

# 4. Ausgabe des Inhalts der Beispieldateien
echo "Inhalt der Datei 'set_example.txt':"
cat set_example.txt

echo "Inhalt der Datei 'fruit_list.txt':"
cat fruit_list.txt

echo "Inhalt der Datei 'positionsparameter_example.txt':"
cat positionsparameter_example.txt

# 5. Löschen der verwendeten Dateien am Ende
rm set_example.txt
rm fruit_list.txt
rm positionsparameter_example.txt

# Ende des Skripts
# Dieses Skript hat die Verwendung des 'set'-Befehls und seiner Optionen wie '-x', '-e', '-u' und '-o pipefail' sowie die Verwendung von Positionsparametern wie \$0 bis \$9, \$* und \$@ und die Zugriffe ab \$10 veranschaulicht.
# Alle temporären Dateien wurden nach der Ausführung des Skripts gelöscht.
