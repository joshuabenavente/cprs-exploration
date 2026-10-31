[CmdletBinding()]
param([switch]$Rebuild)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
Push-Location $root
try {
    if ($Rebuild -or -not (Test-Path -LiteralPath $binary)) {
        & cargo build -p cprs-chart-mock --locked --offline
        if ($LASTEXITCODE -ne 0) { throw 'The mock-only desktop build failed.' }
    }
    & $binary
    if ($LASTEXITCODE -ne 0) { throw "The mock app exited with code $LASTEXITCODE" }
} finally { Pop-Location }
