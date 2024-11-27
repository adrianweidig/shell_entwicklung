#!/bin/sh

echo "-------------------- Mit printf ------------------"

for zeile in {1..10}; do
    for spalte in {1..10}; do
       # Diese Möglichkeit ist grundsätzlich richtig nutzt jedoch nicht die volle Kapazität von printf
       # printf "$((zeile * spalte)) \t"

       # %4d sorgt dafür, dass mindestens 4 Zeichen genutzt werden als Platz was dafür sorgt, dass für Zahlen
       # bis zu 4 Stellen reserviert werden und die Zahlen damit rechtsbündig sind. 
       printf "%4d \t" "$((zeile * spalte))"
    done
    printf "\n"
done

echo "---------------------- Mit echo ------------------"

# Maximale Breite berechnen (für 10x10 Tabelle ist die maximale Zahl 100 also wären 3 ausreichend)
max_width=4

for zeile in {1..10}; do
    row=""
    for spalte in {1..10}; do
        result=$((zeile * spalte))
        # Länge des Ergebnisses ermitteln
        length=${#result}
        # Füge führende Leerzeichen hinzu, um rechtsbündig zu formatieren
        spaces=$((max_width - length))
        while [ "$spaces" -gt 0 ]; do
            row="$row "
            spaces=$((spaces - 1))
        done
        row="$row$result"
    done
    echo "$row"
done

