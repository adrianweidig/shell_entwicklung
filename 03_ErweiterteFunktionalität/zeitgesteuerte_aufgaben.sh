#!/bin/sh
# ===============================================
# Tutorial: Zeitgesteuerte Aufgaben mit cron und at
# ===============================================
# Achtung: Dieses Skript benötigt sudo- oder Root-Rechte.
# ===============================================
# Hinweise:
# - Alle Warteprozeduren dauern maximal 5 Sekunden.
# - Vor jeder Wartezeit erfolgt ein Hinweis in ROT.
# ===============================================

# Farbcodes
RED="\033[1;31m"
RESET="\033[0m"

# Einführung
printf "${RED}Achtung: Dieses Skript benötigt sudo- oder Root-Rechte!${RESET}\n"

# 1. Arbeiten mit `cron`
echo "### Arbeiten mit cron ###"

# crontab - Parameterübersicht
# | Option      | Beschreibung                                              |
# |-------------|----------------------------------------------------------|
# | -e          | Öffnet den Crontab-Editor für den aktuellen Benutzer.     |
# | -l          | Zeigt die Crontab-Einträge des aktuellen Benutzers an.    |
# | -r          | Entfernt alle Crontab-Einträge des aktuellen Benutzers.   |
# | -u BENUTZER | Führt Crontab-Befehle für den angegebenen Benutzer aus.   |

echo "Erstellen eines einfachen cron-Jobs..."
printf "${RED}ACHTUNG SIE MÜSSEN JETZT 5 SEKUNDEN WARTEN${RESET}\n"
sleep 5

# Temporäre Crontab-Datei erstellen
crontab_file="$(mktemp)"
echo "* * * * * echo 'Cron-Job läuft!' >> /tmp/cron_test.log" > "$crontab_file"
crontab "$crontab_file"
rm -f "$crontab_file"

echo "Ein cron-Job wurde erstellt, der jede Minute ausgeführt wird."

# Zeigen der aktuellen Crontab
echo "Aktuelle Crontab-Einträge:"
crontab -l

# Löschen der Crontab-Einträge
echo "Löschen der Crontab-Einträge..."
crontab -r
echo "Alle Crontab-Einträge wurden gelöscht."

# 2. Arbeiten mit `at`
echo "### Arbeiten mit at ###"

# at - Parameterübersicht
# | Option      | Beschreibung                                       |
# |-------------|---------------------------------------------------|
# | -f DATEI    | Liest Befehle aus einer Datei.                    |
# | -l          | Zeigt alle geplanten Aufgaben des Benutzers an.   |
# | -d oder -r  | Löscht geplante Aufgaben nach Jobnummer.          |

echo "Planen einer Aufgabe mit at..."
printf "${RED}ACHTUNG SIE MÜSSEN JETZT 5 SEKUNDEN WARTEN${RESET}\n"
sleep 5

echo "echo 'Aufgabe ausgeführt' >> /tmp/at_test.log" | at now + 1 minute
echo "Aufgabe wurde geplant. Sie wird in 1 Minute ausgeführt."

# Zeigen geplanter Aufgaben
echo "Geplante Aufgaben mit at:"
at -l

# Löschen einer geplanten Aufgabe
echo "Löschen geplanter Aufgaben..."
at -r "$(at -l | awk '{print $1}')"
echo "Alle geplanten Aufgaben wurden gelöscht."

# 3. Aufräumen
echo "### Aufräumen ###"
rm -f /tmp/cron_test.log /tmp/at_test.log
echo "Temporäre Dateien wurden gelöscht."

# Ende
echo "Dieses Skript hat cron und at demonstriert."
exit 0
