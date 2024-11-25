#!/bin/sh
# Dieses Skript erklärt grundlegende Datentypen und einfache Operationen mit Zahlen in der Shell.

# 1. Text (Zeichenketten) als Standard-Datentyp
# In der Shell sind alle Variablen standardmäßig Zeichenketten (Strings).
# Beispiel:
TEXT="Dies ist ein Text."
echo "$TEXT"

# 2. Ganzzahlen (Integer) in der Shell
# In der Shell sind Variablen standardmäßig Zeichenketten, aber wir können sie für arithmetische Berechnungen verwenden.
# Beispiel für eine Ganzzahl:
ZAHL1=10
ZAHL2=5

# 3. Arithmetische Operationen mit Ganzzahlen
# Arithmetische Berechnungen mit `(( ))`:
# Addition:
ERGEBNIS=$((ZAHL1 + ZAHL2))
echo "Addition: $ZAHL1 + $ZAHL2 = $ERGEBNIS"

# Subtraktion:
ERGEBNIS=$((ZAHL1 - ZAHL2))
echo "Subtraktion: $ZAHL1 - $ZAHL2 = $ERGEBNIS"

# Multiplikation:
ERGEBNIS=$((ZAHL1 * ZAHL2))
echo "Multiplikation: $ZAHL1 * $ZAHL2 = $ERGEBNIS"

# Division:
ERGEBNIS=$((ZAHL1 / ZAHL2))
echo "Division: $ZAHL1 / $ZAHL2 = $ERGEBNIS"

# Modulo (Rest der Division):
ERGEBNIS=$((ZAHL1 % ZAHL2))
echo "Modulo: $ZAHL1 % $ZAHL2 = $ERGEBNIS"

# 4. Gleitkommazahlen (Floating Point)
# Für Gleitkommazahlen verwenden wir den Befehl `bc`.
ZAHL1_FLOAT=10.5
ZAHL2_FLOAT=3.2

# Beispiel für eine Division mit Gleitkommazahlen:
ERGEBNIS=$(echo "$ZAHL1_FLOAT / $ZAHL2_FLOAT" | bc -l)
echo "Division mit Gleitkommazahlen: $ZAHL1_FLOAT / $ZAHL2_FLOAT = $ERGEBNIS"

# 5. Arbeiten mit Variablen und Zahlen in der Shell
# Variablen können beliebige Werte speichern, die als Zahl behandelt werden, solange der Inhalt numerisch ist.
# Beispiel:
VAR="20"
VAR=$((VAR + 10))
echo "Neue Zahl nach Addition: $VAR"

# 6. Umwandlung von Strings in Zahlen
# Wenn der Text eine Zahl ist, wird sie von der Shell automatisch als Zahl behandelt.
TEXT_ZAHL="50"
ERGEBNIS=$((TEXT_ZAHL + 10))
echo "Addition von Text und Zahl: $TEXT_ZAHL + 10 = $ERGEBNIS"

# Ende des Skripts
# Dieses Skript zeigt grundlegende Datentypen (Strings und Zahlen) und einfache Berechnungen in der Shell.
