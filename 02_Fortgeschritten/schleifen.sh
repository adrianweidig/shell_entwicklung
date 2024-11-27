#!/bin/sh
# Dieses Skript erklärt die Verwendung von Schleifen in der Shell-Programmierung.
# Temporäre Dateien werden am Anfang erstellt und am Ende des Skripts gelöscht.

# 1. Erstellen einer Beispieldatei
echo "Zeile 1: Apfel" > loop_example.txt
echo "Zeile 2: Banane" >> loop_example.txt
echo "Zeile 3: Orange" >> loop_example.txt
echo "Zeile 4: Traube" >> loop_example.txt

# 2. Einführung in Schleifen
echo "### Einführung in Schleifen ###"

# 3. For-Schleife: Iteration über eine Liste
echo "### Beispiel: For-Schleife mit einer Liste ###"
for fruit in Apfel Banane Orange Traube; do
  echo "Frucht: $fruit"
done

# 4. For-Schleife: Iteration über Inhalte einer Datei
echo "### Beispiel: For-Schleife mit Datei-Inhalten ###"
for line in $(cat loop_example.txt); do
  echo "Datei-Inhalt: $line"
done

# Hinweis: Der obige Ansatz trennt Einträge nach Leerzeichen. 
# Für zeilenweises Lesen wird eine While-Schleife empfohlen (siehe unten).

# 5. For-Schleife: Iteration mit 'seq' (von bis)
echo "### Beispiel: For-Schleife mit 'seq' zum Zählen ###"
for i in $(seq 1 5); do
  echo "Zähler mit seq: $i"
done

# Erklärung:
# 'seq 1 5' erzeugt eine Sequenz von 1 bis 5 und iteriert über diese Zahlen in der For-Schleife.

# 6. While-Schleife: Zeilenweises Lesen einer Datei
echo "### Beispiel: While-Schleife zum Lesen einer Datei ###"
while read -r line; do
  echo "Gelesene Zeile: $line"
done < loop_example.txt

# 7. While-Schleife mit einer Bedingung
echo "### Beispiel: While-Schleife mit Bedingung ###"
counter=1
while [ $counter -le 5 ]; do
  echo "Zähler: $counter"
  counter=$((counter + 1))
done

# Erklärung:
# Die While-Schleife wiederholt sich, solange die Bedingung (hier $counter -le 5) wahr ist.

# 8. Until-Schleife: Wiederholen bis eine Bedingung erfüllt ist
echo "### Beispiel: Until-Schleife ###"
counter=1
until [ $counter -gt 5 ]; do
  echo "Zähler (until): $counter"
  counter=$((counter + 1))
done

# Erklärung:
# Die Until-Schleife wiederholt sich, bis die Bedingung ($counter -gt 5) wahr ist.

# 9. Verschachtelte Schleifen
echo "### Beispiel: Verschachtelte Schleifen ###"
for i in 1 2 3; do
  for j in A B C; do
    echo "Kombination: $i$j"
  done
done

# Erklärung:
# Eine Schleife innerhalb einer anderen Schleife, um alle möglichen Kombinationen zu erzeugen.

# 10. Schleifensteuerung: break und continue
echo "### Beispiel: Schleifensteuerung mit break und continue ###"
for number in 1 2 3 4 5; do
  if [ "$number" -eq 3 ]; then
    echo "break bei Zahl: $number"
    break
  fi
  echo "Nummer: $number"
done

# Erklärung:
# Die Schleife wird bei der Zahl 3 mit 'break' abgebrochen und nicht weiter ausgeführt.

for number in 1 2 3 4 5; do
  if [ "$number" -eq 3 ]; then
    echo "continue bei Zahl: $number"
    continue
  fi
  echo "Nummer: $number"
done

# Erklärung:
# Bei der Zahl 3 überspringt 'continue' den aktuellen Schleifendurchlauf und fährt mit der nächsten Zahl fort.

# 11. For-Schleife mit einer C-ähnlichen Syntax
echo "### Beispiel: For-Schleife mit C-ähnlicher Syntax ###"
for ((i=1; i<=5; i++)); do
  echo "C-ähnliche Schleife: $i"
done

# Erklärung:
# Diese Syntax ist der C-Sprache sehr ähnlich, und ermöglicht das Setzen von Initialisierung, Bedingung und Inkrement in einer einzigen Zeile.

# 12. Wiederholung bis Benutzerabbruch mit 'while true'
echo "### Beispiel: Endlosschleife mit 'while true' ###"
counter=1
while true; do
  echo "Endlosschleife: Zähler = $counter"
  counter=$((counter + 1))
  if [ $counter -gt 5 ]; then
    echo "Ende der Schleife nach 5 Durchläufen."
    break
  fi
done

# 13. Aufräumen: Löschen der verwendeten Datei
rm loop_example.txt

# Ende des Skripts
# Dieses Skript hat die Verwendung der grundlegenden Schleifenarten wie For, While, Until, sowie Schleifensteuerung und verschachtelte Schleifen veranschaulicht.
# Alle temporären Dateien wurden nach der Ausführung des Skripts gelöscht.

exit 0
