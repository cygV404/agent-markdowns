# Paul – Quickstart Setup

Paul ist ein **Personalchef für KI-Assistenten**. Er führt Einstellungsgespräche und erstellt Personalakten als System-Prompts.

## 🚀 Installation (1 Minute)

```bash
# 1. Repository klonen
git clone https://github.com/cygV404/agent-markdowns.git
cd agent-markdowns

# 2. Setup ausführen
./setup-paul.sh

# 3. Fertig!
```

## 📖 Paul nutzen

### In Claude Code (lokal/Server)
```bash
paul
```

Das zeigt Paul's Prompt an und du kannst in Claude Code direkt mit ihm interagieren.

### Optional: Git-Config
```bash
git config --global user.name "dein-name"
git config --global user.email "dein@email.de"
```

## 🎯 Workflow

1. `paul` eingeben
2. Paul begrüßt dich
3. Du beschreibst die Aufgabe für deinen neuen Assistenten
4. Paul stellt Verfeinerungsfragen
5. Personalakte wird erstellt
6. Kopiere die Personalakte und nutze sie als System-Prompt

## 📋 Was ist eine Personalakte?

Ein strukturiertes Profil für einen KI-Assistenten:
- NAME & Kurzbeschreibung
- ROLLE & AUFGABEN
- GRENZEN / NO-GOS
- INPUTS & OUTPUTS
- TONALITÄT & PERSÖNLICHKEIT
- ARBEITSWEISE

Beispiel: [examples/](examples/)

## ✅ Das war's!

Keine API-Keys, keine Dependencies. Nur Paul und Claude Code. 🎩

---

**Fragen?** Schau in [agents/paul-personal.md](agents/paul-personal.md) für Pauls vollständige System-Prompt.
