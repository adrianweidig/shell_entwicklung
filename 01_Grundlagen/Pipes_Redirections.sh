#!/bin/sh
# Dieses Skript erklärt die grundlegende Nutzung von Pipes und Redirections in der Shell.
# Alle genutzten Dateien werden zu Beginn erstellt und am Ende gelöscht.

# 1. Erstellen der Dateien, die im Skript verwendet werden
echo "Dies ist ein Beispieltext für die Ausgabe-Umleitung" > output.txt
echo "Text zum Anhängen" >> output.txt
echo "Zeile1" > input.txt
echo "Zeile2" >> input.txt
echo "Banane" >> output.txt
echo "Apfel" >> output.txt
echo "Orange" >> output.txt
echo "Fehler: Befehl nicht gefunden!" > error.log

# 2. Pipes
# Eine Pipe leitet die Ausgabe eines Befehls direkt als Eingabe für einen anderen Befehl weiter.

# Beispiel: Mit der Pipe "|" verbinden wir 'echo' mit 'grep', um die Ausgabe zu filtern
echo "Dies ist eine Zeile mit Test" | grep "Test"
# Ausgabe: Zeile wird nur dann angezeigt, wenn das Wort "Test" enthalten ist

# Beispiel: Ausgabe eines Befehls an 'sort', um die Zeilen alphabetisch zu sortieren
echo "Banane" > output.txt
echo "Apfel" >> output.txt
echo "Orange" >> output.txt

echo "Vor der Sortierung:"
cat output.txt
# Ausgabe vor der Sortierung:
# Banane
# Apfel
# Orange

# Sortiere den Inhalt von output.txt alphabetisch
echo "Nach der Sortierung:"
cat output.txt | sort
# Ausgabe nach der Sortierung:
# Apfel
# Banane
# Orange

# Beispiel: Pipe mit mehreren Befehlen
echo -e "Apfel\nBanane\nOrange" | sort | wc -l
# Ausgabe: 3  (Anzahl der Zeilen)

# 3. Redirections
# Redirections ermöglichen es, die Eingabe oder Ausgabe eines Befehls umzuleiten.

# 3.1 Ausgabe in eine Datei umleiten (stdout)
# Mit '>' wird die Ausgabe eines Befehls in eine Datei geschrieben.
echo "Dies ist ein Beispieltext" > output.txt
# Die Datei 'output.txt' enthält nun: "Dies ist ein Beispieltext"

# Wenn die Datei bereits existiert, wird der Inhalt überschrieben.
echo "Neuer Text in der Datei" > output.txt
# Die Datei 'output.txt' enthält nun: "Neuer Text in der Datei"

# 3.2 Ausgabe an die Datei anhängen (>>)
# Mit '>>' wird die Ausgabe eines Befehls an eine bestehende Datei angehängt.
echo "Weitere Zeile wird hinzugefügt" >> output.txt
# Die Datei 'output.txt' enthält nun:
# "Neuer Text in der Datei"
# "Weitere Zeile wird hinzugefügt"

# 3.3 Eingabe aus einer Datei umleiten (stdin)
# Mit '<' kann die Eingabe eines Befehls aus einer Datei kommen.
# Beispiel: 'cat' liest den Inhalt der Datei 'input.txt' und gibt ihn auf dem Bildschirm aus.
cat < input.txt
# Ausgabe: 
# Zeile1
# Zeile2

# 3.4 Fehlerausgabe umleiten (stderr)
# Standardmäßig werden Fehler auf den Bildschirm (stderr) ausgegeben.
# Mit '2>' kann die Fehlerausgabe in eine Datei umgeleitet werden.
# Beispiel: Hier wird ein Befehl ausgeführt, der nicht existiert, und die Fehlerausgabe wird in 'error.log' umgeleitet.
nonexistent_command 2> error.log
# Die Datei 'error.log' enthält nun die Fehlermeldung:
# "bash: nonexistent_command: command not found"

# 3.5 Fehlerausgabe und Standardausgabe zusammen umleiten
# Mit '>&' können sowohl die Standardausgabe als auch die Fehlerausgabe in dieselbe Datei umgeleitet werden.
echo "Dies ist eine normale Nachricht" > combined_output.log
nonexistent_command 2>&1 >> combined_output.log
# Die Datei 'combined_output.log' enthält nun:
# "Dies ist eine normale Nachricht"
# "bash: nonexistent_command: command not found"

# 4. Weitere Beispiele mit Pipes und Redirections

# Beispiel: Ausgabe einer Datei mit 'cat' an 'grep', um nach einem bestimmten Wort zu suchen
cat output.txt | grep "Text"
# Ausgabe: Zeile mit dem Wort "Text"

# Beispiel: Fehlerausgabe und Standardausgabe trennen
echo "Dies ist eine normale Nachricht" > normal_output.log
nonexistent_command 2> error_output.log
# 'normal_output.log' enthält: "Dies ist eine normale Nachricht"
# 'error_output.log' enthält: "bash: nonexistent_command: command not found"

# 5. Löschen der verwendeten Dateien am Ende
rm output.txt
rm input.txt
rm error.log
rm combined_output.log
rm normal_output.log
rm error_output.log

# Ende des Skripts
# Dieses Skript hat die grundlegende Nutzung von Pipes und Redirections in der Shell veranschaulicht.
# Alle temporären Dateien wurden nach der Ausführung des Skripts gelöscht.
