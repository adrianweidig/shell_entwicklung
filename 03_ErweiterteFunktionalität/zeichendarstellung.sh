#!/bin/sh
# Dieses Skript erklärt verschiedene Methoden zur Zeichendarstellung in der Shell.
# Es behandelt die Verwendung von `od`, `printf`, `xxd` und anderen Techniken zum Anzeigen und Umwandeln von Zeichen und deren numerischen Repräsentationen.

# 1. Beispiel: Oktaldump mit od
echo "### Beispiel 1: Oktaldump mit od ###"
# `od` (Oktaldump) zeigt die hexadezimale, oktale, und ASCII-Repräsentation von Dateien oder Zeichen an.
# Der Befehl `od` kann verwendet werden, um Zeichen in ihrer Oktal-, Hexadezimal- oder ASCII-Darstellung zu überprüfen.

echo "Hallo, Welt!" | od -c
# Ausgabe:
# 0000000   H   a   l   l   o   ,       W   e   l   t   !  \n

# Der Parameter -c zeigt die Zeichen dar und übersetzt sie in lesbare ASCII-Zeichen.
# Weitere nützliche Optionen:
# ---------------------------------------------------------------
# | Option  | Bedeutung                                           |
# ---------------------------------------------------------------
# | -c      | Gibt die Zeichen in ASCII-Darstellung aus            |
# | -x      | Zeigt die Hexadezimalwerte der Eingabe               |
# | -d      | Zeigt die dezimale Darstellung                       |
# | -o      | Zeigt die oktale Darstellung                         |
# ---------------------------------------------------------------

# 2. Beispiel: ASCII-Zahl zu Zeichen umwandeln
echo "### Beispiel 2: ASCII-Zahl zu Zeichen umwandeln ###"
# Mit `printf` können ASCII-Zahlen in ihre Zeichen umgewandelt werden.
# Der Formatstring \x ermöglicht es, die hexadezimale ASCII-Repräsentation in Zeichen umzuwandeln.

ascii_num=65
printf 'ASCII-Zahl %d entspricht dem Zeichen: %s\n' "$ascii_num" "$(printf \\$(printf '%03o' "$ascii_num"))"
# Ausgabe: ASCII-Zahl 65 entspricht dem Zeichen: A

# Um mehrere ASCII-Zahlen umzuwandeln, kann eine Schleife verwendet werden:
for ascii_num in 72 101 108 108 111 44 32 87 111 114 108 100 33; do
  printf '%s' "$(printf \\$(printf '%03o' "$ascii_num"))"
done
echo
# Ausgabe: Hello, World!

# 3. Beispiel: Zeichen als Hexadezimalwert ausgeben
echo "### Beispiel 3: Zeichen als Hexadezimalwert ausgeben ###"
# Verwenden von printf, um Zeichen in Hexadezimalwerte umzuwandeln:
echo "Hallo, Welt!" | od -An -t x1
# Ausgabe (Hexadezimalwerte der Zeichen):
#  48 61 6c 6c 6f 2c 20 57 65 6c 74 21

# 4. Beispiel: Zeichen und deren ASCII-Werte mit `printf`
echo "### Beispiel 4: Zeichen und deren ASCII-Werte mit printf ###"
# Der Befehl `printf` kann verwendet werden, um den ASCII-Wert eines Zeichens direkt anzuzeigen.
char="A"
printf 'Das Zeichen "%s" hat den ASCII-Wert %d.\n' "$char" "'$char'"
# Ausgabe: Das Zeichen 'A' hat den ASCII-Wert 65.

# 5. Beispiel: Umwandlung von Zeichen in oktale ASCII-Darstellung
echo "### Beispiel 5: Umwandlung von Zeichen in oktale ASCII-Darstellung ###"
# Mit `printf` können Zeichen auch in ihre oktalen ASCII-Werte umgewandelt werden.
char="A"
printf 'Das Zeichen "%s" hat den oktalen ASCII-Wert: %o.\n' "$char" "'$char'"
# Ausgabe: Das Zeichen 'A' hat den oktalen ASCII-Wert: 101.

