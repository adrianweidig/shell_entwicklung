#!/usr/bin/bash

# Zum Debuggen falls nix übergeben wurde
if [ $# -eq 0 ]; then
    set -- 10
fi


for ((i = 2; i <= $1; i++)); do
    is_prime=1
    for ((j = 2; j < $i; j++)); do
        if [ $((i % j)) -eq 0 ]; then
            is_prime=0
            break
        fi
    done
    if [ $is_prime -eq 1 ]; then
        echo $i
    fi
done    

# Vorgehensweise des Skriptes:
# 1. Schleife, die von 2 bis dem ersten Parameter iteriert wird.
#    --> Dies wird gemacht da die kleinste Primzahl bei 2 beginnt
# 2. Innerer Schleife, die von 2 bis dem aktuellen Wert (j) iteriert wird.
#    um zu prüfen ob j ein Teiler von i ist.
# 3. Wenn j ein Teiler von i ist, ist es keine Primzahl da ein weiterer Teiler
#    gefunden wurde.    
# 4. Wenn keine Teiler gefunden wurden ist i eine Primzahl