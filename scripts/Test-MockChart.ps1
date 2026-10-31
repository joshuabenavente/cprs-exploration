[CmdletBinding()]
param([ValidateSet(8)][int]$Milestone = 8)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$binaryPath = Join-Path $root 'target/debug/cprs-chart-mock.exe'
$running = Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binaryPath }
if ($running) { throw 'Close the running mock app before validation so Windows can replace its executable.' }
$validation = Join-Path $root "validation/milestone-$Milestone"
New-Item -ItemType Directory -Path $validation -Force | Out-Null
$steps = @(
    @{ Name = 'format'; Arguments = @('fmt', '--all', '--', '--check') },
    @{ Name = 'clippy'; Arguments = @('clippy', '--workspace', '--all-targets', '--locked', '--offline', '--', '-D', 'warnings') },
    @{ Name = 'tests'; Arguments = @('test', '--workspace', '--locked', '--offline') },
    @{ Name = 'build'; Arguments = @('build', '-p', 'cprs-chart-mock', '--locked', '--offline') },
    @{ Name = 'callbacks'; Arguments = @('run', '-p', 'cprs-chart-mock', '--locked', '--offline', '--', '--smoke-check') },
    @{ Name = 'integrated'; Arguments = @('run', '-p', 'cprs-chart-mock', '--locked', '--offline', '--', '--integration-check') }
)
$results = @()
$failure = $null
$priorIncremental = $env:CARGO_INCREMENTAL
$env:CARGO_INCREMENTAL = '0'
Push-Location $root
try {
    foreach ($step in $steps) {
        $arguments = $step.Arguments
        Write-Output ("Running: cargo " + ($arguments -join ' '))
        $output = & cargo @arguments 2>&1
        $code = $LASTEXITCODE
        $output | ForEach-Object { $_.ToString() } | Set-Content -LiteralPath (Join-Path $validation ($step.Name + '.log')) -Encoding utf8
        $output | Write-Output
        $results += [ordered]@{ name = $step.Name; command = 'cargo ' + ($arguments -join ' '); exit_code = $code; passed = ($code -eq 0) }
        if ($code -ne 0) { $failure = $step.Name; break }
    }
    $binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
    $receipt = [ordered]@{
        checked_at = [DateTimeOffset]::Now.ToString('o')
        scope = 'Milestone 8 mock-only Vitals and integrated chart validation'
        passed = ($null -eq $failure -and $results.Count -eq $steps.Count)
        rustc = (& rustc --version | Out-String).Trim()
        cargo = (& cargo --version | Out-String).Trim()
        checks = $results
        executable = 'target/debug/cprs-chart-mock.exe'
        executable_sha256 = if (Test-Path -LiteralPath $binary) { (Get-FileHash -LiteralPath $binary -Algorithm SHA256).Hash.ToLowerInvariant() } else { $null }
        evidence_limits = @('Callback smoke uses immediate responses; the separate integrated journey uses real timers and checks accepted/rejected deliveries and UI bindings. It does not inject physical keys or verify speech.', 'Visual and keyboard observations are recorded separately.', 'No clinical server or original CPRS process is involved.')
    }
    $receipt | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $validation 'automated.json') -Encoding utf8
    if ($failure) { throw "Mock validation failed at: $failure" }
} finally {
    Pop-Location
    $env:CARGO_INCREMENTAL = $priorIncremental
}
