[CmdletBinding()]
param([ValidateSet(12)][int]$Milestone = 12, [switch]$CodeOnly, [switch]$Bootstrap)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Get-MockFileSha256.ps1')
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
if ($CodeOnly) { $steps = @($steps | Where-Object { $_.Name -notin @('callbacks', 'integrated') }) }
if ($Bootstrap) { $steps = @(@{ Name = 'bootstrap'; Arguments = @('fetch', '--locked') }) + $steps }
$receiptName = if ($CodeOnly) { 'code-checks.json' } else { 'automated.json' }
# Remove this mode's receipt and every step log first, so a failed or partial
# run can never leave an earlier passing log beside its new receipt.
$staleNames = @($receiptName) + @($steps | ForEach-Object { $_.Name + '.log' })
foreach ($name in $staleNames) { Remove-Item -LiteralPath (Join-Path $validation $name) -Force -ErrorAction SilentlyContinue }
$results = @()
$failure = $null
$priorIncremental = $env:CARGO_INCREMENTAL
$env:CARGO_INCREMENTAL = '0'
Push-Location $root
try {
    foreach ($step in $steps) {
        $arguments = $step.Arguments
        Write-Output ("Running: cargo " + ($arguments -join ' '))
        # Windows PowerShell wraps ordinary native stderr (Cargo progress) as
        # ErrorRecord. Judge the process exit code, while still retaining stderr.
        $ErrorActionPreference = 'Continue'
        try {
            $output = & cargo @arguments 2>&1
            $code = $LASTEXITCODE
        } finally { $ErrorActionPreference = 'Stop' }
        $logName = $step.Name + '.log'
        $logPath = Join-Path $validation $logName
        # A successful silent step (notably cargo fmt) still needs an empty log.
        Set-Content -LiteralPath $logPath -Value @($output | ForEach-Object { $_.ToString() }) -Encoding utf8
        $output | ForEach-Object { $_.ToString() } | Write-Output
        $results += [ordered]@{ name = $step.Name; command = 'cargo ' + ($arguments -join ' '); exit_code = $code; passed = ($code -eq 0); log = "validation/milestone-$Milestone/$logName"; log_sha256 = (Get-MockFileSha256 -LiteralPath $logPath) }
        if ($code -ne 0) { $failure = $step.Name; break }
    }
    $binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
    $receipt = [ordered]@{
        protocol = 'M12'
        checked_at = [DateTimeOffset]::Now.ToString('o')
        scope = 'Milestone 12 shared Cover Sheet hardening and integrated chart validation'
        passed = ($null -eq $failure -and $results.Count -eq $steps.Count)
        rustc = (& rustc --version | Out-String).Trim()
        cargo = (& cargo --version | Out-String).Trim()
        rustc_verbose = (& rustc --version --verbose | Out-String).Trim()
        os = [Environment]::OSVersion.VersionString
        architecture = [Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()
        powershell = $PSVersionTable.PSVersion.ToString()
        dependency_bootstrap_requested = [bool]$Bootstrap
        dependency_policy = 'Optional cargo fetch --locked may access the network; subsequent checks use --locked --offline. Registry caches may already be populated.'
        desktop_session_checks = if ($CodeOnly) { 'not run; code/build checks only' } else { 'immediate callbacks and real-timer journey requested in this desktop session' }
        checks = $results
        executable = 'target/debug/cprs-chart-mock.exe'
        executable_sha256 = if (Test-Path -LiteralPath $binary) { Get-MockFileSha256 -LiteralPath $binary } else { $null }
        evidence_limits = @('Callback smoke uses immediate responses; the separate integrated journey uses real timers and checks accepted/rejected deliveries and UI bindings. It does not inject physical keys or verify speech.', 'Visual and keyboard observations are recorded separately.', 'No clinical server or original CPRS process is involved.')
    }
    $receipt | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $validation $receiptName) -Encoding utf8
    if ($failure) { throw "Mock validation failed at: $failure" }
} finally {
    Pop-Location
    $env:CARGO_INCREMENTAL = $priorIncremental
}
