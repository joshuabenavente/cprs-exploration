# CPRS Chart Rust recreation research

This workspace contains a mock-only Rust patient selector, five Cover Sheet panels with read-only item details, read-only Notes, Orders, and Results browsers, and static research on CPRS Chart 1.33.214.5 (executable metadata: OR*3.0*639). All nine prototype records are invented. The Rust application has no live connection or clinical-write functionality.

Initial scope includes Chart forms, navigation, client state, and the interfaces Chart uses. VistA server implementation, terminal configuration under `vista/`, and bundled DLL internals are outside this milestone. No CPRS process or live clinical connection is needed for these analysis commands.

The development branch is `main`. The active testing phase is **functionality at
100% scale only**, at default and minimum sizes. Keyboard/focus/navigation and
screen-reader checks are excluded; other scales are deferred until the functional
work is finished. See [validation policy](docs/validation-policy.md), the
[functional checklist](validation/milestone-16/functional-100/manual-checklist.md),
[current handoff](docs/handoff.md) and [delivery approval](docs/delivery-workflow.md).

## Run and validate the current mock

```powershell
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap
python scripts/verify_integrated.py
python scripts/test_m16_functional_protocol.py
```

`-Matrix` runs default-100 and minimum-100 only; `-CodeOnly` omits desktop execution.
The active protocol is M16F100; receipts are written under
`validation/milestone-16/functional-100/windows/` or `linux/`. Linux uses
`python3 scripts/validate_m16_functional.py --matrix` with the pinned Rust and X11
software backend. The older full-scale M16 writer/review entry points are frozen.

After automation passes, review functionality in the normal app:

```powershell
.\scripts\Review-Functional.ps1 -Size default
```

Close it and repeat with `-Size minimum`; both are fixed at 100%. The manual
launcher does not run a background automatic journey. No keyboard-navigation or
Narrator report is requested. Use the [Windows update/rebuild guide](docs/m16-windows-rebuild.md)
when moving from the old full-scale build; preserve its EXE and logs first.

Nine invented patients, five Cover Sheet panels and the read-only Notes, Orders
and Results browsers remain. Notes has text/author/date filters and automatic
reading; Orders text/status/date and Results text/date filters preserve explicit
detail opening. Historical evidence and the [M16 overview](docs/project-overview-m16.md)
remain available; the current policy supersedes their previous acceptance gates.
The [published reverse-engineering folder](reverse-engineering/README.md) is unchanged.

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

- [Current M16 search-page integrity and validation checkpoint](docs/milestone-16.md)
- [Merged M13 Notes filters (native/listening pending)](docs/milestone-13.md)
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
