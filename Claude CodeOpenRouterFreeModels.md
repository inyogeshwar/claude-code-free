# 🎬 CLAUDE CODE + OPENROUTER FREE MODELS

## Complete Windows Setup — 2026 Updated Tutorial

---

## ⏱️ 00:00 — HOOK

**SCREEN:** Claude Code terminal + OpenRouter dashboard का fast montage.

**VOICEOVER:**

> "क्या आप Claude Code को सिर्फ Anthropic के models तक limited रखना चाहते हैं?
>
> आज मैं आपको दिखाने वाला हूँ कि Windows पर Claude Code को OpenRouter के साथ कैसे connect करें — और OpenRouter के `openrouter/free` router के जरिए available free models को Claude Code के coding workflow में कैसे use करें.
>
> इस पूरे setup को हम zero से करेंगे.
>
> Claude Code installation से लेकर API configuration, model routing, testing, troubleshooting और real coding demo तक — सब कुछ इसी video में."

**ON SCREEN:**

```text
CLAUDE CODE
      ↓
OPENROUTER
      ↓
openrouter/free
      ↓
FREE MODELS
```

---

# ⏱️ 00:25 — IMPORTANT 2026 UPDATE

**VOICEOVER:**

> "और video शुरू करने से पहले एक important YouTube update.
>
> YouTube ने announce किया है कि 24 August 2026 से public views की counting में बदलाव होगा.
>
> अब एक view video के play होते ही, यानी first frame से count होगी.
>
> इसलिए इस tutorial में मैं शुरुआत से ही actual setup और result दिखाऊंगा — कोई लंबा intro नहीं."

**ON SCREEN:**

```text
YouTube View Counting Update

24 August 2026

View starts counting
→ When playback begins
→ From the first frame
```

YouTube के official community announcement के अनुसार यह नया counting standard Shorts के अलावा अन्य public videos पर भी लागू होगा।

---

# ⏱️ 01:00 — WHAT WE ARE BUILDING

**VOICEOVER:**

> "सबसे पहले architecture समझ लेते हैं."

**SCREEN:**

```text
Windows PC
    │
    ▼
Claude Code
    │
    │ Anthropic-compatible API
    ▼
OpenRouter
    │
    ▼
openrouter/free
    │
    ├── Free Model 1
    ├── Free Model 2
    ├── Free Model 3
    └── Other available free models
```

**VOICEOVER:**

> "`openrouter/free` खुद एक fixed model नहीं है.
>
> यह OpenRouter का Free Models Router है, जो available free models में से suitable model select कर सकता है."

---

# ⏱️ 01:35 — REQUIREMENTS

**SCREEN:**

```text
✓ Windows
✓ PowerShell
✓ Claude Code
✓ OpenRouter Account
✓ OpenRouter API Key
```

**VOICEOVER:**

> "आपको सिर्फ Windows PC, PowerShell, Claude Code और OpenRouter account की जरूरत होगी."

---

# ⏱️ 02:00 — CHECK POWERSHELL

**COMMAND:**

```powershell
$PSVersionTable.PSVersion
```

**VOICEOVER:**

> "सबसे पहले PowerShell version check कर लेते हैं."

---

# ⏱️ 02:20 — INSTALL CLAUDE CODE

**COMMAND:**

```powershell
irm https://claude.ai/install.ps1 | iex
```

फिर:

```powershell
claude --version
```

**VOICEOVER:**

> "Installation complete होने के बाद `claude --version` run करेंगे.
>
> अगर version दिखाई देता है, तो Claude Code successfully installed है."

---

# ⏱️ 03:00 — OPENROUTER ACCOUNT

**SCREEN:**

OpenRouter dashboard.

**VOICEOVER:**

> "अब OpenRouter पर जाएं और एक API key create करें."

**ON SCREEN:**

```text
OpenRouter
→ Dashboard
→ Keys
→ Create Key
```

**IMPORTANT:**

```text
NEVER SHOW YOUR REAL API KEY
```

**VOICEOVER:**

> "मैं video में अपनी real API key कभी display नहीं करूंगा.
>
> आप अपनी key को हमेशा private रखें."

---

