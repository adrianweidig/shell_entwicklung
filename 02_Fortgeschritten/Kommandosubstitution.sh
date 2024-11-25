#!/bin/sh
# Dieses Skript erklärt die verschiedenen Varianten von Hochkommata in der Shell.
# Alle genutzten Dateien werden zu Beginn erstellt und am Ende gelöscht.

# 1. Erstellen der Dateien, die im Skript verwendet werden
echo "Dies ist eine Beispieldatei, die die Nutzung von Hochkommata in der Shell erklärt." > quotes_example.txt
echo "Zeile 1: Apfel" > fruit_list.txt
echo "Zeile 2: Banane" >> fruit_list.txt
echo "Zeile 3: Orange" >> fruit_list.txt

# 2. Einfaches Hochkomma (`'`) – Keine Expansion
# Mit einfachen Hochkommata (') wird der Inhalt genau so behandelt, wie er ist. Variablen oder Befehle werden nicht expandiert.

echo "Beispiel für einfaches Hochkomma ('):"
my_variable="Wert"
echo 'Dies ist ein Text mit einer Variablen: $my_variable'  # $my_variable wird nicht expandiert.
echo 'In einfachen Hochkommata wird nichts expandiert: $my_variable'

# 3. Doppelte Hochkomma (`"`) – Expansion von Variablen und Befehlen
# Mit doppelten Hochkommata (") können Variablen und Befehle expandiert werden.

echo "Beispiel für doppelte Hochkommata (\"):"
echo "Dies ist ein Text mit einer Variablen: $my_variable"  # $my_variable wird expandiert.
echo "Der aktuelle Benutzer ist: $USER"  # $USER wird expandiert.

# Beispiel: Befehlsausgabe mit doppelten Hochkommata und Kommandosubstitution
current_date=$(date)
echo "Das aktuelle Datum und die Uhrzeit sind: $current_date"

# 4. Backticks (\`) – Kommandosubstitution (ältere Syntax)
# Backticks ( \` \` ) werden verwendet, um die Ausgabe eines Befehls als Teil eines anderen Befehls zu verwenden.
# Diese Methode ist die ältere Syntax für die Kommandosubstitution und funktioniert auch, ist aber weniger flexibel als $(command).

echo "Beispiel für Backticks (\`\`):"
echo "Das Verzeichnis des aktuellen Skripts: `pwd`"  # Befehl wird ausgeführt und Ergebnis wird hier eingefügt.
echo "Das aktuelle Datum mit Backticks: `date`"  # Befehl wird ausgeführt und Ergebnis wird hier eingefügt.

# 5. Verwendung von typografischen Hochkommata (‚ und ’)
# Typografische Hochkommata werden normalerweise nicht in der Shell verwendet und sollten vermieden werden.
# Sie sind keine gültigen Shell-Zeichen, aber hier zeigen wir, was passiert, wenn sie verwendet werden.

echo "Beispiel für typografische Hochkommata (‚ und ’):"
echo "Dies wird nicht richtig funktionieren, weil typografische Hochkommata verwendet werden: ‚$my_variable’"

# 6. Ausgabe des Inhalts der Dateien
echo "Inhalt der Datei 'quotes_example.txt':"
cat quotes_example.txt

echo "Inhalt der Datei 'fruit_list.txt':"
cat fruit_list.txt

# 7. Löschen der verwendeten Dateien am Ende
rm quotes_example.txt
rm fruit_list.txt

# Ende des Skripts
# Dieses Skript hat die Verwendung der verschiedenen Hochkommavarianten in der Shell veranschaulicht.
# Alle temporären Dateien wurden nach der Ausführung des Skripts gelöscht.
