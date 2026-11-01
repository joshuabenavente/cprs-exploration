[CmdletBinding()]
param([ValidateSet('default', 'minimum')][string]$Size = 'default',
      [ValidateSet('1', '1.25', '1.5', '1.75', '2')][string]$ScaleFactor = '1',
      [string]$Python = 'python')
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$base = Join-Path $root 'validation/milestone-15/windows'
$receipt = Get-Content -LiteralPath (Join-Path $base 'automated.json') -Raw | ConvertFrom-Json
if (-not $receipt.passed -or -not $receipt.matrix_requested) {
    throw 'Run Test-MockChart.ps1 -Matrix first for this new executable.'
}
& $Python (Join-Path $PSScriptRoot 'verify_integrated.py')
if ($LASTEXITCODE -ne 0) { throw 'M15 source/executable/log binding verification failed.' }
$binary = Join-Path $root $receipt.executable
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the mock before opening another sample.'
}
$destination = Join-Path $base 'native'
New-Item -ItemType Directory -Path $destination -Force | Out-Null
$stamp = [DateTimeOffset]::UtcNow.ToString('yyyyMMddTHHmmssfffffffZ')
$percent = [int]([double]::Parse($ScaleFactor, [Globalization.CultureInfo]::InvariantCulture) * 100)
$log = Join-Path $destination "$Size-$percent-$stamp.log"
$priorScale = $env:SLINT_SCALE_FACTOR
try {
    $env:SLINT_SCALE_FACTOR = $ScaleFactor
    $arguments = @('--integration-check', '--keep-open')
    if ($Size -eq 'minimum') { $arguments += '--minimum-size' }
    & $binary @arguments *> $log
    if ($LASTEXITCODE -ne 0) { throw "M15 preparation failed; inspect $log" }
    [ordered]@{
        protocol = 'M15'; scope = 'Synthetic launch preparation only; not native or speech acceptance'
        executable_sha256 = $receipt.executable_sha256
        requested_size = $Size; requested_application_scale = $ScaleFactor
        log = Split-Path -Leaf $log
        log_sha256 = (Get-FileHash -LiteralPath $log -Algorithm SHA256).Hash.ToLowerInvariant()
        native_visual_keyboard = 'not recorded by launcher'
        narrator_listening = 'not recorded by launcher'
    } | ConvertTo-Json | Set-Content -LiteralPath "$log.json" -Encoding utf8
} finally { $env:SLINT_SCALE_FACTOR = $priorScale }
