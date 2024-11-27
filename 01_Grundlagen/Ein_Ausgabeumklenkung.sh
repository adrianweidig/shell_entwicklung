#!/bin/sh
# ---------------------------------------------------------
# Ein- und Ausgabenumlenkung in der Shell
# 
# ASCII-Tabelle der wichtigsten Ein- und Ausgabenumleitung-Operatoren
# 
# +----------------------------+---------------------------------------------------------------+
# | Operator                   | Bedeutung                                                     |
# +----------------------------+---------------------------------------------------------------+
# | >                          | Umleitung der Standardausgabe (stdout) in eine Datei          |
# | >>                         | Anhängen der Standardausgabe (stdout) an eine Datei           |
# | 2>                         | Umleitung der Standardfehlerausgabe (stderr) in eine Datei    |
# | 2>>                        | Anhängen der Standardfehlerausgabe (stderr) an eine Datei     |
# | <                          | Eingabeumlenkung von einer Datei                              |
# | <<                         | Hier-Dokument für mehrzeilige Eingaben                        |
# | |                          | Pipe – Verknüpft Ausgaben und Eingaben von Befehlen           |
# | tee                        | Umleitung der Ausgabe an mehrere Ziele (Bildschirm und Datei)|
# +----------------------------+---------------------------------------------------------------+
# 
# In diesem Skript zeigen wir verschiedene Möglichkeiten der Ein- und Ausgabenumlenkung,
# um mit Dateien und Programmen in der Shell effizient zu arbeiten.
# ---------------------------------------------------------

echo "### Ein- und Ausgabenumlenkung in der Shell ###"
echo "Dieses Skript zeigt verschiedene Möglichkeiten der Ein- und Ausgabenumlenkung."

# 1. Umleitung der Standardausgabe (stdout)
echo "### Umleitung der Standardausgabe (stdout) ###"
# Umleitung der Ausgabe eines Befehls in eine Datei
echo "Dies ist eine Beispielausgabe in eine Datei" > output.txt
# Inhalt der Datei anzeigen
echo "Inhalt der Datei output.txt:"
cat output.txt

# 2. Umleitung der Standardfehlerausgabe (stderr)
echo "### Umleitung der Standardfehlerausgabe (stderr) ###"
# Ein Befehl, der einen Fehler verursacht und die Fehlerausgabe in eine Datei umleitet
nonexistent_command 2> error.txt
# Fehlerdatei anzeigen
echo "Inhalt der Datei error.txt (Fehlerausgabe):"
cat error.txt

# 3. Umleitung von stdout und stderr in verschiedene Dateien
echo "### Umleitung von stdout und stderr in verschiedene Dateien ###"
# Umleitung von stdout in output.txt und stderr in error.txt
echo "Dies ist eine normale Ausgabe" > output.txt
nonexistent_command 2> error.txt
echo "Normale Ausgabe wurde in output.txt umgeleitet und Fehler in error.txt"

# 4. Umleitung von stdout und stderr in dieselbe Datei
echo "### Umleitung von stdout und stderr in dieselbe Datei ###"
# Sowohl stdout als auch stderr in die gleiche Datei umleiten
echo "Dies ist eine normale Ausgabe" > combined_output.txt
nonexistent_command 2>> combined_output.txt
echo "Normale Ausgabe und Fehler wurden in combined_output.txt gespeichert"
cat combined_output.txt

# 5. Anhängen der Ausgabe an eine Datei (>>)
echo "### Anhängen der Ausgabe an eine Datei (>>)" ###"
# Statt die Datei zu überschreiben, wird die Ausgabe angehängt
echo "Neue Zeile wird angehängt" >> output.txt
echo "Inhalt der Datei output.txt nach Anhängen:"
cat output.txt

# 6. Eingabeumlenkung (stdin)
echo "### Eingabeumlenkung (stdin) ###"
# Umleitung der Eingabe von einer Datei
echo "Bitte geben Sie Ihre Eingabe ein: "
cat input.txt
# Beispiel für das Erstellen einer Datei input.txt mit Daten:
echo -e "Dies ist die erste Zeile\nDies ist die zweite Zeile" > input.txt

# 7. Umleitung und Pipe (|) - Verkettung von Befehlen
echo "### Umleitung und Pipe (|) ###"
# Verwenden von Pipe, um die Ausgabe eines Befehls in den nächsten Befehl zu leiten
echo -e "Dies ist eine Zeile\nDies ist eine zweite Zeile" | grep "erste" 
# Diese Ausgabe zeigt nur Zeilen, die "erste" enthalten

# 8. Umleitung von Eingabe und Ausgabe in einem Befehl
echo "### Umleitung von Eingabe und Ausgabe in einem Befehl ###"
# Umleitung von Eingabe und Ausgabe in einem einzigen Befehl
cat < input.txt > output_from_input.txt
echo "Inhalt der Datei output_from_input.txt:"
cat output_from_input.txt

# 9. Hier-Dokumente (heredoc) für mehrzeilige Eingaben
echo "### Hier-Dokumente (heredoc) ###"
# Hier-Dokument für die Eingabe mehrerer Zeilen an ein Programm
cat << EOF > heredoc_output.txt
Dies ist eine Zeile in einem Hier-Dokument.
Und dies ist eine weitere Zeile.
EOF
echo "Inhalt der Datei heredoc_output.txt:"
cat heredoc_output.txt

# 10. Verwendung von Tee (tee) zur Ausgabe in mehrere Ziele
echo "### Verwendung von Tee (tee) zur Ausgabe in mehrere Ziele ###"
# Mit tee können Sie die Ausgabe sowohl auf dem Bildschirm als auch in eine Datei umleiten
echo "Dies wird sowohl auf dem Bildschirm angezeigt als auch in die Datei geschrieben" | tee output_tee.txt
echo "Inhalt der Datei output_tee.txt:"
cat output_tee.txt

# 11. Umleitung der Ausgabe an einen anderen Befehl mit Tee
echo "### Umleitung der Ausgabe an einen anderen Befehl mit Tee ###"
# Mit tee kann die Ausgabe auch an einen weiteren Befehl weitergegeben werden
echo -e "Erste Zeile\nZweite Zeile" | tee | grep "Zweite"

# 12. Umleitung mit mehrfacher Pipe und Ausgabe
echo "### Umleitung mit mehrfacher Pipe und Ausgabe ###"
# Ein Beispiel mit mehrfacher Pipe
echo -e "Eins, Zwei, Drei" | tr ',' '\n' | awk '{ print "Nummer: " $1 }' > final_output.txt
echo "Inhalt der Datei final_output.txt:"
cat final_output.txt

# 13. Löschen der erzeugten Dateien
echo "### Löschen der erzeugten Dateien ###"
rm output.txt error.txt output_from_input.txt heredoc_output.txt output_tee.txt final_output.txt combined_output.txt input.txt

# Ende des Skripts
exit 0
