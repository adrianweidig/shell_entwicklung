#!/bin/sh
# Dieses Skript erklärt den Unterschied zwischen globalen (Umgebungs-)Variablen im Benutzerkontext und lokalen Variablen innerhalb eines Shell-Skripts.

# 1. Globale (Umgebungs-)Variablen im Benutzerkontext
# Diese Variablen sind im gesamten System verfügbar und können von jedem Prozess verwendet werden.

# Beispiel: Die Umgebungsvariable $USER enthält den Benutzernamen des aktuellen Benutzers
echo "Globale Umgebungsvariable - Benutzername: $USER"

# Weitere Beispiel-Umgebungsvariablen
echo "Globale Umgebungsvariable - Home-Verzeichnis: $HOME"
echo "Globale Umgebungsvariable - Aktuelles Verzeichnis: $PWD"
echo "Globale Umgebungsvariable - Shell: $SHELL"

# 2. Lokale Variablen
# Lokale Variablen existieren nur innerhalb des aktuellen Shell-Skripts oder einer Funktion und sind außerhalb dieser Kontexte nicht zugänglich.
# Sie werden ohne das Schlüsselwort 'local' deklariert und sind nur in der aktuellen Sitzung oder Funktion verfügbar.

# Lokale Variable innerhalb des Skripts
lokale_variable="Ich bin eine lokale Variable im Skript"
echo "Lokale Variable: $lokale_variable"

# 3. Umgebungsvariablen setzen
# Man kann auch eigene Umgebungsvariablen setzen, die nur innerhalb der aktuellen Shell-Sitzung verfügbar sind.
# Umgebungsvariablen, die gesetzt werden, sind nachfolgend in der aktuellen Sitzung verfügbar, aber nicht dauerhaft.

export MEINE_UMGEBUNGSVARIABLE="Dies ist eine benutzerdefinierte Umgebungsvariable"
echo "Benutzerdefinierte Umgebungsvariable: $MEINE_UMGEBUNGSVARIABLE"

# 4. Löschen von Variablen
# Um eine Variable innerhalb der aktuellen Shell-Sitzung zu löschen, kann man 'unset' verwenden.
unset MEINE_UMGEBUNGSVARIABLE
echo "Nach dem Löschen der Umgebungsvariablen MEINE_UMGEBUNGSVARIABLE: $MEINE_UMGEBUNGSVARIABLE"

# Ende des Skripts
# Dieses Skript hat grundlegende Konzepte von globalen (Umgebungs-)Variablen und lokalen Variablen veranschaulicht.
