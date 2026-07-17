# AgentRouter

## Overview

[AgentRouter](https://agentrouter.org) is an AI routing platform that provides access to Claude models with a generous free tier. It uses `ANTHROPIC_AUTH_TOKEN` for authentication.

## Quick Start

1. Sign up at [agentrouter.org](https://agentrouter.org)
2. Generate an API key from the dashboard
3. Copy `settings/settings-agentrouter.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://agentrouter.org` |
| **Auth Method** | Auth Token (`ANTHROPIC_AUTH_TOKEN`) |
| **Free Tier** | Yes |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://agentrouter.org",
  "ANTHROPIC_AUTH_TOKEN": "YOUR_API_KEY_HERE",
  "CLAUDE_CODE_USE_AUTH_TOKEN": "true",
  "ANTHROPIC_MODEL": "claude-opus-4-8"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| claude-opus-4-8 | Yes | Claude Opus |
| glm-5.2 | Yes | GLM |

## Pros

- Access to Claude Opus on free tier
- Auth token authentication (more secure)
- Agent Teams experimental support
- Tool search enabled

## Cons

- Newer platform
- May have rate limits
- Limited model selection

## Troubleshooting

### "Authentication failed"
Ensure `CLAUDE_CODE_USE_AUTH_TOKEN` is set to `"true"`.

### "Rate limit exceeded"
Wait for the rate limit window to reset.

## Resources

- [Official Website](https://agentrouter.org)
- [Documentation](https://agentrouter.org/docs)

## Support

[Sign up with AgentRouter](https://agentrouter.org/register?aff=TAGp)
