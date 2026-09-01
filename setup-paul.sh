#!/bin/bash
# Setup Paul – Ultra-einfach

set -e

echo "🎩 Paul Setup"
echo ""

# 1. Pfade
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PAUL_SCRIPT="$SCRIPT_DIR/paul"

# 2. Executables
chmod +x "$PAUL_SCRIPT"
chmod +x "$SCRIPT_DIR/paul-save"
chmod +x "$SCRIPT_DIR/agent"
cp "$PAUL_SCRIPT" ~/.local/bin/paul 2>/dev/null || echo "⚠️  ~/.local/bin nicht verfügbar (optional)"
cp "$SCRIPT_DIR/paul-save" ~/.local/bin/paul-save 2>/dev/null || echo "⚠️  ~/.local/bin nicht verfügbar (optional)"
cp "$SCRIPT_DIR/agent" ~/.local/bin/agent 2>/dev/null || echo "⚠️  ~/.local/bin nicht verfügbar (optional)"

# 3. Agents-Verzeichnis mitkopieren
mkdir -p ~/.local/bin/agents
cp "$SCRIPT_DIR/agents/paul-personal.md" ~/.local/bin/agents/paul-personal.md 2>/dev/null || echo "⚠️  agents/paul-personal.md konnte nicht kopiert werden"

echo "✅ Paul installiert"
echo ""
echo "Nutzung:"
echo "  $ paul              # Startet Paul in Claude Code"
echo "  $ ./paul            # Direkt aus dem Repo"
echo ""
echo "Git-Config (optional):"
echo "  $ git config --global user.name 'dein-name'"
echo "  $ git config --global user.email 'dein@email.de'"
echo ""
