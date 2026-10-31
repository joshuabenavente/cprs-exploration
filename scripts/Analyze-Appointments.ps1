[CmdletBinding()]
param()
. (Join-Path $PSScriptRoot 'Use-AnalysisEnvironment.ps1')
# Isolate script compilation from the earlier milestones' OSGi cache.
$env:APPDATA = Join-Path $AnalysisRoot '.local/appointments/appdata'
New-Item -ItemType Directory -Path $env:APPDATA -Force | Out-Null
$reports = Join-Path $AnalysisRoot 'analysis/appointments/decompiled'
New-Item -ItemType Directory -Path $reports -Force | Out-Null
$options = @((Join-Path $AnalysisRoot 'analysis/projects'), 'CPRSChartFocused',
    '-process', 'CPRSChart.exe', '-noanalysis', '-max-cpu', '4',
    '-scriptPath', (Join-Path $AnalysisRoot 'scripts/ghidra'),
    '-log', (Join-Path $AnalysisRoot 'analysis/appointments/headless.log'),
    '-scriptlog', (Join-Path $AnalysisRoot 'analysis/appointments/scripts.log'),
    '-postScript', 'ExportChartWorkflow.java', $reports, (Join-Path $AnalysisRoot 'provenance/appointments-targets.txt'))
$started = [DateTime]::UtcNow
& (Join-Path $GhidraInstall 'support/analyzeHeadless.bat') @options
if ($LASTEXITCODE -ne 0) { throw 'Appointments export failed.' }
$report = Get-Item -LiteralPath (Join-Path $reports 'workflow-functions.tsv')
if ($report.LastWriteTimeUtc -lt $started.AddSeconds(-2)) { throw 'Appointments report is stale.' }
if (Import-Csv -LiteralPath $report.FullName -Delimiter "`t" | Where-Object status -ne 'decompiled') {
    throw 'One or more Appointments targets could not be exported.'
}
