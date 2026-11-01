[CmdletBinding()]
param(
    [ValidateSet('default', 'minimum')][string]$Size = 'default',
    [ValidateSet('1', '1.25', '1.5', '1.75', '2')][string]$ScaleFactor = '1'
)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Get-MockFileSha256.ps1')
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
$destination = Join-Path $root 'validation/milestone-12/native-followup'
$receipt = Get-Content -LiteralPath (Join-Path $destination 'checks.json') -Raw | ConvertFrom-Json
if (-not $receipt.passed -or -not $receipt.matrix_requested -or $receipt.checks.Count -ne 16 -or
    (Get-MockFileSha256 -LiteralPath $binary) -ne $receipt.executable_sha256) {
    throw 'Run Test-CoverSheetFollowup.ps1 -Matrix against this executable before review.'
}
# The verifier checks the complete source/build file set, allowing only Git's
# LF/CRLF text normalization. Evidence and executable hashes remain byte-exact.
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the current mock before another review sample.'
}
& python (Join-Path $PSScriptRoot 'verify_cover_followup.py')
if ($LASTEXITCODE -ne 0) { throw 'Follow-up receipt verification failed.' }
$percent = [int]([double]::Parse($ScaleFactor, [Globalization.CultureInfo]::InvariantCulture) * 100)
$stamp = [DateTimeOffset]::UtcNow.ToString('yyyyMMddTHHmmssfffffffZ')
$log = Join-Path $destination "native-$Size-$percent-$stamp.log"
$options = @{ IntegratedReview = $true; ScaleFactor = $ScaleFactor; MinimumSize = ($Size -eq 'minimum') }
& (Join-Path $PSScriptRoot 'Start-MockChart.ps1') @options *> $log
$code = $LASTEXITCODE
[IO.File]::WriteAllText($log, [IO.File]::ReadAllText($log), [Text.UTF8Encoding]::new($false))
if ($code -ne 0) { throw "Follow-up review failed. Inspect $log" }
