# Claude Code + OpenRouter Free Models

Complete Windows configuration and reference guide for using Claude Code with OpenRouter, including the `openrouter/free` router.

---

## Overview

This document covers:

- Claude Code installation on Windows
- OpenRouter API key configuration
- Anthropic-compatible OpenRouter endpoint configuration
- `openrouter/free` model routing
- Permanent PowerShell environment variables
- Session-level configuration
- Model configuration
- Connection verification
- Direct OpenRouter API testing
- Claude Code CLI commands
- Claude Code slash commands
- Gateway model discovery
- Debugging and common authentication errors
- Security recommendations
- Exact-model configuration
- A future universal gateway architecture

## Architecture

```text
┌──────────────────────┐
│      Claude Code     │
│   Windows CLI        │
└──────────┬───────────┘
           │
           │ Anthropic-compatible API
           ▼
┌──────────────────────┐
│      OpenRouter      │
│   API Endpoint       │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│   openrouter/free    │
│   Free Model Router  │
└──────────┬───────────┘
           │
     ┌─────┼─────┐
     ▼     ▼     ▼
   Free   Free   Free
  Model  Model  Model
```

> `openrouter/free` is a routing identifier, not a single permanently fixed model. The selected upstream model can change based on OpenRouter's available free-model routing.

---

## Requirements

- Windows 10/11
- PowerShell
- Claude Code
- OpenRouter account
- OpenRouter API key
- Internet connection

Optional:

- Git
- An existing coding project
- A code editor

---

# 1. Install Claude Code

Open PowerShell and run:

```powershell
irm https://claude.ai/install.ps1 | iex
```

Verify the installation:

```powershell
claude --version
```

Start Claude Code:

```powershell
claude
```

---

# 2. Create an OpenRouter API Key

Create an API key in your OpenRouter account.

Use a new key for your own environment.

### Security

Never:

- Publish the API key
- Commit the API key to Git
- Put the key in a public repository
- Paste the key into screenshots or recordings
- Share the key with others

Use placeholders in documentation:

```text
YOUR_OPENROUTER_API_KEY
```

---

# 3. Session-Only PowerShell Configuration

The following configuration applies only to the current PowerShell session:

```powershell
$env:OPENROUTER_API_KEY="YOUR_OPENROUTER_API_KEY"
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
$env:ANTHROPIC_API_KEY=""
```

Configure the model:

```powershell
$env:ANTHROPIC_DEFAULT_SONNET_MODEL="openrouter/free"
```

Optional model slots:

```powershell
$env:ANTHROPIC_DEFAULT_OPUS_MODEL="openrouter/free"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL="openrouter/free"
$env:CLAUDE_CODE_SUBAGENT_MODEL="openrouter/free"
```

Start Claude Code:

```powershell
claude
```

---

# 4. Permanent User Environment Variables

To persist the configuration for future PowerShell sessions, use Windows user-level environment variables.

## Recommended `setx` commands

```powershell
setx OPENROUTER_API_KEY "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_BASE_URL "https://openrouter.ai/api"
setx ANTHROPIC_AUTH_TOKEN "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_DEFAULT_SONNET_MODEL "openrouter/free"
setx ANTHROPIC_DEFAULT_OPUS_MODEL "openrouter/free"
setx ANTHROPIC_DEFAULT_HAIKU_MODEL "openrouter/free"
setx CLAUDE_CODE_SUBAGENT_MODEL "openrouter/free"
```

### Important

`setx` changes future processes. It does not refresh the environment of the current PowerShell process.

Close PowerShell and open a new PowerShell window after running `setx`.

Verify:

```powershell
$env:ANTHROPIC_BASE_URL
```

Expected:

```text
https://openrouter.ai/api
```

Check whether the API key exists without printing it:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "OPENROUTER_API_KEY is configured"
} else {
    "OPENROUTER_API_KEY is missing"
}
```

Do not use:

```powershell
$env:OPENROUTER_API_KEY
```

in screenshots, screen recordings, logs, or public documentation.

---

# 5. Remove an Existing Anthropic API Key

If an old user-level `ANTHROPIC_API_KEY` is configured and you want to avoid credential conflicts:

```powershell
[Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $null, "User")
```

Open a new PowerShell session afterward.

Check:

```powershell
$env:ANTHROPIC_API_KEY
```

A blank result is expected when the user-level variable has been removed and no higher-precedence source provides it.

---

# 6. Verify Claude Code Configuration

Start Claude Code:

```powershell
claude
```

Inside Claude Code:

```text
/status
```

Check that the active base URL points to:

```text
https://openrouter.ai/api
```

You can also inspect the model selection:

```text
/model
```

---

# 7. Basic Connection Test

Inside Claude Code:

```text
Hello
```

Then:

```text
What model are you currently using?
```

Then, inside a project:

```text
Explain this project's architecture without modifying any files.
```

A successful response confirms basic request routing.

---

# 8. Direct OpenRouter API Test

A direct API test can help separate Claude Code configuration problems from OpenRouter API problems.

## Build the request body

```powershell
$body = @{
    model = "openrouter/free"
    max_tokens = 50
    messages = @(
        @{
            role = "user"
            content = "Say hello in one sentence."
        }
    )
} | ConvertTo-Json -Depth 10
```

## Send the request

```powershell
Invoke-RestMethod `
    -Method Post `
    -Uri "https://openrouter.ai/api/v1/messages" `
    -Headers @{
        "Authorization" = "Bearer $env:OPENROUTER_API_KEY"
        "anthropic-version" = "2023-06-01"
        "Content-Type" = "application/json"
    } `
    -Body $body
