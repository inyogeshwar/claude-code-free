#requires -Version 5.1
<#
╔══════════════════════════════════════════════════════════════╗
║              * CLAUDE CODE CLEANER *                       ║
║           Windows Deep Cleanup Utility                      ║
╚══════════════════════════════════════════════════════════════╝

Unofficial community utility.

Removes Claude Code-specific:
- npm installation/package and npm shims
- native Claude executable
- Claude config/cache/state/session data
- Claude Code VS Code extension + extension-specific storage
- Claude-related user environment variables
- Claude native PATH entry

Protects:
- VS Code settings.json / mcp.json / profiles / workspaceStorage / History
- Other VS Code extensions
- OpenCode / Kilo Code
- Other npm packages

PowerShell 5.1+ compatible.
#>

$ErrorActionPreference = "Continue"
$script:Removed = 0
$script:Skipped = 0
$script:Failed = 0

# ---------- ANSI ----------
$ESC = [char]27
$Cyan    = "$ESC[96m"
$Blue    = "$ESC[94m"
$Magenta = "$ESC[95m"
$Green   = "$ESC[92m"
$Yellow  = "$ESC[93m"
$Red     = "$ESC[91m"
$White   = "$ESC[97m"
$Gray    = "$ESC[90m"
$Reset   = "$ESC[0m"

function Write-Color {
    param([string]$Text, [string]$Color = $White)
    Write-Host ($Color + $Text + $Reset)
}

function Write-Status {
    param([string]$Label, [string]$Text, [string]$Color = $Gray)
    Write-Host ("  {0,-28}" -f $Label) -NoNewline
    Write-Color $Text $Color
}

function Remove-Safe {
    param([string]$Path, [string]$Label = $null)

    if (-not (Test-Path -LiteralPath $Path)) {
        $script:Skipped++
        if ($Label) { Write-Status $Label "NOT FOUND" $Gray }
        return
    }

    try {
        Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction Stop
        if (-not (Test-Path -LiteralPath $Path)) {
            $script:Removed++
            if ($Label) { Write-Status $Label "REMOVED" $Green }
        } else {
            $script:Failed++
            if ($Label) { Write-Status $Label "FAILED" $Red }
        }
    } catch {
        $script:Failed++
        if ($Label) { Write-Status $Label "FAILED" $Red }
    }
}

function Test-CommandExists {
    param([string]$Name)
    try {
        return $null -ne (Get-Command $Name -ErrorAction Stop)
    } catch {
        return $false
    }
}

function Get-NpmClaudePath {
    if (-not (Test-CommandExists "npm")) { return $null }
    try {
        $root = (& npm root -g 2>$null | Select-Object -First 1).Trim()
        if ($root) {
            $p = Join-Path $root "@anthropic-ai\claude-code"
            if (Test-Path -LiteralPath $p) { return $p }
        }
    } catch {}
    return $null
}

function Get-VSCodeClaudeExtensions {
    $roots = @(
        (Join-Path $env:USERPROFILE ".vscode\extensions"),
        (Join-Path $env:USERPROFILE ".vscode-insiders\extensions")
    )
    $found = @()
    foreach ($root in $roots) {
        if (Test-Path -LiteralPath $root) {
            try {
                $found += Get-ChildItem -LiteralPath $root -Directory -Force |
                    Where-Object { $_.Name -match "^anthropic\.claude-code" }
            } catch {}
        }
    }
    return $found
}

