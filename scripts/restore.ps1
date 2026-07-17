<#
.SYNOPSIS
    Restores Claude Code settings from a backup.
.EXAMPLE
    .\restore.ps1
#>

$ClaudeDir = Join-Path $env:USERPROFILE ".claude"
$SettingsFile = Join-Path $ClaudeDir "settings.json"
$BackupDir = Join-Path $ClaudeDir "backups"

if (-not (Test-Path $BackupDir)) {
    Write-Host "No backups found at $BackupDir" -ForegroundColor Red
    exit 1
}

$Backups = Get-ChildItem -Path $BackupDir -Filter "settings-backup-*.json" | Sort-Object Name -Descending

if ($Backups.Count -eq 0) {
    Write-Host "No backup files found" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Available backups:" -ForegroundColor Cyan
for ($i = 0; $i -lt $Backups.Count; $i++) {
    $Num = $i + 1
    $Date = $Backups[$i].Name -replace "settings-backup-", "" -replace "\.json$", ""
    Write-Host "  [$Num] $Date" -ForegroundColor Yellow
}

$Choice = Read-Host "Select backup (1-$($Backups.Count))"

if ($Choice -notmatch '^\d+$' -or [int]$Choice -lt 1 -or [int]$Choice -gt $Backups.Count) {
    Write-Host "Invalid selection." -ForegroundColor Red
    exit 1
}

$Selected = $Backups[[int]$Choice - 1]
Copy-Item -Path $Selected.FullName -Destination $SettingsFile -Force
Write-Host "Settings restored from: $($Selected.Name)" -ForegroundColor Green
