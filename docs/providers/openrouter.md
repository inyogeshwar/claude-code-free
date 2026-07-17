# OpenRouter

## Overview

[OpenRouter](https://openrouter.ai) is an AI model aggregator that provides access to hundreds of AI models through a unified API. It offers a free tier with access to several models, making it a popular choice for Claude Code users.

## Quick Start

1. Sign up at [openrouter.ai](https://openrouter.ai)
2. Generate an API key from the [dashboard](https://openrouter.ai/keys)
3. Copy `settings/settings-openrouter.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://openrouter.ai/api` |
| **Auth Method** | API Key (`ANTHROPIC_API_KEY`) |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://openrouter.ai/api",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "ANTHROPIC_MODEL": "openrouter/free",
  "CLAUDE_CODE_USE_AUTH_TOKEN": "true"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| openrouter/free | Yes | Auto-routed free model |
| anthropic/claude-3.5-sonnet | No | Premium |
| deepseek/deepseek-chat | Varies | Open source |
| meta-llama/llama-3.1-405b | Varies | Open source |
| google/gemini-pro | Varies | Google |

## Pros

- Access to hundreds of models
- Free tier available
- Simple API key authentication
- Anthropic-compatible endpoint
- Active community

## Cons

- Free tier has rate limits
- Some models require payment
- Additional hop through aggregator
- Variable model availability

## Troubleshooting

### "Invalid API key"
Ensure your OpenRouter API key starts with `sk-or-`. Check your [dashboard](https://openrouter.ai/keys).

### "Rate limit exceeded"
Free tier has limits. Wait or switch to a paid model.

### "Model not available"
OpenRouter routes automatically. Use `openrouter/free` for the free tier.

## Resources

- [Official Website](https://openrouter.ai)
- [Documentation](https://openrouter.ai/docs)
- [API Reference](https://openrouter.ai/docs/api-reference)
- [Status Page](https://openrouter.ai/status)

## Support

[Sign up with OpenRouter](https://openrouter.ai)