```

> Keep the API key in the environment rather than embedding it in the script.

---

# 9. Project Usage

Change to a project directory:

```powershell
cd "C:\\Path\\To\\Your\\Project"
```

Start Claude Code:

```powershell
claude
```

A safe project-analysis request:

```text
Analyze this project without modifying files.

Provide:
1. Framework
2. Runtime
3. Package manager
4. Main entry points
5. Important configuration files
6. Build command
7. Test command
```

A planning-first coding request:

```text
Inspect this project and identify the cause of the current build issue.

Do not modify any files.

Explain:
1. Root cause
2. Affected files
3. Recommended fix
4. Verification steps
```

After reviewing the plan, a modification request can be made explicitly.

---

# 10. Claude Code CLI Commands

## Start an interactive session

```powershell
claude
```

## Start with an initial prompt

```powershell
claude "fix this bug"
```

## One-off print/query mode

```powershell
claude -p "explain this code"
```

## Continue the most recent conversation

```powershell
claude -c
```

## Resume a previous conversation

```powershell
claude -r
```

## Debug mode

```powershell
claude --debug
```

## Check version

```powershell
claude --version
```

---

# 11. Claude Code Slash Commands

Inside Claude Code:

```text
/help
```

Show help.

```text
/status
```

Show current status and configuration.

```text
/model
```

Open model selection.

```text
/clear
```

Clear the current conversation.

```text
/login
```

Start authentication/login flow when applicable.

```text
/logout
```

Sign out when applicable.

```text
/exit
```

Exit Claude Code.

---

# 12. Gateway Model Discovery

If the gateway supports Claude Code model discovery:

```powershell
setx CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY "1"
```

Open a new PowerShell session and start:

```powershell
claude
```

Then:

```text
/model
```

With a compatible gateway, discovered models can be shown in the model picker.

For troubleshooting discovery:

```powershell
claude --debug
```

Search the debug output for:

```text
[gatewayDiscovery]
```

> Model discovery behavior depends on the gateway implementation and its compatibility with Claude Code.

---

# 13. Exact Model vs `openrouter/free`

## Free router

```text
openrouter/free
```

Use this when you want OpenRouter to select from eligible free models.

## Exact model

Use a specific OpenRouter model ID when deterministic model selection is required:

```powershell
setx ANTHROPIC_DEFAULT_SONNET_MODEL "PROVIDER/MODEL-ID"
```

Example format:

```text
provider/model-name
```

Replace the example with the current model ID from OpenRouter.

### Why use an exact model?

- Predictable model selection
- Easier debugging
- Stable benchmarks
- Reproducible test results

### Why use `openrouter/free`?

- Automatic free-model routing
- Convenient experimentation
- No need to manually choose a single free model

---

# 14. Troubleshooting

## 401 Unauthorized

Check that the key exists:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "OpenRouter key is configured"
} else {
    "OpenRouter key is missing"
}
```

Check the base URL:

```powershell
$env:ANTHROPIC_BASE_URL
```

Expected:

```text
https://openrouter.ai/api
```

Refresh the bearer credential:

```powershell
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
```

Restart Claude Code:

```text
/exit
```

Then:

```powershell
claude
```

---

## Wrong Base URL

Set:

```powershell
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
```

For permanent user configuration:

```powershell
setx ANTHROPIC_BASE_URL "https://openrouter.ai/api"
```

Restart PowerShell after using `setx`.

---

## API Key Missing

Check:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "Configured"
} else {
    "Missing"
}
```

For a new PowerShell process, verify the permanent setting was loaded.

---

## `setx` Appears Not to Work

`setx` does not update the environment of the already-open PowerShell window.

Correct workflow:

```text
1. Run setx
2. Close PowerShell
3. Open a new PowerShell
4. Verify $env:VARIABLE
```

---

## Claude Code Still Uses Another Credential

Remove a conflicting user-level Anthropic API key:

```powershell
[Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $null, "User")
```

Then start a new PowerShell session.

---

# 15. Security Best Practices

## Never commit secrets

Do not place real API keys in:

- Git repositories
- `README.md`
- public Markdown files
- screenshots
- screen recordings
- public issue reports
- client-side application code

## Use environment variables

Example:

```powershell
$env:OPENROUTER_API_KEY="YOUR_OPENROUTER_API_KEY"
```

## Rotate leaked keys

If an API key has been exposed publicly, revoke or rotate it and replace it with a new key.

## Do not print the key

Avoid:

```powershell
$env:OPENROUTER_API_KEY
```

Prefer:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "API key configured"
}
```

