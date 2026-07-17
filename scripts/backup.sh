#!/usr/bin/env bash
# backup.sh - Backs up the current Claude Code settings

set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"
BACKUP_DIR="$CLAUDE_DIR/backups"

if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No settings file found at $SETTINGS_FILE"
    exit 1
fi

mkdir -p "$BACKUP_DIR"
Timestamp=$(date +%Y%m%d-%H%M%S)
cp "$SETTINGS_FILE" "$BACKUP_DIR/settings-backup-$Timestamp.json"
echo "Settings backed up to: $BACKUP_DIR/settings-backup-$Timestamp.json"
