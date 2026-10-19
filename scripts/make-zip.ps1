# make-zip.ps1 - create spec-compliant zip with forward-slash entry names.
# Windows PowerShell Compress-Archive uses backslash entries (violates ZIP spec);
# this script uses System.IO.Compression.ZipArchive to force forward slashes.
# ASCII-only (PS 5.1 reads .ps1 as ANSI without BOM).
#
# Usage:
#   powershell -File make-zip.ps1 -SrcDir <dir> -ZipPath <out.zip> -EntryPrefix <name>
# Example:
#   powershell -File make-zip.ps1 -SrcDir skills/behavior-analyst -ZipPath out/behavior-analyst.zip -EntryPrefix behavior-analyst

param(
    [Parameter(Mandatory = $true)][string]$SrcDir,
    [Parameter(Mandatory = $true)][string]$ZipPath,
    [Parameter(Mandatory = $true)][string]$EntryPrefix
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.IO.Compression | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null

$srcFull = (Resolve-Path $SrcDir).Path
# FileMode Create overwrites if exists (no deletion needed)
$fs = [System.IO.File]::Open($ZipPath, [System.IO.FileMode]::Create)
$zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)

$files = Get-ChildItem -Path $SrcDir -Recurse -File
$count = 0
foreach ($f in $files) {
    $rel = $f.FullName.Substring($srcFull.Length).TrimStart('\', '/')
    $rel = $rel -replace '\\', '/'
    $entryName = $EntryPrefix + '/' + $rel
    $entry = $zip.CreateEntry($entryName, [System.IO.Compression.CompressionLevel]::Optimal)
    $es = $entry.Open()
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    $es.Write($bytes, 0, $bytes.Length)
    $es.Close()
    $count++
}

$zip.Dispose()
$fs.Close()
Write-Output "Created $ZipPath with $count files (forward-slash entries)"
