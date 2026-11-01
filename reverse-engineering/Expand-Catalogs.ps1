[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$AnalysisRoot = $PSScriptRoot
$Manifest = Get-Content -LiteralPath (Join-Path $AnalysisRoot 'PUBLICATION-MANIFEST.json') -Raw | ConvertFrom-Json
foreach ($Entry in $Manifest.files) {
    if (-not $Entry.compressed) { continue }
    $SourceFile = Join-Path $AnalysisRoot $Entry.stored_path
    $TargetFile = Join-Path $AnalysisRoot $Entry.path
    if (Test-Path -LiteralPath $TargetFile) {
        if ((Get-FileHash -LiteralPath $TargetFile -Algorithm SHA256).Hash.ToLowerInvariant() -eq $Entry.source_sha256) { continue }
        throw "Existing file differs from the recorded evidence: $TargetFile"
    }
    $TempFile = "$TargetFile.partial"
    if (Test-Path -LiteralPath $TempFile) { throw "Remove or inspect the previous partial file before retrying: $TempFile" }
    $InputStream = [System.IO.File]::OpenRead($SourceFile)
    try {
        $GzipStream = [System.IO.Compression.GZipStream]::new($InputStream, [System.IO.Compression.CompressionMode]::Decompress)
        try {
            $OutputStream = [System.IO.File]::Create($TempFile)
            try { $GzipStream.CopyTo($OutputStream) } finally { $OutputStream.Dispose() }
        } finally { $GzipStream.Dispose() }
    } finally { $InputStream.Dispose() }
    if ((Get-FileHash -LiteralPath $TempFile -Algorithm SHA256).Hash.ToLowerInvariant() -ne $Entry.source_sha256) {
        Remove-Item -LiteralPath $TempFile
        throw "Decompressed checksum mismatch: $TargetFile"
    }
    Move-Item -LiteralPath $TempFile -Destination $TargetFile
    Write-Host "Restored $($Entry.path)"
}
Write-Host 'All compressed catalogs match their recorded SHA-256 hashes.'
