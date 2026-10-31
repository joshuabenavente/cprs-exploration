[CmdletBinding()]
param()
. (Join-Path $PSScriptRoot 'Use-AnalysisEnvironment.ps1')
& (Join-Path $GhidraInstall 'ghidraRun.bat') (Join-Path $AnalysisRoot 'analysis/projects/CPRSChartFocused.gpr')
