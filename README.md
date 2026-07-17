<div align="center">

# Claude Code Free

### Configure Claude Code with Free AI Providers — No Paid Subscription Required

[![GitHub Stars](https://img.shields.io/github/stars/inyogeshwar/claude-code-free?style=flat-square&logo=github&color=yellow)](https://github.com/inyogeshwar/claude-code-free/stargazers)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](LICENSE)
[![Last Updated](https://img.shields.io/badge/updated-July%202026-brightgreen?style=flat-square)](CHANGELOG.md)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-purple?style=flat-square)](#installation)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-orange?style=flat-square)](CONTRIBUTING.md)
[![Discussions](https://img.shields.io/github/discussions/inyogeshwar/claude-code-free?style=flat-square)](https://github.com/inyogeshwar/claude-code-free/discussions)

**Claude Code** is Anthropic's official CLI coding agent. This repository provides ready-to-use configuration files, step-by-step guides, and utility scripts to connect Claude Code with officially supported or publicly documented AI providers — including free-tier options where available.

[Installation](#installation) · [Providers](#supported-providers) · [Settings Files](#settings-files) · [Documentation](docs/) · [Website](https://inyogeshwar.github.io/claude-code-free/) · [FAQ](FAQ.md)

---

</div>

## Why This Repository?

Claude Code normally requires an Anthropic API key with a paid plan. Several third-party providers offer **free tiers** or **complimentary credits** for Claude-compatible models. This repository:

- Compiles **officially documented** configuration methods
- Provides **copy-paste ready** settings files
- Includes **utility scripts** for Windows, Linux, and macOS
- Documents **every supported provider** with pros, cons, and troubleshooting
- Keeps everything **open source** under MIT License

> **Disclaimer:** This project does **not** provide cracked APIs, stolen keys, or any method that violates a provider's terms of service. See [DISCLAIMER.md](DISCLAIMER.md).

---

## Features

| Feature | Description |
|---------|-------------|
| **Ready-Made Settings** | Drop-in JSON config files for 8+ providers |
| **Cross-Platform** | Windows (PowerShell), Linux (Bash), macOS (Bash) |
| **Provider Comparison** | Side-by-side table of every supported provider |
| **Utility Scripts** | Switch providers, diagnose issues, backup & restore configs |
| **GitHub Pages Site** | Beautiful, animated documentation website |
| **SEO Optimized** | Open Graph, Twitter Cards, JSON-LD, sitemap |
| **Dark & Light Mode** | Both terminal and website support theming |
| **Always Updated** | Community-driven, actively maintained |

---

## Installation

### Prerequisites

- [Node.js](https://nodejs.org/) v18 or later
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed globally

```bash
npm install -g @anthropic-ai/claude-code
```

### Windows

1. Clone this repository:

```powershell
git clone https://github.com/inyogeshwar/claude-code-free.git
cd claude-code-free
```

2. Copy the settings file for your chosen provider into your Claude Code config directory:

```powershell
# Example: Using OpenRouter
Copy-Item settings\settings-openrouter.json ~\.claude\settings.json
```

3. Open Claude Code — you're ready to go:

```powershell
claude
```

### Linux / macOS

1. Clone this repository:

```bash
git clone https://github.com/inyogeshwar/claude-code-free.git
cd claude-code-free
```

2. Copy the settings file:

```bash
# Example: Using AgentRouter
cp settings/settings-agentrouter.json ~/.claude/settings.json
```

3. Launch Claude Code:

```bash
claude
```

### Quick Switch (Recommended)

Use the included scripts to switch providers instantly:

```bash
# Linux / macOS
chmod +x scripts/switch.sh
./scripts/switch.sh

# Windows
.\scripts\switch.ps1
```

---

## Supported Providers

| Provider | Free Tier | Base URL | Models | Guide |
|----------|:---------:|----------|--------|-------|
| **[OpenRouter](https://openrouter.ai)** | Yes | `https://openrouter.ai/api` | Claude, DeepSeek, Llama, Gemini | [Setup →](docs/providers/openrouter.md) |
| **[OpenCode](https://opencode.ai)** | Yes | `https://opencode.ai/zen/v1` | North Mini Code, DeepSeek V4 | [Setup →](docs/providers/opencode.md) |
| **[AgentRouter](https://agentrouter.org)** | Yes | `https://agentrouter.org` | Claude Opus 4, GLM 5.2 | [Setup →](docs/providers/agentrouter.md) |
| **[NVIDIA NIM](https://build.nvidia.com)** | Yes | `https://integrate.api.nvidia.com/v1` | Llama, Mixtral, Gemma | [Setup →](docs/providers/nvidia.md) |
| **[ZenMux](https://zenmux.ai)** | Yes | `https://zenmux.ai/api/anthropic` | GLM 4.7, StepFun, Kimi K3 | [Setup →](docs/providers/zenmux.md) |
| **[AeroLink](https://aerolink.lat)** | Yes | `https://capi.aerolink.lat` | Claude (proxied) | [Setup →](docs/providers/aerolink.md) |
| **[FreeModel](https://freemodel.dev)** | Yes | `https://cc.freemodel.dev` | Free Claude-compatible | [Setup →](docs/providers/freemodel.md) |
| **[BlueSminds](https://bluesminds.com)** | Yes | `https://api.bluesminds.com` | GLM 4.7, Kimi K2.6, Qwen 3 | [Setup →](docs/providers/bluesminds.md) |
| **[NaraRouter](https://router.bynara.id)** | Yes | `https://router.bynara.id/v1` | Tencent HY3, Agnes Flash | [Setup →](docs/providers/nararouter.md) |

---

## Settings Files

Each provider has a ready-to-use settings file in the `settings/` directory:

```
settings/
├── settings-openrouter.json
├── settings-opencode.json
├── settings-agentrouter.json
├── settings-nvidia.json
├── settings-zenmux.json
├── settings-aerolink.json
├── settings-freemodel.json
├── settings-nararouter.json
└── settings-bluesminds.json
```

### How to Use

1. Choose a provider from the table above
2. Get your API key from the provider's website
3. Open the corresponding settings file
4. Replace `YOUR_API_KEY_HERE` with your actual key
5. Copy the file to `~/.claude/settings.json`

### Settings File Example

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "alwaysThinkingEnabled": true,
  "env": {
    "ANTHROPIC_BASE_URL": "https://openrouter.ai/api",
    "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "ENABLE_TOOL_SEARCH": "true"
  },
  "permissions": {
    "defaultMode": "acceptEdits"
  }
}
```

---

## Provider Setup Guides

Each provider has a detailed guide in the `docs/providers/` directory:

- [OpenRouter](docs/providers/openrouter.md)
- [OpenCode](docs/providers/opencode.md)
- [AgentRouter](docs/providers/agentrouter.md)
- [NVIDIA NIM](docs/providers/nvidia.md)
- [ZenMux](docs/providers/zenmux.md)
- [AeroLink](docs/providers/aerolink.md)
- [FreeModel](docs/providers/freemodel.md)
- [BlueSminds](docs/providers/bluesminds.md)

---

## Scripts

This repository includes utility scripts for managing your Claude Code configuration:

| Script | Platform | Description |
|--------|----------|-------------|
| `scripts/switch.ps1` | Windows | Interactive provider switcher |
| `scripts/switch.sh` | Linux/macOS | Interactive provider switcher |
| `scripts/doctor.ps1` | Windows | Diagnose configuration issues |
| `scripts/doctor.sh` | Linux/macOS | Diagnose configuration issues |
| `scripts/backup.ps1` | Windows | Backup current settings |
| `scripts/backup.sh` | Linux/macOS | Backup current settings |
| `scripts/restore.ps1` | Windows | Restore settings from backup |
| `scripts/restore.sh` | Linux/macOS | Restore settings from backup |
| `scripts/install.ps1` | Windows | Automated setup wizard |
| `scripts/install.sh` | Linux/macOS | Automated setup wizard |

---

## Website

Visit our **[GitHub Pages Website](https://inyogeshwar.github.io/claude-code-free/)** for:

- Interactive provider comparison
- Step-by-step video tutorials
- Searchable FAQ
- Troubleshooting guides
- Beautiful dark-mode interface

---

## Troubleshooting

### Common Issues

<details>
<summary><strong>"Invalid API key" error</strong></summary>

Make sure you've replaced `YOUR_API_KEY_HERE` in the settings file with your actual API key. Verify the key is active on your provider's dashboard.
</details>

<details>
<summary><strong>"Connection refused" or timeout errors</strong></summary>

Some providers have rate limits on free tiers. Try:
1. Wait a few minutes and retry
2. Switch to a different model
3. Check the provider's status page
</details>

<details>
<summary><strong>Models not loading</strong></summary>

Ensure your settings file is at the correct path:
- **Windows:** `%USERPROFILE%\.claude\settings.json`
- **Linux/macOS:** `~/.claude/settings.json`
</details>

<details>
<summary><strong>"Rate limit exceeded"</strong></summary>

Free tiers have usage limits. Try:
1. Reducing request frequency
2. Using a lighter model (Haiku instead of Opus)
3. Waiting for the rate limit window to reset
</details>

For more troubleshooting, see [FAQ.md](FAQ.md) or run the diagnostic script:

```bash
# Linux/macOS
./scripts/doctor.sh

# Windows
.\scripts\doctor.ps1
```

---

## FAQ

**Q: Is this free?**
A: Yes. This repository is MIT licensed and free forever. The providers listed offer free tiers, though some may require signup.

**Q: Will my data be sent to third parties?**
A: Your code is sent to whichever provider you configure. Always review a provider's privacy policy before use.

**Q: Can I use multiple providers?**
A: Yes! Use the `switch` script to swap providers instantly.

**Q: Does this work with VS Code / Cursor?**
A: Claude Code is a CLI tool. For VS Code integration, see the [Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code).

**Q: Are there usage limits?**
A: Each provider has its own limits. Free tiers typically have daily or monthly quotas. Check your provider's dashboard.

See the full [FAQ →](FAQ.md)

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Start

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/claude-code-free.git
cd claude-code-free

# Create a branch
git checkout -b add-new-provider

# Make changes and commit
git add .
git commit -m "Add [Provider Name] configuration"

# Push and create PR
git push origin add-new-provider
```

---

## Roadmap

- [ ] Add more providers (Mistral, Together AI, Groq)
- [ ] VS Code extension for settings management
- [ ] Interactive CLI wizard
- [ ] Provider health monitoring dashboard
- [ ] Video tutorials for each provider
- [ ] API benchmark comparisons

See [ROADMAP.md](ROADMAP.md) for the full roadmap.

---

## Security

See [SECURITY.md](SECURITY.md) for our security policy and how to report vulnerabilities.

---

## Referral Links

If you find this project helpful, consider signing up through our referral links. This helps support the project at no extra cost to you:

| Provider | Link |
|----------|------|
| OpenRouter | [Sign up](https://openrouter.ai) |
| OpenCode | [Sign up](https://opencode.ai) |
| AgentRouter | [Sign up](https://agentrouter.org/register?aff=TAGp) |
| NVIDIA NIM | [Sign up](https://build.nvidia.com) |
| ZenMux | [Sign up](https://zenmux.ai/invite/YGGC5O) |
| AeroLink | [Sign up](https://aerolink.lat/register?ref=7JJTI60) |
| FreeModel | [Sign up](https://freemodel.dev/invite/FRE-5ea6df8e) |
| BlueSminds | [Sign up](https://api.bluesminds.com/register?aff=vzdu) |
| NaraRouter | [Sign up](https://router.bynara.id/register?ref=KB864Z8T) |

---

## License

This project is licensed under the [MIT License](LICENSE).

```
MIT License — Copyright (c) 2026 inyogeshwar
```

---

## Star History

If this project helps you, please give it a star. It helps others discover it!

[![Star History Chart](https://api.star-history.com/svg?repos=inyogeshwar/claude-code-free&type=Date)](https://star-history.com/#inyogeshwar/claude-code-free&Date)

---

<div align="center">

**Built with care by the open source community**

[Website](https://inyogeshwar.github.io/claude-code-free/) · [Documentation](docs/) · [FAQ](FAQ.md) · [Contributing](CONTRIBUTING.md) · [Roadmap](ROADMAP.md)

</div>
