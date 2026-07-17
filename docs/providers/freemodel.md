# FreeModel

## Overview

[FreeModel](https://freemodel.dev) offers free AI model access specifically designed for developer tools like Claude Code.

## Quick Start

1. Sign up at [freemodel.dev](https://freemodel.dev)
2. Generate an API key
3. Copy `settings/settings-freemodel.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://cc.freemodel.dev` |
| **Auth Method** | API Key |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://cc.freemodel.dev",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
  "ENABLE_TOOL_SEARCH": "true"
}
```

## Pros

- Purpose-built for Claude Code
- Free tier available
- Simple authentication

## Cons

- Limited to Claude Code use case
- Newer service
- May have rate limits

## Troubleshooting

### "API key invalid"
Regenerate your key at freemodel.dev.

### "Request failed"
Check your remaining free tier quota.

## Resources

- [Official Website](https://freemodel.dev)
- [Documentation](https://freemodel.dev/docs)

## Support

[Sign up with FreeModel](https://freemodel.dev/invite/FRE-5ea6df8e)
