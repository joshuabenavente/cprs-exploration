[CmdletBinding()]
param([switch]$Rebuild, [switch]$MinimumSize, [switch]$IntegratedReview,
    [ValidateSet('1', '1.25', '1.5', '1.75', '2')][string]$ScaleFactor)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
Push-Location $root
$priorScale = $env:SLINT_SCALE_FACTOR
try {
    if ($Rebuild -or -not (Test-Path -LiteralPath $binary)) {
        & cargo build -p cprs-chart-mock --locked --offline
        if ($LASTEXITCODE -ne 0) { throw 'The mock-only desktop build failed.' }
    }
    if ($ScaleFactor) { $env:SLINT_SCALE_FACTOR = $ScaleFactor }
    [string[]]$mockArguments = if ($MinimumSize) { @('--minimum-size') } else { @() }
    if ($IntegratedReview) { $mockArguments += @("--integration-check", "--keep-open") }
    & $binary @mockArguments
    if ($LASTEXITCODE -ne 0) { throw "The mock app exited with code $LASTEXITCODE" }
} finally { $env:SLINT_SCALE_FACTOR = $priorScale; Pop-Location }
