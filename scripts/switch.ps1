<#
.SYNOPSIS
    Interactive provider switcher for Claude Code.
.DESCRIPTION
    Lists available provider settings files and copies the selected one
    to ~/.claude/settings.json. Backs up the current settings first.
.EXAMPLE
    .\switch.ps1
#>

$SettingsDir = Join-Path $PSScriptRoot "..\settings"
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$TargetFile = Join-Path $ClaudeDir "settings.json"
$BackupDir = Join-Path $ClaudeDir "backups"

if (-not (Test-Path $ClaudeDir)) {
    New-Item -ItemType Directory -Path $ClaudeDir -Force | Out-Null
}

$SettingsFiles = Get-ChildItem -Path $SettingsDir -Filter "settings-*.json" | Sort-Object Name

if ($SettingsFiles.Count -eq 0) {
    Write-Host "No settings files found in $SettingsDir" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     Claude Code Provider Switcher        ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

for ($i = 0; $i -lt $SettingsFiles.Count; $i++) {
    $Name = $SettingsFiles[$i].Name -replace "^settings-", "" -replace "\.json$", ""
    $Num = $i + 1
    Write-Host "  [$Num] $Name" -ForegroundColor Yellow
}

Write-Host ""
$Choice = Read-Host "Select provider (1-$($SettingsFiles.Count))"

if ($Choice -notmatch '^\d+$' -or [int]$Choice -lt 1 -or [int]$Choice -gt $SettingsFiles.Count) {
    Write-Host "Invalid selection." -ForegroundColor Red
    exit 1
}

$Selected = $SettingsFiles[[int]$Choice - 1]

# Backup current settings
if (Test-Path $TargetFile) {
    if (-not (Test-Path $BackupDir)) {
        New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
    }
    $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $BackupFile = Join-Path $BackupDir "settings-backup-$Timestamp.json"
    Copy-Item -Path $TargetFile -Destination $BackupFile
    Write-Host "  Backed up current settings to $BackupFile" -ForegroundColor DarkGray
}

Copy-Item -Path $Selected.FullName -Destination $TargetFile -Force
Write-Host ""
Write-Host "  Switched to: $($Selected.Name -replace '^settings-', '' -replace '\.json$', '')" -ForegroundColor Green
Write-Host "  Settings file: $TargetFile" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Edit $TargetFile to add your API key." -ForegroundColor Yellow
Write-Host "  Then run: claude" -ForegroundColor Cyan
Write-Host ""
