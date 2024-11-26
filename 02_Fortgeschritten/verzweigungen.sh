#!/bin/sh
# Dieses Skript erklärt die Verwendung von Verzweigungen (if, elif, else) in der Shell.

# 1. Beispiel für eine einfache if-Verzweigung
echo "### Beispiel 1: Einfache if-Verzweigung ###"
echo "Überprüfen, ob eine Zahl größer als 10 ist."

zahl=15

if [ "$zahl" -gt 10 ]; then
  echo "Die Zahl $zahl ist größer als 10."
fi

# 2. Beispiel für if-else-Verzweigung
echo "### Beispiel 2: if-else-Verzweigung ###"
echo "Überprüfen, ob eine Zahl gerade oder ungerade ist."

zahl=8

if [ $((zahl % 2)) -eq 0 ]; then
  echo "Die Zahl $zahl ist gerade."
else
  echo "Die Zahl $zahl ist ungerade."
fi

# 3. Beispiel für if-elif-else-Verzweigung
echo "### Beispiel 3: if-elif-else-Verzweigung ###"
echo "Überprüfen der Bewertung basierend auf der Punktzahl."

punktzahl=85

if [ "$punktzahl" -ge 90 ]; then
  echo "Sehr gut"
elif [ "$punktzahl" -ge 75 ]; then
  echo "Gut"
elif [ "$punktzahl" -ge 50 ]; then
  echo "Befriedigend"
else
  echo "Nicht bestanden"
fi

# 4. Beispiel für verschachtelte if-Verzweigungen
echo "### Beispiel 4: Verschachtelte if-Verzweigungen ###"
echo "Überprüfen der Alterskategorie."

alter=25

if [ "$alter" -ge 18 ]; then
  if [ "$alter" -ge 65 ]; then
    echo "Senior"
  else
    echo "Erwachsen"
  fi
else
  echo "Minderjährig"
fi

# 5. Beispiel für die Verwendung von logischen Operatoren in if-Bedingungen
echo "### Beispiel 5: Logische Operatoren in Bedingungen ###"
echo "Überprüfen, ob eine Zahl zwischen 10 und 20 liegt."

zahl=15

if [ "$zahl" -ge 10 ] && [ "$zahl" -le 20 ]; then
  echo "Die Zahl $zahl liegt zwischen 10 und 20."
else
  echo "Die Zahl $zahl liegt nicht zwischen 10 und 20."
fi

# 6. Beispiel für die Verwendung von OR-Bedingungen
echo "### Beispiel 6: OR-Bedingungen in if-Verzweigungen ###"
echo "Überprüfen, ob eine Zahl kleiner als 5 oder größer als 10 ist."

zahl=12

if [ "$zahl" -lt 5 ] || [ "$zahl" -gt 10 ]; then
  echo "Die Zahl $zahl ist entweder kleiner als 5 oder größer als 10."
else
  echo "Die Zahl $zahl liegt zwischen 5 und 10."
fi

# 7. Beispiel für eine Bedingung mit Test-Operatoren (z.B. -f, -d, -e)
echo "### Beispiel 7: Test-Operatoren (Dateiüberprüfungen) ###"
echo "Überprüfen, ob eine Datei existiert und ob es ein Verzeichnis ist."

dateiname="testdatei.txt"
if [ -e "$dateiname" ]; then
  echo "Die Datei $dateiname existiert."
  
  if [ -f "$dateiname" ]; then
    echo "$dateiname ist eine Datei."
  elif [ -d "$dateiname" ]; then
    echo "$dateiname ist ein Verzeichnis."
  fi
else
  echo "Die Datei $dateiname existiert nicht."
fi

# 8. Beispiel für die Verwendung von ternären Operatoren (Bedingung innerhalb einer einzigen Zeile)
echo "### Beispiel 8: Ternärer Operator ###"
echo "Verwenden eines ternären Operators, um eine Zahl als positiv oder negativ zu kennzeichnen."

zahl=-5
[ "$zahl" -lt 0 ] && echo "Die Zahl $zahl ist negativ." || echo "Die Zahl $zahl ist positiv oder null."

# Ende des Skripts
echo "Dieses Skript hat verschiedene Verzweigungsstrukturen in der Shell erklärt: if, elif, else, verschachtelte if-Bedingungen, logische Operatoren, und Dateiüberprüfungen."
