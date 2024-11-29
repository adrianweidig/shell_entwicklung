#!/bin/bash

# Farbdefinitionen
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RESET='\033[0m'  # Reset auf Standardfarbe
FETT='\033[1m'

wuerfeln() {
    echo $((RANDOM % 6 + 1))
}

groesser_kleiner() {
    if [[ $1 -gt $2 ]]; then
        echo "$1 $2"
    else
        echo "$2 $1"
    fi
}

runde() {
    max_wurf=0
    for i in {1..3}; do
        echo -e "\n$YELLOW Wurf #$i...$RESET"
        wurf1=$(wuerfeln)
        wurf2=$(wuerfeln)
        echo -e "$BLUE Geworfene Zahlen: $wurf1 und $wurf2$RESET"
        groesser_kleiner_ergebnis=$(groesser_kleiner $wurf1 $wurf2)
        groesser=$(echo $groesser_kleiner_ergebnis | cut -d' ' -f1)
        kleiner=$(echo $groesser_kleiner_ergebnis | cut -d' ' -f2)
        
        echo -e "$GREEN Zehnerstelle: $groesser, Einerstelle: $kleiner$RESET"
        
        echo -e "$GREEN Wurfwert: $groesser * 10 + $kleiner = $FETT $((groesser * 10 + kleiner))$RESET"
        
        wurf_wert=$((groesser * 10 + kleiner))
        
        if [[ $wurf_wert -gt $max_wurf ]]; then
            max_wurf=$wurf_wert
        fi
    done
    return $max_wurf
}

spiel_starten() {
    echo -e "$BLUE Bitte gib deinen Benutzernamen ein (drücke Enter für '$USER'): $RESET"
    read -r benutzername
    if [[ -z "$benutzername" ]]; then
        benutzername="$USER"
    fi
    
    echo -e "\n$GREEN Hallo, $benutzername! Lass uns das Spiel starten!\n$RESET"
    
    echo -e "$YELLOW Um zu ermitteln, wer beginnt, würfeln beide Spieler einmal... $RESET"
    wurf_spieler=$(wuerfeln)
    wurf_computer=$(wuerfeln)
    echo -e "$BLUE Du hast geworfen: $wurf_spieler$RESET"
    echo -e "$BLUE Der Computer hat geworfen: $wurf_computer$RESET"
    
    if [[ $wurf_spieler -gt $wurf_computer ]]; then
        echo -e "$GREEN Du beginnst das Spiel!$RESET"
        aktueller_spieler="spieler"
        elif [[ $wurf_computer -gt $wurf_spieler ]]; then
        echo -e "$RED Der Computer beginnt das Spiel!$RESET"
        aktueller_spieler="computer"
    else
        echo -e "$YELLOW Unentschieden! Beide haben gleich geworfen. Der Computer beginnt!$RESET"
        aktueller_spieler="computer"
    fi
    
    punkt_spieler=0
    punkt_computer=0
    
    for i in {1..2}; do
        echo -e "\n$YELLOW Runde $i$RESET"
        
        if [[ "$aktueller_spieler" == "spieler" ]]; then
            echo -e "$GREEN Dein Zug! Drücke Leertaste zum Würfeln...$RESET"
            read -r -n 1 -s
            runde
            punkt_spieler=$?
            echo -e "$BLUE Dein Ergebnis: $punkt_spieler$RESET"
            aktueller_spieler="computer"
        else
            echo -e "$RED Computer's Zug!$RESET"
            runde
            punkt_computer=$?
            echo -e "$BLUE Computer Ergebnis: $punkt_computer$RESET"
            aktueller_spieler="spieler"
        fi
    done
    
    echo -e "\n$YELLOW Endstand:$RESET"
    echo -e "$GREEN Dein bestes Ergebnis: $FETT $punkt_spieler$RESET"
    echo -e "$RED Computers bestes Ergebnis: $FETT $punkt_computer$RESET"
    
    # if [[ $punkt_spieler -gt $punkt_computer ]]; then
    #   echo -e "\n$GREEN $FETT Du hast gewonnen! Herzlichen Glückwunsch, $benutzername!$RESET"
    # elif [[ $punkt_spieler -lt $punkt_computer ]]; then
    #   echo -e "\n$RED $FETT Der Computer hat gewonnen! Versuch es beim nächsten Mal!$RESET"
    # else
    #   echo -e "\n$YELLOW $FETT Es ist ein Unentschieden! Gut gespielt!$RESET"
    # fi
    
    if [[ $punkt_spieler -gt $punkt_computer ]]; then
        gewinner_text=$(echo "Du hast gewonnen! Herzlichen Glueckwunsch, $benutzername!" | figlet )
        echo -e "\n$GREEN $FETT$gewinner_text$RESET"
        elif [[ $punkt_spieler -lt $punkt_computer ]]; then
        verlierer_text=$(echo "Der Computer hat gewonnen! Versuch es beim naechsten Mal!" | figlet )
        echo -e "\n$RED $FETT$verlierer_text$RESET"
    else
        unentschieden_text=$(echo "Es ist ein Unentschieden! Gut gespielt!" | figlet )
        echo -e "\n$YELLOW $FETT$unentschieden_text$RESET"
    fi
    
}

spiel_starten
