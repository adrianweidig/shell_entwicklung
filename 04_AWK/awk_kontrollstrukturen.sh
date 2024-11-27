#!/bin/sh
# Dieses Skript erklärt die Verwendung von AWK Kontrollstrukturen.
# AWK bietet eine Vielzahl von Kontrollstrukturen, um Bedingungen zu testen, Schleifen zu verwenden und benutzerdefinierte Bedingungen zu erstellen.

# 1. ASCII-Tabelle der AWK Parameter und Optionen für Kontrollstrukturen
# -----------------------------------------------------------------------------
# | Parameter      | Bedeutung                                                |
# -----------------------------------------------------------------------------
# | if ... else    | Bedingte Anweisungen: Führt Anweisungen basierend auf einer Bedingung aus. |
# | &&             | Logisches UND: Verbindet mehrere Bedingungen.           |
# | ||             | Logisches ODER: Verbindet mehrere Bedingungen.          |
# | for ...        | Schleife, die über eine Anzahl von Iterationen läuft.   |
# | while ...      | Schleife, die so lange ausgeführt wird, wie die Bedingung wahr ist. |
# | NR             | Zeilennummer.                                            |
# | NF             | Anzahl der Felder in der aktuellen Zeile.                |
# -----------------------------------------------------------------------------

# 2. Beispiel: Bedingungen mit if, else, && und ||

echo "### Beispiel 1: Bedingungen mit if, else, && und || ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '{ if ($2 > 25) { print $1, "ist älter als 25" } else { print $1, "ist nicht älter als 25" } }'
# Ausgabe:
# Max ist nicht älter als 25
# Eva ist älter als 25
# John ist nicht älter als 25

# Beispiel mit logischem UND (&&) und logischem ODER (||)
echo "### Beispiel 2: Bedingungen mit && und || ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '{ if ($2 > 25 && $3 == "Hamburg") { print $1, "ist älter als 25 und lebt in Hamburg" } }'
# Ausgabe:
# Eva ist älter als 25 und lebt in Hamburg

# Beispiel mit logischem ODER
echo "### Beispiel 3: Bedingungen mit || (ODER) ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '{ if ($2 == 25 || $3 == "Köln") { print $1, "wird berücksichtigt" } }'
# Ausgabe:
# Max wird berücksichtigt
# John wird berücksichtigt

# 3. Beispiel: Schleifen (for, while)

echo "### Beispiel 4: for-Schleife in AWK ###"
echo "### Zählen von Zahlen von 1 bis 5 ###"
echo | awk 'BEGIN { for(i=1; i<=5; i++) { print i } }'
# Ausgabe:
# 1
# 2
# 3
# 4
# 5

echo "### Beispiel 5: while-Schleife in AWK ###"
echo "### Solange die Zahl kleiner als 5 ist ###"
echo | awk 'BEGIN { i=1; while(i<5) { print i; i++ } }'
# Ausgabe:
# 1
# 2
# 3
# 4

# 4. Beispiel: Verzweigungen und benutzerdefinierte Bedingungen

echo "### Beispiel 6: Benutzerdefinierte Bedingungen ###"
echo -e "Max 25 Berlin\nEva 35 Hamburg\nJohn 22 Köln" | awk '{ if ($2 > 30) { print $1, "ist über 30 Jahre alt" } else { print $1, "ist 30 Jahre alt oder jünger" } }'
# Ausgabe:
# Max ist 30 Jahre alt oder jünger
# Eva ist 30 Jahre alt oder jünger
# John ist 30 Jahre alt oder jünger

# Beispiel: Verwendung von NR (Zeilennummer) für benutzerdefinierte Bedingungen
echo "### Beispiel 7: Verzweigungen mit NR (Zeilennummer) ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk 'NR == 2 { print "Zweite Zeile:", $1, $2 }'
# Ausgabe:
# Zweite Zeile: Eva 30

# Beispiel mit einer Kombination von Schleife und Bedingung
echo "### Beispiel 8: Schleife und Bedingung kombiniert ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk 'BEGIN { for(i=1; i<=3; i++) { if (i == 2) { print "Zweite Zeile: ", $1, $2 } } }'
# Ausgabe:
# Zweite Zeile: Eva 30

# 5. Beispiel: Schleifen zur Iteration über die Eingabedaten

echo "### Beispiel 9: Schleife zur Iteration über Eingabedaten ###"
echo -e "Max 25 Berlin\nEva 30 Hamburg\nJohn 22 Köln" | awk '{ for(i=1; i<=NF; i++) { print "Feld", i, "ist:", $i } }'
# Ausgabe:
# Feld 1 ist: Max
# Feld 2 ist: 25
# Feld 3 ist: Berlin
# Feld 1 ist: Eva
# Feld 2 ist: 30
# Feld 3 ist: Hamburg
# Feld 1 ist: John
# Feld 2 ist: 22
# Feld 3 ist: Köln

# Ende des Skripts
echo "Dieses Skript hat die Verwendung von AWK Kontrollstrukturen erklärt, einschließlich Bedingungen, Schleifen und benutzerdefinierten Bedingungen."
