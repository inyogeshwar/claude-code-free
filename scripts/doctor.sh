#!/usr/bin/env bash
# doctor.sh - Diagnostic tool for Claude Code configuration

set -euo pipefail

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║       Claude Code Doctor                 ║"
echo "╚══════════════════════════════════════════╝"
echo ""

Issues=0

# Check Node.js
if command -v node &>/dev/null; then
    NodeVersion=$(node --version)
    echo "  [OK] Node.js: $NodeVersion"
else
    echo "  [FAIL] Node.js not found. Install from https://nodejs.org/"
    ((Issues++))
fi

# Check Claude Code
if command -v claude &>/dev/null; then
    echo "  [OK] Claude Code: installed"
else
    echo "  [WARN] Claude Code not found in PATH"
fi

# Check settings file
SettingsFile="$HOME/.claude/settings.json"

if [ -f "$SettingsFile" ]; then
    echo "  [OK] Settings file exists: $SettingsFile"

    if command -v python3 &>/dev/null; then
        BaseURL=$(python3 -c "import json; d=json.load(open('$SettingsFile')); print(d.get('env',{}).get('ANTHROPIC_BASE_URL',''))" 2>/dev/null || echo "")
        APIKey=$(python3 -c "import json; d=json.load(open('$SettingsFile')); print(d.get('env',{}).get('ANTHROPIC_API_KEY', d.get('env',{}).get('ANTHROPIC_AUTH_TOKEN','')))" 2>/dev/null || echo "")

        if [ -n "$BaseURL" ]; then
            echo "  [OK] Base URL: $BaseURL"
        else
            echo "  [WARN] ANTHROPIC_BASE_URL not set"
        fi

        if [ -n "$APIKey" ]; then
            if [ "$APIKey" = "YOUR_API_KEY_HERE" ]; then
                echo "  [WARN] API key is placeholder - update with real key"
            else
                echo "  [OK] API Key: ${APIKey:0:8}..."
            fi
        else
            echo "  [WARN] No API key configured"
        fi
    fi
else
    echo "  [WARN] No settings file at $SettingsFile"
    echo "         Run switch.sh to set up a provider"
fi

# Check backups
BackupDir="$HOME/.claude/backups"
if [ -d "$BackupDir" ]; then
    BackupCount=$(find "$BackupDir" -name "*.json" | wc -l)
    echo "  [OK] Backups: $BackupCount found"
fi

echo ""
if [ "$Issues" -eq 0 ]; then
    echo "  All checks passed!"
else
    echo "  Found $Issues issue(s). Please fix the above."
fi
echo ""
