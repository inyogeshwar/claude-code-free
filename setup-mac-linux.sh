#!/bin/bash
# Claude Code FREE Setup — macOS / Linux
# Tutorial by: youtube.com/@YogeshwarkumarOfficial
# GitHub: github.com/inyogeshwar/claude-code-free

echo ""
echo "================================================================"
echo "  CLAUDE CODE FREE SETUP"
echo "  youtube.com/@YogeshwarkumarOfficial"
echo "================================================================"
echo ""

echo "Step 1: Installing Claude Code..."
npm install -g @anthropic-ai/claude-code
if [ $? -ne 0 ]; then
    echo "ERROR: Install failed. Get Node.js from https://nodejs.org/"
    exit 1
fi

echo ""
echo "Step 2: Get your FREE AgentRouter API Token"
echo "  Register: https://agentrouter.org/register?aff=TAGp"
echo "  Get Token: https://agentrouter.org/console/token"
echo ""
read -p "Paste your token (sk-...): " TOKEN

if [ -z "$TOKEN" ]; then
    echo "ERROR: Token cannot be empty!"
    exit 1
fi

# Detect shell config
if [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.bash_profile"
fi

echo ""
echo "Step 3: Adding to $SHELL_CONFIG..."

# Remove old entries
sed -i.bak '/ANTHROPIC_BASE_URL\|ANTHROPIC_AUTH_TOKEN\|ANTHROPIC_API_KEY\|ANTHROPIC_MODEL\|CLAUDE_CODE_USE_AUTH_TOKEN/d' "$SHELL_CONFIG"

cat >> "$SHELL_CONFIG" << EOF

# Claude Code FREE — github.com/inyogeshwar/claude-code-free
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="$TOKEN"
export ANTHROPIC_API_KEY="$TOKEN"
export ANTHROPIC_MODEL="claude-sonnet-4-5-20250514"
export CLAUDE_CODE_USE_AUTH_TOKEN="true"
EOF

source "$SHELL_CONFIG"

echo ""
echo "================================================================"
echo "  SETUP COMPLETE!"
echo "================================================================"
echo ""
echo "  cd your-project-folder"
echo "  claude"
echo ""
echo "Subscribe: youtube.com/@YogeshwarkumarOfficial"
echo "GitHub: github.com/inyogeshwar"
echo ""
