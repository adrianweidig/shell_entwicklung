#!/bin/sh
# ============================================
# Tutorial: Drag and Drop mit YAD
# ============================================
# Dieses Tutorial zeigt, wie man ein YAD-Fenster erstellt, das Dateien oder Ordner per Drag-and-Drop empfängt.
# Die empfangenen Daten werden in der Konsole ausgegeben und können für weitere Verarbeitung genutzt werden.

# ============================================
# YAD Drag-and-Drop Beispiel
# ============================================
yad --title="Drag and Drop mit YAD" \
    --width=400 \
    --height=200 \
    --dnd \
    --drop-target="all" \
    --text="Ziehen Sie Dateien oder Ordner in dieses Fenster!" \
    --on-top \
    --button="Schließen:1" \
    | while read -r FILE_PATH; do
        # Empfange Daten und verarbeite sie
        if [ -n "$FILE_PATH" ]; then
            echo "Empfangene Datei/Ordner: $FILE_PATH"
        fi
    done

# ============================================
# Erklärung der YAD-Optionen
# ============================================
# --dnd               Aktiviert Drag-and-Drop-Funktionalität im Fenster.#!/bin/bash
# --drop-target=all   Legt fest, dass alle Objekte (Dateien, Ordner etc.) akzeptiert werden.
# --text              Zeigt statischen Text im Fenster an.
# --on-top            Erzwingt, dass das Fenster immer im Vordergrund bleibt.
# --button            Fügt eine Schließen-Schaltfläche hinzu, die das Fenster schließt.
#
# Hinweis:
# Der Dateipfad wird als Ausgabe (via STDOUT) von YAD zurückgegeben. Dies erlaubt die
# direkte Verarbeitung mit Shell-Befehlen.
