<#
.SYNOPSIS
    Backs up the current Claude Code settings.
.EXAMPLE
    .\backup.ps1
#>

$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$SettingsFile = Join-Path $ClaudeDir "settings.json"
$BackupDir = Join-Path $ClaudeDir "backups"

if (-not (Test-Path $SettingsFile)) {
    Write-Host "No settings file found at $SettingsFile" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
}

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupFile = Join-Path $BackupDir "settings-backup-$Timestamp.json"
Copy-Item -Path $SettingsFile -Destination $BackupFile

Write-Host "Settings backed up to: $BackupFile" -ForegroundColor Green
