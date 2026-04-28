# 🎬 FULL VIDEO SCRIPT
### "How to Use Claude Code FREE UNLIMITED (No GPU, No Limits!) 🤯"
### Channel: youtube.com/@YogeshwarkumarOfficial

---

## 📊 VIDEO INFO
- **Length:** ~10–12 minutes
- **Language:** Hinglish (Hindi + English)
- **Style:** Fast-paced screen recording + face cam
- **Energy:** High excitement, desi dev vibe

---

---

## 🎣 HOOK — [0:00 to 0:30] — MOST IMPORTANT

> 🎯 Pehle 5 seconds = viewer ruke ya na ruke

**[SCREEN: Claude Code terminal running — code generating fast in real time]**

**[FACE CAM: Shocked/excited expression]**

**[VOICE — loud, fast, energetic:]**

> "Bhai sun — yeh Claude AI, Anthropic wala, mere laptop pe FREE mein chal raha hai. Koi GPU nahi, koi ₹2000/month subscription nahi, koi credit card swipe nahi.
>
> Sirf ek free API key — aur tera laptop ek senior developer ban jaata hai jo poora codebase khud padhta hai, files khud edit karta hai, commands khud run karta hai.
>
> Aaj main Yogeshwar — aur aaj tujhe dikhaunga exactly kaise set up karte hain Claude Code — bilkul free — Windows pe — 5 minutes mein."

**[TEXT OVERLAY animated:]**
```
✅ No GPU Required
✅ No Subscription
✅ No Credit Card
✅ 100% FREE
```

**[CUT TO: Screen showing $20/month Anthropic pricing — red X over it]**

> "Yeh sab bhool jao — aaj se free hai."

---

## 📌 INTRO — [0:30 to 1:00]

**[Screen: Claude Code GitHub repo + official docs]**

> "Toh pehle 30 seconds mein samjho — Claude Code kya hai.
>
> Yeh Anthropic ka official AI coding agent hai. Yeh terminal pe directly chalata hai. Poora codebase padhta hai, files edit karta hai, tests run karta hai — bilkul ek senior developer ki tarah behave karta hai.
>
> Normally iske liye Anthropic ka paid API chahiye — $5, $10, $20 per month.
>
> But aaj ek free provider use karenge — AgentRouter — jo free mein Anthropic-compatible API deta hai.
>
> Chalo seedha setup pe aate hain!"

---

## 🛠️ PART 1 — Node.js Check — [1:00 to 2:00]

**[Screen: Open CMD / Terminal]**

> "Pehle check karo — Node.js installed hai ya nahi. Yeh Claude Code ke liye zaroori hai."

**[Type clearly:]**
```
node --version
```

> "Agar version number aaya — perfect, aage badho.
>
> Agar 'node is not recognized' aaya — pause karo video. nodejs.org pe jao, download karo, install karo, wapas aao. 2 minute kaam hai.
>
> Node 18 ya upar chahiye. Most systems mein already hota hai."

---

## 📦 PART 2 — Install Claude Code — [2:00 to 3:00]

**[Screen: Terminal]**

> "Ab install karte hain Claude Code — ek single command hai:"

**[Type slowly, clearly:]**
```
npm install -g @anthropic-ai/claude-code
```

> "Yeh Anthropic ka official npm package hai. -g matlab globally install ho raha hai — matlab kisi bhi folder se `claude` command run kar sakte ho.
>
> Thoda wait karo — packages download ho rahe hain."

**[Show install progress]**

> "Ho gaya! Verify karo:"

```
claude --version
```

> "Version number aaya — Claude Code successfully install ho gaya. Easy hai na!"

---

## 🔑 PART 3 — AgentRouter FREE API — [3:00 to 5:00]

**[Screen: Open browser]**

> "Ab sabse important step — FREE API key lena.
>
> Description mein link hai — agentrouter.org — yahan click karo."

**[Navigate to agentrouter.org/register?aff=TAGp]**

> "AgentRouter ek API routing service hai. Yeh Anthropic-compatible API provide karta hai — free mein.
>
> Registration bilkul simple hai — sirf email aur password. Koi credit card nahi, koi OTP drama nahi."

**[Show registration — blur personal details]**

> "Register ho gaye? Ab console mein jao."

**[Navigate to agentrouter.org/console/token]**

> "Yahan token milega — kuch aisa dikhega — sk- se start hoga.
>
> Is token ko copy karo — yeh tumhara API password hai. Screen record karo toh blur karna mat bhulna!"

**[SHOW TOKEN — BLURRED]**

> "Copy ho gaya? Kisi notes app mein save kar lo temporarily."

---

## ⚙️ PART 4 — Environment Variables — [5:00 to 7:30]

**[Screen: Open NEW CMD window as administrator]**

> "Ab 5 commands paste karne hain — ek ek karke.
>
> Yeh permanent variables set karti hain — ek baar karo, baar baar nahi karna."

**[Paste command 1, press Enter, explain:]**
```
setx ANTHROPIC_BASE_URL "https://agentrouter.org/"
```
> "Pehla command — yeh Claude Code ko batata hai ki Anthropic ki API ki jagah AgentRouter ka address use karo."

