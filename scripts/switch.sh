#!/usr/bin/env bash
# switch.sh - Interactive provider switcher for Claude Code

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETTINGS_DIR="$SCRIPT_DIR/../settings"
CLAUDE_DIR="$HOME/.claude"
TARGET_FILE="$CLAUDE_DIR/settings.json"
BACKUP_DIR="$CLAUDE_DIR/backups"

mkdir -p "$CLAUDE_DIR"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║     Claude Code Provider Switcher        ║"
echo "╚══════════════════════════════════════════╝"
echo ""

SettingsFiles=()
for f in "$SETTINGS_DIR"/settings-*.json; do
    [ -f "$f" ] && SettingsFiles+=("$f")
done

if [ ${#SettingsFiles[@]} -eq 0 ]; then
    echo "No settings files found in $SETTINGS_DIR"
    exit 1
fi

for i in "${!SettingsFiles[@]}"; do
    Name=$(basename "${SettingsFiles[$i]}" | sed 's/^settings-//' | sed 's/\.json$//')
    Num=$((i + 1))
    echo "  [$Num] $Name"
done

echo ""
read -rp "Select provider (1-${#SettingsFiles[@]}): " Choice

if ! [[ "$Choice" =~ ^[0-9]+$ ]] || [ "$Choice" -lt 1 ] || [ "$Choice" -gt "${#SettingsFiles[@]}" ]; then
    echo "Invalid selection."
    exit 1
fi

Selected="${SettingsFiles[$((Choice - 1))]}"

# Backup current settings
if [ -f "$TARGET_FILE" ]; then
    mkdir -p "$BACKUP_DIR"
    Timestamp=$(date +%Y%m%d-%H%M%S)
    cp "$TARGET_FILE" "$BACKUP_DIR/settings-backup-$Timestamp.json"
    echo "  Backed up current settings"
fi

cp "$Selected" "$TARGET_FILE"
SelectedName=$(basename "$Selected" | sed 's/^settings-//' | sed 's/\.json$//')

echo ""
echo "  Switched to: $SelectedName"
echo "  Settings file: $TARGET_FILE"
echo ""
echo "  Edit $TARGET_FILE to add your API key."
echo "  Then run: claude"
echo ""