# ⏱️ 03:40 — OPENROUTER FREE ROUTER

**SCREEN:**

```text
openrouter/free
```

**VOICEOVER:**

> "अब हम OpenRouter के Free Models Router पर आते हैं."

**SCREEN:**

```text
Model:
openrouter/free
```

**VOICEOVER:**

> "ध्यान रखें — `openrouter/free` एक specific model नहीं है.
>
> यह एक routing endpoint है, जो available free models में से model choose करता है."

---

# ⏱️ 04:20 — CONFIGURE API KEY

PowerShell:

```powershell
$env:OPENROUTER_API_KEY="YOUR_OPENROUTER_API_KEY"
```

**VOICEOVER:**

> "यहाँ अपनी नई OpenRouter API key डालें."

फिर:

```powershell
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
```

फिर:

```powershell
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
```

और:

```powershell
$env:ANTHROPIC_API_KEY=""
```

**VOICEOVER:**

> "यहाँ हम Claude Code को बता रहे हैं कि Anthropic-compatible requests OpenRouter के endpoint पर भेजनी हैं."

---

# ⏱️ 05:20 — CONFIGURE MODEL

```powershell
$env:ANTHROPIC_DEFAULT_SONNET_MODEL="openrouter/free"
```

Optional testing:

```powershell
$env:ANTHROPIC_DEFAULT_OPUS_MODEL="openrouter/free"

$env:ANTHROPIC_DEFAULT_HAIKU_MODEL="openrouter/free"
```

Subagent:

```powershell
$env:CLAUDE_CODE_SUBAGENT_MODEL="openrouter/free"
```

**VOICEOVER:**

> "अब Claude Code के model variables को OpenRouter के Free Router पर point कर दिया गया है."

---

# ⏱️ 06:15 — START CLAUDE CODE

```powershell
claude
```

Claude Code खुलने के बाद:

```text
/status
```

**VOICEOVER:**

> "अब `/status` से हम configuration verify करेंगे."

**SCREEN:**

```text
Base URL:
https://openrouter.ai/api
```

---

# ⏱️ 06:50 — FIRST TEST

Claude Code:

```text
Hello
```

फिर:

```text
What model are you currently using?
```

फिर:

```text
Explain what you can do in this project.
```

**VOICEOVER:**

> "अगर response आ रहा है, तो हमारा basic connection working है."

---

# ⏱️ 07:30 — DIRECT OPENROUTER API TEST

PowerShell:

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

फिर:

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

**VOICEOVER:**

> "अब हम Claude Code को हटाकर directly OpenRouter endpoint test कर रहे हैं.
>
> अगर यहाँ response मिलता है, तो API key और endpoint दोनों working हैं."

---

# ⏱️ 08:40 — REAL PROJECT OPEN करें

```powershell
cd "C:\Path\To\Your\Project"
```

फिर:

```powershell
claude
```

Claude Code में:

```text
Analyze this project.

Do not modify anything.

Tell me:
1. What framework is being used?
2. What is the main entry point?
3. What package manager is being used?
4. What files are most important?
```

**VOICEOVER:**

> "अब हम actual coding project में Claude Code को test करेंगे."

---

# ⏱️ 09:40 — CLAUDE CODE AGENT DEMO

Prompt:

```text
Inspect this project and identify the cause of the current build error.

Do not modify any files.

Explain:
1. The root cause
2. The affected files
3. The recommended fix
```

**VOICEOVER:**

> "यहाँ हम पहले analysis करवा रहे हैं और modification नहीं करने दे रहे."

---

# ⏱️ 10:30 — CODING DEMO

Prompt:

```text
Now fix the identified build issue.

Before modifying anything:
1. Explain the changes.
2. List the files you will modify.
3. Apply the minimum required changes.
4. Run the relevant tests.
5. Summarize the result.
```

**VOICEOVER:**

> "अब Claude Code actual project modification कर सकता है और उसके बाद tests run कर सकता है."

---

# ⏱️ 11:40 — IMPORTANT CLAUDE CODE COMMANDS

**SCREEN:**

```text
claude
```

Start Claude Code.

```text
claude "fix this bug"
```

