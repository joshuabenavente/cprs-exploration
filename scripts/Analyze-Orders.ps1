[CmdletBinding()]
param()
. (Join-Path $PSScriptRoot 'Use-AnalysisEnvironment.ps1')
$reports = Join-Path $AnalysisRoot 'analysis/orders/decompiled'
New-Item -ItemType Directory -Path $reports -Force | Out-Null
$options = @((Join-Path $AnalysisRoot 'analysis/projects'), 'CPRSChartFocused',
    '-process', 'CPRSChart.exe', '-noanalysis', '-max-cpu', '4',
    '-scriptPath', (Join-Path $AnalysisRoot 'scripts/ghidra'),
    '-log', (Join-Path $AnalysisRoot 'analysis/logs/orders.log'),
    '-scriptlog', (Join-Path $AnalysisRoot 'analysis/logs/orders-scripts.log'),
    '-postScript', 'ExportChartWorkflow.java', $reports, (Join-Path $AnalysisRoot 'provenance/orders-targets.txt'))
$started = [DateTime]::UtcNow
& (Join-Path $GhidraInstall 'support/analyzeHeadless.bat') @options
if ($LASTEXITCODE -ne 0) { throw 'Orders export failed.' }
$report = Get-Item -LiteralPath (Join-Path $reports 'workflow-functions.tsv')
if ($report.LastWriteTimeUtc -lt $started.AddSeconds(-2)) { throw 'Orders report is stale.' }
if (Import-Csv -LiteralPath $report.FullName -Delimiter "`t" | Where-Object status -ne 'decompiled') {
    throw 'One or more Orders targets could not be exported.'
}
