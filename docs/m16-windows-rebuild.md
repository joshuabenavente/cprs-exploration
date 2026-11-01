# Rebuild the Windows M16 executable

The user reported Windows Git HEAD `1617e03b65f2f869b4a37e99e2d41f5766cf77d9`,
an executable hash matching historical M12, and no
`validation/milestone-16/windows/automated.json`. The reported commit has the
same tracked runtime/build inputs as the checked M16 PR head. Being on that
commit does not establish which executable was built or launched. Current native
acceptance remains unresolved; retain the existing pass report as user-reported.

Close the mock first. From the Windows repository, run the following in
PowerShell. It preserves the existing executable and any current M16 Windows
evidence outside the repository, then clears only generated desktop-package
artifacts to force a new executable. Older milestone receipts are not rewritten.
The confirmed source commit is sufficient; a Git reset, cleanup or pull is not
needed for this rebuild.

```powershell
$ErrorActionPreference = 'Stop'
Set-Location 'C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration'

$cprsArchive = Join-Path $env:TEMP ('cprs-before-m16-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $cprsArchive | Out-Null
if (Test-Path '.\target\debug\cprs-chart-mock.exe') {
    Copy-Item '.\target\debug\cprs-chart-mock.exe' (Join-Path $cprsArchive 'previous.exe')
    Get-FileHash (Join-Path $cprsArchive 'previous.exe') -Algorithm SHA256 |
        Format-List | Out-File (Join-Path $cprsArchive 'previous-hash.txt')
}
if (Test-Path '.\validation\milestone-16\windows') {
    Copy-Item '.\validation\milestone-16\windows' (Join-Path $cprsArchive 'windows') -Recurse
}
Write-Host "Preserved existing build/evidence in $cprsArchive"

cargo clean -p cprs-chart-mock
if ($LASTEXITCODE -ne 0) { throw 'Package cleanup failed; stop here.' }
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap

python scripts/verify_integrated.py
if ($LASTEXITCODE -ne 0) { throw 'M16 binding verification failed; stop here.' }

Get-Content '.\validation\milestone-16\windows\automated.json' -Raw |
    ConvertFrom-Json |
    Select-Object protocol, passed, matrix_requested, executable_sha256, executable
Get-FileHash '.\target\debug\cprs-chart-mock.exe' -Algorithm SHA256
```

Send the final receipt fields and executable hash. The receipt must say M16,
passed=True, matrix_requested=True, and its executable hash must match the file.
The verifier checks the current source, executable, step logs and every matrix
sample. On failure, stop and send the first error plus the referenced step log;
do not use the earlier pass report to bypass the failed check.

After the new build is verified, repeat the ten native visual/keyboard and Narrator
samples against that executable using `Review-SearchPages.ps1` and the
[M16 checklist](../validation/milestone-16/native-checklist.md). Automated matrix
success is separate from those observations. Preserve the archived old executable
for historical M12 artifact follow-up; it is not the current M16 test target.
