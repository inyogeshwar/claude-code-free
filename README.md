# 🤖 Claude Code CLI — Free Access Guide

> ⚡ Use the official **Claude Code** CLI tool with alternative API endpoints — no GPU required!

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)](#)
[![Tutorial](https://img.shields.io/badge/YouTube-Tutorial-red?logo=youtube)](https://youtu.be/-ITyNBWPGu4)

---

## 📋 Table of Contents

- [✨ Features](#-features)
- [🔧 Prerequisites](#-prerequisites)
- [⚡ Quick Setup](#-quick-setup)
  - [Windows](#windows)
  - [macOS / Linux](#macos--linux)
- [🌐 Alternative Providers](#-alternative-providers)
- [🛠️ Troubleshooting](#️-troubleshooting)
- [⚠️ Disclaimer](#️-disclaimer)
- [⭐ Support](#-support)
- [📄 License](#-license)

---

## ✨ Features

✅ Official `@anthropic-ai/claude-code` CLI compatibility  
✅ Cross-platform support (Windows, macOS, Linux)  
✅ Flexible API endpoint configuration  
✅ Support for multiple model selections  
✅ Zero GPU requirements  
✅ Easy environment variable setup  

---

## 🔧 Prerequisites

Before you begin, ensure you have:

- [Node.js](https://nodejs.org/) (v18 or higher)
- [npm](https://www.npmjs.com/) package manager
- A terminal/command prompt with admin privileges
- An API token from [AgentRouter](https://agentrouter.org/register?aff=TAGp)

---

## ⚡ Quick Setup

### Windows

#### 1️⃣ Install Claude Code CLI

```cmd
:: Install globally via npm
npm install -g @anthropic-ai/claude-code
```

#### 2️⃣ Get Your API Token

🔗 [Register at AgentRouter](https://agentrouter.org/register?aff=TAGp)  
🔗 [Generate Token](https://agentrouter.org/console/token)

#### 3️⃣ Configure Environment Variables

```cmd
:: Set API base URL
setx ANTHROPIC_BASE_URL "https://agentrouter.org/"

:: Set your authentication token
setx ANTHROPIC_AUTH_TOKEN "sk-YOUR_TOKEN_HERE"

:: Choose your preferred model
setx ANTHROPIC_MODEL "claude-3-5-sonnet-20241022"

:: Enable token authentication
setx CLAUDE_CODE_USE_AUTH_TOKEN "true"
```

> 💡 **Tip**: Restart your terminal after setting environment variables for changes to take effect.

#### 4️⃣ Launch Claude

```cmd
:: Navigate to your project directory
cd path\to\your-project

:: Start the Claude CLI
claude
```

---

### macOS / Linux

```bash
# 1. Install Claude Code CLI
npm install -g @anthropic-ai/claude-code

# 2. Configure environment variables
export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="sk-YOUR_TOKEN_HERE"
export ANTHROPIC_MODEL="claude-3-5-sonnet-20241022"
export CLAUDE_CODE_USE_AUTH_TOKEN="true"

# 3. Launch Claude
claude
```

> 💡 **Pro Tip**: Add the `export` commands to your `~/.bashrc` or `~/.zshrc` for persistent configuration.

---

## 🌐 Alternative Providers

### OpenRouter (Free Tier Models)

```bash
# Configure for OpenRouter
export ANTHROPIC_BASE_URL="https://openrouter.ai/api/v1"
export ANTHROPIC_AUTH_TOKEN="sk-YOUR_OPENROUTER_KEY"
export ANTHROPIC_MODEL="openrouter/free"  # Auto-selects best free model
```

🔗 [Get OpenRouter Key](https://openrouter.ai/keys)

| Provider | Base URL | Free Tier | Notes |
|----------|----------|-----------|-------|
| AgentRouter | `https://agentrouter.org/` | ✅ | Best for Claude models |
| OpenRouter | `https://openrouter.ai/api/v1` | ✅ | Multiple model options |
| Official Anthropic | `https://api.anthropic.com` | ❌ | Requires paid subscription |

---

## 🛠️ Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| `claude: command not found` | Ensure npm global bin is in your PATH |
| Authentication failed | Verify `ANTHROPIC_AUTH_TOKEN` is correct |
| Model not found | Check `ANTHROPIC_MODEL` spelling & provider support |
| Connection timeout | Verify internet connection & firewall settings |

### Verify Installation

```bash
# Check Claude CLI version
claude --version

# Test environment variables (macOS/Linux)
echo $ANTHROPIC_BASE_URL
echo $ANTHROPIC_AUTH_TOKEN
```

### Reset Configuration

```bash
# Windows
setx ANTHROPIC_AUTH_TOKEN ""

# macOS/Linux
unset ANTHROPIC_AUTH_TOKEN
```

---

## ⚠️ Disclaimer

> 🔐 **Important**: This guide demonstrates configuration options for the Claude Code CLI. 
> 
> - Always review and comply with [Anthropic's Terms of Service](https://www.anthropic.com/legal/terms)
> - Third-party API proxies may have their own usage policies
> - This project is not affiliated with Anthropic, AgentRouter, or OpenRouter
> - Use responsibly and ethically

---

## ⭐ Support the Project

If you found this guide helpful:

- 🌟 **Star** this repository
- 👍 **Like** the [YouTube tutorial](https://youtu.be/-ITyNBWPGu4)
- 🔔 **Subscribe** for more dev tools content
- 🐛 **Report issues** via GitHub Issues

[![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/YOUR_REPO?style=social)](https://github.com/YOUR_USERNAME/YOUR_REPO)

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for more information.

---

<p align="center">
  <sub>Made with ❤️ by <a href="https://github.com/YogeshwarKumar">Yogeshwar Kumar</a></sub><br>
  <sub>© 2024 — For educational purposes only</sub>
</p>
