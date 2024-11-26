#!/bin/bash

# Frage nach dem Namen des Skripts
read -p "Gib den Namen des Skripts ein: " script_name

# Frage nach dem Namen des Autors
read -p "Gib deinen Namen als Autor ein: " author_name

# Erhalte das aktuelle Datum
current_date=$(date)

# Initiale Version (startet mit 1.0)
major_version=1
minor_version=0

# Prüfen, ob das Skript bereits existiert
if [ -f "$script_name.sh" ]; then
    # Skript existiert, Version erhöhen
    # Hole die bestehende Versionsnummer aus der Datei
    existing_version=$(grep -oP "(?<=# Version: )\d+\.\d+" "$script_name.sh")

    # Wenn die Versionsnummer vorhanden ist
    if [[ $existing_version =~ ([0-9]+)\.([0-9]+) ]]; then
        major_version=${BASH_REMATCH[1]}  # Major-Version aus der RegEx extrahieren
        minor_version=${BASH_REMATCH[2]}  # Minor-Version aus der RegEx extrahieren

        # Erhöhe die Minor-Version
        minor_version=$((minor_version + 1))

        # Wenn Minor-Version 10 erreicht, gehe zur nächsten Major-Version
        if [ $minor_version -ge 10 ]; then
            major_version=$((major_version + 1))
            minor_version=0
        fi
    fi
fi

# Version zusammenstellen
version="$major_version.$minor_version"

# Erzeuge das Skript mit den Benutzereingaben und füge einen Kommentar hinzu
# `printf` wird verwendet, um formatierte Ausgaben zu erzeugen, da es eine bessere Kontrolle über das Ausgabeformat bietet.
printf "# Skriptname: %s\n# Autor: %s\n# Version: %s\n# Datum: %s\n\n# Das Skript führt folgende Aufgaben aus:\n\n" \
    "$script_name" "$author_name" "$version" "$current_date" > "$script_name.sh"

# Füge die eigentliche Skriptlogik hinzu
printf "echo \"Name des Skriptes: %s\"\n" "$script_name" >> "$script_name.sh"
printf "echo \"Autor des Skriptes: %s\"\n" "$author_name" >> "$script_name.sh"
printf "echo \"Datum der Erzeugung: %s\"\n" "$current_date" >> "$script_name.sh"

# Mache die Datei ausführbar
chmod +x "$script_name.sh"

# Gebe die Informationen aus
printf "Name des Skriptes: %s\n" "$script_name"
printf "Autor des Skriptes: %s\n" "$author_name"
printf "Datum der Erzeugung: %s\n" "$current_date"
printf "Version: %s\n" "$version"

# Führe das erzeugte Skript aus
./"$script_name.sh"

rm "$script_name.sh"