**[Pause, show "SUCCESS" message in terminal]**

**[Paste command 2:]**
```
setx ANTHROPIC_AUTH_TOKEN "sk-YOUR_TOKEN_HERE"
```
> "Doosra — yahan apna token paste karo. sk- se shuru hoga jo tumne copy kiya tha."

**[Paste command 3:]**
```
setx ANTHROPIC_API_KEY "sk-YOUR_TOKEN_HERE"
```
> "Teesra — same token again. Claude Code dono variables check karta hai — dono set karna zaroori hai."

**[Paste command 4:]**
```
setx ANTHROPIC_MODEL "claude-sonnet-4-5-20250514"
```
> "Chautha — yeh model select karta hai. Claude Sonnet 4.5 — AgentRouter pe sabse reliable free model hai."

**[Paste command 5:]**
```
setx CLAUDE_CODE_USE_AUTH_TOKEN "true"
```
> "Paanchwan — yeh Claude Code ko force karta hai ki auth token use kare. Yeh line miss mat karna — bina iske kaam nahi karega."

**[BIG TEXT ON SCREEN:]**

> "⚠️ Ab yeh terminal BAND karo. Nayi terminal kholо.
>
> Setx commands tabhi apply hoti hain jab terminal restart karo. Yeh Windows ka rule hai — humara nahi!"

---

## 🚀 PART 5 — Launch! — [7:30 to 9:00]

**[New terminal window opened]**

> "Nayi terminal mein chalo project folder mein:"

```
mkdir test-with-claude
cd test-with-claude
```

> "Ab ek command — bas ek:"

```
claude
```

**[Claude Code welcome screen appears]**

> "DEKHO! Claude Code launch ho gaya!
>
> Yeh official Claude Code hai — free mein — no subscription — chal raha hai mere laptop pe."

**[Type a prompt in Claude Code:]**
```
Create a simple Python web scraper that scrapes headlines from a news site
```

**[Show Claude reading, thinking, generating code...]**

> "Dekho kya ho raha hai — Claude khud files create kar raha hai, code likh raha hai, logic apply kar raha hai.
>
> Yeh kaam manually karte toh 20-30 minute lagte. Claude ne 1 minute mein kar diya.
>
> Yahi hai AI coding agent ka power."

---

## 💡 PART 6 — Pro Tips — [9:00 to 10:30]

**[Face cam + screen split]**

> "Kuch tips jo tumhe save karenge:

**Tip 1 — Model switch karna:**"
```
setx ANTHROPIC_MODEL "claude-haiku-4-5-20251001"
```
> "Agar Sonnet slow lage ya rate limit aaye — Haiku try karo. Faster hai."

**Tip 2 — Existing projects pe use karo:**
> "Claude Code sabse zyada powerful hai existing codebase pe.
>
> Apna koi bhi project folder kholo — `claude` type karo — woh pura codebase khud padhega aur samjhega."

**Tip 3 — Best prompts:**
```
"Explain this entire codebase to me"
"Find all bugs and fix them"
"Add proper error handling throughout"
"Write tests for all functions"
"Refactor this file for better performance"
```

**Tip 4 — Rate limits ke baare mein:**
> "Free tier mein limits hain — agar rate limit error aaye, thoda wait karo.
>
> Normal dev use ke liye mostly kaam karta hai. Heavy use ke liye AgentRouter ka paid plan dekho."

**Tip 5 — GitHub repo:**
> "Iss video ke saare scripts — setup files, yeh script, sab kuch — GitHub pe hain.
>
> Link description mein hai — github.com/inyogeshwar/claude-code-free — star karna mat bhulna!"

---

## 🎬 OUTRO — [10:30 to End]

**[Face cam — direct to camera]**

> "Bhai, toh yahi tha — Claude Code, FREE, 5 minutes setup, zero credit card.
>
> Agar koi problem aaye — comment mein likho — main personally reply karta hoon.
>
> Description mein sab links hain:
> ✅ AgentRouter free registration
> ✅ GitHub repo with all scripts
> ✅ Claude Code official docs
>
> Video helpful laga toh —
> LIKE karo 👍
> SUBSCRIBE karo 🔔
> Apne developer dost ko SHARE karo — unka bhi paisa bachao!
>
> Main hoon Yogeshwar — milte hain next video mein — tab tak, happy coding! 🚀"

**[END SCREEN:]**
- Subscribe button prominent
- Next recommended video
- GitHub repo card

---

## 🎙️ RECORDING TIPS

- Terminal font size badhao — viewers clearly padhein
- Slow down jab commands type karo — copy karne ka time do
- "Yahan click karo" bolte waqt cursor clearly point karo
- Token ko screen pe mat dikhao — blur karo
- Genuine reaction dena — forced excitement mat karo
- Background: lo-fi beats, low volume

## ✅ B-ROLL CHECKLIST

- [ ] `node --version` running
- [ ] `npm install` progress
- [ ] AgentRouter registration (personal info blurred)
- [ ] Token page (token blurred)
- [ ] All 5 `setx` commands with SUCCESS messages
- [ ] New terminal opening
- [ ] `claude` launch — welcome screen
- [ ] Claude generating code in real time
- [ ] Final output files shown in editor
