<#
.SYNOPSIS
    Diagnostic tool for Claude Code configuration.
.DESCRIPTION
    Checks if Claude Code is installed, settings file exists, and validates configuration.
.EXAMPLE
    .\doctor.ps1
#>

Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║       Claude Code Doctor                 ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$Issues = 0

# Check Node.js
$NodePath = Get-Command node -ErrorAction SilentlyContinue
if ($NodePath) {
    $NodeVersion = & node --version 2>&1
    Write-Host "  [OK] Node.js: $NodeVersion" -ForegroundColor Green
} else {
    Write-Host "  [FAIL] Node.js not found. Install from https://nodejs.org/" -ForegroundColor Red
    $Issues++
}

# Check Claude Code
$ClaudePath = Get-Command claude -ErrorAction SilentlyContinue
if ($ClaudePath) {
    Write-Host "  [OK] Claude Code: installed" -ForegroundColor Green
} else {
    Write-Host "  [WARN] Claude Code not found in PATH" -ForegroundColor Yellow
}

# Check settings file
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$SettingsFile = Join-Path $ClaudeDir "settings.json"

if (Test-Path $SettingsFile) {
    Write-Host "  [OK] Settings file exists: $SettingsFile" -ForegroundColor Green

    try {
        $Settings = Get-Content $SettingsFile -Raw | ConvertFrom-Json
        if ($Settings.env.ANTHROPIC_BASE_URL) {
            Write-Host "  [OK] Base URL: $($Settings.env.ANTHROPIC_BASE_URL)" -ForegroundColor Green
        } else {
            Write-Host "  [WARN] ANTHROPIC_BASE_URL not set" -ForegroundColor Yellow
        }

        if ($Settings.env.ANTHROPIC_API_KEY -or $Settings.env.ANTHROPIC_AUTH_TOKEN) {
            $Key = if ($Settings.env.ANTHROPIC_API_KEY) { $Settings.env.ANTHROPIC_API_KEY } else { $Settings.env.ANTHROPIC_AUTH_TOKEN }
            if ($Key -eq "YOUR_API_KEY_HERE") {
                Write-Host "  [WARN] API key is placeholder - update with real key" -ForegroundColor Yellow
            } else {
                $Masked = $Key.Substring(0, [Math]::Min(8, $Key.Length)) + "..."
                Write-Host "  [OK] API Key: $Masked" -ForegroundColor Green
            }
        } else {
            Write-Host "  [WARN] No API key configured" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "  [FAIL] Settings file is not valid JSON" -ForegroundColor Red
        $Issues++
    }
} else {
    Write-Host "  [WARN] No settings file at $SettingsFile" -ForegroundColor Yellow
    Write-Host "         Run switch.ps1 to set up a provider" -ForegroundColor DarkGray
}

# Check backups
$BackupDir = Join-Path $ClaudeDir "backups"
if (Test-Path $BackupDir) {
    $Backups = (Get-ChildItem $BackupDir -Filter "*.json").Count
    Write-Host "  [OK] Backups: $Backups found" -ForegroundColor Green
}

Write-Host ""
if ($Issues -eq 0) {
    Write-Host "  All checks passed!" -ForegroundColor Green
} else {
    Write-Host "  Found $Issues issue(s). Please fix the above." -ForegroundColor Red
}
Write-Host ""
