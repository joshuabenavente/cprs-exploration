[CmdletBinding()]
param(
    [ValidateSet('default', 'minimum')][string]$Size = 'default',
    [ValidateSet('1', '1.25', '1.5', '1.75', '2')][string]$ScaleFactor = '1',
    [switch]$Matrix
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Get-MockFileSha256.ps1')
$reviewRoot = Split-Path -Parent $PSScriptRoot
$reviewBinary = Join-Path $reviewRoot 'target/debug/cprs-chart-mock.exe'
$reviewReceipt = Get-Content -LiteralPath (Join-Path $reviewRoot 'validation/milestone-11/automated.json') -Raw | ConvertFrom-Json
if (-not $reviewReceipt.passed -or (Get-MockFileSha256 -LiteralPath $reviewBinary) -ne $reviewReceipt.executable_sha256) {
    throw 'Run Test-MockChart.ps1 successfully against this executable before native review.'
}
if ($Matrix) {
    foreach ($scale in @('1', '1.25', '1.5', '1.75', '2')) {
        if ([double]::Parse($scale, [Globalization.CultureInfo]::InvariantCulture) -lt
            [double]::Parse($ScaleFactor, [Globalization.CultureInfo]::InvariantCulture)) { continue }
        foreach ($sampleSize in @('default', 'minimum')) {
            & $PSCommandPath -Size $sampleSize -ScaleFactor $scale
        }
    }
    return
}
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the current mock window before starting another layout sample.'
}
$percent = [int]([double]::Parse($ScaleFactor, [Globalization.CultureInfo]::InvariantCulture) * 100)
$log = Join-Path $root "validation/milestone-11/layout-$Size-$percent.log"
$options = @{ IntegratedReview = $true; ScaleFactor = $ScaleFactor; MinimumSize = ($Size -eq 'minimum') }
& (Join-Path $PSScriptRoot 'Start-MockChart.ps1') @options *> $log
if ($LASTEXITCODE -ne 0) { throw "Native review failed. Inspect $log" }
# Windows PowerShell redirection writes UTF-16; completed receipts use UTF-8.
[IO.File]::WriteAllText($log, [IO.File]::ReadAllText($log), [Text.UTF8Encoding]::new($false))
