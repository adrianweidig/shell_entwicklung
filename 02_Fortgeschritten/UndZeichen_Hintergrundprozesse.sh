#!/bin/sh
# Dieses Skript erklärt die Nutzung des &-Zeichens für Hintergrundprozesse in der Shell.
# Alle genutzten Dateien werden zu Beginn erstellt und am Ende gelöscht.

# 1. Erstellen der Dateien, die im Skript verwendet werden
echo "Dies ist eine Datei für die Demonstration von Hintergrundprozessen." > background_test.txt
echo "Text in einer weiteren Datei" > process_test.txt

# 2. Hintergrundprozesse mit '&'
# Das '&'-Zeichen wird verwendet, um Prozesse im Hintergrund auszuführen.
# Beispiel: Ein einfacher Befehl, der im Hintergrund läuft.

echo "Starte Hintergrundprozess 1"
sleep 5 &  # Der Befehl sleep wird im Hintergrund ausgeführt.
# Der 'sleep 5' Befehl pausiert für 5 Sekunden. Dies läuft im Hintergrund.
echo "Hintergrundprozess 1 läuft jetzt im Hintergrund."

# Beispiel: Ein weiterer Hintergrundprozess
echo "Starte Hintergrundprozess 2"
sleep 3 &  # Ein weiterer 'sleep 3' Befehl im Hintergrund
echo "Hintergrundprozess 2 läuft jetzt im Hintergrund."

# Beispiel: Weitere Hintergrundprozesse mit längerer Dauer
echo "Starte Hintergrundprozess 3"
sleep 10 &  # Ein weiterer 'sleep 10' Befehl im Hintergrund
echo "Hintergrundprozess 3 läuft jetzt im Hintergrund."

# 3. Hinweis für den Benutzer: Das Skript läuft noch
echo -e "\033[0;31mACHTUNG: Das Programm läuft noch...\033[0m"
# Der Text wird in Rot ausgegeben. \033[0;31m setzt die Textfarbe auf Rot, und \033[0m setzt sie zurück.

# Warten auf den Abschluss der Hintergrundprozesse
wait  # Der Befehl 'wait' wartet darauf, dass alle Hintergrundprozesse abgeschlossen sind.

# 4. Verwendung von '&' in einer längeren Befehlssequenz
echo "Starte einen langen Hintergrundprozess und führe etwas anderes währenddessen aus."
sleep 15 &  # Hintergrundprozess für 15 Sekunden
echo "Ich warte nicht auf den Hintergrundprozess und führe jetzt etwas anderes aus."
# Hier kann man weitere Befehle ausführen, während 'sleep 15' im Hintergrund läuft.

# 5. Prüfen von Hintergrundprozessen mit 'ps'
echo "Liste der laufenden Prozesse:"
ps -ef | grep sleep  # Zeigt die Prozesse an, die den Befehl 'sleep' enthalten.

# 6. Beenden von Hintergrundprozessen mit 'kill'
# Um einen Hintergrundprozess zu beenden, verwenden wir 'kill' gefolgt von der Prozess-ID.
# Wir zeigen ein Beispiel, wie man einen Hintergrundprozess auf Basis seiner PID beendet.

# Starten eines Prozesses im Hintergrund und speichern der PID
sleep 10 &  # Hintergrundprozess
bg_pid=$!  # $! gibt die PID des zuletzt gestarteten Hintergrundprozesses zurück
echo "PID des Hintergrundprozesses: $bg_pid"

# Der Befehl 'kill' beendet den Prozess basierend auf seiner PID
echo "Beende den Hintergrundprozess mit der PID $bg_pid."
kill $bg_pid  # Killt den Hintergrundprozess

# 7. Ausgabe des Inhalts der Dateien
echo "Inhalt der Datei background_test.txt:"
cat background_test.txt

echo "Inhalt der Datei process_test.txt:"
cat process_test.txt

# 8. Löschen der verwendeten Dateien am Ende
rm background_test.txt
rm process_test.txt

# Ende des Skripts
# Dieses Skript hat die grundlegende Nutzung des &-Zeichens für Hintergrundprozesse veranschaulicht.
# Alle temporären Dateien wurden nach der Ausführung des Skripts gelöscht.
