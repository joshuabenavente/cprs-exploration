# GitHub distribution

The requested analysis reports, specification and uncertainty records are stored in this folder. Start with [README.md](README.md), [specification.json](specification.json) and [catalog/uncertainties.json](catalog/uncertainties.json).

Large text catalogs are stored as deterministic gzip files to keep Git objects below large-file limits. The JSON specification records their original paths. After checkout, run `./reverse-engineering/Expand-Catalogs.ps1` from the repository root to restore those paths and verify every decompressed SHA-256. Existing files with a different checksum are preserved and reported as conflicts.

The top-level Markdown links point to compressed downloads where needed. Original evidence, capture-time paths and validation receipts are preserved. The source validation receipt is a record of the original analysis workspace, rather than a claim that every copied document has unchanged publication links. `PUBLICATION-MANIFEST.json` records source hashes, stored paths and compression choices.

## Save into the Windows checkout

From PowerShell:

```powershell
Set-Location 'C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration'
git fetch origin reverse-engineering-reports
git restore --source=FETCH_HEAD --worktree -- reverse-engineering
.\reverse-engineering\Expand-Catalogs.ps1
```

This retrieves only the analysis folder into the working tree. Check for existing local changes before restoring paths. The resulting location is `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration\reverse-engineering`.

## Local reference assets

The original executable, supplied DLLs/help files, Ghidra database, tool installations and caches are excluded from this public distribution, consistent with the repository's existing treatment of local reference binaries. They remain in the original cloud analysis workspace and bundle. The executable and MAP hashes, derived catalogs, selected disassembly, analysis scripts, reconstruction notes and exact analysis options are included.

To reproduce static extraction locally, provide the original uploaded reference files under `reverse-engineering/input/cprs/` and adjust installation paths in the launcher. The original Windows checkout already keeps reference files separately under `cprs/`. No execution of the original client is required. See [REPRODUCE.md](REPRODUCE.md) for the analysis sequence and limits.
