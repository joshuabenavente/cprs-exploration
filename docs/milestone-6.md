# Milestone 6: mock-only read-only Results

Results now provides one invented interim-style laboratory report list and an explicit read-only text action. Patient selection, Cover Sheet, Notes, and Orders remain available. This completes a first implementation of the shell's four tabs; it does not establish complete CPRS Chart coverage.

Start with `scripts/Start-MockChart.ps1` or the native app launcher. Native launch preserves the previously verified clipboard path. Choose CARTER, JAMIE / SYNTH-001, then Results. The list shows Date, Report, Training specimen, and Location, sorted newest first. Filter by report ID/title, report type, specimen, or location. The type is fixed to Invented interim-style text.

Selection only highlights. Enter, double-click, or View report detail opens text. Escape or Close detail clears it and retains the selected row. Ctrl+F returns to the filter; Ctrl+O opens patient selection. Cancel preserves the committed patient/tab and reloads a fresh unselected list. Horizontal table and text scrolling expose content that does not fit.

Reports 01 and 02 share a title but have different identities. Report 03 has long Unicode text; Report 04 succeeds with empty text. SYNTH-002 has no reports. The scenario selector provides unavailable lists, unavailable report text, and slow replies. Retry repeats the current operation; scenario changes reload the filtered list. No real lab measurements, reference ranges, abnormal flags, or clinical interpretation are modeled.

The [Results specification](../specifications/results.md) separates source findings from authored behavior. Static evidence consists of one complete Laboratory Results form and 12 focused functions. In particular, `rLabs.Interim` receives its RPC name from report configuration; neither its interface nor the nearby `ORWLRR INTERIMS` literal is used as a live contract. Raw assembly/decompilations and annotations remain separate from Rust code and are hashed in the static receipt.

## Validation

Close the mock before rebuilding. Receipts are written only to `validation/milestone-6/`; earlier receipts remain historical.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\inspect_results.py
.\scripts\Analyze-Results.ps1
& $ChartPython scripts\resolve_workflow.py --results
& $ChartPython scripts\verify_results.py
```

Keep the Ghidra GUI project closed during export. Preserve generated evidence bytes, including exporter whitespace. The static verifier checks pinned input hashes, MAP coverage, resource identity, and nonempty exports. The core has 70 workflow tests: 15 Results cases and 55 existing regressions. Desktop callback smoke exercises Results selection/open/close, double-click, filtering, errors/retry, and patient clearing alongside the earlier workflows.

Native UI observations and Results Narrator listening status belong in `validation/milestone-6/native-ui.json`. Earlier Notes and Orders speech checks remain separate. Immediate UIA focus/document snapshots can lag native actions; settled screenshots and caret/selection behavior must be assessed separately. No exact latency or complete accessibility conformance is claimed.

Formatting, warning-free Clippy, all 70 tests, offline build, and desktop callback smoke passed on the final executable. Native samples covered the default 1180x800 logical client at 100% and minimum 980x680 at 200%. Explicit activation/close, duplicate titles, Unicode filtering/long text, read-only selection, list/report error and retry, successful empty report/list states, and patient cancellation/switching were checked. Notes and Orders reading panes/actions and the default Cover Sheet cards remained usable after removing shared layout gaps from hidden views. The corrected Results lower actions fitted inside the card at both samples.

The long report exposed 14,391 selectable characters through its end marker; a normal typing key did not replace that text. Unicode filtering used clipboard-backed tool input after native launch, while a later report-ID filter used accessible value replacement. Neither establishes physical IME composition. Minimum-size capture exposed a 16x16 related surface plus the full 1962x1392 window; coordinate actions used the full-window screenshot. Intermediate application scales and Windows monitor DPI changes were not tested.

The runtime remains compiled synthetic data only, with no clinical imports, live connection, credentials, interpretation, graphs, printing/export, acknowledgment, order entry, or signing. Physical IME/dead keys, full assistive-technology conformance, original-client runtime parity, server contracts/site permissions, and clinical compatibility remain unverified.
