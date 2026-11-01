[CmdletBinding()]
param([switch]$Matrix)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Get-MockFileSha256.ps1')
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the mock before follow-up validation.'
}
# A changed executable must not replace the original M12 checkpoint receipts.
$destination = Join-Path $root 'validation/milestone-12/native-followup'
New-Item -ItemType Directory -Path $destination -Force | Out-Null
$receiptPath = Join-Path $destination 'checks.json'
Remove-Item -LiteralPath $receiptPath -Force -ErrorAction SilentlyContinue
$historical = @{}
Get-ChildItem -LiteralPath (Join-Path $root 'validation/milestone-12') -File -Recurse |
    Where-Object { -not $_.FullName.StartsWith($destination + [IO.Path]::DirectorySeparatorChar) } |
    ForEach-Object { $historical[$_.FullName] = Get-MockFileSha256 -LiteralPath $_.FullName }
$checks = @()
$priorScale = $env:SLINT_SCALE_FACTOR
$priorIncremental = $env:CARGO_INCREMENTAL
$env:CARGO_INCREMENTAL = '0'
function Invoke-FollowupCheck([string]$Name, [string]$Program, [string[]]$Arguments) {
    Write-Output "Checking $Name"
    $ErrorActionPreference = 'Continue'
    try { $output = & $Program @Arguments 2>&1; $code = $LASTEXITCODE }
    finally { $ErrorActionPreference = 'Stop' }
    $path = Join-Path $destination ($Name + '.log')
    [IO.File]::WriteAllLines($path, [string[]]@($output | ForEach-Object { $_.ToString() }), [Text.UTF8Encoding]::new($false))
    $script:checks += [ordered]@{ name = $Name; program = $Program; arguments = $Arguments; exit_code = $code; log = $Name + '.log'; log_sha256 = Get-MockFileSha256 -LiteralPath $path }
    if ($code -ne 0) { throw "Follow-up failed: $Name; inspect $path" }
}
Push-Location $root
try {
    # Slint treats this variable as a compiler constant when it is present at
    # build time. Leave it unset while compiling so runtime matrix overrides work.
    $env:SLINT_SCALE_FACTOR = $null
    Invoke-FollowupCheck 'format' 'cargo' @('fmt', '--all', '--', '--check')
    Invoke-FollowupCheck 'clippy' 'cargo' @('clippy', '--workspace', '--all-targets', '--locked', '--offline', '--', '-D', 'warnings')
    Invoke-FollowupCheck 'tests' 'cargo' @('test', '--workspace', '--locked', '--offline')
    Invoke-FollowupCheck 'build' 'cargo' @('build', '-p', 'cprs-chart-mock', '--locked', '--offline')
    $binaryHash = Get-MockFileSha256 -LiteralPath $binary
    $env:SLINT_SCALE_FACTOR = '1'
    Invoke-FollowupCheck 'callbacks' $binary @('--smoke-check')
    Invoke-FollowupCheck 'integrated' $binary @('--integration-check')
    if ($Matrix) {
        foreach ($scale in @('1', '1.25', '1.5', '1.75', '2')) {
            $env:SLINT_SCALE_FACTOR = $scale
            $percent = [int]([double]::Parse($scale, [Globalization.CultureInfo]::InvariantCulture) * 100)
            foreach ($size in @('default', 'minimum')) {
                $arguments = @('--integration-check')
                if ($size -eq 'minimum') { $arguments += '--minimum-size' }
                Invoke-FollowupCheck "probe-$size-$percent" $binary $arguments
                $log = [IO.File]::ReadAllText((Join-Path $destination "probe-$size-$percent.log"))
                $window = [regex]::Match($log, 'M12_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)')
                $logicalWidth = if ($size -eq 'minimum') { 980 } else { 1180 }
                $logicalHeight = if ($size -eq 'minimum') { 680 } elseif ($scale -eq '2') { 700 } else { 800 }
                $factor = [double]::Parse($scale, [Globalization.CultureInfo]::InvariantCulture)
                if (-not $window.Success -or [int]$window.Groups[1].Value -ne [int]($logicalWidth * $factor) -or
                    [int]$window.Groups[2].Value -ne [int]($logicalHeight * $factor) -or
                    [double]::Parse($window.Groups[3].Value, [Globalization.CultureInfo]::InvariantCulture) -ne $factor) {
                    throw "Requested/observed size or scale mismatch: $size at $scale"
                }
            }
        }
    }
    if ($binaryHash -ne (Get-MockFileSha256 -LiteralPath $binary)) { throw 'Executable changed during validation.' }
    foreach ($path in $historical.Keys) {
        if ($historical[$path] -ne (Get-MockFileSha256 -LiteralPath $path)) { throw "Existing M12 evidence changed: $path" }
    }
    $inputs = @{}
    @(Get-ChildItem -LiteralPath (Join-Path $root 'crates') -File -Recurse) +
        @(Get-Item (Join-Path $root 'Cargo.toml'), (Join-Path $root 'Cargo.lock'), (Join-Path $root 'rust-toolchain.toml'), $PSCommandPath) |
        ForEach-Object { $inputs[$_.FullName.Substring($root.Length + 1).Replace('\', '/')] = Get-MockFileSha256 -LiteralPath $_.FullName }
    [ordered]@{
        scope = 'M12 native finding follow-up; separate build, not replacement milestone acceptance'
        checked_at = [DateTimeOffset]::Now.ToString('o'); passed = $true
        executable_sha256 = $binaryHash; checks = $checks; input_sha256 = $inputs
        preserved_m12_files = $historical.Count; preserved_m12_sha256 = $historical
        matrix_requested = [bool]$Matrix
        native_acceptance_complete = $false
        listening = 'Previous reports belong to the original executable; no new listening report'
    } | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $receiptPath -Encoding utf8
} finally {
    Pop-Location
    $env:SLINT_SCALE_FACTOR = $priorScale
    $env:CARGO_INCREMENTAL = $priorIncremental
}
