<#
.SYNOPSIS
    Automated setup wizard for Claude Code with free providers.
.DESCRIPTION
    Guides you through selecting a provider and configuring Claude Code.
.EXAMPLE
    .\install.ps1
#>

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "╔══════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     Claude Code Free — Setup Wizard             ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Check prerequisites
$NodeOk = Get-Command node -ErrorAction SilentlyContinue
$ClaudeOk = Get-Command claude -ErrorAction SilentlyContinue

if (-not $NodeOk) {
    Write-Host "  [!] Node.js is required. Install from https://nodejs.org/" -ForegroundColor Red
    Write-Host "      Press Enter to open the download page, or Ctrl+C to cancel."
    Read-Host
    Start-Process "https://nodejs.org/"
    exit 1
}

Write-Host "  [OK] Node.js installed" -ForegroundColor Green

if (-not $ClaudeOk) {
    Write-Host "  [!] Installing Claude Code globally..."
    & npm install -g @anthropic-ai/claude-code
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  [FAIL] Failed to install Claude Code" -ForegroundColor Red
        exit 1
    }
    Write-Host "  [OK] Claude Code installed" -ForegroundColor Green
} else {
    Write-Host "  [OK] Claude Code installed" -ForegroundColor Green
}

Write-Host ""

# Select provider
$Providers = @(
    @{ Name = "OpenRouter"; File = "settings-openrouter.json" },
    @{ Name = "OpenCode"; File = "settings-opencode.json" },
    @{ Name = "AgentRouter"; File = "settings-agentrouter.json" },
    @{ Name = "NVIDIA NIM"; File = "settings-nvidia.json" },
    @{ Name = "ZenMux"; File = "settings-zenmux.json" },
    @{ Name = "AeroLink"; File = "settings-aerolink.json" },
    @{ Name = "FreeModel"; File = "settings-freemodel.json" },
    @{ Name = "BlueSminds"; File = "settings-bluesminds.json" }
)

Write-Host "  Select a provider:" -ForegroundColor Yellow
for ($i = 0; $i -lt $Providers.Count; $i++) {
    Write-Host "  [$($i+1)] $($Providers[$i].Name)" -ForegroundColor White
}

$Choice = Read-Host "`n  Provider (1-$($Providers.Count))"
if ($Choice -notmatch '^\d+$' -or [int]$Choice -lt 1 -or [int]$Choice -gt $Providers.Count) {
    Write-Host "  Invalid selection." -ForegroundColor Red
    exit 1
}

$Selected = $Providers[[int]$Choice - 1]
$SourceFile = Join-Path $PSScriptRoot "..\settings\$($Selected.File)"
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$TargetFile = Join-Path $ClaudeDir "settings.json"

if (-not (Test-Path $ClaudeDir)) {
    New-Item -ItemType Directory -Path $ClaudeDir -Force | Out-Null
}

Copy-Item -Path $SourceFile -Destination $TargetFile -Force

Write-Host ""
Write-Host "  Installed $($Selected.Name) settings!" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Cyan
Write-Host "  1. Open $TargetFile" -ForegroundColor White
Write-Host "  2. Replace YOUR_API_KEY_HERE with your actual API key" -ForegroundColor White
Write-Host "  3. Run: claude" -ForegroundColor White
Write-Host ""