function Get-UserPathEntries {
    $p = [Environment]::GetEnvironmentVariable("Path", "User")
    if ([string]::IsNullOrWhiteSpace($p)) { return @() }
    return @($p -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}

function Remove-ClaudePathEntry {
    $target = (Join-Path $env:USERPROFILE ".local\bin").TrimEnd('\').ToLowerInvariant()
    $entries = Get-UserPathEntries
    if ($entries.Count -eq 0) {
        Write-Status "PATH entry" "NOT FOUND" $Gray
        return
    }

    $kept = New-Object System.Collections.Generic.List[string]
    $removedAny = $false

    foreach ($entry in $entries) {
        $normalized = $entry.Trim().TrimEnd('\').ToLowerInvariant()
        if ($normalized -eq $target) {
            $removedAny = $true
            $script:Removed++
            Write-Status "Claude PATH entry" "REMOVED" $Green
        } else {
            [void]$kept.Add($entry)
        }
    }

    if ($removedAny) {
        [Environment]::SetEnvironmentVariable("Path", ($kept -join ';'), "User")
    } else {
        Write-Status "Claude PATH entry" "NOT FOUND" $Gray
    }
}

Clear-Host

Write-Color ""
Write-Color "╔══════════════════════════════════════════════════════════════╗" $Cyan
Write-Color "║                                                              ║" $Cyan
Write-Color "║              * CLAUDE CODE CLEANER *                       ║" $Magenta
Write-Color "║                                                              ║" $Cyan
Write-Color "║           Windows Deep Cleanup Utility                      ║" $White
Write-Color "║                                                              ║" $Cyan
Write-Color "║                 Version 1.0.0                                ║" $Gray
Write-Color "║                                                              ║" $Cyan
Write-Color "╚══════════════════════════════════════════════════════════════╝" $Cyan
Write-Host ""

Write-Color "        ─── *⋅*⋅* ───  SYSTEM SCAN  ─── *⋅*⋅* ───" $Blue
Write-Host ""

$ClaudeBin = Join-Path $env:USERPROFILE ".local\bin"
$NativeExe = Join-Path $ClaudeBin "claude.exe"
$ClaudeHome = Join-Path $env:USERPROFILE ".claude"
$ClaudeJson = Join-Path $env:USERPROFILE ".claude.json"
$ClaudeJsonBackup = Join-Path $env:USERPROFILE ".claude.json.backup"
$ClaudeCache = Join-Path $env:USERPROFILE ".cache\claude"
$ClaudeShare = Join-Path $env:USERPROFILE ".local\share\claude"
$ClaudeState = Join-Path $env:USERPROFILE ".local\state\claude"

$npmClaude = Get-NpmClaudePath
$npmBin = Join-Path $env:APPDATA "npm"
$npmShims = @(
    (Join-Path $npmBin "claude.cmd"),
    (Join-Path $npmBin "claude.ps1"),
    (Join-Path $npmBin "claude")
)

$vsExtensions = @(Get-VSCodeClaudeExtensions)

$vsStorage = Join-Path $env:APPDATA "Code\User\globalStorage\anthropic.claude-code"
$vsInsiderStorage = Join-Path $env:APPDATA "Code - Insiders\User\globalStorage\anthropic.claude-code"

$localClaudePaths = @(
    (Join-Path $env:LOCALAPPDATA "Claude"),
    (Join-Path $env:LOCALAPPDATA "claude"),
    (Join-Path $env:APPDATA "Claude"),
    (Join-Path $env:APPDATA "claude")
)

$nativeFound = Test-Path -LiteralPath $NativeExe
$npmFound = $null -ne $npmClaude
$commandFound = Test-CommandExists "claude"
$extensionFound = $vsExtensions.Count -gt 0

$dataFound = $false
foreach ($p in @($ClaudeHome,$ClaudeJson,$ClaudeJsonBackup,$ClaudeCache,$ClaudeShare,$ClaudeState,$vsStorage,$vsInsiderStorage) + $localClaudePaths) {
    if (Test-Path -LiteralPath $p) { $dataFound = $true; break }
}

if ($nativeFound) {
    Write-Status "* Native installation" "FOUND" $Green
} else {
    Write-Status "* Native installation" "NOT FOUND" $Gray
}

if ($npmFound) {
    Write-Status "* npm installation" "FOUND" $Green
} else {
    Write-Status "* npm installation" "NOT FOUND" $Gray
}

if ($commandFound) {
    Write-Status "* CLI command" "FOUND" $Green
} else {
    Write-Status "* CLI command" "NOT FOUND" $Gray
}

if ($extensionFound) {
    Write-Status "* VS Code extension" "FOUND" $Green
} else {
    Write-Status "* VS Code extension" "NOT FOUND" $Gray
}

if ($dataFound) {
    Write-Status "* Claude local data" "FOUND" $Green
} else {
    Write-Status "* Claude local data" "NOT FOUND" $Gray
}

$anything = $nativeFound -or $npmFound -or $commandFound -or $extensionFound -or $dataFound

if (-not $anything) {
    Write-Host ""
    Write-Color "╔══════════════════════════════════════════════════════════════╗" $Green
    Write-Color "║                                                              ║" $Green
    Write-Color "║                  * SYSTEM ALREADY CLEAN *                  ║" $Green
    Write-Color "║                                                              ║" $Green
    Write-Color "║       Claude Code was not found on this system.              ║" $White
    Write-Color "║                                                              ║" $Green
    Write-Color "║              Nothing needs to be removed.                    ║" $Gray
    Write-Color "║                                                              ║" $Green
    Write-Color "╚══════════════════════════════════════════════════════════════╝" $Green
    Write-Host ""
    Write-Color "              * Have a clean system! *" $Magenta
    Write-Host ""
    Read-Host "Press ENTER to close"
    exit 0
}

Write-Host ""
Write-Color "══════════════ * * * ═══════════════════════════════════════" $Magenta
Write-Host ""

Write-Color "╔══════════════════════════════════════════════════════════════╗" $Yellow
Write-Color "║                    [!] CLEANUP WARNING                        ║" $Yellow
Write-Color "╠══════════════════════════════════════════════════════════════╣" $Yellow
Write-Color "║  Claude Code-specific data may be permanently deleted.      ║" $White
Write-Color "║                                                              ║" $Yellow
Write-Color "║  🗑 Installation / npm package / native files               ║" $White
Write-Color "║  🗑 Config / cache / state / sessions                       ║" $White
Write-Color "║  🗑 Claude Code VS Code extension                           ║" $White
Write-Color "║                                                              ║" $Yellow
Write-Color "║  🛡 PROTECTED                                                ║" $Green
Write-Color "║  ✓ VS Code settings.json / mcp.json / profiles              ║" $Green
Write-Color "║  ✓ workspaceStorage / History / snippets / sync             ║" $Green
Write-Color "║  ✓ OpenCode / Kilo Code / other npm packages                ║" $Green
Write-Color "║  ✓ Other VS Code extensions                                 ║" $Green
Write-Color "╚══════════════════════════════════════════════════════════════╝" $Yellow

Write-Host ""
Write-Color "              * Type DELETE to continue *" $Cyan
$confirmation = Read-Host "              ❯"

if ($confirmation -cne "DELETE") {
    Write-Host ""
    Write-Color "              * Cleanup cancelled. *" $Yellow
    Write-Host ""
    Read-Host "Press ENTER to close"
    exit 0
}

Write-Host ""
Write-Color "─── *⋅*⋅* ─── -- ─── *⋅*⋅* ───" $Magenta
Write-Host ""

# Close only Claude processes. VS Code is deliberately NOT closed.
Write-Color "*･ﾟ: ** CLEANUP IN PROGRESS ** :･ﾟ*" $Cyan
Write-Host ""

foreach ($procName in @("claude","claude-code")) {
    try {
        $procs = @(Get-Process -Name $procName -ErrorAction SilentlyContinue)
        if ($procs.Count -gt 0) {
            $procs | Stop-Process -Force -ErrorAction Stop
            Write-Status "Closing $procName" "DONE" $Green
        } else {
            Write-Status "Closing $procName" "SKIPPED" $Gray
        }
    } catch {
        Write-Status "Closing $procName" "FAILED" $Red
        $script:Failed++
    }
}

# npm
if (Test-CommandExists "npm") {
    if ($npmClaude) {
        try {
            & npm uninstall -g "@anthropic-ai/claude-code" 2>$null | Out-Null
            if ($LASTEXITCODE -eq 0) {
                Write-Status "Removing npm package" "DONE" $Green
            } else {
                Write-Status "Removing npm package" "FAILED" $Red
                $script:Failed++
            }
        } catch {
            Write-Status "Removing npm package" "FAILED" $Red
            $script:Failed++
        }
    } else {
        Write-Status "Removing npm package" "SKIPPED" $Gray
    }
} else {
    Write-Status "Removing npm package" "SKIPPED" $Gray
}

foreach ($p in $npmShims) { Remove-Safe $p }

# Native
Remove-Safe $NativeExe "Removing native executable"

# Claude config/data
Remove-Safe $ClaudeHome "Removing Claude config"
Remove-Safe $ClaudeJson "Removing Claude JSON"
Remove-Safe $ClaudeJsonBackup "Removing Claude JSON backup"
Remove-Safe $ClaudeCache "Removing Claude cache"
Remove-Safe $ClaudeShare "Removing Claude native data"
Remove-Safe $ClaudeState "Removing Claude state"

foreach ($p in $localClaudePaths) { Remove-Safe $p }

# VS Code: Claude extension only
foreach ($ext in $vsExtensions) {
    Remove-Safe $ext.FullName ("Removing VS Code extension: " + $ext.Name)
}
Remove-Safe $vsStorage "Removing Claude VS Code storage"
Remove-Safe $vsInsiderStorage "Removing Claude Insiders storage"

Write-Status "VS Code workspace data" "PROTECTED" $Green
Write-Status "VS Code settings / MCP" "PROTECTED" $Green
Write-Status "Other VS Code extensions" "PROTECTED" $Green
Write-Status "OpenCode / Kilo Code" "PROTECTED" $Green
Write-Status "Other npm packages" "PROTECTED" $Green

# Environment variables
$vars = @(
    "ANTHROPIC_API_KEY",
    "ANTHROPIC_AUTH_TOKEN",
    "ANTHROPIC_BASE_URL",
    "ANTHROPIC_MODEL",
    "ANTHROPIC_DEFAULT_OPUS_MODEL",
    "ANTHROPIC_DEFAULT_SONNET_MODEL",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL",
    "CLAUDE_CODE_SUBAGENT_MODEL",
    "CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY",
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS",
    "CLAUDE_CODE_USE_AUTH_TOKEN",
    "ENABLE_TOOL_SEARCH",
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS",
    "DISABLE_TELEMETRY"
)

foreach ($v in $vars) {
    try {
        $current = [Environment]::GetEnvironmentVariable($v, "User")
        if ($null -ne $current) {
            [Environment]::SetEnvironmentVariable($v, $null, "User")
            Remove-Item "Env:$v" -ErrorAction SilentlyContinue
            $script:Removed++
            Write-Status ("Removing env: " + $v) "DONE" $Green
        }
    } catch {
        $script:Failed++
        Write-Status ("Removing env: " + $v) "FAILED" $Red
    }
}

# PATH
Remove-ClaudePathEntry

# Empty native bin only if truly empty
if (Test-Path -LiteralPath $ClaudeBin) {
    try {
        $remaining = @(Get-ChildItem -LiteralPath $ClaudeBin -Force)
        if ($remaining.Count -eq 0) {
            Remove-Item -LiteralPath $ClaudeBin -Force
            $script:Removed++
            Write-Status ".local\bin" "REMOVED (EMPTY)" $Green
        } else {
            Write-Status ".local\bin" "PROTECTED - OTHER FILES FOUND" $Gray
        }
    } catch {
        Write-Status ".local\bin" "SKIPPED" $Gray
    }
}

Write-Host ""
Write-Color "══════════════ * * * ══════════════════════════════════════" $Magenta
Write-Host ""

# Verification
$nativeGone = -not (Test-Path -LiteralPath $NativeExe)
$configGone = -not (Test-Path -LiteralPath $ClaudeHome)
$cacheGone = -not (Test-Path -LiteralPath $ClaudeCache)

$commandGone = -not (Test-CommandExists "claude")

Write-Color "╔══════════════════════════════════════════════════════════════╗" $Green
Write-Color "║                  * CLEANUP COMPLETE *                      ║" $Green
Write-Color "╠══════════════════════════════════════════════════════════════╣" $Green
Write-Color ("║     * Removed       : {0,-3}                                ║" -f $script:Removed) $White
Write-Color ("║     * Skipped       : {0,-3}                                ║" -f $script:Skipped) $Gray
Write-Color ("║     * Failed        : {0,-3}                                ║" -f $script:Failed) $(if($script:Failed -eq 0){$Green}else{$Red})
Write-Color "║                                                              ║" $Green
Write-Color "╚══════════════════════════════════════════════════════════════╝" $Green

Write-Host ""
Write-Status "Native executable" ($(if($nativeGone){"REMOVED"}else{"STILL EXISTS"})) ($(if($nativeGone){$Green}else{$Red}))
Write-Status "Claude config" ($(if($configGone){"REMOVED"}else{"STILL EXISTS"})) ($(if($configGone){$Green}else{$Red}))
Write-Status "Claude cache" ($(if($cacheGone){"REMOVED"}else{"STILL EXISTS"})) ($(if($cacheGone){$Green}else{$Red}))
Write-Status "CLI command" ($(if($commandGone){"NOT FOUND"}else{"STILL AVAILABLE"})) ($(if($commandGone){$Green}else{$Red}))

Write-Host ""
if ($script:Failed -eq 0 -and $nativeGone -and $configGone -and $cacheGone -and $commandGone) {
    Write-Color "                 <3 CLAUDE CODE REMOVED <3" $Magenta
} else {
    Write-Color "             [!] CLEANUP NEEDS REVIEW [!]" $Yellow
}

Write-Host ""
Write-Color "             ─── *⋅*⋅* ─── * ─── *⋅*⋅* ───" $Blue
Write-Host ""
Write-Color "  NEXT STEP" $Cyan
Write-Host "    1. Close this PowerShell window."
Write-Host "    2. Open a NEW PowerShell window."
Write-Host "    3. Run: claude --version"
Write-Host ""
Write-Color "  Expected: claude command is not recognized." $Gray
Write-Host ""

Read-Host "Press ENTER to close"
