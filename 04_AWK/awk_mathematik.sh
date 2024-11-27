#!/bin/sh
# Dieses Skript erklärt die Verwendung von mathematischen Operationen in AWK, einschließlich arithmetischer Operationen,
# aggregierter Berechnungen und der Nutzung mathematischer Funktionen.

# 1. ASCII-Tabelle der AWK Parameter und Funktionen für mathematische Operationen
# -----------------------------------------------------------------------------
# | Parameter/Operator | Bedeutung                                                 |
# -----------------------------------------------------------------------------
# | +                  | Addition (Addition von zwei Werten)                       |
# | -                  | Subtraktion (Subtraktion von zwei Werten)                 |
# | *                  | Multiplikation (Multiplikation von zwei Werten)           |
# | /                  | Division (Division von zwei Werten)                       |
# | %                  | Modulo (Rest bei der Division)                            |
# | sqrt(x)            | Quadratwurzel von x                                        |
# | log(x)             | Natürlicher Logarithmus von x                              |
# | exp(x)             | Exponentialfunktion von x                                  |
# | int(x)             | Abrunden von x auf die nächste ganze Zahl                 |
# | int(x)             | Abrunden von x auf die nächste ganze Zahl                 |
# | abs(x)             | Absoluter Wert von x                                       |
# | rand()             | Erzeugt eine Zufallszahl zwischen 0 und 1                 |
# | sin(x)             | Sinus von x (x in Bogenmaß)                               |
# | cos(x)             | Kosinus von x (x in Bogenmaß)                             |
# -----------------------------------------------------------------------------

# 2. Beispiel: Arithmetische Operationen

echo "### Beispiel 1: Arithmetische Operationen ###"
echo -e "Max 25\nEva 30\nJohn 22" | awk '{ sum = $2 + 5; print $1, "plus 5 ergibt:", sum }'
# Ausgabe:
# Max plus 5 ergibt: 30
# Eva plus 5 ergibt: 35
# John plus 5 ergibt: 27

echo "### Beispiel 2: Division und Modulo ###"
echo -e "Max 25\nEva 30\nJohn 22" | awk '{ div = $2 / 5; mod = $2 % 5; print $1, "dividiert durch 5:", div, "Rest:", mod }'
# Ausgabe:
# Max dividiert durch 5: 5 Rest: 0
# Eva dividiert durch 5: 6 Rest: 0
# John dividiert durch 5: 4 Rest: 2

# 3. Beispiel: Aggregierte Berechnungen (Summe, Durchschnitt, etc.)

echo "### Beispiel 3: Aggregierte Berechnungen - Summe und Durchschnitt ###"
echo -e "Max 25\nEva 30\nJohn 22" | awk '{ sum += $2 } END { print "Summe:", sum, "Durchschnitt:", sum/NR }'
# Ausgabe:
# Summe: 77 Durchschnitt: 25.6667

# Berechnung des Mittelwerts und der Summe über Felder
echo "### Beispiel 4: Aggregierte Berechnungen über Felder ###"
echo -e "Max 25 30\nEva 30 40\nJohn 22 33" | awk '{ sum1 += $2; sum2 += $3 } END { print "Summe 1:", sum1, "Summe 2:", sum2, "Durchschnitt 1:", sum1/NR, "Durchschnitt 2:", sum2/NR }'
# Ausgabe:
# Summe 1: 77 Summe 2: 103 Durchschnitt 1: 25.6667 Durchschnitt 2: 34.3333

# 4. Beispiel: Mathematische Funktionen

echo "### Beispiel 5: Nutzung der mathematischen Funktionen sqrt(), log(), exp() ###"
echo -e "Max 25\nEva 30\nJohn 22" | awk '{ root = sqrt($2); log_val = log($2); exp_val = exp($2); print $1, "Quadratwurzel:", root, "Logarithmus:", log_val, "Exponentialwert:", exp_val }'
# Ausgabe:
# Max Quadratwurzel: 5 Logarithmus: 3.21888 Exponentialwert: 720048993.37
# Eva Quadratwurzel: 5.47723 Logarithmus: 3.4012 Exponentialwert: 1068647457.99
# John Quadratwurzel: 4.69042 Logarithmus: 3.09104 Exponentialwert: 268338209.99

# 5. Beispiel: Weitere mathematische Operationen

echo "### Beispiel 6: Abrunden und Absoluter Wert ###"
echo -e "Max -25\nEva 30\nJohn -22" | awk '{ print $1, "abgerundet:", int($2), "absoluter Wert:", abs($2) }'
# Ausgabe:
# Max abgerundet: -25 absoluter Wert: 25
# Eva abgerundet: 30 absoluter Wert: 30
# John abgerundet: -22 absoluter Wert: 22

# 6. Beispiel: Zufallszahlen generieren

echo "### Beispiel 7: Erzeugen von Zufallszahlen ###"
echo "Zufallszahl: " | awk '{ print "Zufallszahl zwischen 0 und 1:", rand() }'
# Ausgabe:
# Zufallszahl zwischen 0 und 1: 0.678910

# Ende des Skripts
echo "Dieses Skript hat die Verwendung von mathematischen Funktionen und Operationen in AWK erklärt, einschließlich arithmetischer Operationen, aggregierter Berechnungen und der Nutzung von mathematischen Funktionen wie sqrt(), log(), exp() und mehr."
