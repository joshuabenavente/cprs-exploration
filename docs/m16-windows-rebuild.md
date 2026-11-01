# Update to the 100% functional M16 runner

The active policy now tests functionality at 100% only. Keyboard/focus/navigation
and screen readers are excluded, and other scales are deferred. The previous
Windows full-scale attempt and its reported focus failure remain historical.
Update to the delivered functional-policy source; old 1617e03 uses the former
full-scale runner. Do not repeat its native/Narrator checklist during this phase.

Close the mock first. From the Windows repository, run the following in
PowerShell. It preserves the existing executable and any current M16 Windows
evidence outside the repository, then updates source and builds the new functional
executable. Older milestone receipts are not rewritten.
Update normally using fast-forward Git commands; no Git reset or working-tree
cleanup is needed. Stop if Git reports local changes or cannot fast-forward.

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
if (Test-Path '.\validation\milestone-16\functional-100\windows') {
    Copy-Item '.\validation\milestone-16\functional-100\windows' (Join-Path $cprsArchive 'functional-100-windows') -Recurse
}
Write-Host "Preserved existing build/evidence in $cprsArchive"

git switch main
if ($LASTEXITCODE -ne 0) { throw 'Git switch failed; stop here.' }
git pull --ff-only
if ($LASTEXITCODE -ne 0) { throw 'Git pull failed; stop here.' }
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap

python scripts/verify_integrated.py
if ($LASTEXITCODE -ne 0) { throw 'M16 binding verification failed; stop here.' }

Get-Content '.\validation\milestone-16\functional-100\windows\automated.json' -Raw |
    ConvertFrom-Json |
    Select-Object protocol, passed, matrix_requested, executable_sha256, executable
Get-FileHash '.\target\debug\cprs-chart-mock.exe' -Algorithm SHA256
```

Send the final receipt fields and executable hash. The receipt must say M16F100,
passed=True, matrix_requested=True, and its executable hash must match the file.
The verifier checks the current source, executable, step logs and both 100% matrix
samples. On failure, stop and send the first error plus the referenced step log;
do not use the earlier pass report to bypass the failed check.

After the new build is verified, use `Review-Functional.ps1 -Size default`, then
close and repeat with `-Size minimum`. Both are 100%. This launches the normal
app for manual functional checks without a background automatic journey. Follow
the [functional checklist](../validation/milestone-16/functional-100/manual-checklist.md).
Do not run keyboard navigation, Narrator or other-scale tests during this phase.
Preserve prior EXEs and receipts for archival follow-up; do not apply their pass
reports to the new executable without a matching build binding.
