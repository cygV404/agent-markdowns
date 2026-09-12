#!/bin/bash
# Setup Paul – Ultra-einfach

set -e

echo "🎩 Paul Setup"
echo ""

# 1. Pfade
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PAUL_SCRIPT="$SCRIPT_DIR/paul"

# 2. Executables
chmod +x "$PAUL_SCRIPT" "$SCRIPT_DIR/paul-save" "$SCRIPT_DIR/agent"

# Installiert eine Datei nach ~/.local/bin. Vorhandene Fassungen werden
# gesichert statt kommentarlos ueberschrieben. Ist das Ziel bereits ein
# Symlink auf genau diese Quelle, bleibt es unangetastet - sonst wuerde
# cp die Quelldatei ueber sich selbst schreiben.
install_bin() {
    local src="$1"
    local dst="$HOME/.local/bin/$(basename "$src")"

    if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$(readlink -f "$src")" ]; then
        echo "   $(basename "$src"): Symlink aufs Repo, bleibt wie er ist"
        return 0
    fi
    if [ -e "$dst" ] && ! cmp -s "$src" "$dst"; then
        cp "$dst" "$dst.bak-$(date +%Y%m%d-%H%M%S)"
        echo "   $(basename "$src"): vorhandene Fassung gesichert"
    fi
    cp "$src" "$dst" 2>/dev/null || echo "⚠️  ~/.local/bin nicht verfuegbar (optional)"
}

mkdir -p ~/.local/bin
install_bin "$PAUL_SCRIPT"
install_bin "$SCRIPT_DIR/paul-save"
install_bin "$SCRIPT_DIR/agent"

# 3. Personalakten mitkopieren
# agent sucht sie in examples/ - ohne diesen Schritt findet er keine.
mkdir -p ~/.local/bin/examples
cp "$SCRIPT_DIR/examples/"*.md ~/.local/bin/examples/ 2>/dev/null \
    || echo "⚠️  examples/ konnte nicht kopiert werden"

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