Direct task.

```text
claude -p "explain this code"
```

Print-style one-off query.

```text
claude -c
```

Continue recent conversation.

```text
claude -r
```

Resume previous conversation.

---

# ⏱️ 12:40 — CLAUDE CODE SLASH COMMANDS

Claude Code के अंदर:

```text
/help
```

```text
/status
```

```text
/model
```

```text
/clear
```

```text
/login
```

```text
/logout
```

```text
/exit
```

**VOICEOVER:**

> "इन commands को याद रखना जरूरी है क्योंकि इन्हीं से आप Claude Code session और configuration manage कर सकते हैं."

---

# ⏱️ 13:30 — MODEL PICKER

Claude Code:

```text
/model
```

**VOICEOVER:**

> "अब `/model` से model selection interface खोल सकते हैं."

अगर gateway model discovery configure किया गया है:

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

**VOICEOVER:**

> "अगर आपका gateway model discovery support करता है, तो gateway से available models model picker में दिखाई दे सकते हैं."

---

# ⏱️ 14:30 — DEBUGGING

अगर connection में problem आए:

```powershell
claude --debug
```

**VOICEOVER:**

> "Debugging के लिए `--debug` बहुत useful है."

फिर configuration:

```powershell
$env:ANTHROPIC_BASE_URL
```

Expected:

```text
https://openrouter.ai/api
```

API key existence check:

```powershell
if ($env:OPENROUTER_API_KEY) {
    "OpenRouter API key is configured"
} else {
    "OpenRouter API key is missing"
}
```

**VOICEOVER:**

> "हम कभी भी पूरी API key terminal में print नहीं करेंगे."

---

# ⏱️ 15:30 — COMMON 401 ERROR

अगर:

```text
401 Unauthorized
```

आता है:

```powershell
$env:ANTHROPIC_AUTH_TOKEN=$env:OPENROUTER_API_KEY
```

फिर:

```text
/exit
```

और:

```powershell
claude
```

**VOICEOVER:**

> "401 का सबसे common कारण गलत या missing authentication configuration है."

---

# ⏱️ 16:15 — WRONG BASE URL

Check:

```powershell
$env:ANTHROPIC_BASE_URL
```

अगर गलत है:

```powershell
$env:ANTHROPIC_BASE_URL="https://openrouter.ai/api"
```

फिर Claude Code restart करें.

---

# ⏱️ 16:50 — SECURITY

**SCREEN — RED TEXT:**

```text
DO NOT:
❌ Upload API keys to GitHub
❌ Show API keys in tutorials
❌ Put secrets inside public project settings
❌ Share your OpenRouter key
```

**VOICEOVER:**

> "एक बहुत important security tip.
>
> API key को कभी GitHub पर commit मत करें.
>
> Video recording में भी key को blur या placeholder से replace करें."

---

# ⏱️ 17:30 — `openrouter/free` VS EXACT MODEL

**VOICEOVER:**

> "अब सबसे important distinction."

**SCREEN:**

```text
openrouter/free
        ≠
Specific Model
```

**VOICEOVER:**

> "`openrouter/free` router है.
>
> अगर आपको हमेशा एक exact model चाहिए, तो उस model का exact OpenRouter slug configure करना होगा.
>
> इससे model selection predictable रहेगा."

---

# ⏱️ 18:20 — UNIVERSAL GATEWAY TEASER

**SCREEN:**

```text
             Claude Code
                  │
                  ▼
       ┌────────────────────┐
       │ Universal Gateway  │
       └─────────┬──────────┘
                 │
       ┌─────────┼─────────┐
       ▼         ▼         ▼
  OpenRouter   OpenAI     Zen
       │
       ▼
  Other Providers
```

**VOICEOVER:**

> "और अगर आप इस setup को next level पर ले जाना चाहते हैं, तो हम एक Universal LLM Gateway बना सकते हैं.
>
> Claude Code को सिर्फ एक Anthropic-compatible endpoint मिलेगा.
>
> लेकिन backend में gateway automatically provider detect करेगा, model route करेगा, failures पर retry करेगा और जरूरत पड़ने पर दूसरे provider पर failover करेगा."

