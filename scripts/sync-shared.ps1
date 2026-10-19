# sync-shared.ps1 — Windows 版：把唯一源 shared-src\ 同步到两个技能的 references\shared\
# 用途：编辑 shared-src\ 后运行本脚本，保证两份分发副本与源一致（防漂移）。无需 Python。
# 用法：powershell -ExecutionPolicy Bypass -File scripts\sync-shared.ps1
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $PSScriptRoot
$Src = Join-Path $Root "shared-src"

if (-not (Test-Path $Src)) {
    Write-Error "找不到 $Src（应在仓库根）"
    exit 1
}

foreach ($skill in @("behavior-analyst", "problem-diver")) {
    $Dest = Join-Path $Root "skills\$skill\references\shared"
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Copy-Item -Path (Join-Path $Src "*.md") -Destination $Dest -Force
    Write-Output "  synced -> skills\$skill\references\shared\"
}

Write-Output "完成：两份分发副本现与 shared-src\ 一致。可跑 scripts\validate.py 复核。"
