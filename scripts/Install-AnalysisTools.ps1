[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$lock = Get-Content -LiteralPath (Join-Path $root 'tools/toolchain.lock.json') -Raw | ConvertFrom-Json
$downloads = Join-Path $root '.tools/downloads'
New-Item -ItemType Directory -Path $downloads -Force | Out-Null
foreach ($name in @('jdk', 'ghidra')) {
    $tool = $lock.$name
    $archive = Join-Path $downloads $tool.archive
    if (-not (Test-Path -LiteralPath $archive)) {
        & curl.exe --fail --location --retry 2 --connect-timeout 30 --output "$archive.partial" $tool.url
        if ($LASTEXITCODE -ne 0) { throw "Download failed for $name" }
        Move-Item -LiteralPath "$archive.partial" -Destination $archive
    }
    $actual = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $tool.sha256) { throw "SHA256 mismatch for $name" }
    $directory = Join-Path $root ('.tools/' + $tool.directory)
    if (-not (Test-Path -LiteralPath $directory)) {
        & tar.exe -xf $archive -C (Join-Path $root '.tools')
        if ($LASTEXITCODE -ne 0) { throw "Extraction failed for $name" }
    }
    Write-Output "$name $($tool.version): archive verified, extracted to $directory"
}
& (Join-Path $root ('.tools/' + $lock.jdk.directory + '/bin/java.exe')) -version
if ($LASTEXITCODE -ne 0) { throw 'JDK launch failed' }
