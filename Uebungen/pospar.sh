#!/bin/sh

# 1. Zeige die Anzahl der übergebenen Positionsparameter an
printf "Es wurden %d PosParameter übergeben\n" "$#"

# 2. Überprüfe, ob Parameter übergeben wurden
if [ $# -eq 0 ]; then
    printf "Es wurden keine Parameter übergeben.\n"
    exit 1
fi

# 3. Schleife über alle übergebenen Parameter
# Wir starten bei 0, weil $0 der Name des Skripts ist und wir auch diesen sehen wollen
for i in $(seq 0 $#); do
    # 4. Zugriff auf den i-ten Parameter mit ${!i} (indirekte Referenzierung)
    parameter_indirect=${!i}
    printf "Parameter %d mit indirekter Referenzierung (\${!i}): %s\n" "$i" "$parameter_indirect"

    # 5. Zugriff auf den i-ten Parameter mit eval und \$$i (Alternative Methode) und geschweiften Klammern für Parameter >9
    eval parameter_eval=\${"$i"}
    printf "Parameter %d mit eval und \${%d}: %s\n" "$i" "$i" "$parameter_eval"
done
