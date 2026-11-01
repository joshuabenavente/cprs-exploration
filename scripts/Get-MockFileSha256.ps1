function Get-MockFileSha256 {
    param([Parameter(Mandatory = $true)][string]$LiteralPath)
    # Works in Windows PowerShell 5.1 and pwsh without module auto-loading.
    $algorithm = [Security.Cryptography.SHA256]::Create()
    $stream = [IO.File]::OpenRead($LiteralPath)
    try {
        return [BitConverter]::ToString($algorithm.ComputeHash($stream)).Replace('-', '').ToLowerInvariant()
    } finally { $stream.Dispose(); $algorithm.Dispose() }
}
