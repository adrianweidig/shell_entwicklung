#!/bin/sh
# ============================================
# Tutorial: Grafische Oberflächen mit YAD
# ============================================
# In diesem Tutorial zeigen wir, wie man mit YAD verschiedene Steuerelemente in einem einzigen Fenster nutzt.
# Der Benutzer kann Eingabefelder ausfüllen, und die Eingabewerte werden in der Konsole angezeigt.
# Das Fenster kann über das 'X' geschlossen werden, und es gibt einen Button 'Ausgabe', der die Eingabewerte anzeigt.

# ============================================
# YAD Fenster mit allen Steuerelementen
# ============================================
OUTPUT=$(yad --form --title="YAD Steuerelemente Beispiel" \
             --item-separator=, \
             --separator="|" \
             --field="Nur lesbares Feld:RO" Text \
             --field="Auswahl einer Zahl:NUM" \
             --field="Ich bin eine Checkbox:CHK" \
             --field="Editierbares Feld:CBE" Text \
             --field="Passwort:H" Password \
             --field="Dateiauswahl:FL" \
             --field="Hier kannst du eine Datei erstellen:SFL" \
             --field="Verzeichnisauswahl:DIR" \
             --field="Hier kannst du ein Verzeichnis erstellen:CDIR" \
             --field="Schriftartauswahl:FN" \
             --field="Hier kannst du mehrere Dateien wählen:MFL" \
             --field="Wähle ein Datum:DT" \
             --field="Wähle eine Farbe:CLR" \
             --field="Ich bin eine Überschrift:LBL" \
             --field="Texteingabe:TEXT" \
             --button="Ausgabe" \
             --width=600 --height=500)

# Überprüfen, ob das Fenster durch das 'X' geschlossen wurde
if [ $? -eq 1 ]; then
    echo "Das Fenster wurde geschlossen. Beende das Skript."
    exit 0
fi

# Eingabewerte extrahieren, mit default-Werten für leere Felder
IFS='|' read -r READONLY NUM CHECKBOX CBE PASSWORD FILE FILE_CREATE DIR DIR_CREATE FONT MULTIFILES DATE COLOR LABEL TEXT <<< "$OUTPUT"

# Sicherstellen, dass leere Felder mit Standardwerten versehen werden
READONLY=${READONLY:-"Kein Wert eingegeben"}
NUM=${NUM:-"Kein Wert eingegeben"}
CHECKBOX=${CHECKBOX:-"Nicht ausgewählt"}
CBE=${CBE:-"Kein Wert eingegeben"}
PASSWORD=${PASSWORD:-"Kein Passwort eingegeben"}
FILE=${FILE:-"Keine Datei ausgewählt"}
FILE_CREATE=${FILE_CREATE:-"Keine Datei erstellt"}
DIR=${DIR:-"Kein Verzeichnis ausgewählt"}
DIR_CREATE=${DIR_CREATE:-"Kein Verzeichnis erstellt"}
FONT=${FONT:-"Keine Schriftart gewählt"}
MULTIFILES=${MULTIFILES:-"Keine Dateien ausgewählt"}
DATE=${DATE:-"Kein Datum ausgewählt"}
COLOR=${COLOR:-"Keine Farbe gewählt"}
LABEL=${LABEL:-"Keine Überschrift"}
TEXT=${TEXT:-"Kein Text eingegeben"}

# ============================================
# Ausgabe der Benutzereingaben
# ============================================
echo "=============================================="
echo "DEBUG: Ausgewählte Eingabefelder"
echo "=============================================="
echo "1. Nur lesbares Feld (RO): $READONLY"
echo "2. Auswahl einer Zahl (NUM): $NUM"
echo "3. Checkbox (CHK): $CHECKBOX"
echo "4. Editierbares Feld (CBE): $CBE"
echo "5. Passwort (H): $PASSWORD"
echo "6. Dateiauswahl (FL): $FILE"
echo "7. Dateierstellung (SFL): $FILE_CREATE"
echo "8. Verzeichnisauswahl (DIR): $DIR"
echo "9. Verzeichniserstellung (CDIR): $DIR_CREATE"
echo "10. Schriftartauswahl (FN): $FONT"
echo "11. Mehrere Dateien (MFL): $MULTIFILES"
echo "12. Datumsauswahl (DT): $DATE"
echo "13. Farbwahl (CLR): $COLOR"
echo "14. Überschrift (LBL): $LABEL"
echo "15. Texteingabe (TEXT): $TEXT"
echo "=============================================="
