# CPRS Chart Rust recreation research

This workspace contains a mock-only Rust patient selector, two Cover Sheet panels with read-only item details, read-only Notes and Orders browsers, and static research on CPRS Chart 1.33.214.5 (executable metadata: OR*3.0*639). All nine prototype records are invented. The Rust application has no live connection or clinical-write functionality.

Initial scope includes Chart forms, navigation, client state, and the interfaces Chart uses. VistA server implementation, terminal configuration under `vista/`, and bundled DLL internals are outside this milestone. No CPRS process or live clinical connection is needed for these analysis commands.

## Run the Rust mock

```powershell
.\scripts\Start-MockChart.ps1
```

Use `-Rebuild` after source changes. Search for `MORGAN` to see duplicate-name records with distinct synthetic IDs, `PATEL` for an acknowledgment, or `RIVERA` for denied mock access. `zárate` or `李` finds the Unicode fixture. Cover Sheet has synthetic Problem List and Allergies panels. Notes loads a selected document automatically. Orders highlights a row first; Enter, double-click, or View order detail explicitly opens its read-only text. Both browsers support filtering, long Unicode fixtures, and error/retry simulations. SYNTH-002 has empty Notes and Orders lists. Results remains a placeholder.

Run `scripts/Test-MockChart.ps1` for offline automated checks, now written under `validation/milestone-5/`. See the [current handoff](docs/milestone-5.md), [Orders specification](specifications/orders.md), and [Notes specification](specifications/notes.md). The original Ghidra analysis remains separate from the running app.

For a repeatable layout check, use `scripts/Start-MockChart.ps1 -MinimumSize -ScaleFactor 1.25`. Supported application scale overrides are 1, 1.25, 1.5, 1.75, and 2. They do not change Windows display settings. Close the app before rebuilding or launching another scale check.

## Analysis tools

Ghidra 12.2 and Temurin JDK 25.0.5+8 are pinned in [tools/toolchain.lock.json](tools/toolchain.lock.json). Archives are verified against release SHA256 digests and extracted under `.tools/`. The launch scripts use a local JDK and direct Ghidra preferences, caches, and temporary files to `.local/`. They do not change machine environment settings.

```powershell
.\scripts\Install-AnalysisTools.ps1
```

Official releases: [Ghidra 12.2](https://github.com/NationalSecurityAgency/ghidra/releases/tag/Ghidra_12.2_build) and [Temurin JDK 25.0.5+8](https://github.com/adoptium/temurin25-binaries/releases/tag/jdk-25.0.5%2B8). See the [Ghidra requirements](https://github.com/NationalSecurityAgency/ghidra/blob/Ghidra_12.2_build/GhidraDocs/GettingStarted.md) for supported platforms.

## Open the Chart project

Run this from a dedicated PowerShell terminal in this directory:

```powershell
.\scripts\Start-Ghidra.ps1
```

The saved project is `analysis/projects/CPRSChartFocused.gpr`. Open `CPRSChart.exe` in CodeBrowser and navigate to `fPtSel.SelectPatient`, `fPtSel.TfrmPtSel.cmdOKClick`, or `fFrame.TfrmFrame.SetupPatient` in the Symbol Tree. These are map-derived names, not recovered Pascal source. Decline automatic whole-program analysis if prompted; the initial full pass exhausted its 4 GB heap, and the saved project uses focused disassembly.

## Reproduce the static inventory

Python 3.14.8 was used; the scripts use only its standard library. Set `$ChartPython` to an installed Python interpreter, avoiding a Windows Store placeholder executable.

```powershell
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\inspect_chart.py
& $ChartPython scripts\decode_dfm.py
```

The inspector checks inputs against [provenance/chart.lock.json](provenance/chart.lock.json), compares the MAP entry point and major sections, exports file-backed symbols, inventories PE resources and direct imports, and extracts four forms. The DFM decoder requires complete consumption of each resource; inherited base form defaults are not expanded.

For an initial import when the project does not exist:

```powershell
.\scripts\Analyze-Chart.ps1
```

The importer refuses a different executable hash. The focused project imports MAP labels, disassembles selected workflow entry points, and exports those functions with automatic whole-program analysis disabled. To export focused decompilations again from an existing, closed project:

```powershell
.\scripts\Analyze-Chart.ps1 -RefreshReports
& $ChartPython scripts\resolve_workflow.py
& $ChartPython scripts\verify_milestone.py
```

Keep the GUI project closed during headless processing. Logs are in `analysis/logs/`; decompilations, instruction listings, and call-site tables are in `analysis/decompiled/`. Separate MAP address and Delphi literal annotations are in `analysis/resolved/`. The menu handler includes a manually seeded exception continuation; its C output still omits some instruction paths. Decompiler success means code was produced; it does not establish complete control flow, inferred types, or clinical behavior.

## Milestone documents

- [Milestone status and evidence](docs/milestone-1.md)
- [Rust mock implementation and validation](docs/milestone-2.md)
- [Cover Sheet implementation and validation](docs/milestone-3.md)
- [Recovered Cover Sheet evidence and authored behavior](specifications/cover-sheet.md)
- [Patient selection and chart shell specification](specifications/patient-selection-chart.md)
- [Machine-readable validation receipt](analysis/validation/milestone-1.json)

Local distributions, terminal profiles, downloaded tools, caches, raw resource bytes, the Ghidra database, and Rust build output are excluded by `.gitignore`. The local milestone 2 baseline is commit `7923c5b`, tagged `milestone-2-mock`. Subsequent work is on `work/milestone-3-cover-sheet`; no remote publication is configured by these scripts.