# 6. Beispiel: Zeichen in Unicode-Darstellung umwandeln
echo "### Beispiel 6: Zeichen in Unicode-Darstellung umwandeln ###"
# Um ein Zeichen in seinen Unicode-Codepunkt umzuwandeln, kann `printf` verwendet werden:
char="A"
printf 'Der Unicode-Codepunkt für "%s" ist: U+%04X\n' "$char" "'$char'"
# Ausgabe: Der Unicode-Codepunkt für 'A' ist: U+0041.

# 7. Beispiel: Hexadezimaldarstellung eines Strings
echo "### Beispiel 7: Hexadezimaldarstellung eines Strings ###"
# Um den gesamten String in Hexadezimal darzustellen, verwenden wir `od`:
echo "Hallo, Welt!" | od -An -t x1 | tr -d ' \n'
# Ausgabe: 48616c6c6f2c2057656c7421

# 8. Beispiel: Zeichenkette in ASCII-Code umwandeln
echo "### Beispiel 8: Zeichenkette in ASCII-Code umwandeln ###"
# Der ASCII-Wert jedes Zeichens eines Strings kann mit einer Schleife ausgegeben werden:
text="Hallo"
for (( i=0; i<${#text}; i++ )); do
  char="${text:$i:1}"
  printf 'Der ASCII-Wert des Zeichens "%s" ist: %d\n' "$char" "'$char'"
done
# Ausgabe:
# Der ASCII-Wert des Zeichens 'H' ist: 72
# Der ASCII-Wert des Zeichens 'a' ist: 97
# Der ASCII-Wert des Zeichens 'l' ist: 108
# Der ASCII-Wert des Zeichens 'l' ist: 108
# Der ASCII-Wert des Zeichens 'o' ist: 111

# 9. Beispiel: Umwandlung von ASCII zu Binärwert
echo "### Beispiel 9: Umwandlung von ASCII zu Binärwert ###"
# Die Umwandlung eines Zeichens in seinen Binärwert (ASCII) ist ebenfalls möglich:
char="A"
printf 'Das Zeichen "%s" hat den Binärwert: ' "$char"
printf "%08d\n" "$(echo "obase=2; $(printf '%d' "'$char'")" | bc)"
# Ausgabe: Das Zeichen 'A' hat den Binärwert: 01000001

# 10. Beispiel: Verwendung von `xxd` zur Darstellung von Hex- und ASCII-Bytes
echo "### Beispiel 10: Verwendung von xxd zur Darstellung von Hex- und ASCII-Bytes ###"
# `xxd` zeigt die hexadezimale und ASCII-Darstellung eines Strings oder einer Datei an.
# Hier eine Tabelle der wichtigsten Parameter von `xxd`:

# --------------------------------------------------------------
# | Option          | Bedeutung                                               |
# --------------------------------------------------------------
# | -p              | Gebe den Input als "plain" (unformatierte Hex-Darstellung)|
# | -c <width>      | Bestimme die Anzahl der Bytes pro Zeile                  |
# | -u              | Verwende die Großbuchstaben für Hexadezimalzahlen        |
# | -a              | Zeigt die ASCII-Darstellung neben den Hex-Werten         |
# | -g <width>      | Gruppiere Hex-Werte in "Breiten" von Bytes               |
# | -s <offset>     | Beginne die Ausgabe bei einem Offset in der Datei        |
# | -v              | Zeigt die Version von xxd an                            |
# --------------------------------------------------------------

# Beispiel für eine einfache Nutzung von `xxd`:
echo "Hallo, Welt!" | xxd
# Ausgabe:
# 00000000: 4861 6c6c 6f2c 2057 656c 7421        Hello, World!

# Ende des Skripts
echo "Dieses Skript hat verschiedene Methoden zur Zeichendarstellung in der Shell gezeigt, einschließlich od, printf, xxd, und Umwandlungen zwischen ASCII, Hexadezimal, Oktal und Binär."