---

# ⏱️ 19:30 — FINAL DEMO PROMPT

Claude Code:

```text
Analyze this project completely.

Do not modify any files yet.

Tell me:

1. Framework
2. Runtime
3. Package manager
4. Entry points
5. Important configuration files
6. Build command
7. Test command
8. Potential security issues
9. Recommended improvements

Wait for my approval before making changes.
```

**VOICEOVER:**

> "और यह हमारा final test है."

---

# ⏱️ 20:30 — FINAL RESULT

**SCREEN:**

```text
Windows
   ↓
Claude Code
   ↓
Anthropic-compatible API
   ↓
OpenRouter
   ↓
openrouter/free
   ↓
Free Model
   ↓
Coding Agent
```

**VOICEOVER:**

> "तो अब हमारे पास Windows पर Claude Code और OpenRouter का working setup है."

---

# ⏱️ 21:00 — OUTRO

**VOICEOVER:**

> "अगर आप Claude Code को OpenRouter के साथ use करना चाहते थे, तो अब आपके पास complete setup है.
>
> हमने Claude Code install किया, OpenRouter configure किया, `openrouter/free` setup किया, API connection test किया, model configuration check की और finally real coding task run किया.
>
> और next part में हम इससे भी powerful setup बनाएंगे — एक Universal LLM Gateway, जिसमें OpenRouter, OpenAI, Anthropic, Zen और दूसरे compatible providers को एक single endpoint से manage किया जा सकेगा.
>
> अगर यह tutorial useful लगा, तो video को like करें और channel को subscribe करें.
>
> मिलते हैं next tutorial में. 🚀"

---

# 📌 VIDEO TITLE OPTIONS

### Option 1 — Recommended

**Claude Code + OpenRouter FREE Models on Windows 🚀 | Full Setup 2026**

### Option 2

**Use Claude Code With OpenRouter FREE Models | Windows Setup 2026**

### Option 3

**Claude Code + OpenRouter Setup 🔥 | FREE AI Coding Models on Windows**

---

# 🖼️ THUMBNAIL TEXT

**Option A**

```text
CLAUDE CODE
+
OPENROUTER

FREE MODELS 🚀
```

**Option B**

```text
CLAUDE CODE
WITHOUT CLAUDE API?

OPENROUTER 🔥
```

**Option C**

```text
CLAUDE CODE
×
OPENROUTER

2026 SETUP
```

---

# 📌 PINNED COMMENT

> 🚀 **Claude Code + OpenRouter Setup**
>
> In this tutorial we configured Claude Code on Windows with OpenRouter's `openrouter/free` router.
>
> ⚠️ Never share your real API key. Use your own OpenRouter key and keep it private.
>
> Next tutorial: **Universal LLM Gateway for Claude Code — OpenRouter + OpenAI + Zen + automatic fallback & retry.**

---

# 🔗 OFFICIAL SOURCES

* [YouTube — Public Views Counting Update](https://support.google.com/youtube/thread/433409976?utm_source=chatgpt.com)
* [Claude Code Quickstart](https://code.claude.com/docs/en/quickstart?utm_source=chatgpt.com)
* [Claude Code Admin Setup](https://code.claude.com/docs/en/admin-setup?utm_source=chatgpt.com)
* [Claude Code LLM Gateway](https://code.claude.com/docs/en/llm-gateway-connect?utm_source=chatgpt.com)
* [OpenRouter Free Models](https://openrouter.ai/models?q=free&utm_source=chatgpt.com)

---

## 🎯 सबसे जरूरी YouTube बदलाव

तुम्हारे **24 August 2026 के बाद publish होने वाले video** में शुरुआत को इस तरह रखना बेहतर है:

**0–3 sec:** Final result दिखाओ
**3–10 sec:** “आज क्या मिलेगा”
**10–20 sec:** Actual terminal/setup
**20 sec onward:** Tutorial

क्योंकि YouTube के नए announcement के अनुसार view अब playback शुरू होते ही count होगी।

इसलिए मैंने ऊपर script को **“long intro → tutorial”** की जगह **“result → promise → immediate tutorial”** format में रखा है। 🔥
