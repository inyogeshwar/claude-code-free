# Frequently Asked Questions

## General

### What is Claude Code?

Claude Code is an AI-powered coding agent built by Anthropic. It runs in your terminal and can read, write, and edit code across your entire project. [Learn more →](https://docs.anthropic.com/en/docs/claude-code)

### Is this project free?

Yes. This repository is completely free and open source under the [MIT License](LICENSE). The configuration files and scripts are yours to use however you like.

### Do I need to pay for Claude Code?

Claude Code requires an Anthropic API key or a compatible provider. Some providers offer free tiers. See the [provider comparison table](README.md#supported-providers) for options.

### Is this legal?

Yes. This project uses only officially documented APIs and public endpoints. We do not provide cracked keys, bypasses, or any unauthorized access methods. See [DISCLAIMER.md](DISCLAIMER.md).

---

## Setup & Installation

### Where should I put the settings file?

| Platform | Path |
|----------|------|
| Windows | `%USERPROFILE%\.claude\settings.json` |
| Linux | `~/.claude/settings.json` |
| macOS | `~/.claude/settings.json` |

### Can I use multiple providers at the same time?

No, but you can switch between providers using the included scripts:

```bash
# Linux/macOS
./scripts/switch.sh

# Windows
.\scripts\switch.ps1
```

### How do I update my API key?

1. Edit the settings file at `~/.claude/settings.json`
2. Replace the old key with the new one
3. Restart Claude Code

### Do I need Node.js?

Yes. Claude Code is a Node.js application. Install it with:

```bash
npm install -g @anthropic-ai/claude-code
```

---

## Providers

### Which provider is the best?

There's no single "best" provider. It depends on your needs:

- **Best free tier:** Check each provider's current offering
- **Best models:** OpenRouter and AgentRouter offer access to Claude Opus
- **Lowest latency:** Depends on your geographic location
- **Most models:** OpenRouter has the widest selection

### Are free tiers really free?

Most providers offer a limited free tier for new users. This may include:
- Daily or monthly request limits
- Slower response times
- Limited model selection
- Time-limited trial periods

Always check the provider's current pricing page.

### What happens when I hit the rate limit?

1. Wait for the rate limit window to reset (usually 1-24 hours)
2. Switch to a lighter model (Haiku instead of Opus)
3. Try a different provider
4. Upgrade to a paid tier if needed

### Can I use my Anthropic API key with these providers?

No. Each provider has its own API keys. Sign up on the provider's website to get your key.

---

## Troubleshooting

### Claude Code says "Invalid API key"

1. Verify your API key is correct (no extra spaces or characters)
2. Make sure the key is active on the provider's dashboard
3. Check that `ANTHROPIC_API_KEY` or `ANTHROPIC_AUTH_TOKEN` is set correctly in settings

### Claude Code says "Connection refused"

1. Check your internet connection
2. Verify the `ANTHROPIC_BASE_URL` is correct
3. The provider might be temporarily down — check their status page

### Claude Code says "Model not found"

1. Check that the model name in your settings is supported by the provider
2. Some models may have been renamed or deprecated
3. Try using the default model for that provider

### Settings file changes aren't taking effect

1. Make sure you saved the file
2. Restart Claude Code (close and reopen)
3. Verify the file is at the correct path
4. Check for JSON syntax errors (use a JSON validator)

### How do I run the diagnostic script?

```bash
# Linux/macOS
./scripts/doctor.sh

# Windows PowerShell
.\scripts\doctor.ps1
```

This will check your configuration and report any issues.

---

## Contributing

### How can I add a new provider?

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed instructions.

### I found a bug

[Open an issue](https://github.com/inyogeshwar/claude-code-free/issues/new) with steps to reproduce.

### I want to request a feature

[Open a feature request issue](https://github.com/inyogeshwar/claude-code-free/issues/new?template=feature_request.md) or start a [discussion](https://github.com/inyogeshwar/claude-code-free/discussions).

---

## Still Have Questions?

Open a [GitHub Discussion](https://github.com/inyogeshwar/claude-code-free/discussions) and the community will help you out.
