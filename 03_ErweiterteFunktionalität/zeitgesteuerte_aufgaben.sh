#!/bin/sh
# ============================================
# Tutorial: Aufgabenplanung mit cron und at
# ============================================
# Hinweis: Dieses Skript benötigt **sudo** oder **Root-Rechte** für die korrekte Ausführung.
# Bitte führen Sie das Skript als Root oder mit `sudo` aus, da einige Befehle (z. B. `crontab`, `at`) Administratorrechte erfordern.
# ============================================

# Farbcodes
RED="\033[1;31m"
RESET="\033[0m"

# Hinweis zur Wartezeit
echo "${RED}Achtung: Dieses Skript benötigt Root- oder sudo-Rechte!${RESET}"
echo "${RED}ACHTUNG SIE MÜSSEN JETZT BIS ZU 5 SEKUNDEN WARTEN WÄHREND DIE AUFGABEN AUSGEFÜHRT WERDEN.${RESET}"

# Temporäre Verzeichnisse und Dateien erstellen
TEMP_CRON_FILE="./temp_entwicklung/temp_crontab"
TEMP_AT_SCRIPT="./temp_entwicklung/temp_at_script.sh"
OUTPUT_DIR="./temp_entwicklung"

# Verzeichnis prüfen und erstellen
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Das Verzeichnis $OUTPUT_DIR wird erstellt."
    mkdir -p "$OUTPUT_DIR"
fi

# Überprüfen, ob 'at' installiert ist
if ! command -v at &> /dev/null; then
    echo "${RED}Der Befehl 'at' ist nicht installiert.${RESET}"
    echo "Möchten Sie 'at' installieren? (y/n)"
    read -r INSTALL_AT
    if [ "$INSTALL_AT" = "y" ]; then
        echo "Installiere 'at'..."
        sudo apt-get install -y at  # Beispiel für Debian/Ubuntu, ggf. anpassen für andere Distributionen
    else
        echo "${RED}Das Skript benötigt 'at'. Das Tutorial kann nicht fortgesetzt werden.${RESET}"
        exit 1
    fi
fi

# Temporäre `at`-Datei erstellen
echo "echo 'Dies ist eine geplante Aufgabe via at!' > $OUTPUT_DIR/at_output.txt" > "$TEMP_AT_SCRIPT"
chmod +x "$TEMP_AT_SCRIPT"

# ===============================
# 1. Verwendung von `cron`
# ===============================
echo "### Demonstration: cron ###"
echo "Eine temporäre crontab wird erstellt."

# Temporäre Crontab-Datei erstellen
echo "*/1 * * * * echo 'Dies ist eine geplante Aufgabe via cron!' > $OUTPUT_DIR/cron_output.txt" > "$TEMP_CRON_FILE"

# Anzeigen der geplanten Crontab-Aufgabe
echo "Die folgende Crontab wird hinzugefügt:"
cat "$TEMP_CRON_FILE"

# Aktivieren der Crontab
crontab "$TEMP_CRON_FILE"

# Warten, bis die cron-Aufgabe ausgeführt wurde (Demonstration)
echo "${RED}ACHTUNG SIE MÜSSEN JETZT 5 SEKUNDEN WARTEN WÄHREND DIE CRON-AUFGABE AUSGEFÜHRT WIRD.${RESET}"
sleep 5

# Überprüfen des Outputs
echo "Inhalt der Datei '$OUTPUT_DIR/cron_output.txt' (falls erstellt):"
[ -f "$OUTPUT_DIR/cron_output.txt" ] && cat "$OUTPUT_DIR/cron_output.txt" || echo "Die Datei wurde nicht erstellt."

# ===============================
# 2. Verwendung von `at`
# ===============================
echo "### Demonstration: at ###"
echo "Eine einmalige Aufgabe wird für eine Minute in der Zukunft geplant."

# Planen einer Aufgabe mit `at` (1 Minute in die Zukunft)
echo "bash $TEMP_AT_SCRIPT" | at now + 1 minute

# Anzeigen der geplanten at-Aufgaben
echo "Geplante at-Aufgaben:"
atq

# Warten, bis die Aufgabe ausgeführt wurde (Demonstration)
echo "${RED}ACHTUNG SIE MÜSSEN JETZT 5 SEKUNDEN WARTEN WÄHREND DIE AT-AUFGABE AUSGEFÜHRT WIRD.${RESET}"
sleep 5

# Überprüfen des Outputs
echo "Inhalt der Datei '$OUTPUT_DIR/at_output.txt' (falls erstellt):"
[ -f "$OUTPUT_DIR/at_output.txt" ] && cat "$OUTPUT_DIR/at_output.txt" || echo "Die Datei wurde nicht erstellt."

# ===============================
# Aufräumen: Beenden und Löschen
# ===============================
echo "Aufräumen: Temporäre Dateien und geplante Aufgaben werden gelöscht."

# Löschen aller temporären Dateien
rm -f "$TEMP_CRON_FILE" "$TEMP_AT_SCRIPT"
rm -f "$OUTPUT_DIR/cron_output.txt" "$OUTPUT_DIR/at_output.txt"

# Verzeichnis löschen
rm -rf "$OUTPUT_DIR"

# Alle crontab-Einträge des Benutzers löschen
crontab -r

# Alle geplanten at-Aufgaben löschen
for job in $(atq | awk '{print $1}'); do
    atrm "$job"
done

echo "Aufräumen abgeschlossen. Das Tutorial ist beendet."

# Ende des Skripts
exit 0
