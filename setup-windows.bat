@echo off
title Claude Code FREE Setup by Yogeshwar Kumar
color 0A

echo.
echo ================================================================
echo   CLAUDE CODE FREE SETUP
echo   Tutorial by: youtube.com/@YogeshwarkumarOfficial
echo ================================================================
echo.

echo Step 1: Installing Claude Code globally...
echo.
call npm install -g @anthropic-ai/claude-code
if %errorlevel% neq 0 (
    echo.
    echo ERROR: npm install failed!
    echo Make sure Node.js is installed: https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo ================================================================
echo Step 2: Enter your AgentRouter FREE API Token
echo.
echo  Register FREE: https://agentrouter.org/register?aff=TAGp
echo  Get Token:     https://agentrouter.org/console/token
echo ================================================================
echo.
set /p TOKEN="Paste your token (sk-...): "

if "%TOKEN%"=="" (
    echo ERROR: Token cannot be empty!
    pause
    exit /b 1
)

echo.
echo Step 3: Setting permanent environment variables...

setx ANTHROPIC_BASE_URL "https://agentrouter.org/"
setx ANTHROPIC_AUTH_TOKEN "%TOKEN%"
setx ANTHROPIC_API_KEY "%TOKEN%"
setx ANTHROPIC_MODEL "claude-sonnet-4-5-20250514"
setx CLAUDE_CODE_USE_AUTH_TOKEN "true"

echo.
echo ================================================================
echo   SETUP COMPLETE! ✓
echo ================================================================
echo.
echo   IMPORTANT: Close this window ^ open a NEW terminal, then:
echo.
echo     cd your-project-folder
echo     claude
echo.
echo ================================================================
echo   Subscribe for more free AI tools:
echo   youtube.com/@YogeshwarkumarOfficial
echo   GitHub: github.com/inyogeshwar
echo ================================================================
echo.
pause
