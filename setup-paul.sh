#!/bin/bash
# Setup Paul – Ultra-einfach

set -e

echo "🎩 Paul Setup"
echo ""

# 1. Pfade
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PAUL_SCRIPT="$SCRIPT_DIR/paul"

# 2. Executable
chmod +x "$PAUL_SCRIPT"
cp "$PAUL_SCRIPT" ~/.local/bin/paul 2>/dev/null || echo "⚠️  ~/.local/bin nicht verfügbar (optional)"

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
