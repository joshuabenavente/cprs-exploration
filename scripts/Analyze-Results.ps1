[CmdletBinding()]
param()
. (Join-Path $PSScriptRoot 'Use-AnalysisEnvironment.ps1')
$reports = Join-Path $AnalysisRoot 'analysis/results/decompiled'
New-Item -ItemType Directory -Path $reports -Force | Out-Null
$options = @((Join-Path $AnalysisRoot 'analysis/projects'), 'CPRSChartFocused',
    '-process', 'CPRSChart.exe', '-noanalysis', '-max-cpu', '4',
    '-scriptPath', (Join-Path $AnalysisRoot 'scripts/ghidra'),
    '-log', (Join-Path $AnalysisRoot 'analysis/logs/results.log'),
    '-scriptlog', (Join-Path $AnalysisRoot 'analysis/logs/results-scripts.log'),
    '-postScript', 'ExportChartWorkflow.java', $reports, (Join-Path $AnalysisRoot 'provenance/results-targets.txt'))
$started = [DateTime]::UtcNow
& (Join-Path $GhidraInstall 'support/analyzeHeadless.bat') @options
if ($LASTEXITCODE -ne 0) { throw 'Results export failed.' }
$report = Get-Item -LiteralPath (Join-Path $reports 'workflow-functions.tsv')
if ($report.LastWriteTimeUtc -lt $started.AddSeconds(-2)) { throw 'Results report is stale.' }
if (Import-Csv -LiteralPath $report.FullName -Delimiter "`t" | Where-Object status -ne 'decompiled') {
    throw 'One or more Results targets could not be exported.'
}
