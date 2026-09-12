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

### Step 1: Personalakte generieren
```bash
paul
```
1. Paul begrüßt dich
2. Du beschreibst die Aufgabe für deinen neuen Assistenten
3. Paul stellt Verfeinerungsfragen
4. Personalakte wird generiert

### Step 2: Automatisch auf GitHub speichern
```bash
paul-save
```
1. Gib den Agenten-Namen ein (z.B. "docker-monitor")
2. Kopiere Pauls Personalakte und füge sie ein
3. **Fertig!** Wird automatisch auf GitHub gespeichert

### Step 3: Agent starten
```bash
agent uwe              # Startet Uwe mit seiner Personalakte
agent docker-monitor   # Startet Docker-Monitor
agent <name>           # Startet jeden gespeicherten Agenten
```

Das war's! Der Agent läuft jetzt in Claude Code mit seiner Personalakte als System-Prompt. 🚀

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

**Fragen?** Schau in [examples/paul.md](examples/paul.md) für Pauls vollständige System-Prompt.
