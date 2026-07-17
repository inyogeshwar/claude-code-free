#!/usr/bin/env bash
# restore.sh - Restores Claude Code settings from a backup

set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"
BACKUP_DIR="$CLAUDE_DIR/backups"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "No backups found at $BACKUP_DIR"
    exit 1
fi

Backups=()
for f in "$BACKUP_DIR"/settings-backup-*.json; do
    [ -f "$f" ] && Backups+=("$f")
done

if [ ${#Backups[@]} -eq 0 ]; then
    echo "No backup files found"
    exit 1
fi

echo ""
echo "Available backups:"
for i in "${!Backups[@]}"; do
    Date=$(basename "${Backups[$i]}" | sed 's/settings-backup-//' | sed 's/\.json$//')
    Num=$((i + 1))
    echo "  [$Num] $Date"
done

read -rp "Select backup (1-${#Backups[@]}): " Choice

if ! [[ "$Choice" =~ ^[0-9]+$ ]] || [ "$Choice" -lt 1 ] || [ "$Choice" -gt "${#Backups[@]}" ]; then
    echo "Invalid selection."
    exit 1
fi

Selected="${Backups[$((Choice - 1))]}"
cp "$Selected" "$SETTINGS_FILE"
echo "Settings restored from: $(basename "$Selected")"
