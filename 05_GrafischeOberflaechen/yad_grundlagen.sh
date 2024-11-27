#!/bin/sh
# ============================================
# Tutorial: Grafische Oberflächen mit YAD
# ============================================
# Einführung in YAD und Grundlagen der grafischen Oberfläche
# ============================================
# Was ist YAD?
# YAD (Yet Another Dialog) ist ein Tool zur Erstellung grafischer Benutzeroberflächen (GUIs) für Shell-Skripte.
# Es ermöglicht das Erstellen von Dialogfenstern, Formularen, Fortschrittsbalken, Listen und vielem mehr.
# 
# Installation von YAD:
# - Unter Debian/Ubuntu: `sudo apt install yad`
# - Unter Red Hat/CentOS: `sudo dnf install yad`
#
# YAD wird verwendet, um Dialoge zu erstellen, die die Benutzerinteraktion in Skripten erleichtern.
#
# ===============================
# Erste Schritte: Einfache Dialoge erstellen
# ===============================
echo "Beispiel 1: Einfache Messagebox"
# Erstelle eine einfache Informationsbox
yad --title "Info-Dialog" --text "Dies ist eine einfache Informationsbox." --button "OK":0

# ===============================
# Einführung in die wichtigsten Parameter von YAD
# ===============================
# Wichtige Optionen und Parameter in YAD:
# | Parameter        | Beschreibung                                                             |
# |------------------|---------------------------------------------------------------------------|
# | --title          | Setzt den Titel des Dialogfensters.                                       |
# | --text           | Zeigt eine Nachricht im Dialogfenster an.                                 |
# | --width          | Setzt die Breite des Fensters.                                            |
# | --height         | Setzt die Höhe des Fensters.                                              |
# | --button         | Fügt einen Button zum Dialog hinzu (z.B. "OK", "Abbrechen").              |
# | --center         | Zentriert das Fenster auf dem Bildschirm.                                 |
# | --icon           | Setzt ein Icon im Dialogfenster.                                          |
# | --no-buttons     | Verhindert, dass Schaltflächen angezeigt werden.                          |
# ===============================

# ===============================
# Beispiel 2: Einfache Warnung
# ===============================
echo "Beispiel 2: Einfache Warnung"
# Erstelle eine einfache Warnung mit einem Titel und Text
yad --title "Warnung" --text "Achtung! Dies ist eine Warnung." --button "OK":0 --width 300 --height 150

# ===============================
# Beispiel 3: Einfacher Informationsdialog
# ===============================
echo "Beispiel 3: Einfacher Informationsdialog"
# Zeigt eine Informationsbox mit benutzerdefinierten Fenstergröße und Text
yad --title "Info" --text "Dies ist eine benutzerdefinierte Informationsbox" --width 350 --height 200 --button "Schließen":0

# ===============================
# Verwendung von YAD in Bash-Skripten
# ===============================
# YAD kann in Bash-Skripten verwendet werden, um die Benutzererfahrung zu verbessern.
# Beispiel 4: Benutzerabfrage
echo "Beispiel 4: Benutzerabfrage"
# Fordert den Benutzer auf, mit einem Ja/Nein-Dialog zu antworten
response=$(yad --title "Benutzerabfrage" --text "Möchten Sie fortfahren?" --button="Ja":0 --button="Nein":1 --width 300 --height 150)
if [ "$response" -eq 0 ]; then
    echo "Benutzer hat 'Ja' gewählt."
else
    echo "Benutzer hat 'Nein' gewählt."
fi

# ===============================
# Beispiel 5: Erstellen eines Dialogs mit Titel und benutzerdefiniertem Text
# ===============================
echo "Beispiel 5: Titel und Text anpassen"
# Hier wird der Titel und der Text des Dialogfensters individuell festgelegt
yad --title "Benutzerdefinierte Nachricht" --text "Hier ist eine angepasste Nachricht im Dialogfenster." --width 400 --height 200 --button "OK":0

# ===============================
# Beispiel 6: Anwendung von Symbolen in YAD
# ===============================
echo "Beispiel 6: Anwendung von Symbolen"
# Ein Dialogfenster mit einem benutzerdefinierten Symbol
yad --title "Fehler" --text "Es ist ein Fehler aufgetreten!" --icon="error" --button="OK":0 --width 300 --height 150

# ===============================
# Aufräumen und Abschluss
# ===============================
echo "Aufräumen: Keine temporären Dateien zum Löschen."
echo "Das Tutorial über grafische Oberflächen mit YAD in Shell-Skripten ist beendet."
