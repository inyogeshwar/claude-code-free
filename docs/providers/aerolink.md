# AeroLink

## Overview

[AeroLink](https://aerolink.lat) provides a proxy service for Claude Code with a simple API key authentication system.

## Quick Start

1. Sign up at [aerolink.lat](https://aerolink.lat)
2. Get your API key
3. Copy `settings/settings-aerolink.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://capi.aerolink.lat/` |
| **Auth Method** | API Key |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "ANTHROPIC_BASE_URL": "https://capi.aerolink.lat/",
  "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
}
```

## Pros

- Simple setup
- Minimal configuration needed
- Fast response times

## Cons

- Limited documentation
- Newer service
- Fewer model options

## Troubleshooting

### "Connection error"
Verify the base URL ends with a trailing slash: `https://capi.aerolink.lat/`

### "Invalid key"
Check your API key at the AeroLink dashboard.

## Resources

- [Official Website](https://aerolink.lat)

## Support

[Sign up with AeroLink](https://aerolink.lat/register?ref=7JJTI60)
