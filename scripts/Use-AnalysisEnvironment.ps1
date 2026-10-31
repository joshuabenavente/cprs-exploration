$ErrorActionPreference = 'Stop'
$AnalysisRoot = Split-Path -Parent $PSScriptRoot
$AnalysisLock = Get-Content -LiteralPath (Join-Path $AnalysisRoot 'tools/toolchain.lock.json') -Raw | ConvertFrom-Json
$env:JAVA_HOME = Join-Path $AnalysisRoot ('.tools/' + $AnalysisLock.jdk.directory)
$env:PATH = (Join-Path $env:JAVA_HOME 'bin') + ';' + $env:PATH
$env:USERPROFILE = Join-Path $AnalysisRoot '.local/home'
$env:APPDATA = Join-Path $AnalysisRoot '.local/appdata'
$env:LOCALAPPDATA = Join-Path $AnalysisRoot '.local/localappdata'
$env:TEMP = Join-Path $AnalysisRoot '.local/tmp'
$env:TMP = $env:TEMP
foreach ($directory in @($env:USERPROFILE, $env:APPDATA, $env:LOCALAPPDATA, $env:TEMP,
        (Join-Path $AnalysisRoot 'analysis/projects'), (Join-Path $AnalysisRoot 'analysis/logs'))) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
}
$env:GHIDRA_HEADLESS_MAXMEM = '4G'
$GhidraInstall = Join-Path $AnalysisRoot ('.tools/' + $AnalysisLock.ghidra.directory)
