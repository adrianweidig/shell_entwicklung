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
        --button='!/home/kit/Dokumente/shell_entwicklung/Uebungen/images/wuerfel_1.png'\
        --button='!/home/kit/Dokumente/shell_entwicklung/Uebungen/images/wuerfel_1.png';\


    echo "$?"
    
    # Empfängt den Rückgabewert 252 wenn man auf den Schließen-Button des Fensters klickt
    if [ $? -eq 252 ]; then
        beenden=true
    fi
done