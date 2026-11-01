[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Get-MockFileSha256.ps1')
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the running mock before the layout probe matrix.'
}
$priorScale = $env:SLINT_SCALE_FACTOR
$beforeHash = (Get-MockFileSha256 -LiteralPath $binary)
$samples = @()
try {
    foreach ($scale in @('1', '1.25', '1.5', '1.75', '2')) {
        $env:SLINT_SCALE_FACTOR = $scale
        $percent = [int]([double]::Parse($scale, [Globalization.CultureInfo]::InvariantCulture) * 100)
        foreach ($sampleSize in @('default', 'minimum')) {
            $arguments = @('--integration-check')
            if ($sampleSize -eq 'minimum') { $arguments += '--minimum-size' }
            $path = Join-Path $root "validation/milestone-11/probe-$sampleSize-$percent.log"
            Write-Output "Binding/geometry probes: $sampleSize at $percent percent (not native input or visual review)"
            $ErrorActionPreference = 'Continue'
            try {
                $output = & $binary @arguments 2>&1
                $code = $LASTEXITCODE
            } finally { $ErrorActionPreference = 'Stop' }
            [IO.File]::WriteAllLines($path, [string[]]@($output | ForEach-Object { $_.ToString() }), [Text.UTF8Encoding]::new($false))
            $samples += [ordered]@{ size = $sampleSize; scale = $scale; exit_code = $code; log = "validation/milestone-11/probe-$sampleSize-$percent.log"; log_sha256 = (Get-MockFileSha256 -LiteralPath $path) }
            if ($code -ne 0) { throw "Probe journey failed; inspect $path" }
        }
    }
    $afterHash = (Get-MockFileSha256 -LiteralPath $binary)
    if ($beforeHash -ne $afterHash) { throw 'Executable changed during probe matrix.' }
    [ordered]@{ scope = 'Callback/binding/geometry probes only; no native input or visual review'; executable_sha256 = $beforeHash; samples = $samples } | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $root 'validation/milestone-11/probe-run.json') -Encoding utf8
} finally { $env:SLINT_SCALE_FACTOR = $priorScale }
