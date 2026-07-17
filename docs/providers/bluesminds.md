# BlueSminds

## Overview

[BlueSminds](https://bluesminds.com) provides AI model access with support for multiple open-source models including GLM, Kimi, and Qwen.

## Quick Start

1. Sign up at [bluesminds.com](https://bluesminds.com)
2. Generate an API key
3. Copy `settings/settings-bluesminds.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://api.bluesminds.com` |
| **Auth Method** | API Key |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://api.bluesminds.com",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "ANTHROPIC_MODEL": "z-ai/glm4.7",
  "ANTHROPIC_DEFAULT_HAIKU_MODEL": "moonshotai/kimi-k2.6",
  "ANTHROPIC_DEFAULT_SONNET_MODEL": "z-ai/glm4.7",
  "ANTHROPIC_DEFAULT_OPUS_MODEL": "qwen/qwen3-next-80b-a3b-instruct",
  "API_TIMEOUT_MS": "30000000"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| z-ai/glm4.7 | Yes | GLM 4.7 |
| moonshotai/kimi-k2.6 | Yes | Kimi K2.6 |
| qwen/qwen3-next-80b-a3b-instruct | Yes | Qwen 3 |

## Pros

- Multiple open-source models
- Extended timeout
- Free tier available
- Tool search support

## Cons

- No Claude models
- Newer platform
- May have rate limits

## Troubleshooting

### "Timeout error"
The extended timeout is configured. If still failing, check provider status.

### "Model not found"
Verify the model name matches exactly as listed.

## Resources

- [Official Website](https://bluesminds.com)
- [Documentation](https://bluesminds.com/docs)

## Support

[Sign up with BlueSminds](https://api.bluesminds.com/register?aff=vzdu)
