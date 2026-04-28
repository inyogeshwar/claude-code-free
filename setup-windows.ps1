# Claude Code FREE Setup — PowerShell
# Tutorial by: youtube.com/@YogeshwarkumarOfficial
# GitHub: github.com/inyogeshwar/claude-code-free

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  CLAUDE CODE FREE SETUP" -ForegroundColor Cyan
Write-Host "  youtube.com/@YogeshwarkumarOfficial" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Installing Claude Code..." -ForegroundColor Yellow
npm install -g @anthropic-ai/claude-code
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Install failed. Get Node.js from https://nodejs.org/" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 2: Get your FREE AgentRouter API Token" -ForegroundColor Yellow
Write-Host "  Register: https://agentrouter.org/register?aff=TAGp" -ForegroundColor Green
Write-Host "  Get Token: https://agentrouter.org/console/token" -ForegroundColor Green
Write-Host ""
$TOKEN = Read-Host "Paste your token (sk-...)"

if ([string]::IsNullOrEmpty($TOKEN)) {
    Write-Host "ERROR: Token cannot be empty!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Step 3: Setting permanent environment variables..." -ForegroundColor Yellow

[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", "https://agentrouter.org/", "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_AUTH_TOKEN", $TOKEN, "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $TOKEN, "User")
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_MODEL", "claude-sonnet-4-5-20250514", "User")
[System.Environment]::SetEnvironmentVariable("CLAUDE_CODE_USE_AUTH_TOKEN", "true", "User")

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  SETUP COMPLETE!" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Open a NEW terminal window, then run:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  cd your-project-folder" -ForegroundColor White
Write-Host "  claude" -ForegroundColor White
Write-Host ""
Write-Host "Subscribe: youtube.com/@YogeshwarkumarOfficial" -ForegroundColor Cyan
Write-Host "GitHub: github.com/inyogeshwar" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"
