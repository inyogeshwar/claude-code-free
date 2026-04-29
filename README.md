# 🤯 Claude Code FREE & UNLIMITED — No GPU, No Limits!

> **YouTube Tutorial:** [Watch Now](https://youtu.be/-ITyNBWPGu4)

Use the official **Claude Code** CLI tool — powered by [AgentRouter](https://agentrouter.org/register?aff=TAGp) — completely FREE. No Anthropic subscription, no GPU, no credit card required.

---

## ✅ What You Get

* 🧠 Claude Sonnet — powerful AI coding agent
* 💻 Runs on Windows, Mac, Linux
* 🔧 Works in Terminal + VS Code + JetBrains
* ♾️ Unlimited usage via AgentRouter free tier
* 🚫 No subscription, no credit card

---

## 📋 Requirements

* Node.js v18+ → [https://nodejs.org/](https://nodejs.org/)
* Git → [https://git-scm.com/](https://git-scm.com/)
* Terminal (CMD / PowerShell / Bash)

---

## ⚡ Quick Setup — Windows

### Step 1 — Install Claude Code

```cmd
npm install -g @anthropic-ai/claude-code
```

---

### Step 2 — Get FREE Token

👉 Register: [https://agentrouter.org/register?aff=TAGp](https://agentrouter.org/register?aff=TAGp)

👉 Get Token: [https://agentrouter.org/console/token](https://agentrouter.org/console/token)

---

### Step 3 — Set Environment Variables

```cmd
setx ANTHROPIC_BASE_URL "https://agentrouter.org/"
setx ANTHROPIC_AUTH_TOKEN "sk-YOUR_TOKEN_HERE"
setx ANTHROPIC_MODEL "claude-3-5-sonnet-20241022"
setx CLAUDE_CODE_USE_AUTH_TOKEN "true"
```

⚠️ Restart terminal after running above commands

---

### Step 4 — Launch Claude

```cmd
cd your-project-folder
claude
```

---

## 🍎 macOS / Linux Setup

```bash
npm install -g @anthropic-ai/claude-code

export ANTHROPIC_BASE_URL="https://agentrouter.org/"
export ANTHROPIC_AUTH_TOKEN="sk-YOUR_TOKEN_HERE"
export ANTHROPIC_MODEL="claude-3-5-sonnet-20241022"
export CLAUDE_CODE_USE_AUTH_TOKEN="true"

claude
```

---

## 🌐 OpenRouter (FREE Models) 🔥

You can also use OpenRouter for FREE models:

```bash
export ANTHROPIC_BASE_URL="https://openrouter.ai/api/v1"
export ANTHROPIC_AUTH_TOKEN="sk-YOUR_TOKEN_HERE"
export ANTHROPIC_MODEL="openrouter/free"
```

✅ Automatically selects best FREE model
✅ No need to manually choose models

---

## 🤖 Available Models

* claude-3-5-sonnet-20241022 (Recommended)
* claude-haiku-4-5-20251001
* claude-opus-4-6
* deepseek-v3.2
* glm-5.1

---

## 📁 Project Structure

```
claude-code-free/
 ├── index.html
 ├── README.md
 ├── setup-windows.bat
 ├── setup-mac-linux.sh
```

---

## 🔗 Useful Links

* AgentRouter → [https://agentrouter.org/register?aff=TAGp](https://agentrouter.org/register?aff=TAGp)
* Token → [https://agentrouter.org/console/token](https://agentrouter.org/console/token)
* OpenRouter → [https://openrouter.ai](https://openrouter.ai)
* Docs → [https://docs.agentrouter.org](https://docs.agentrouter.org)
* Claude Code → [https://code.claude.com](https://code.claude.com)

---

## 🛠 Troubleshooting

**Command not found**

```bash
npm list -g @anthropic-ai/claude-code
```

Restart terminal after install

---

**Token invalid**

* Re-copy token
* Remove extra spaces
* Restart terminal

---

## ⭐ Support

If this helped:

* ⭐ Star this repo
* 👍 Like the video
* 🔔 Subscribe

---

*Made with ❤️ by Yogeshwar Kumar*
