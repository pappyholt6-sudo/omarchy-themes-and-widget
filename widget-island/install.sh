#!/usr/bin/env bash
set -euo pipefail
PLUGIN_ID="local.widget-island"
DEST="$HOME/.config/omarchy/plugins/$PLUGIN_ID"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$DEST"
cp "$SRC/manifest.json" "$DEST/manifest.json"
cp "$SRC/Island.qml" "$DEST/Island.qml"
command -v omarchy-shell >/dev/null 2>&1 && omarchy-shell shell rescanPlugins >/dev/null || true
command -v omarchy >/dev/null 2>&1 && omarchy plugin enable "$PLUGIN_ID" --yes 2>/dev/null || true
echo "Installed Widget Island."
echo 'Add to ~/.config/hypr/bindings.lua:'
echo 'o.bind("SUPER + SHIFT + I", "Widget Island", "omarchy-shell shell toggle local.widget-island")'
echo 'Then run: hyprctl reload'
