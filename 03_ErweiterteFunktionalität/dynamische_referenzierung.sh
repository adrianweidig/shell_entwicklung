#!/bin/sh
# Dieses Skript erklärt die Verwendung von dynamischer Referenzierung in der Shell.
# Es behandelt eval, indirekte Variablenreferenzierung und andere Techniken.
# Alle genutzten Dateien werden zu Beginn erstellt und am Ende gelöscht.

# 1. Einführung in dynamische Referenzierung
# Dynamische Referenzierung ermöglicht es, Variablen oder Befehle zur Laufzeit aufzulösen oder auszuführen.

# 2. Erstellung von Beispieldateien (wenn nötig)
echo "Dies ist eine Beispieldatei für dynamische Referenzierung." > dynamic_example.txt

# 3. Beispiele für dynamische Referenzierung

## a. Indirekte Variablenreferenzierung mit eval
echo "### Beispiel: Indirekte Referenzierung mit eval ###"

# Eine Variable, deren Name dynamisch generiert wird
var_name="dynamic_var"
dynamic_var="Dies ist ein dynamischer Wert."

# Zugriff auf den dynamischen Variablennamen mit eval
echo "Direkter Zugriff auf \$dynamic_var: $dynamic_var"
echo "Indirekter Zugriff mit eval: $(eval echo \$$var_name)"

## b. Indirekte Referenzierung mit Parametererweiterung
echo "### Beispiel: Indirekte Referenzierung mit Parametererweiterung ###"

# Zugriff mit ${!var}
var_ref="dynamic_var"
echo "Zugriff auf den Wert von \$dynamic_var über \${!var_ref}: ${!var_ref}"

## c. Dynamische Variablenzuweisung
echo "### Beispiel: Dynamische Variablenzuweisung ###"

# Eine Variable dynamisch zuweisen
dynamic_name="assigned_var"
eval "$dynamic_name='Dynamisch zugewiesener Wert'"
echo "Zugriff auf dynamisch zugewiesene Variable \$assigned_var: $assigned_var"

## d. Verwendung von eval für dynamische Befehle
echo "### Beispiel: Verwendung von eval für dynamische Befehle ###"

# Ein Befehl dynamisch aufbauen und ausführen
command="ls -l dynamic_example.txt"
echo "Dynamischer Befehl: $command"
eval $command

## e. Dynamische Referenzierung in Arrays (nur Bash-kompatibel)
# Hinweis: In der /bin/sh-Shell sind Arrays nicht direkt verfügbar.
# Diese Beispiele gelten für Bash:
if [ -n "$BASH_VERSION" ]; then
    echo "### Beispiel: Dynamische Referenzierung in Arrays (nur Bash) ###"
    arr_name="my_array"
    declare -a my_array=("Apfel" "Banane" "Orange")

    # Zugriff auf Array-Elemente über einen dynamischen Index
    index=1
    echo "Direkter Zugriff auf \$my_array[1]: ${my_array[1]}"
    echo "Indirekter Zugriff über eval: $(eval echo \${${arr_name}[$index]})"
fi

## f. Dynamische Ausführung mit Command Substitution $()
echo "### Beispiel: Dynamische Ausführung mit Command Substitution ###"

# Dynamischer Befehl
cmd="date +%Y-%m-%d"
result=$(eval $cmd)
echo "Das Ergebnis des dynamischen Befehls \`$cmd\`: $result"

## g. Sicherheitshinweis bei eval
echo "### Wichtiger Hinweis ###"
echo "Seien Sie vorsichtig bei der Verwendung von eval, da es potenziell unsichere Eingaben ausführen kann."
echo "Nutzen Sie eval nur, wenn es keine sichereren Alternativen gibt."

# 4. Ausgabe der Beispieldatei
echo "Inhalt der Datei 'dynamic_example.txt':"
cat dynamic_example.txt

# 5. Aufräumen: Löschen der verwendeten Dateien
rm dynamic_example.txt

# Ende des Skripts
# Dieses Skript hat dynamische Referenzierung mit eval, indirekter Referenzierung und anderen Methoden demonstriert.
# Alle temporären Dateien wurden nach der Ausführung gelöscht.
exit 0
