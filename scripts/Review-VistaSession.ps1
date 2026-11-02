[CmdletBinding()]
param([ValidateSet('default','minimum')][string]$Size = 'default', [string]$Python = 'python')
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$base = Join-Path $root 'validation/milestone-18/functional-100/windows'
$receipt = Get-Content -LiteralPath (Join-Path $base 'automated.json') -Raw | ConvertFrom-Json
if (-not $receipt.passed -or -not $receipt.matrix_requested) { throw 'Run Test-MockChart.ps1 -Matrix first.' }
& $Python (Join-Path $PSScriptRoot 'verify_integrated.py')
if ($LASTEXITCODE -ne 0) { throw 'M18 source/build binding failed.' }
if ($receipt.native_broker_adapter -ne 'unavailable' -or $receipt.live_connection_attempted) {
    throw 'This launcher only reviews the unavailable M18 foundation; native review needs its own implemented protocol.'
}
$binary = Join-Path $root $receipt.executable
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) { throw 'Close the mock before opening another review.' }
$priorScale = $env:SLINT_SCALE_FACTOR
try {
    $env:SLINT_SCALE_FACTOR = '1'
    $arguments = @('--live-session')
    if ($Size -eq 'minimum') { $arguments += '--minimum-size' }
    Write-Host 'M18 foundation only: supported Broker integration is unavailable. No connection or patient read will be attempted.'
    # Do not collect a native/authentication transcript or screenshot.
    & $binary @arguments
    if ($LASTEXITCODE -ne 0) { throw 'M18 foundation review launch failed.' }
} finally { $env:SLINT_SCALE_FACTOR = $priorScale }
