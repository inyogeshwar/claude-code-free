# Claude Code + OpenRouter Free Models
## Complete Windows Setup Tutorial

---

## 🎬 INTRO

**VOICEOVER:**

> "Hey everyone! आज के इस tutorial में हम Windows पर Claude Code को OpenRouter के साथ connect करने वाले हैं.
>
> सबसे interesting बात यह है कि हम OpenRouter के `openrouter/free` router को use करेंगे, जिससे हमें available free models के साथ Claude Code का coding workflow test करने का मौका मिलेगा.
>
> मैं आपको बिल्कुल zero से setup कराऊंगा — Claude Code installation, OpenRouter API key, environment variables, connection testing, model configuration, model discovery और final testing — सब कुछ step by step."

---

# PART 1 — REQUIREMENTS

**VOICEOVER:**

> "शुरू करने से पहले हमें तीन चीज़ों की जरूरत होगी:
>
> Number one — Windows PC और PowerShell.
>
> Number two — Claude Code.
>
> Number three — OpenRouter API key."

**SCREEN:**

PowerShell खोलें.

```powershell
$PSVersionTable.PSVersion
```

Optional Git check:

```powershell
git --version
```

अगर Git installed नहीं है तो native Windows पर Git for Windows recommended है क्योंकि Claude Code Bash tool use कर सकता है। Git उपलब्ध न होने पर Claude Code Windows पर PowerShell को shell के रूप में use करता है।

---

# PART 2 — INSTALL CLAUDE CODE

**VOICEOVER:**

> "अब सबसे पहले Claude Code install करते हैं."

**SCREEN COMMAND:**

```powershell
irm https://claude.ai/install.ps1 | iex
```

Installation complete होने के बाद:

```powershell
claude --version
```

अगर version दिखाई देता है, तो Claude Code successfully install हो चुका है.

Official documentation के अनुसार Windows PowerShell के लिए यही current native installation command है।

---

# PART 3 — OPENROUTER ACCOUNT

**VOICEOVER:**

> "अब हमें OpenRouter की API key चाहिए."

Browser में OpenRouter खोलें:

https://openrouter.ai/

फिर:

```text
Dashboard
→ Keys
→ Create Key
```

**IMPORTANT SCREEN NOTE:**

> API key को कभी भी video में expose मत करें.

**VOICEOVER:**

> "मैं अपनी real API key screen पर नहीं दिखाऊंगा. Tutorial में हम placeholder use करेंगे."

Example:

```text
sk-or-v1-XXXXXXXXXXXXXXXX
```

---

# PART 4 — OPENROUTER FREE ROUTER

**VOICEOVER:**

> "अब हम OpenRouter के Free Models Router को देखेंगे."

Browser:

https://openrouter.ai/openrouter/free

यहाँ model identifier है:

```text
openrouter/free
```

**VOICEOVER:**

> "`openrouter/free` एक single fixed model नहीं है. यह OpenRouter का router है जो available free models में से suitable model select करता है."

OpenRouter की current documentation इसे free models के लिए router बताती है और request requirements के आधार पर compatible free models filter कर सकता है।

---

# PART 5 — SET OPENROUTER API KEY

**VOICEOVER:**

> "अब सबसे important step है Claude Code को OpenRouter का endpoint बताना."

PowerShell में:

```powershell
$env:OPENROUTER_API_KEY="YOUR_OPENROUTER_API_KEY"
```

अब Claude Code के लिए gateway variables:

```powershell
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
```

और authentication:

```powershell
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
```

अब अगर कोई existing Anthropic API key set है तो उसे clear करें:

```powershell
$env:ANTHROPIC_API_KEY=""
```

---

# PART 6 — CONFIGURE THE MODEL

अब:

```powershell
$env:ANTHROPIC_DEFAULT_SONNET_MODEL="openrouter/free"
```

अगर testing में दूसरे Claude Code model slots भी same router पर भेजने हैं:

```powershell
$env:ANTHROPIC_DEFAULT_OPUS_MODEL="openrouter/free"

$env:ANTHROPIC_DEFAULT_SONNET_MODEL="openrouter/free"

$env:ANTHROPIC_DEFAULT_HAIKU_MODEL="openrouter/free"
```

Subagent model के लिए:

```powershell
$env:CLAUDE_CODE_SUBAGENT_MODEL="openrouter/free"
```

**VOICEOVER:**

> "अब Claude Code के model routing variables को OpenRouter के `openrouter/free` identifier पर point कर दिया गया है."

---

# PART 7 — START CLAUDE CODE

अब:

```powershell
claude
```

अगर Claude Code खुल जाता है, तो अंदर:

```text
/status
```

