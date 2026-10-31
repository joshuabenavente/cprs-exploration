[CmdletBinding()]
param(
    [ValidateSet('default', 'minimum')][string]$Size = 'default',
    [ValidateSet('1', '1.25', '1.5', '1.75', '2')][string]$ScaleFactor = '1',
    [switch]$Matrix
)
$ErrorActionPreference = 'Stop'
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
$log = Join-Path $root "validation/milestone-10/layout-$Size-$percent.log"
$options = @{ IntegratedReview = $true; ScaleFactor = $ScaleFactor; MinimumSize = ($Size -eq 'minimum') }
& (Join-Path $PSScriptRoot 'Start-MockChart.ps1') @options *> $log
if ($LASTEXITCODE -ne 0) { throw "Native review failed. Inspect $log" }
# Windows PowerShell redirection writes UTF-16; completed receipts use UTF-8.
[IO.File]::WriteAllText($log, [IO.File]::ReadAllText($log), [Text.UTF8Encoding]::new($false))
