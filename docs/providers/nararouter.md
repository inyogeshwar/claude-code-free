# NaraRouter

## Overview

[NaraRouter](https://router.bynara.id) is an AI routing platform that provides access to Tencent HY3 and other models through a unified API. It offers a free tier with generous limits.

## Quick Start

1. Sign up at [router.bynara.id](https://router.bynara.id/register?ref=KB864Z8T)
2. Generate an API key from the dashboard
3. Copy `settings/settings-nararouter.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://router.bynara.id/v1` |
| **Auth Method** | Auth Token (`ANTHROPIC_AUTH_TOKEN`) |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://router.bynara.id/v1",
  "ANTHROPIC_AUTH_TOKEN": "YOUR_API_KEY_HERE",
  "CLAUDE_CODE_USE_AUTH_TOKEN": "true",
  "ANTHROPIC_MODEL": "tencent-hy3"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| tencent-hy3 | Yes | Tencent HY3 |
| agnes-2.0-flash | Yes | Agnes Flash |

## Pros

- Free tier with generous limits
- Auth token authentication
- Tencent HY3 model access
- Agent Teams experimental support
- Tool search enabled

## Cons

- Newer platform
- Limited model selection
- May have rate limits

## Troubleshooting

### "Authentication failed"
Ensure `CLAUDE_CODE_USE_AUTH_TOKEN` is set to `"true"`.

### "Rate limit exceeded"
Wait for the rate limit window to reset or switch to a lighter model.

## Resources

- [Official Website](https://router.bynara.id)
- [Documentation](https://router.bynara.id/docs)

## Support

[Sign up with NaraRouter](https://router.bynara.id/register?ref=KB864Z8T)
