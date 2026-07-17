# NVIDIA NIM

## Overview

[NVIDIA NIM](https://build.nvidia.com) provides access to optimized AI models through NVIDIA's inference infrastructure. It offers a free tier for development and testing.

## Quick Start

1. Sign up at [build.nvidia.com](https://build.nvidia.com)
2. Generate an API key from your NVIDIA account
3. Copy `settings/settings-nvidia.json` to `~/.claude/settings.json`
4. Replace `YOUR_API_KEY_HERE` with your NVIDIA API key
5. Launch Claude Code: `claude`

## Configuration

| Setting | Value |
|---------|-------|
| **Base URL** | `https://integrate.api.nvidia.com/v1` |
| **Auth Method** | API Key |
| **Free Tier** | Yes (limited credits) |
| **API Format** | Anthropic-compatible |

## Environment Variables

```json
{
  "ANTHROPIC_BASE_URL": "https://integrate.api.nvidia.com/v1",
  "ANTHROPIC_API_KEY": "YOUR_API_KEY_HERE",
  "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
}
```

## Available Models

| Model | Free | Type |
|-------|:----:|------|
| meta/llama-3.1-405b-instruct | Credits | Open source |
| mistralai/mixtral-8x22b-instruct-v0.1 | Credits | Open source |
| google/gemma-2-27b-it | Credits | Open source |

## Pros

- NVIDIA-optimized inference
- High-performance infrastructure
- Free credits for new accounts
- Wide model selection

## Cons

- Free credits are limited
- Requires NVIDIA account
- Some models are premium only

## Troubleshooting

### "Insufficient credits"
Check your remaining credits at the NVIDIA dashboard.

### "Model not available"
Some models may require a higher credit tier.

## Resources

- [Official Website](https://build.nvidia.com)
- [Documentation](https://docs.api.nvidia.com)
- [API Reference](https://docs.api.nvidia.com/nim/reference)

## Support

[Sign up with NVIDIA NIM](https://build.nvidia.com)
