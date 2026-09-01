# Paul – Persönlicher Setup

Paul ist jetzt vollständig konfiguriert und einsatzbereit!

## 🚀 Paul aufrufen

### Option 1: Bash/CLI (von überall)
```bash
paul
```

Das bash-Script startet Claude mit Pauls System-Prompt.

### Option 2: Python-Wrapper (mit Git-Integration)
```bash
python3 /home/arcturus/agent-markdowns/.claude/paul-agent.py
```

### Option 3: Direkt aus Claude Code
```
Nutze einen der Slash-Befehle oben, oder spawne einen Agent mit Paul als System-Prompt.
```

## 🔧 Technische Details

### Installierte Dateien
- `~/.local/bin/paul` – Bash-Script
- `.claude/paul-agent.py` – Python-Wrapper mit Git-Integration

### Git-Konfiguration
- **Nutzer**: cygV404
- **Email**: v404cyg@proton.me
- **Token**: Speichert sich automatisch via git-credentials

### Workflows

#### 1. Paul starten
```bash
paul
```

#### 2. Einstellungsgespräch führen
Paul begrüßt dich und beginnt mit Fragen zu:
- Aufgabe
- Inputs
- Outputs
- No-GOs
- Freigaben

#### 3. Personalakte generieren
Paul erstellt eine finale Personalakte als Markdown-Codeblock.

#### 4. Speichern auf GitHub (automatisch)
- Personalakte wird in `examples/` gespeichert
- Git-Commit mit Timestamp
- Push zu GitHub

## 📋 Output-Format

Die Personalakte wird im folgenden Format erstellt:
```
NAME: [Alliteration, z.B. "Tim Termine"]
KURZBESCHREIBUNG: [...]
ROLLE: [...]
AUFGABEN: [...]
GRENZEN / NO-GOS: [...]
ZIELGRUPPE: [...]
TONALITÄT & STIL: [...]
INPUTS: [...]
OUTPUTS: [...]
QUALITÄTSKRITERIEN: [...]
ARBEITSWEISE: [...]
PERSÖNLICHKEIT: [...]
BEISPIELE FÜR GUTE OUTPUTS: [...]
```

## ✅ Checklist

- [x] Repository geklont
- [x] GitHub-Token konfiguriert
- [x] Bash-Script installiert
- [x] Git-Credentials gespeichert
- [x] Python-Wrapper erstellt

## 🔒 Sicherheit

Der GitHub-Token ist in `~/.git-credentials` gespeichert und wird:
- **NICHT** in Dateien hardcodiert
- **NICHT** in Commit-Messages gezeigt
- Automatisch bei `git` Befehlen genutzt

> **Wichtig**: Nach Session-Ende solltest du den Token auf GitHub regenerieren, falls er exposed wurde.

---

**Paul ist bereit!** Nutze `paul` um zu starten. 🎩
