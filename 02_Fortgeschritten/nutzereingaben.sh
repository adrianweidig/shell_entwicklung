#!/bin/sh
# Dieses Skript erklärt die Verwendung von Nutzereingaben in Shell-Skripten.
# Es deckt einfache und fortgeschrittene Methoden der Eingabe und Verarbeitung ab.

# 1. Einführung in Nutzereingaben
# In Shell-Skripten können Nutzereingaben auf verschiedene Arten erfolgen. 
# Wir werden uns sowohl mit einfachen Methoden wie 'read' als auch mit fortgeschrittenen Methoden wie benutzerdefinierten Eingabeaufforderungen und der Verarbeitung von Eingaben mit Spezialparametern beschäftigen.

# 2. Einfache Eingabe mit 'read'
echo "### Beispiel 1: Einfache Eingabe mit 'read' ###"
echo "Gib deinen Namen ein:"
read benutzername
echo "Hallo, $benutzername! Willkommen zum fortgeschrittenen Tutorial."

# Beispiel: Eingabe eines Alters und Überprüfung
echo "### Beispiel 2: Altersabfrage ###"
echo "Bitte gib dein Alter ein:"
read alter

# Überprüfen, ob das Alter eine Zahl ist
if ! [[ "$alter" =~ ^[0-9]+$ ]]; then
  echo "Fehler: Bitte gib eine gültige Zahl für dein Alter ein."
else
  echo "Dein Alter ist: $alter"
fi

# 3. Eingabe mit einer benutzerdefinierten Eingabeaufforderung
echo "### Beispiel 3: Eingabe mit einer benutzerdefinierten Eingabeaufforderung ###"
# Benutzerdefinierte Eingabeaufforderung für den Dateinamen
echo "Bitte gib den Namen einer Datei ein, die du überprüfen möchtest:"
read -p "Dateiname: " dateiname
if [ -e "$dateiname" ]; then
  echo "Die Datei $dateiname existiert."
else
  echo "Die Datei $dateiname existiert nicht."
fi

# 4. Überprüfung der Eingabe mit einer Schleife und Auswahlmöglichkeiten
echo "### Beispiel 4: Eingabe mit Auswahlmöglichkeiten ###"
# Auswahl von Optionen durch den Benutzer mit Schleifen
echo "Wähle eine der folgenden Optionen:"
echo "1) Datei prüfen"
echo "2) Alter überprüfen"
echo "3) Skript beenden"
echo -n "Bitte gib die Nummer deiner Wahl ein: "
read wahl

case $wahl in
  1)
    echo "Bitte gib den Dateinamen ein, den du prüfen möchtest:"
    read dateiname
    if [ -e "$dateiname" ]; then
      echo "Die Datei $dateiname existiert."
    else
      echo "Die Datei $dateiname existiert nicht."
    fi
    ;;
  2)
    echo "Bitte gib dein Alter ein:"
    read alter
    echo "Dein Alter ist $alter Jahre."
    ;;
  3)
    echo "Das Skript wird beendet."
    exit 0
    ;;
  *)
    echo "Ungültige Auswahl. Bitte wähle eine gültige Option."
    ;;
esac

# 5. Eingabe mit Zeitlimit (timeout)
echo "### Beispiel 5: Eingabe mit Timeout ###"
echo "Du hast 10 Sekunden, um deinen Namen einzugeben."

# Zeitlimit für die Eingabe
if read -t 10 -p "Dein Name: " name; then
  echo "Hallo, $name!"
else
  echo "Zeit abgelaufen. Du hast zu lange gebraucht, um deinen Namen einzugeben."
fi

# 6. Bestätigung der Eingabe (ja/nein)
echo "### Beispiel 6: Bestätigung der Eingabe (Ja/Nein) ###"
# Bestätigung durch den Benutzer
echo "Möchtest du fortfahren? (y/n)"
read -n 1 -s antwort  # -n 1 liest nur ein Zeichen, -s unterdrückt die Anzeige der Eingabe

if [ "$antwort" = "y" ]; then
  echo "Du hast 'Ja' gewählt. Das Skript wird fortgesetzt."
else
  echo "Du hast 'Nein' gewählt. Das Skript wird beendet."
  exit 0
fi

# 7. Eingabe mit mehreren Feldern
echo "### Beispiel 7: Eingabe mit mehreren Feldern ###"
# Mehrere Eingabefelder (z.B. Benutzername und Passwort)
echo "Bitte gib deinen Benutzernamen und Passwort ein:"
read -p "Benutzername: " benutzername
read -sp "Passwort: " passwort
echo
echo "Benutzername: $benutzername"
echo "Passwort: (versteckt)"

# Beispiel: Überprüfung, ob die Eingaben übereinstimmen
echo "Bitte gib dein Passwort erneut ein:"
read -sp "Passwort bestätigen: " passwort2
echo
if [ "$passwort" = "$passwort2" ]; then
  echo "Die Passwörter stimmen überein."
else
  echo "Die Passwörter stimmen nicht überein. Bitte versuche es erneut."
fi

# 8. Verwendung von Eingabe als Variablen
echo "### Beispiel 8: Eingabe als Variablen ###"
# Eingabe einer Variablen, die im Skript verwendet wird
echo "Bitte gib eine Zahl ein, die zum Berechnen des Quadrats verwendet wird:"
read zahl
quadratisch=$(( zahl * zahl ))
echo "Das Quadrat der Zahl $zahl ist: $quadratisch"

# 9. Umgang mit mehreren Eingaben
echo "### Beispiel 9: Mehrere Eingaben gleichzeitig ###"
# Eingabe von mehreren Parametern und deren Verarbeitung
echo "Bitte gib deinen Vornamen und Nachnamen ein (getrennt durch Leerzeichen):"
read vorname nachname
echo "Dein Vorname ist: $vorname"
echo "Dein Nachname ist: $nachname"

# Beispiel: Verwendung von $IFS (Internal Field Separator) zum Trennen der Eingaben
echo "Bitte gib mehrere Werte ein, die durch Kommas getrennt sind:"
IFS=, read -p "Werte: " wert1 wert2 wert3
echo "Erster Wert: $wert1"
echo "Zweiter Wert: $wert2"
echo "Dritter Wert: $wert3"

# 10. Verarbeitung von Eingaben mit Regex (Regulären Ausdrücken)
echo "### Beispiel 10: Verarbeitung mit regulären Ausdrücken ###"
# Überprüfen, ob die Eingabe eine gültige E-Mail-Adresse ist
echo "Bitte gib deine E-Mail-Adresse ein:"
read email
if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Die E-Mail-Adresse '$email' ist gültig."
else
  echo "Die E-Mail-Adresse '$email' ist ungültig."
fi

# 11. Verwendung von Eingabe in einer Schleife
echo "### Beispiel 11: Eingabe in einer Schleife ###"
# Wiederholt die Eingabe, bis eine gültige Eingabe gemacht wird
while true; do
  echo "Gib eine Zahl zwischen 1 und 10 ein:"
  read zahl
  if [ "$zahl" -ge 1 ] && [ "$zahl" -le 10 ]; then
    echo "Die Zahl $zahl ist gültig."
    break
  else
    echo "Ungültige Eingabe. Bitte versuche es erneut."
  fi
done

# Ende des Skripts
# Dieses Skript hat gezeigt, wie Nutzereingaben in Shell-Skripten verarbeitet und genutzt werden können, mit verschiedenen fortgeschrittenen Techniken und Validierungen.

exit 0
