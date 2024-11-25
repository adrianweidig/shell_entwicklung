# Shell-Entwicklung

---

## Warum Shell-Entwicklung?

Die Shell ist das Herzstück vieler Betriebssysteme. Sie ermöglicht es, Aufgaben zu automatisieren, Prozesse zu steuern und komplexe Workflows zu vereinfachen. Mit der richtigen Kombination aus Befehlen und Skripten kannst du:

- Routineaufgaben automatisieren, um Zeit zu sparen.  
- Leistungsstarke Tools kombinieren, um einzigartige Lösungen zu erstellen.  
- Effizient mit Dateien und Prozessen arbeiten, ohne auf grafische Schnittstellen angewiesen zu sein.  

---

## Was dich hier erwartet

Dieses Repository enthält verschiedene Ressourcen, die dir helfen, das Beste aus deiner Shell zu machen. Dazu gehören:

- Erklärungen der Grundlagen, um ein solides Verständnis aufzubauen.  
- Praktische Beispiele, die du direkt ausprobieren kannst.  
- Kniffe und versteckte Tricks, die in vielen Tutorials oft übersehen werden.  
- Best Practices, damit deine Skripte lesbar, wartbar und sicher sind.  

---

## Voraussetzungen

Bevor du loslegst, solltest du sicherstellen, dass du Zugriff auf eine Shell-Umgebung hast. Die meisten modernen Betriebssysteme (wie Linux, macOS und Windows mit WSL) bringen bereits eine Shell wie Bash oder Zsh mit.

Falls du noch nie mit der Shell gearbeitet hast, ist das kein Problem – wir starten bei den Grundlagen.

---

## Möglichkeiten, ein Skript auszuführen und Unterschiede zwischen Windows und Linux

### Skriptaufruf unter Linux

Unter Linux gibt es verschiedene Möglichkeiten, ein Shell-Skript auszuführen:  

1. **Direkter Aufruf über die Shell**  
   Angenommen, das Skript heißt `script.sh` und ist im aktuellen Verzeichnis:
   ```bash
   bash script.sh
   ```
   oder, wenn es ausführbar ist:
   ```bash
   ./script.sh
   ```
   Um sicherzustellen, dass das Skript ausführbar ist, kannst du es mit folgendem Befehl ändern:
   ```bash
   chmod +x script.sh
   ```

2. **Aufruf mit vollem Pfad**  
   Wenn das Skript sich nicht im aktuellen Verzeichnis befindet, kannst du den vollständigen Pfad angeben:
   ```bash
   /pfad/zu/deinem/script.sh
   ```

3. **Eingabe in die Shell umleiten**  
   Ein Skript kann auch über die Eingabeumleitung ausgeführt werden:
   ```bash
   bash < script.sh
   ```

### Skriptaufruf unter Windows

In Windows ist die Shell (PowerShell oder cmd) nicht standardmäßig für Bash-Skripte ausgelegt. Mit der **Windows Subsystem for Linux (WSL)** kannst du jedoch eine Linux-Umgebung nutzen:

1. **WSL verwenden**  
   ```bash
   wsl bash script.sh
   ```

2. **Git Bash**  
   Wenn du Git installiert hast, bringt es eine Bash-Umgebung mit:
   ```bash
   ./script.sh
   ```

3. **PowerShell**  
   Mit PowerShell kannst du Bash-Skripte aus WSL heraus starten:
   ```powershell
   wsl ./script.sh
   ```

### Unterschiede zwischen Windows und Linux

| **Aspekt**             | **Linux**                              | **Windows**                         |
|-------------------------|-----------------------------------------|--------------------------------------|
| **Skriptausführung**    | Direkte Ausführung mit `bash` oder `./` | WSL oder Git Bash erforderlich      |
| **Dateiformat**         | Unix-LF (`\n`) als Zeilenumbruch        | Windows-CRLF (`\r\n`) als Standard  |
| **Shell-Umgebung**      | Bash, Zsh, Fish                        | PowerShell, cmd, Git Bash, WSL      |
| **Rechteverwaltung**    | Ausführungsrechte erforderlich          | Keine expliziten Ausführungsrechte  |

### Hinweise zur Portabilität

- Skripte sollten immer mit einem sogenannten Shebang (`#!/bin/bash`) beginnen, um die gewünschte Shell zu definieren.
- Verwende, wenn möglich, portable Befehle, um plattformübergreifende Kompatibilität sicherzustellen.  
- Bei der Arbeit auf Windows solltest du die Zeilenumbrüche anpassen, falls Probleme auftreten. Das Tool `dos2unix` kann dabei helfen:
   ```bash
   dos2unix script.sh
   ```

---

## Shell-Skripte mit Visual Studio Code entwickeln und debuggen

Visual Studio Code (VS Code) ist ein leistungsfähiges Tool, das die Entwicklung und Wartung von Shell-Skripten erheblich erleichtert. Hier ist eine einfache Anleitung:

### 1. Voraussetzungen

- Installiere [Visual Studio Code](https://code.visualstudio.com/).
- Installiere das **Bash Extension Pack** aus dem Extensions Marketplace. Dieses enthält:
  - **ShellCheck**: Ein leistungsstarker Linter für Shell-Skripte.
  - **Bash Debug**: Ermöglicht das Debuggen von Shell-Skripten.

### 2. Nutzung der Tools

- Öffne dein Shell-Skript in VS Code.
- **Linting mit ShellCheck**: Fehler und Verbesserungen werden automatisch im Editor angezeigt. Folge den Hinweisen, um dein Skript zu optimieren.
- **Debuggen**: Starte den Debugger mit der Standardkonfiguration des Bash Extension Packs und überprüfe den Ablauf deines Skripts, indem du Breakpoints setzt und Variablen analysierst.

---

## Git-Konfiguration für Linux

Damit du deine Änderungen mit einem Remote-Repository synchronisieren kannst, ist es wichtig, deine Git-Konfiguration einzurichten. Führe dazu die folgenden Befehle aus:

1. Setze deinen Namen:
   ```bash
   git config --global user.name "Dein Name"
   ```
2. Setze deine E-Mail-Adresse:
   ```bash
   git config --global user.email "deine-email@example.com"
   ```

Diese Einstellungen sind notwendig, damit Git deine Änderungen korrekt zuordnen kann. Danach kannst du wie gewohnt Änderungen pushen und synchronisieren.
