#!/bin/sh
# Dieses Skript erklärt die Verwendung von Regulären Ausdrücken (Regex) in Shell-Skripten.
# Es zeigt grundlegende und fortgeschrittene Anwendungen, inklusive Beispielen und ASCII-Tabellen zur Erklärung der wichtigsten Regex-Symbole.

# 1. Einführung in Reguläre Ausdrücke (Regex)
# Reguläre Ausdrücke (Regex) sind Muster, die zur Suche und Bearbeitung von Texten verwendet werden.
# In Shell-Skripten werden Regex häufig mit Tools wie `grep` und der eingebauten Bash-Regex-Syntax verwendet.
# Das Verständnis von Regex ermöglicht es, komplexe Textverarbeitungsaufgaben effizient zu lösen.

# 2. Grundlegende Syntax von Regex
# Die grundlegende Syntax von Regex verwendet spezielle Zeichen, um Muster zu definieren, die mit Text übereinstimmen.

# ASCII-Tabelle mit gängigen Regex-Symbolen:

# | Symbol       | Bedeutung                                                        |
# |--------------|------------------------------------------------------------------|
# | .            | Ein beliebiges Zeichen außer Zeilenumbruch.                      |
# | ^            | Beginnt mit dem folgenden Muster (Anfang einer Zeile).           |
# | $            | Endet mit dem vorhergehenden Muster (Ende einer Zeile).          |
# | *            | Wiederholt das vorherige Zeichen null oder mehrmals.             |
# | +            | Wiederholt das vorherige Zeichen einmal oder mehrmals.           |
# | ?            | Das vorherige Zeichen ist optional (null oder einmal).           |
# | []           | Ein Zeichensatz, der eines der Zeichen innerhalb der eckigen Klammern erfordert.  |
# | [^]          | Ein Zeichensatz, der ein Zeichen ausschließt.                     |
# | |            | Oder-Verknüpfung.                                                |
# | ()           | Gruppierung, um Teile des Musters zu isolieren.                  |
# | {n,m}        | Wiederholt das vorherige Zeichen mindestens n bis höchstens m mal.|
# | \d           | Entspricht einer Zahl (Ziffer von 0 bis 9).                      |
# | \w           | Entspricht einem Wortzeichen (Buchstaben, Ziffern und Unterstrich).|
# | \s           | Entspricht einem Leerzeichen (Whitespace: Leerzeichen, Tabulator, etc.).|
# | \b           | Wortgrenze (z.B. zwischen einem Wort und einem Leerzeichen).     |
# | \B           | Keine Wortgrenze.                                                |

# 3. Verwendung von Regex in Shell-Skripten

# 3.1. Beispiel 1: Einfache Suche mit `grep`
echo "### Beispiel 1: Einfache Regex-Suche mit grep ###"
# Suchen nach einer Zahl in einem Text
echo "Mein Alter ist 25" | grep -E '\d+'
# Ausgabe: "Mein Alter ist 25"

# 3.2. Beispiel 2: Überprüfung einer E-Mail-Adresse mit Regex in Bash
echo "### Beispiel 2: E-Mail-Überprüfung ###"
# Überprüfen, ob eine E-Mail-Adresse korrekt formatiert ist
email="beispiel@domain.com"
if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Die E-Mail-Adresse $email ist gültig."
else
  echo "Die E-Mail-Adresse $email ist ungültig."
fi
# Ausgabe: "Die E-Mail-Adresse beispiel@domain.com ist gültig."

# 3.3. Beispiel 3: Suchen und Extrahieren von Telefonnummern mit `grep`
echo "### Beispiel 3: Extrahieren von Telefonnummern ###"
# Extrahieren einer Telefonnummer im Format 123-456-7890
echo "Meine Nummer ist 123-456-7890." | grep -oP '\d{3}-\d{3}-\d{4}'
# Ausgabe: "123-456-7890"

# 3.4. Beispiel 4: Überprüfen, ob ein Wort mit einem bestimmten Buchstaben beginnt (Bash-Regex)
echo "### Beispiel 4: Überprüfen, ob ein Wort mit einem bestimmten Buchstaben beginnt ###"
# Überprüfen, ob ein Wort mit "A" beginnt
word="Apfel"
if [[ "$word" =~ ^A ]]; then
  echo "Das Wort beginnt mit A."
else
  echo "Das Wort beginnt nicht mit A."
fi
# Ausgabe: "Das Wort beginnt mit A."

# 3.5. Beispiel 5: Überprüfung, ob ein Text eine gültige URL enthält
echo "### Beispiel 5: Überprüfung, ob eine gültige URL vorhanden ist ###"
# Regex für eine einfache URL-Prüfung
url="http://www.example.com"
if [[ "$url" =~ ^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Die URL $url ist gültig."
else
  echo "Die URL $url ist ungültig."
fi
# Ausgabe: "Die URL http://www.example.com ist gültig."

# 3.6. Beispiel 6: Extrahieren von Datumsangaben im Format "YYYY-MM-DD"
echo "### Beispiel 6: Extrahieren von Datumsangaben ###"
# Extrahieren eines Datums
text="Das heutige Datum ist 2024-11-26."
echo "$text" | grep -oP '\d{4}-\d{2}-\d{2}'
# Ausgabe: "2024-11-26"

# 4. Praktische Links zu Regex-Tools und Ressourcen
# - [Regex101](https://regex101.com/): Ein interaktiver Regex-Tester mit detaillierter Erklärung
# - [Regexr](https://regexr.com/): Ein weiterer interaktiver Regex-Tester mit Regex-Bibliothek und Beispielen
# - [Regular Expressions - Wikipedia](https://de.wikipedia.org/wiki/Regul%C3%A4re_Ausdr%C3%BCcke): Detaillierte Erklärung von Regex-Syntax und -Anwendungen

# 5. Fazit
# Reguläre Ausdrücke sind ein mächtiges Werkzeug, das in Shell-Skripten zur Textsuche, -ersetzung und -verarbeitung verwendet wird.
# Durch das Verstehen der grundlegenden Regex-Syntax können wir präzise und effiziente Textmanipulationen in unseren Skripten durchführen.

exit 0
