[CmdletBinding()]
param([switch]$RefreshReports)
. (Join-Path $PSScriptRoot 'Use-AnalysisEnvironment.ps1')
$project = Join-Path $AnalysisRoot 'analysis/projects'
$scriptPath = Join-Path $AnalysisRoot 'scripts/ghidra'
$reports = Join-Path $AnalysisRoot 'analysis/decompiled'
New-Item -ItemType Directory -Path $reports -Force | Out-Null
$options = @($project, 'CPRSChartFocused', '-scriptPath', $scriptPath,
    '-log', (Join-Path $AnalysisRoot 'analysis/logs/headless.log'),
    '-scriptlog', (Join-Path $AnalysisRoot 'analysis/logs/scripts.log'), '-max-cpu', '4')
if ($RefreshReports) {
    $options += @('-process', 'CPRSChart.exe', '-noanalysis')
} else {
    if (Test-Path -LiteralPath (Join-Path $project 'CPRSChartFocused.gpr')) {
        throw 'Project exists. Use -RefreshReports to export again; open the project to continue analysis.'
    }
    $options += @('-noanalysis', '-import', (Join-Path $AnalysisRoot 'cprs/CPRSChart.exe'),
        '-preScript', 'ImportChartMap.java', (Join-Path $AnalysisRoot 'analysis/inventory/chart-symbols.tsv'),
        '-analysisTimeoutPerFile', '600')
}
$options += @('-postScript', 'ExportChartWorkflow.java', $reports)
$runStarted = [DateTime]::UtcNow
& (Join-Path $GhidraInstall 'support/analyzeHeadless.bat') @options
if ($LASTEXITCODE -ne 0) { throw "Headless analysis failed: $LASTEXITCODE" }
$functionReport = Join-Path $reports 'workflow-functions.tsv'
if (-not (Test-Path -LiteralPath $functionReport)) {
    throw 'Ghidra did not export the function report. Inspect the headless and script logs.'
}
if ((Get-Item -LiteralPath $functionReport).LastWriteTimeUtc -lt $runStarted.AddSeconds(-2)) {
    throw 'The workflow report is stale. Inspect the script compilation and export logs.'
}
$failed = Import-Csv -LiteralPath $functionReport -Delimiter "`t" | Where-Object { $_.status -ne 'decompiled' }
if ($failed) { throw ('Unresolved workflow exports: ' + (($failed | ForEach-Object function) -join ', ')) }