---

# 16. Global Claude Code Settings

Claude Code global configuration can also be maintained under the user's `.claude` directory.

Windows path:

```text
%USERPROFILE%\.claude```

Example:

```powershell
New-Item -ItemType Directory -Force "$HOME\.claude"
```

Open the directory:

```powershell
explorer "$HOME\.claude"
```

Avoid putting reusable secrets into project-level configuration that can be committed to source control.

---

# 17. Environment Variable Reference

| Variable | Purpose | Example |
|---|---|---|
| `OPENROUTER_API_KEY` | OpenRouter credential | `YOUR_OPENROUTER_API_KEY` |
| `ANTHROPIC_BASE_URL` | Anthropic-compatible API base | `https://openrouter.ai/api` |
| `ANTHROPIC_AUTH_TOKEN` | Bearer authentication | `YOUR_OPENROUTER_API_KEY` |
| `ANTHROPIC_API_KEY` | Anthropic-style API-key credential | Leave unset when not needed |
| `ANTHROPIC_DEFAULT_SONNET_MODEL` | Default Sonnet slot | `openrouter/free` |
| `ANTHROPIC_DEFAULT_OPUS_MODEL` | Default Opus slot | `openrouter/free` |
| `ANTHROPIC_DEFAULT_HAIKU_MODEL` | Default Haiku slot | `openrouter/free` |
| `CLAUDE_CODE_SUBAGENT_MODEL` | Subagent model | `openrouter/free` |
| `CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY` | Gateway model discovery | `1` |

---

# 18. Minimal Permanent Configuration

For a simple Windows setup, the essential user-level variables are:

```powershell
setx OPENROUTER_API_KEY "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_BASE_URL "https://openrouter.ai/api"
setx ANTHROPIC_AUTH_TOKEN "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_DEFAULT_SONNET_MODEL "openrouter/free"
```

Then restart PowerShell:

```powershell
claude
```

Verify:

```text
/status
```

---

# 19. Universal Gateway Architecture

A more advanced architecture can place a local gateway between Claude Code and multiple providers:

```text
                    Claude Code
                         │
                         ▼
            Anthropic-Compatible Endpoint
                         │
                         ▼
              ┌─────────────────────┐
              │ Universal LLM       │
              │ Gateway              │
              └─────────┬───────────┘
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
     OpenRouter       OpenAI          Zen
          │             │             │
          └─────────────┼─────────────┘
                        ▼
                 Provider Adapter
                        │
                        ▼
                    LLM Model
```

Potential gateway responsibilities:

- Provider detection
- Provider registry
- Model discovery
- Protocol normalization
- Request translation
- Response normalization
- Streaming normalization
- Tool-call translation
- Reasoning normalization
- Retry handling
- Failover
- Health checks
- Rate-limit handling
- Logging and observability
- Secret management

---

# 20. Recommended Verification Checklist

```text
[ ] Claude Code installed
[ ] `claude --version` works
[ ] OpenRouter API key created
[ ] API key stored securely
[ ] `ANTHROPIC_BASE_URL` points to OpenRouter
[ ] `ANTHROPIC_AUTH_TOKEN` is configured
[ ] Existing conflicting credential removed if necessary
[ ] `openrouter/free` configured
[ ] New PowerShell session opened after `setx`
[ ] `/status` checked
[ ] `/model` checked
[ ] Direct API request tested
[ ] Real project tested
[ ] API key not committed to Git
```

---

# 21. Quick Start

For a clean Windows setup:

```powershell
irm https://claude.ai/install.ps1 | iex
```

```powershell
setx OPENROUTER_API_KEY "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_BASE_URL "https://openrouter.ai/api"
setx ANTHROPIC_AUTH_TOKEN "YOUR_OPENROUTER_API_KEY"
setx ANTHROPIC_DEFAULT_SONNET_MODEL "openrouter/free"
```

Close PowerShell and open a new PowerShell window.

Verify:

```powershell
$env:ANTHROPIC_BASE_URL
```

Then:

```powershell
claude
```

Inside Claude Code:

```text
/status
```

and:

```text
/model
```

---

# References

- Claude Code Quickstart: https://code.claude.com/docs/en/quickstart
- Claude Code Admin Setup: https://code.claude.com/docs/en/admin-setup
- Claude Code LLM Gateway: https://code.claude.com/docs/en/llm-gateway-connect
- OpenRouter Models: https://openrouter.ai/models
- OpenRouter Free Models Router: https://openrouter.ai/openrouter/free