**SCREEN पर CHECK करें:**

```text
Anthropic base URL
```

और authentication source.

Claude Code की gateway documentation के अनुसार `/status` में gateway base URL और active credential source दिखाई देना चाहिए।

---

# PART 8 — TEST CONNECTION

Claude Code के अंदर:

```text
Hello
```

फिर:

```text
What model are you using?
```

और:

```text
Explain this project structure.
```

अगर response आता है तो basic connection working है.

---

# PART 9 — DIRECT API TEST

अब Claude Code से बाहर PowerShell में connection को independently test करना useful है.

पहले:

```powershell
$env:ANTHROPIC_BASE_URL
```

यह output होना चाहिए:

```text
https://openrouter.ai/api
```

Credential check:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "OPENROUTER_API_KEY is set"
} else {
    "OPENROUTER_API_KEY is missing"
}
```

**API key को print मत करें.**

---

# PART 10 — TEST OPENROUTER DIRECTLY

OpenRouter का Anthropic-compatible endpoint:

```text
https://openrouter.ai/api/v1/messages
```

और `openrouter/free` model identifier use किया जा सकता है। OpenRouter current documentation इस router के लिए Anthropic Messages API format भी दिखाती है।

PowerShell:

```powershell
$body = @{
    model = "openrouter/free"
    max_tokens = 20
    messages = @(
        @{
            role = "user"
            content = "."
        }
    )
} | ConvertTo-Json -Depth 10

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

अगर JSON response मिलता है तो OpenRouter API key और endpoint working हैं.

---

# PART 11 — START A REAL CODING SESSION

अपने project folder में जाएँ:

```powershell
cd "C:\Path\To\Your\Project"
```

फिर:

```powershell
claude
```

Claude Code में:

```text
What does this project do?
```

फिर:

```text
Explain the folder structure.
```

फिर:

```text
What technologies does this project use?
```

Claude Code project files को जरूरत के अनुसार read कर सकता है; manually हर file context में देने की जरूरत नहीं होती।

---

# PART 12 — REAL CODING TEST

अब एक safe coding test:

```text
Create a simple hello world function in the main entry file and explain the changes before applying them.
```

Claude Code relevant file खोजेगा और change propose करेगा.

**VOICEOVER:**

> "अब हम देख सकते हैं कि यह सिर्फ chatbot की तरह answer नहीं कर रहा, बल्कि actual coding workflow में project files के साथ काम कर रहा है."

---

# PART 13 — GIT TEST

अगर project Git repository है:

```text
What files have I changed?
```

फिर:

```text
Show me the last 5 commits.
```

फिर:

```text
Review my current changes and explain any potential issues.
```

Claude Code Git workflows के साथ conversational तरीके से काम कर सकता है।

---

# PART 14 — CLAUDE CODE BASIC COMMANDS

Terminal commands:

```powershell
claude
```

Interactive mode.

```powershell
claude "fix the build error"
```

One-time task.

```powershell
claude -p "explain this function"
```

One-off query.

```powershell
claude -c
```

Most recent conversation continue करना.

```powershell
claude -r
```

Previous conversation resume करना.

Claude Code की current quickstart documentation इन्हें essential CLI commands के रूप में list करती है।

---

# PART 15 — SESSION COMMANDS

Claude Code के अंदर:

```text
/help
```

Help.

```text
/status
```

Current configuration/status.

```text
/clear
```

Conversation clear.

```text
/login
```

Login/re-authentication.

```text
/logout
```

Saved authentication clear करना.

```text
/model
```

Model selection.

```text
/exit
```

Session exit.

`/help`, `/clear`, `/exit` आदि current quickstart में documented हैं।

---

# PART 16 — MODEL DISCOVERY

अगर हमारा gateway model discovery support करता है, तो Claude Code में:

```powershell
$env:CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY="1"
```

फिर:

```powershell
claude
```

और:

```text
/model
```

Claude Code gateway से model list discover करके model picker में additional models दिखा सकता है। Current documentation के अनुसार discovered models `From gateway` के रूप में दिखाई देते हैं।

Debug के लिए:

```powershell
claude --debug
```

Gateway discovery logs में:

```text
[gatewayDiscovery]
```

देखे जा सकते हैं।

---

# PART 17 — PERSIST THE CONFIGURATION

अब तक हमारे environment variables सिर्फ current PowerShell session के लिए हैं.

अगर permanent user-level configuration चाहिए, तो Claude Code का global settings file use कर सकते हैं:

```text
%USERPROFILE%\.claude\settings.json
```

Official gateway documentation Windows पर इसी global path को बताती है।

Create/open:

