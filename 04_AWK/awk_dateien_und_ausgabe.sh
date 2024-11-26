#!/bin/sh
# Dieses Skript zeigt die Verwendung von AWK für Dateioperationen und Ausgabeformate wie CSV, JSON, XML, YAML, HTML und mehr.
# Alle erzeugten Dateien werden am Ende des Skripts gelöscht.

# 1. Verarbeitung von Eingabedateien

# Beispiel für die Verarbeitung einer Eingabedatei
echo "Max 25" > input.txt
echo "Eva 30" >> input.txt
echo "John 22" >> input.txt

# Ausgabe der Datei zur Kontrolle
echo "### Inhalt der Eingabedatei ###"
cat input.txt

# 2. Ausgabe in CSV-Format (Comma-Separated Values)
echo "### Ausgabe in CSV-Format ###"
awk 'BEGIN { OFS="," } { print $1, $2 }' input.txt > output.csv
echo "Inhalt der Datei output.csv:"
cat output.csv

# 3. Ausgabe in TSV-Format (Tab-Separated Values)
echo "### Ausgabe in TSV-Format ###"
awk 'BEGIN { OFS="\t" } { print $1, $2 }' input.txt > output.tsv
echo "Inhalt der Datei output.tsv:"
cat output.tsv

# 4. Ausgabe in SSV-Format (Space-Separated Values)
echo "### Ausgabe in SSV-Format ###"
awk 'BEGIN { OFS=" " } { print $1, $2 }' input.txt > output.ssv
echo "Inhalt der Datei output.ssv:"
cat output.ssv

# 5. Ausgabe in PSV-Format (Pipe-Separated Values)
echo "### Ausgabe in PSV-Format ###"
awk 'BEGIN { OFS="|" } { print $1, $2 }' input.txt > output.psv
echo "Inhalt der Datei output.psv:"
cat output.psv

# 6. Ausgabe im JSON-Format
echo "### Ausgabe im JSON-Format ###"
awk 'BEGIN { print "[" } { print "{\"name\":\"" $1 "\",\"age\":" $2 "}," } END { print "]" }' input.txt > output.json
echo "Inhalt der Datei output.json:"
cat output.json

# 7. Ausgabe im XML-Format
echo "### Ausgabe im XML-Format ###"
awk 'BEGIN { print "<root>" } { print "<person><name>" $1 "</name><age>" $2 "</age></person>" } END { print "</root>" }' input.txt > output.xml
echo "Inhalt der Datei output.xml:"
cat output.xml

# 8. Ausgabe im YAML-Format
echo "### Ausgabe im YAML-Format ###"
awk '{ print "- name: " $1 "\n  age: " $2 "\n" }' input.txt > output.yml
echo "Inhalt der Datei output.yml:"
cat output.yml

# 9. Ausgabe im HTML-Format
echo "### Ausgabe im HTML-Format ###"
awk 'BEGIN { print "<table>" } { print "<tr><td>" $1 "</td><td>" $2 "</td></tr>" } END { print "</table>" }' input.txt > output.html
echo "Inhalt der Datei output.html:"
cat output.html

# 10. Ausgabe in benutzerdefiniertem Format (z. B. Semikolon-getrennt)
echo "### Ausgabe im benutzerdefinierten Format (Semikolon-getrennt) ###"
awk 'BEGIN { OFS=";" } { print $1, $2 }' input.txt > output.custom
echo "Inhalt der Datei output.custom:"
cat output.custom

# 11. Verarbeiten von mehreren Dateien (NR, NF)
echo "### Verarbeitung mehrerer Dateien und Zugriff auf NR (Zeilennummer) und NF (Anzahl der Felder) ###"
echo "Alice 35" > input2.txt
echo "Bob 40" >> input2.txt
echo "Charlie 25" >> input2.txt

awk '{ print "Name: " $1 ", Alter: " $2 ", Zeilennummer: " NR ", Anzahl der Felder: " NF }' input.txt input2.txt > output_multiple_files.txt
echo "Inhalt der Datei output_multiple_files.txt:"
cat output_multiple_files.txt

# 12. Arbeiten mit Dateimanipulation und Datenspeicherung
echo "### Verarbeitung und Speicherung von Daten in eine neue Datei ###"
awk '{ print $1, $2 }' input.txt > output_processed.txt
echo "Inhalt der Datei output_processed.txt:"
cat output_processed.txt

# 13. Löschen der erzeugten Dateien
echo "### Aufräumen: Löschen der erzeugten Dateien ###"
rm input.txt input2.txt output.csv output.tsv output.ssv output.psv output.json output.xml output.yml output.html output.custom output_multiple_files.txt output_processed.txt

# Ende des Skripts
exit 0
