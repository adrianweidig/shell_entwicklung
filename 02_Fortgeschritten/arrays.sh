#!/bin/sh
# Dieses Skript erklärt die Verwendung von Arrays in Shell-Skripten.
# Hinweis: Native Arrays werden in /bin/sh nicht unterstützt, daher wird Bash für erweiterte Array-Funktionen benötigt.
# Temporäre Dateien werden erstellt und am Ende gelöscht.

# 1. Hinweis zur Unterstützung von Arrays in der aktuellen Shell
if [ -z "$BASH_VERSION" ]; then
  echo "### Warnung: Native Arrays werden in der aktuellen /bin/sh-Umgebung nicht unterstützt."
  echo "### Bitte verwenden Sie Bash, um alle Array-Funktionen dieses Skripts zu testen."
  echo "### Einige Beispiele funktionieren möglicherweise nicht in dieser Shell."
fi

# 2. Erstellung einer Beispieldatei (falls erforderlich)
echo "Array-Tutorial: Demonstration der Verwendung von Arrays in der Shell." > arrays_example.txt

# 3. Grundlagen der Arrays in Bash
if [ -n "$BASH_VERSION" ]; then
  echo "### Beispiel: Erstellung und Zugriff auf Arrays ###"

  # a. Erstellung eines Arrays
  declare -a fruits=("Apfel" "Banane" "Orange")
  echo "Array 'fruits' wurde erstellt mit den Elementen: Apfel, Banane, Orange"

  # b. Zugriff auf Array-Elemente
  echo "Zugriff auf das erste Element (Index 0): ${fruits[0]}"
  echo "Zugriff auf das zweite Element (Index 1): ${fruits[1]}"

  # c. Alle Elemente eines Arrays
  echo "Alle Elemente im Array: ${fruits[*]}"
  echo "Alle Elemente einzeln gelistet:"
  for fruit in "${fruits[@]}"; do
    echo "- $fruit"
  done

  # d. Array-Länge
  echo "Länge des Arrays (Anzahl der Elemente): ${#fruits[@]}"

  # e. Hinzufügen eines Elements
  fruits+=("Traube")
  echo "Neues Element 'Traube' hinzugefügt. Neues Array: ${fruits[*]}"

  # f. Entfernen eines Elements
  unset fruits[1]  # Entfernt "Banane"
  echo "Element an Index 1 entfernt. Neues Array: ${fruits[*]}"

  # g. Dynamische Indizes
  echo "Zugriff auf ein Element mit dynamischem Index:"
  index=2
  echo "Das Element an Index $index ist: ${fruits[$index]}"

else
  echo "### Einschränkung: Arrays sind in der aktuellen Shell nicht nativ verfügbar. ###"
  echo "### Bitte verwenden Sie Bash, um die vollständigen Array-Funktionen zu testen. ###"
fi

# 4. Verwendung von Pseudo-Arrays in /bin/sh (Alternative)
echo "### Beispiel: Verwendung von Pseudo-Arrays in /bin/sh ###"

# Mit /bin/sh können Arrays durch Trennung mit Leerzeichen simuliert werden
pseudo_array="Apfel Banane Orange"
echo "Pseudo-Array erstellt: $pseudo_array"

# Zugriff auf ein Element mit `set`
set -- $pseudo_array  # Teilt den String in Argumente
echo "Zugriff auf das erste Element: $1"
echo "Zugriff auf das zweite Element: $2"
echo "Zugriff auf das dritte Element: $3"

# Iteration durch alle Elemente
echo "Alle Elemente im Pseudo-Array:"
for element in $pseudo_array; do
  echo "- $element"
done

# 5. Ausgabe der Beispieldatei
echo "Inhalt der Datei 'arrays_example.txt':"
cat arrays_example.txt

# 6. Aufräumen: Löschen der verwendeten Dateien
rm arrays_example.txt

# Ende des Skripts
exit 0
