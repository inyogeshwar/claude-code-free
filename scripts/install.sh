#!/usr/bin/env bash
# install.sh - Automated setup wizard for Claude Code with free providers

set -euo pipefail

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║     Claude Code Free — Setup Wizard             ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check prerequisites
if ! command -v node &>/dev/null; then
    echo "  [!] Node.js is required. Install from https://nodejs.org/"
    exit 1
fi
echo "  [OK] Node.js installed"

if ! command -v claude &>/dev/null; then
    echo "  [!] Installing Claude Code globally..."
    npm install -g @anthropic-ai/claude-code
    echo "  [OK] Claude Code installed"
else
    echo "  [OK] Claude Code installed"
fi

echo ""

# Select provider
Providers=("OpenRouter" "OpenCode" "AgentRouter" "NVIDIA NIM" "ZenMux" "AeroLink" "FreeModel" "BlueSminds")
Files=("settings-openrouter.json" "settings-opencode.json" "settings-agentrouter.json" "settings-nvidia.json" "settings-zenmux.json" "settings-aerolink.json" "settings-freemodel.json" "settings-bluesminds.json")

echo "  Select a provider:"
for i in "${!Providers[@]}"; do
    echo "  [$((i+1))] ${Providers[$i]}"
done

read -rp "`n  Provider (1-${#Providers[@]}): " Choice

if ! [[ "$Choice" =~ ^[0-9]+$ ]] || [ "$Choice" -lt 1 ] || [ "$Choice" -gt "${#Providers[@]}" ]; then
    echo "  Invalid selection."
    exit 1
fi

Idx=$((Choice - 1))
SourceFile="$SCRIPT_DIR/../settings/${Files[$Idx]}"
mkdir -p "$HOME/.claude"
cp "$SourceFile" "$HOME/.claude/settings.json"

echo ""
echo "  Installed ${Providers[$Idx]} settings!"
echo ""
echo "  Next steps:"
echo "  1. Open ~/.claude/settings.json"
echo "  2. Replace YOUR_API_KEY_HERE with your actual API key"
echo "  3. Run: claude"
echo ""
