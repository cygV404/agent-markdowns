#!/usr/bin/env python3
"""
Paul – Personalchef für KI-Assistenten
Starts Paul as an interactive agent with GitHub write access.
"""

import os
import sys
import json
from pathlib import Path
from datetime import datetime

# Konfiguration
REPO_DIR = Path(__file__).parent.parent
PAUL_PROMPT = REPO_DIR / "agents" / "paul-personal.md"
EXAMPLES_DIR = REPO_DIR / "examples"
TEMPLATE = REPO_DIR / "templates" / "personalakte.md"

# Git-Konfiguration für Commits
os.environ["GIT_AUTHOR_NAME"] = "cygV404"
os.environ["GIT_AUTHOR_EMAIL"] = "v404cyg@proton.me"
os.environ["GIT_COMMITTER_NAME"] = "cygV404"
os.environ["GIT_COMMITTER_EMAIL"] = "v404cyg@proton.me"

def read_paul_prompt():
    """Lese Pauls System-Prompt"""
    if not PAUL_PROMPT.exists():
        raise FileNotFoundError(f"Paul-Prompt nicht gefunden: {PAUL_PROMPT}")
    return PAUL_PROMPT.read_text()

def save_personalakte(content: str, name: str) -> str:
    """Speichere die erstellte Personalakte auf GitHub"""
    # Sanitize filename
    filename = name.lower().replace(" ", "-").replace("/", "-") + ".md"
    filepath = EXAMPLES_DIR / filename

    # Speichere Datei
    filepath.write_text(content)

    # Git-Commit
    os.chdir(REPO_DIR)
    os.system(f'git add "{filepath}"')
    os.system(f'git commit -m "Paul: Neue Personalakte – {name} [{datetime.now().strftime("%Y-%m-%d %H:%M")}]"')
    os.system("git push")

    return str(filepath)

def main():
    print(f"""
╔════════════════════════════════════════════════╗
║  🎩 Paul – Personalchef für KI-Assistenten    ║
║                                                ║
║  Startet einen interaktiven Agent...           ║
║  • Führt Einstellungsgespräche                 ║
║  • Erstellt Personalakten                      ║
║  • Speichert auf GitHub (mit Git-Commit)       ║
╚════════════════════════════════════════════════╝
    """)

    # Lese Pauls Prompt
    paul_prompt = read_paul_prompt()

    # Starte Claude mit Paul
    print(f"📄 Nutze System-Prompt: {PAUL_PROMPT}")
    print(f"💾 Personalakten werden gespeichert in: {EXAMPLES_DIR}")
    print()

    # Claude CLI mit Paul starten
    os.execvp("claude", ["claude", "--system", paul_prompt])

if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(f"❌ Fehler: {e}", file=sys.stderr)
        sys.exit(1)
