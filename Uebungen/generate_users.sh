#!/bin/bash

# Ein yad Beispiel mit Buttons welche eigene onclick funktionen haben

yad --title="Drag and Drop mit YAD" \
--width=400 \
--height=200 \
--dnd \
--drop-target="file" \
--text="Ziehen Sie Dateien oder Ordner in dieses Fenster!" \
--on-top \
--button="Schließen:1" \
--button="Info:2" \
| while read -r FILE_PATH; do
    # Entferne file://, falls vorhanden
    FILE_PATH=$(echo "$FILE_PATH" | sed 's|file://||')
    
    start_uid=5000
    
    initial_password=$(openssl passwd -1 "P@ssw0rd")
    
    # Empfange Daten und verarbeite sie
    if [ -n "$FILE_PATH" ]; then
        # Gibt jede Zeile der Datei aus
        while read -r line; do
            # Erzeugt den Nutzer anhand der nächsten Zeile in der Datei
            # mit -m Homelaufwerk
            # mit -u UID
            # mit -s Shell
            echo "useradd -m -u "$start_uid" -s /usr/bin/bash -p "$initial_password" "$line""
            
            # Passwort muss beim nächsten Anmelden geändert werden
            echo "passwd -e "$line""
            
            # Alternativ kann einfach die /home/skel/.bashrc angepasst werden da diese dann direkt
            # bei dem neuen Nutzer erstellt wird
            
            # Kopiert vom Nutzer kit die .bashrc in das Homeverzeichnis des neuen Nutzers
            # echo "cp /home/kit/.bashrc /home/"$line"/.bashrc"
            
            # Ändert die Besitzrechte der .bashrc auf die des neuen Nutzers
            #echo "chown "$line":"$line" /home/"$line"/.bashrc"
            
            start_uid=$((start_uid + 1))
            
            # -------------------------------
            # *** ÜBERSICHT DER ÄNDERUNGEN ***
            # -------------------------------
            
            echo -e "\n\033[1;33m#-----------------------------------#\033[0m"
            echo -e "\033[1;33m#         Änderungen für $line        #\033[0m"
            echo -e "\033[1;33m#-----------------------------------#\033[0m"
            
            echo -e "\033[1;32m1. Nutzer erstellt:\033[0m"
            echo -e "  - $line mit UID: $start_uid"
            echo -e "  - Homelaufwerk mit -m"
            echo -e "  - Shell: /usr/bin/bash"
            echo -e "  - Passwort: '$initial_password'"
            
            echo -e "\033[1;34m2. Passwortänderung erforderlich:\033[0m"
            echo -e "  - $line muss beim nächsten Anmelden das Passwort ändern."
            
            echo -e "\033[1;36m3. Optional: .bashrc Anpassung:\033[0m"
            echo -e "  - Falls aktiviert, wird /home/kit/.bashrc nach /home/$line kopiert."
            
            echo -e "\033[1;35m4. Besitzrechte der .bashrc geändert:\033[0m"
            echo -e "  - Der Eigentümer von /home/$line/.bashrc wurde auf $line gesetzt."
            
            echo -e "\033[1;37m5. UID für den nächsten Nutzer erhöht:\033[0m"
            echo -e "  - start_uid=$((start_uid + 1))"
            echo -e "\033[1;33m#-----------------------------------#\033[0m"
            
        done < "$FILE_PATH"
    fi
done
