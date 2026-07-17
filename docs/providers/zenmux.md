# ZenMux

## Overview

[ZenMux](https://zenmux.ai) is an AI model multiplexer that routes requests across multiple providers. It offers a free tier with access to several models.

## Quick Start

1. Sign up at [zenmux.ai](https://zenmux.ai)
2. Generate an API key from your dashboard
3. Copy `settings/settings-zenmux.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://zenmux.ai/api/anthropic` |
| **Auth Method** | API Key |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://zenmux.ai/api/anthropic",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "ANTHROPIC_MODEL": "z-ai/glm-4.7-flash-free",
  "API_TIMEOUT_MS": "30000000"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| z-ai/glm-4.7-flash-free | Yes | GLM 4.7 Flash |
| stepfun/step-3.7-flash-free | Yes | StepFun Flash |
| moonshotai/kimi-k3-free | Yes | Kimi K3 |

## Pros

- Multiple free models
- Extended timeout (configurable)
- Anthropic-compatible endpoint
- Smart model routing

## Cons

- May have request limits
- Newer platform
- Latency varies by model

## Troubleshooting

### "Timeout error"
Increase `API_TIMEOUT_MS` in your settings file.

### "Model unavailable"
Try a different model from the free tier list.

## Resources

- [Official Website](https://zenmux.ai)
- [Documentation](https://zenmux.ai/docs)

## Support

[Sign up with ZenMux](https://zenmux.ai/invite/YGGC5O)
