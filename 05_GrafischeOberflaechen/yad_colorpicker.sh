#!/bin/sh
# ============================================
# Tutorial: Farbwahl und Textfärbung mit YAD
# ============================================
# Der Benutzer kann eine Farbe auswählen, und im zweiten Fenster wird der
# Hexwert der Farbe als Text angezeigt und der Text selbst in der gewählten
# Farbe dargestellt.

# ============================================
# Funktion: Farbwahl Fenster
# ============================================
choose_color() {
    COLOR=$(yad --title="Farbauswahl" --color --width=400 --height=200 --button="OK:0" --button="Abbrechen:1")
    
    if [ $? -eq 0 ]; then
        # Wenn OK geklickt wurde, wird die Farbe an das nächste Fenster übergeben
        display_color_text "$COLOR"
    else
        # Wenn Abbrechen geklickt wurde, wird das Skript beendet
        echo "Farbauswahl abgebrochen. Beende das Skript."
        exit 0
    fi
}

# ============================================
# Funktion: Fenster mit Text in gewählter Farbe
# ============================================
display_color_text() {
    TEXT_COLOR="$1"
    
    # Sicherstellen, dass die Farbe korrekt übergeben wird
    if [[ "$TEXT_COLOR" =~ ^#[0-9A-Fa-f]{6}$ || "$TEXT_COLOR" =~ ^#[0-9A-Fa-f]{8}$ ]]; then
        # Der HEX-Farbwert wird als Text angezeigt
        COLOR_TEXT="Der Hex-Wert der gewählten Farbe ist: $TEXT_COLOR"
        echo "Textfarbe: $TEXT_COLOR"
    else
        # Fallback, falls der Farbwert ungültig ist
        TEXT_COLOR="#000000"
        COLOR_TEXT="Ungültige Farbe, Standardfarbe #000000 verwendet."
        echo "Ungültige Farbe, Standardfarbe #000000 verwendet."
    fi
    
    # Öffnen des Fensters mit dem Text in der gewählten Farbe
    RESULT=$(yad --title="Fenster mit gewählter Textfarbe" --width=400 --height=200 \
                 --text="<span color=\"$TEXT_COLOR\">$COLOR_TEXT</span>" \
                 --button="Neu einfärben:0" \
                 --button="Schließen:1")
    
    # Wenn „Neu einfärben“ gedrückt wurde, rufen wir den Farbwähler erneut auf
    if [ $? -eq 0 ]; then
        choose_color
    else
        # Wenn „Schließen“ gedrückt wurde, beenden wir das Skript
        echo "Fenster geschlossen."
        exit 0
    fi
}

# ============================================
# Hauptaufruf: Starten mit dem Farbwähler
# ============================================
choose_color