```powershell
New-Item -ItemType Directory -Force "$HOME\.claude"
notepad "$HOME\.claude\settings.json"
```

Example structure:

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "https://openrouter.ai/api",
    "ANTHROPIC_AUTH_TOKEN": "YOUR_OPENROUTER_API_KEY",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "openrouter/free",
    "CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY": "1"
  }
}
```

**VOICEOVER:**

> "ध्यान रखें — real API key को Git repository में commit नहीं करना है. Project-level shared settings में secret डालना avoid करें."

Official docs भी project `.claude/settings.json` में credentials रखने से मना करती हैं क्योंकि वह repository के साथ share हो सकता है।

---

# PART 18 — SECURITY CHECK

PowerShell:

```powershell
if ($env:OPENROUTER_API_KEY) {
    Write-Host "OpenRouter key detected"
} else {
    Write-Host "OpenRouter key missing"
}
```

**Never do this in the video:**

```powershell
echo $env:OPENROUTER_API_KEY
```

या:

```powershell
$env:OPENROUTER_API_KEY
```

क्योंकि इससे पूरा secret terminal में दिखाई देगा.

---

# PART 19 — TROUBLESHOOTING

## ERROR 401

अगर:

```text
401 Unauthorized
```

आता है तो सबसे पहले API key check करें.

```powershell
if ($env:OPENROUTER_API_KEY) {
    "Key exists"
}
```

फिर:

```powershell
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
```

और Claude restart करें:

```text
/exit
```

फिर:

```powershell
claude
```

Claude Code documentation के अनुसार credential variable गलत होने पर authentication header mismatch होकर `401` आ सकता है। `ANTHROPIC_AUTH_TOKEN` bearer Authorization header भेजता है, जबकि `ANTHROPIC_API_KEY` `x-api-key` header के लिए है।

---

# PART 20 — WRONG BASE URL

Check:

```powershell
$env:ANTHROPIC_BASE_URL
```

Expected:

```text
https://openrouter.ai/api
```

अगर गलत है:

```powershell
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
```

फिर:

```powershell
claude
```

---

# PART 21 — CHECK CURRENT CONFIGURATION

Claude Code में:

```text
/status
```

देखें:

```text
Anthropic base URL
Auth token
Model
```

अगर base URL OpenRouter दिखा रहा है, तो Claude Code gateway path पर route हो रहा है।

---

# PART 22 — DEBUG MODE

अगर problem समझ नहीं आ रही:

```powershell
claude --debug
```

और gateway discovery/configuration related logs देखें.

---

# PART 23 — DISABLE NONESSENTIAL TRAFFIC

अगर आप चाहते हैं कि Claude Code का nonessential background traffic gateway deployment के बाहर न जाए:

```powershell
$env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
```

लेकिन ध्यान दें कि current Claude Code documentation के अनुसार इससे auto-updates disable होते हैं और gateway model discovery भी disable हो जाती है; इसलिए सामान्य personal tutorial setup में इसे बिना जरूरत enable न करें।

---

# PART 24 — IMPORTANT OPENROUTER LIMITATION

**VOICEOVER:**

> "यहाँ एक important बात समझना जरूरी है.
>
> `openrouter/free` का मतलब यह नहीं है कि हर request हमेशा एक ही model पर जाएगी.
>
> OpenRouter dynamically available free models में से choose करता है.
>
> इसलिए अगर आपको exact model चाहिए, तो `openrouter/free` की जगह उस model का exact OpenRouter model slug configure करना होगा."

OpenRouter की current Free Models Router documentation यही behavior describe करती है।

---

# PART 25 — FINAL TEST PROMPT

Claude Code में:

```text
Analyze this project.

1. Identify the framework.
2. Identify the main entry point.
3. Identify the package manager.
4. Identify the test framework.
5. Find any obvious configuration problems.
6. Do not modify any files yet.
```

फिर:

```text
Now create a small improvement in the project and explain exactly which files you would modify before making the change.
```

---

# PART 26 — DEMO CODING PROMPT

Final demonstration के लिए:

```text
Inspect this project and add a simple health-check endpoint.

First:
1. Understand the existing architecture.
2. Find the correct server entry point.
3. Explain the implementation plan.
4. Identify the files that will change.
5. Wait for approval.
6. Implement the change.
7. Run the relevant tests.
8. Summarize the result.
```

यह demo Claude Code के agentic coding workflow को clearly दिखाएगा.

---

# PART 27 — FINAL RESULT

**SCREEN:**

```text
Claude Code
      ↓
ANTHROPIC_BASE_URL
      ↓
OpenRouter
      ↓
openrouter/free
      ↓
Free Model Router
      ↓
