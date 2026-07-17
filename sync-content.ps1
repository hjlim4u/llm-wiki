param(
    [Parameter(Mandatory)]
    [string]$Source
)

$source = (Resolve-Path -LiteralPath $Source).Path
$destination = Join-Path $PSScriptRoot "content"

if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Vault not found: $source"
}

New-Item -ItemType Directory -Path $destination -Force | Out-Null

$excludedDirectories = Get-ChildItem -LiteralPath $source -Directory -Force |
    Where-Object { $_.Name.StartsWith(".") -or $_.Name -in @("node_modules", "Template") } |
    Select-Object -ExpandProperty Name

$excludedFiles = Get-ChildItem -LiteralPath $source -File -Force |
    Where-Object {
        $_.Name.StartsWith(".") -or
        $_.Name -in @("AGENTS.md", "CLAUDE.md", "package.json", "package-lock.json", "metadata-optimizer.skill.disabled")
    } |
    Select-Object -ExpandProperty Name

$arguments = @($source, $destination, "/MIR", "/XJ", "/R:1", "/W:1")
if ($excludedDirectories) { $arguments += "/XD"; $arguments += $excludedDirectories }
if ($excludedFiles) { $arguments += "/XF"; $arguments += $excludedFiles }

& robocopy @arguments
if ($LASTEXITCODE -gt 7) { throw "Vault sync failed: robocopy exit code $LASTEXITCODE" }

foreach ($directory in $excludedDirectories) {
    $excludedDestination = Join-Path $destination $directory
    if (Test-Path -LiteralPath $excludedDestination) {
        Remove-Item -LiteralPath $excludedDestination -Recurse -Force
    }
}

$index = Join-Path $destination "index.md"
$homePage = Join-Path $destination "HOME.md"
if (-not (Test-Path -LiteralPath $index) -and (Test-Path -LiteralPath $homePage)) {
@"
---
title: LLM Wiki
---

![[HOME]]
"@ | Set-Content -LiteralPath $index -Encoding UTF8
}
