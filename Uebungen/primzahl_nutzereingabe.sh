#!/usr/bin/bash
zu_pruefende_zahl=2

abbruch=false

while ! $abbruch; do
    ist_primzahl=1
    for ((linke_grenze = 2; linke_grenze < zu_pruefende_zahl; linke_grenze++)); do
        if [ $((zu_pruefende_zahl % linke_grenze)) -eq 0 ]; then
            ist_primzahl=0
            break
        fi
    done
    if [ $ist_primzahl -eq 1 ]; then
        figlet $zu_pruefende_zahl
        
        read -r -p "Möchtest du weitere Primzahlen eingeben? (nein = abbruch)"
        
        if [ "$REPLY" == "nein" ]; then
            abbruch=true
        fi
    fi
    
    zu_pruefende_zahl=$((zu_pruefende_zahl + 1))
    
    
done

# Vorgehensweise des Skriptes:
# 1. Schleife, die von 2 bis dem ersten Parameter iteriert wird.
#    --> Dies wird gemacht da die kleinste Primzahl bei 2 beginnt
# 2. Innerer Schleife, die von 2 als linke_grenze bis zu_pruefende_zahl iteriert wird.
#    um zu prüfen ob linke_grenze ein Teiler von zu_pruefende_zahl ist.
# 3. Wenn linke_grenze ein Teiler von zu_pruefende_zahl ist, ist es keine Primzahl da ein weiterer Teiler
#    gefunden wurde.
# 4. Wenn keine Teiler gefunden wurden ist zu_pruefende_zahl eine Primzahl