# Life Teardown installer (Windows PowerShell)
# Usage: irm <url>/install.ps1 | iex
# ASCII-only messages to avoid PS 5.1 encoding issues.
$ErrorActionPreference = "Stop"

$Repo = "PME0997/life-teardown"
$Branch = "main"
$Skills = @("behavior-analyst", "problem-diver")

Write-Host "==> Life Teardown installer"

# 1. Detect platform
$Home_ = $env:USERPROFILE
if (Test-Path "$Home_\.qwenworkcn") {
    $Platform = "qwenwork"; $SkillDir = "$Home_\.qwenworkcn\skills"; $Archive = "$Home_\.qwenworkcn\user-data\life-teardown"
} elseif (Test-Path "$Home_\.claude") {
    $Platform = "claude-code"; $SkillDir = "$Home_\.claude\skills"; $Archive = "$Home_\.claude\user-data\life-teardown"
} elseif (Test-Path "$Home_\.workbuddy") {
    $Platform = "workbuddy"; $SkillDir = "$Home_\.workbuddy\skills"; $Archive = "$Home_\.workbuddy\life-teardown"
} else {
    $Platform = "generic"; $SkillDir = "$Home_\.local\share\ai-skills"; $Archive = "$Home_\.local\share\life-teardown"
    Write-Host "    No known platform detected; installing to generic location."
}
Write-Host "    Platform: $Platform"
Write-Host "    Skills dir: $SkillDir"
$Root = if ($env:LIFE_TEARDOWN_ROOT) { $env:LIFE_TEARDOWN_ROOT } else { $Archive }
Write-Host "    Archive root: $Root"

# 2. Download repo zip
$Tmp = Join-Path $env:TEMP ("lt-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $Tmp | Out-Null
try {
    $Zip = Join-Path $Tmp "repo.zip"
    $Url = "https://github.com/$Repo/archive/refs/heads/$Branch.zip"
    Write-Host "==> Downloading $Repo@$Branch"
    Invoke-WebRequest -Uri $Url -OutFile $Zip -UseBasicParsing
    Expand-Archive -Path $Zip -DestinationPath $Tmp -Force
    $Src = Get-ChildItem -Path $Tmp -Directory -Filter "life-teardown-*" | Select-Object -First 1

    # 3. Copy skills
    New-Item -ItemType Directory -Path $SkillDir -Force | Out-Null
    foreach ($s in $Skills) {
        Write-Host "==> Installing $s"
        $Dest = Join-Path $SkillDir $s
        if (Test-Path $Dest) {
            $Stamp = [int][double]::Parse((Get-Date -UFormat %s))
            Copy-Item -Recurse -Path $Dest -Destination "$Dest.bak.$Stamp"
            Write-Host "    (existing $s backed up)"
        }
        Copy-Item -Recurse -Path (Join-Path $Src.FullName "skills\$s") -Destination $Dest
        if ($Platform -ne "generic") {
            Write-Host "    NOTE: apply $Platform frontmatter from adapters\$Platform\ for full UI (see INSTALL.md step 3)."
        }
    }

    # 4. Create archive dirs
    New-Item -ItemType Directory -Force -Path "$Root\behavior-archive\raw" | Out-Null
    New-Item -ItemType Directory -Force -Path "$Root\problem-archive\raw" | Out-Null
    New-Item -ItemType Directory -Force -Path "$Root\problem-archive\outbox" | Out-Null
    Write-Host "==> Archive ready at $Root"
} finally {
    Remove-Item -Recurse -Force $Tmp -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "Done. Try it out:"
Write-Host "  behavior-analyst:  why do I always procrastinate"
Write-Host "  problem-diver:     help me review something that went wrong"
Write-Host ""
Write-Host "Set LIFE_TEARDOWN_ROOT to relocate archives. Uninstall: remove the two skill dirs + archive root (back up archives first!)."