Coding Response
```

**VOICEOVER:**

> "और इसी तरह हमने Windows पर Claude Code को OpenRouter के साथ successfully connect कर दिया.
>
> अब Claude Code का interface वही रहता है, लेकिन model traffic OpenRouter के gateway के through जाता है."

---

# PART 28 — BONUS: FUTURE UNIVERSAL GATEWAY

**VOICEOVER:**

> "और अगर आप इससे भी advanced setup बनाना चाहते हैं, तो इसी architecture को एक universal LLM gateway में convert किया जा सकता है."

```text
Claude Code
     │
     ▼
Universal Gateway
     │
     ├── OpenRouter
     ├── OpenAI
     ├── Anthropic
     ├── Google
     ├── Zen
     └── Custom Providers
```

**VOICEOVER:**

> "इस architecture में Claude Code को सिर्फ एक standard Anthropic-compatible endpoint दिखाई देगा.
>
> Backend में हमारा gateway provider detection, model routing, retries, fallbacks, streaming, tool translation और response normalization handle कर सकता है."

Claude Code की gateway documentation भी centralized gateway को multiple providers के सामने single endpoint और centralized request logging के use case के रूप में describe करती है।

---

# 🎬 OUTRO

**VOICEOVER:**

> "तो दोस्तों, इस tutorial में हमने शुरुआत से लेकर end तक Claude Code को OpenRouter के साथ connect किया.
>
> हमने Claude Code install किया, OpenRouter API key configure की, Anthropic-compatible gateway endpoint set किया, `openrouter/free` configure किया, direct API test किया, Claude Code status verify किया और finally real coding task run किया.
>
> अगर आप next level पर जाना चाहते हैं, तो हमारा next project होगा — एक Windows-native Universal LLM Gateway, जिसमें OpenRouter, OpenAI, Anthropic, Zen और दूसरे providers को एक single Claude Code-compatible endpoint के पीछे connect किया जाएगा.
>
> Thanks for watching! ❤️"

---

# 📌 VIDEO DESCRIPTION — SHORT

**Claude Code + OpenRouter Free Models on Windows 🚀**

इस tutorial में हम step-by-step Windows पर Claude Code install करके OpenRouter के साथ connect करते हैं और `openrouter/free` Free Models Router को coding workflow में use करते हैं.

Covered:

- Claude Code installation
- OpenRouter API setup
- Windows PowerShell configuration
- Anthropic-compatible gateway
- `openrouter/free`
- Environment variables
- Direct API testing
- `/status`
- `/model`
- Model discovery
- Claude Code debugging
- Real coding workflow
- Troubleshooting
- Security best practices

---

# 🏷️ VIDEO CHAPTERS

```text
00:00 Introduction
00:35 Requirements
01:10 Install Claude Code
02:00 OpenRouter Setup
03:00 Create API Key
03:45 OpenRouter Free Router
04:30 Configure PowerShell
06:00 Configure Model
07:00 Start Claude Code
07:45 Check /status
08:30 Test OpenRouter
10:00 Real Coding Test
11:30 Claude Code Commands
13:00 Model Discovery
14:00 Persistent Configuration
15:30 Security
16:30 Troubleshooting
18:00 openrouter/free Explained
19:00 Final Demo
20:00 Universal Gateway Concept
21:00 Outro
```

---

# 🔗 OFFICIAL REFERENCES

Claude Code Quickstart: [Claude Code Quickstart](https://code.claude.com/docs/en/quickstart?utm_source=chatgpt.com)

Claude Code Admin Setup: [Claude Code Admin Setup](https://code.claude.com/docs/en/admin-setup?utm_source=chatgpt.com)

Claude Code LLM Gateway: [Claude Code LLM Gateway](https://code.claude.com/docs/en/llm-gateway-connect?utm_source=chatgpt.com)

OpenRouter Free Models Router: [OpenRouter Free Router](https://openrouter.ai/openrouter/free?utm_source=chatgpt.com)

OpenRouter Free Models: [OpenRouter Free Models](https://openrouter.ai/models?q=free&utm_source=chatgpt.com)

---

## ⚠️ एक correction जो tutorial में बहुत important है

OpenRouter का current `openrouter/free` **fixed model नहीं है**; यह available free models में से dynamically select करता है। इसलिए video में इसे **“Free Models Router”** बोलना, **“एक free model”** नहीं।

और एक practical बात: अगर तुम्हारा अगला goal **“Claude Code + OpenRouter के लिए exact free coding model + automatic fallback + retry + multiple providers”** वाला demo है, तो उसके लिए `openrouter/free` से अलग exact model slug और gateway architecture दिखाना ज्यादा professional रहेगा।