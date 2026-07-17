# OpenCode

## Overview

[OpenCode](https://opencode.ai) provides AI-powered development tools with a free tier that supports Claude Code integration. It offers its own model routing and competitive pricing.

## Quick Start

1. Sign up at [opencode.ai](https://opencode.ai)
2. Generate an API key from your dashboard
3. Copy `settings/settings-opencode.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://opencode.ai/zen/v1` |
| **Auth Method** | API Key |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://opencode.ai/zen/v1",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "ANTHROPIC_MODEL": "north-mini-code-free"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| north-mini-code-free | Yes | Free tier |
| deepseek-v4-flash-free | Yes | Free tier |
| claude-opus-4-8 | No | Premium |

## Pros

- Dedicated free tier for coding
- Fast model routing
- Simple authentication
- Competitive pricing

## Cons

- Smaller model selection than OpenRouter
- Free tier may have limitations
- Newer platform

## Troubleshooting

### "Connection refused"
Verify the base URL is `https://opencode.ai/zen/v1`.

### "Model not found"
Ensure you're using a model available on your plan tier.

## Resources

- [Official Website](https://opencode.ai)
- [Documentation](https://opencode.ai/docs)

## Support

[Sign up with OpenCode](https://opencode.ai)
