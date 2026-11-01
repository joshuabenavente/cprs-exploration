# CPRS Chart Rust recreation research

This workspace contains a mock-only Rust patient selector, five Cover Sheet panels with read-only item details, read-only Notes, Orders, and Results browsers, and static research on CPRS Chart 1.33.214.5 (executable metadata: OR*3.0*639). All nine prototype records are invented. The Rust application has no live connection or clinical-write functionality.

Initial scope includes Chart forms, navigation, client state, and the interfaces Chart uses. VistA server implementation, terminal configuration under `vista/`, and bundled DLL internals are outside this milestone. No CPRS process or live clinical connection is needed for these analysis commands.

The documented development branch is `main`. Current M13 work is on
`m13-notes-filters`, based on fetched `origin/main` at `6428037`;
that baseline commit adds only the [published reverse-engineering folder](reverse-engineering/README.md).
Earlier milestone history, receipts and uncommitted review work are preserved.
Inspect actual Git refs before choosing a branch. See the [current handoff](docs/handoff.md),
[analysis review](docs/analysis-review-2026-11-01.md),
[feature traceability](docs/traceability-2026-11-01.md) and
[proposed M13 Notes filtering milestone](docs/milestone-13.md).
Original reference binaries and the Ghidra database are excluded from the publication.

## Run the current M13 Rust mock

The approved M13 work adds read-only Notes author/date filters. Choose stable
AUTHOR keys (equal labels can name distinct invented authors), enter optional
inclusive YYYY-MM-DD bounds, combine them with the existing substring search,
or Reset all filters. Invalid dates clear transient rows/text and display a
validation message. Reading remains automatic on note selection. No signed-only
eligibility, FileMan dates, provider lookup, editing or signing is implemented.

```powershell
.\scripts\Start-MockChart.ps1 -Rebuild
.\scripts\Test-MockChart.ps1 -Matrix
python scripts\verify_integrated.py
python scripts\test_m13_protocol.py
```

The active runner accepts only M13 and writes platform-specific
`validation/milestone-13/windows/` or `linux/` evidence. `-CodeOnly` omits desktop
execution; `-Bootstrap` fetches locked dependencies before offline checks;
`-Python` selects the installed Windows interpreter. Linux can run
`python3 scripts/validate_m13.py --matrix` with Rust 1.99.1, native build libraries
and an X11 display (a virtual display establishes only synthetic UI evidence).
Unset SLINT_SCALE_FACTOR while compiling; the runner applies it only at runtime.

The journey retains all 83 previous checkpoints and adds eight Notes filtering
checks. New source/build/executable/log bindings and ten requested size/scale
samples are verified together. See [M13](docs/milestone-13.md), the
[filter contract](specifications/notes-filtering.md) and
[native/listening checklist](validation/milestone-13/native-checklist.md).
Windows native and Narrator results must be recorded separately on the new build.

Use `scripts/Review-NotesFilters.ps1 -Size minimum -ScaleFactor 2` after the full
Windows matrix to prepare a native sample. Repeat both sizes at 100%, 125%, 150%,
175% and 200%. The launcher leaves Notes open and records preparation only.
Close the app between samples. The largest-scale default remains 1180x700
logical pixels; minimum is 980x680, other defaults 1180x800. These application
scale overrides do not change Windows display settings.

The earlier M2–M12 commands/receipts are historical. Do not run old validation
writers or the M12 follow-up runner with the changed executable. The historical
M12 user-reported acceptance remains bound to `a88c…`; a new M13 build needs its
own acceptance. Earlier source-bound verifiers can be run in their historical
checkout. All raw evidence and receipts are preserved.

Search MORGAN for duplicate names with distinct synthetic IDs, PATEL for an
acknowledgment, RIVERA for denied access, and zárate or 李 for the Unicode fixture.
SYNTH-002 has empty Notes, Orders, Results and designated Cover Sheet panels.
Orders and Results still require explicit opening. Every record is invented;
there is no VistA connection, credential, clinical import or clinical write API.

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

- [Current M13 Notes filters and validation checkpoint](docs/milestone-13.md)
- [Historical M12 evidence protocol and review checkpoint](docs/milestone-12.md)
- [Historical M11 shared Cover Sheet hardening](docs/milestone-11.md)
- [Historical Appointments milestone, listening pending](docs/milestone-10.md)
- [Appointments static recovery and authored contract](specifications/appointments.md)
- [Accepted Active Medications milestone](docs/milestone-9.md)
- [Active Medications static recovery and authored contract](specifications/active-medications.md)
- [Milestone status and evidence](docs/milestone-1.md)
- [Rust mock implementation and validation](docs/milestone-2.md)
- [Cover Sheet implementation and validation](docs/milestone-3.md)
- [Recovered Cover Sheet evidence and authored behavior](specifications/cover-sheet.md)
- [Patient selection and chart shell specification](specifications/patient-selection-chart.md)
- [Machine-readable validation receipt](analysis/validation/milestone-1.json)

Local distributions, terminal profiles, downloaded tools, caches, raw resource bytes, the Ghidra database, and Rust build output are excluded by `.gitignore`. The local milestone 2 baseline is commit `7923c5b`, tagged `milestone-2-mock`. The current checkpoint is described in `docs/handoff.md`; no remote publication is configured by these scripts.

At the largest supported application scale (200%), the authored default window uses 1180x700 logical pixels; the ordinary 1180x800 default would extend below the reviewed 1440-pixel desktop. Other defaults remain 1180x800 and the minimum is 980x680. The compact default is a bounded policy for the reviewed setup, not a general monitor-fit or DPI-transition guarantee.
