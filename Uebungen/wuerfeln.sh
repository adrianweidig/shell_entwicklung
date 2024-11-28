#!/bin/bash

# Hängt an yad alle Buttons als Bilder an
#    $(for f in /home/kit/Dokumente/shell_entwicklung/Uebungen/images/*.png; do
#            echo --button=''!$f'!eval 'echo test'';
#    done)

beenden=false

# Erstelle ein YAD-Formular mit einem Button, der ein Bild enthält
while ! $beenden; do
    yad \
    --title="Würfelspiel" \
    --columns=2 \
    --image='/home/kit/Dokumente/shell_entwicklung/Uebungen/images/wuerfel_1.png' \
    --text="<b>Textfeld 1: [Hier Text eingeben]</b><img src='/home/kit/Dokumente/shell_entwicklung/Uebungen/images/wuerfel_2.png></img>" \
    --button="Würfeln:0" \
    --geometry=600x300
    
    
    
    #echo "$?"
    
    # Empfängt den Rückgabewert 252 wenn man auf den Schließen-Button des Fensters klickt
    if [ $? -eq 252 ]; then
        beenden=true
    fi
done