#!/bin/sh
# Dieses Skript erklärt die Verwendung von Zeichenkettenmanipulation in der Shell.
# Es behandelt verschiedene Werkzeuge wie tr, cut, und Parametererweiterung, um mit Zeichenketten zu arbeiten.

# 1. Beispiel für die Verwendung von tr (Zeichenersetzung und -entfernung)
echo "### Beispiel 1: tr (Zeichenersetzung und -entfernung) ###"

# Übersicht der möglichen Parameter für `tr`
# -------------------------------------------------------
# | Option  | Bedeutung                                        |
# -------------------------------------------------------
# | -d      | Löscht Zeichen aus der Eingabe                    |
# | -s      | Kürzt aufeinanderfolgende gleiche Zeichen        |
# | -c      | Verwendet das komplementäre Set der angegebenen Zeichen |
# | -t      | Kürzt das Eingabemuster, um die Ausgabe zu trimmen|
# -------------------------------------------------------

echo "Beispieltext: Hallo, Welt!"
echo "Entferne alle Kommata:"
echo "Hallo, Welt!" | tr -d ','
echo "Entferne alle Großbuchstaben:"
echo "Hallo, Welt!" | tr -d 'A-Z'
echo "Ersetze Komma durch Punkt:"
echo "Hallo, Welt!" | tr ',' '.'
echo "Ersetze Großbuchstaben durch Kleinbuchstaben:"
echo "Hallo, Welt!" | tr 'A-Z' 'a-z'

# 2. Beispiel für die Verwendung von cut (Extraktion von Textteilen)
echo "### Beispiel 2: cut (Extraktion von Textteilen) ###"

# Übersicht der möglichen Parameter für `cut`
# --------------------------------------------------------------
# | Option        | Bedeutung                                               |
# --------------------------------------------------------------
# | -d 'Zeichen'  | Definiert das Trennzeichen für die Felder                |
# | -f 'Feld'     | Extrahiert das angegebene Feld (Feldnummer)              |
# | -c 'Zeichen'  | Extrahiert bestimmte Zeichenpositionen                   |
# | -s            | Überspringt Zeilen ohne das Trennzeichen                 |
# --------------------------------------------------------------

echo "Beispieltext: Max,25,Berlin"
echo "Extrahiere das erste Feld (Name):"
echo "Max,25,Berlin" | cut -d',' -f1
echo "Extrahiere das zweite Feld (Alter):"
echo "Max,25,Berlin" | cut -d',' -f2
echo "Extrahiere das dritte Feld (Stadt):"
echo "Max,25,Berlin" | cut -d',' -f3
echo "Extrahiere das erste und zweite Feld (Name und Alter):"
echo "Max,25,Berlin" | cut -d',' -f1,2

# 3. Beispiel für Parametererweiterung (Extrahieren und Bearbeiten von Text)
echo "### Beispiel 3: Parametererweiterung (Extrahieren und Bearbeiten von Text) ###"
# Übersicht der möglichen Parametererweiterungsoptionen
# --------------------------------------------------------------
# | Option               | Bedeutung                                                 |
# --------------------------------------------------------------
# | ${variable%%pattern}  | Entfernt den längsten Teil des Musters vom Ende der Variable|
# | ${variable#pattern}   | Entfernt den kürzesten Teil des Musters vom Anfang der Variable|
# | ${variable/pattern}   | Ersetzt das erste Vorkommen des Musters durch den angegebenen Text|
# | ${variable//pattern}  | Ersetzt alle Vorkommen des Musters durch den angegebenen Text|
# | ${variable/#pattern}  | Ersetzt das Muster nur am Anfang der Variable             |
# | ${variable/%pattern}  | Ersetzt das Muster nur am Ende der Variable               |
# --------------------------------------------------------------

text="Max Mustermann, 25, Berlin"
echo "Extrahiere das erste Wort (bis zum ersten Komma):"
echo "${text%%,*}"
echo "Extrahiere das Alter (alles nach dem ersten Komma):"
echo "${text#*, }"
echo "Ersetze 'Max' durch 'John':"
echo "${text/Max/John}"

# 4. Beispiel für die Verwendung von rev (Umkehrung der Zeichenkette)
echo "### Beispiel 4: rev (Umkehrung der Zeichenkette) ###"
# `rev` kehrt die Reihenfolge der Zeichen in der Eingabe um.
echo "Beispieltext: Hallo, Welt!"
echo "Umgekehrter Text:"
echo "Hallo, Welt!" | rev

# 5. Beispiel für die Verwendung von tr zur Bereinigung von Zeichen
echo "### Beispiel 5: tr (Bereinigung von Zeichen) ###"
# tr -cd 'Zeichen'  : Entfernt alle Zeichen, die nicht zu den angegebenen Zeichen gehören
text="Max 25, 500"
echo "Text mit Zahlen und Buchstaben:"
echo "$text"
echo "Nur Ziffern:"
echo "$text" | tr -cd '0-9'

# 6. Beispiel für die Verwendung von cut mit mehreren Trennzeichen
echo "### Beispiel 6: cut mit mehreren Trennzeichen ###"
# cut -d'...' : Mit -d können mehrere Trennzeichen angegeben werden
# cut -fFeldnummer : Gibt ein bestimmtes Feld aus
echo "Beispieltext: Max|25|Berlin"
echo "Extrahiere das erste Feld:"
echo "Max|25|Berlin" | cut -d'|' -f1
echo "Extrahiere das zweite Feld:"
echo "Max|25|Berlin" | cut -d'|' -f2
echo "Extrahiere das dritte Feld:"
echo "Max|25|Berlin" | cut -d'|' -f3

# 7. Beispiel für die Verwendung von cut mit mehreren Feldern
echo "### Beispiel 7: cut mit mehreren Feldern ###"
# cut -d',' -f1,3  : Extrahiert das erste und dritte Feld aus der durch Kommas getrennten Zeichenkette
echo "Max,25,Berlin" | cut -d',' -f1,3

# 8. Beispiel für das Entfernen von Leerzeichen mit Parametererweiterung
echo "### Beispiel 8: Entfernen von Leerzeichen mit Parametererweiterung ###"
# Entfernt Leerzeichen am Anfang und Ende
text="    Max Mustermann    "
echo "Text mit Leerzeichen:"
echo "$text"
echo "Text ohne Leerzeichen:"
echo "${text%"${text##*[![:space:]]}"}"  # Entfernt Leerzeichen am Ende
echo "${text#"${text%%*[![:space:]]}"}"  # Entfernt Leerzeichen am Anfang

# Ende des Skripts
echo "Dieses Skript hat verschiedene Methoden zur Zeichenkettenmanipulation in der Shell demonstriert, einschließlich tr, cut und Parametererweiterung."
