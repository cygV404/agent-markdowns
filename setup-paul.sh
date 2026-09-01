#!/bin/bash
# Setup Paul – Installation für lokal und Server

set -e

echo "╔════════════════════════════════════════════════╗"
echo "║  🎩 Paul Setup – Installation & Konfiguration ║"
echo "╚════════════════════════════════════════════════╝"

# 1. Überprüfe Python
echo ""
echo "1️⃣  Überprüfe Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 nicht gefunden! Installiere Python3."
    exit 1
fi
echo "✅ Python3 gefunden: $(python3 --version)"

# 2. Installiere Anthropic SDK
echo ""
echo "2️⃣  Installiere Anthropic SDK..."
pip install -q anthropic || pip3 install -q anthropic
echo "✅ Anthropic SDK installiert"

# 3. Erstelle ~/.local/bin falls nicht vorhanden
echo ""
echo "3️⃣  Erstelle ~/.local/bin..."
mkdir -p ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# 4. Installiere Paul-Script
echo ""
echo "4️⃣  Installiere Paul-Script..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "$SCRIPT_DIR/paul" ~/.local/bin/paul
chmod +x ~/.local/bin/paul
echo "✅ Paul installiert: ~/.local/bin/paul"

# 5. Überprüfe Git-Konfiguration
echo ""
echo "5️⃣  Überprüfe Git-Konfiguration..."
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name "cygV404"
    git config --global user.email "v404cyg@proton.me"
    echo "✅ Git-Konfiguration gespeichert"
else
    echo "✅ Git bereits konfiguriert: $(git config --global user.name)"
fi

# 6. Überprüfe ANTHROPIC_API_KEY
echo ""
echo "6️⃣  Überprüfe ANTHROPIC_API_KEY..."
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  ANTHROPIC_API_KEY ist nicht gesetzt!"
    echo "   Setze sie mit: export ANTHROPIC_API_KEY='dein-token'"
    echo "   Oder in ~/.bashrc/~/.zshrc"
else
    echo "✅ ANTHROPIC_API_KEY ist gesetzt"
fi

# 7. Überprüfe GitHub-Token (falls vorhanden)
echo ""
echo "7️⃣  Überprüfe GitHub-Konfiguration..."
if [ -f ~/.git-credentials ]; then
    echo "✅ Git-Credentials gefunden"
else
    echo "ℹ️  Kein ~/.git-credentials gefunden (optional für GitHub-Zugriff)"
fi

# Finale Nachricht
echo ""
echo "╔════════════════════════════════════════════════╗"
echo "║  ✅ Paul Setup abgeschlossen!                 ║"
echo "║                                                ║"
echo "║  Nutze jetzt:  paul                            ║"
echo "║  oder:         ~/.local/bin/paul               ║"
echo "║  oder:         $SCRIPT_DIR/paul                ║"
echo "║                                                ║"
echo "║  Dokumentation: $SCRIPT_DIR/PAUL_SETUP.md      ║"
echo "╚════════════════════════════════════════════════╝"
echo ""

# Überprüfe ob PATH aktualisiert werden muss
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "⚠️  ~/.local/bin ist noch nicht in deinem PATH!"
    echo "   Füge das zu ~/.bashrc oder ~/.zshrc hinzu:"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

echo "Done! 🎩"
