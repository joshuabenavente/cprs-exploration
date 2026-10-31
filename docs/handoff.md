# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. **Milestone 8: mock-only, read-only Cover Sheet Vitals** is implemented and natively validated; the separate user listening result remains pending.

## Checkout and checkpoint

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration` (CPRS Remake).
- Branch: `codex/milestone-8-vitals`, created from the clean current handoff `7f37325`, preserving the full Milestone 7 history.
- Current runtime: invented patient selection; Cover Sheet Problem List, Allergies and Vitals; Notes; Orders; interim-style Results. No original CPRS or clinical connection.
- Milestone 8 evidence: [handoff/results](milestone-8.md), [Vitals contract](../specifications/vitals.md), [static](../validation/milestone-8/static.json), [automated](../validation/milestone-8/automated.json), [integrated](../validation/milestone-8/integrated.json), [native/listening](../validation/milestone-8/native-ui.json), [bounded acceptance](../validation/milestone-8/acceptance.json).
- Formatting, warning-denied Clippy, all 78 core tests, locked/offline build, immediate callback smoke and 51 real-timer checkpoints passed. The journey observed 72 deliveries and rejected 30 stale replies.
- All ten final native layout samples passed: default/minimum at 100%, 125%, 150%, 175%, 200%. At 200% the default uses compact 1180x700 logical sizing. Native minimum-200% arrows/Enter/Tab/Escape/Ctrl+O, text selection and cancellation passed. Ordinary native-launch 100% Tab/Down/Space/Escape also passed; the app is left on SYNTH-001 with Temperature selected for listening.
- Final executable SHA256: `a79bebeece2d5e03fbf0f414bf4c461ffbbf588a125f4f33c00e33e98ae4202f`. It is an ignored build output, never a committed deliverable.
- Authorized local checkpoint: `milestone-8-mock` on the current branch; no push/publication.

## Recovery and authored policy

Focused Ghidra 12.2 export used `-noanalysis`, ten MAP functions and four bounded VMT slots. Assembly/call-site evidence, original input hashes and static verification remain separate from runtime. See `provenance/vitals-targets.txt`, `analysis/vitals/` and `scripts/Analyze-Vitals.ps1`, `inspect_vitals.py`, `verify_vitals.py`.

Constructor columns are Vital, Value, Date Taken and Quals. Row population and `OnGetDetail` format fields from delimited objects; complete server semantics are unresolved. The Vitals `OnShowDetail` slot dispatches to `OnUpdateVitals`, which checks write access and calls `ViewPatientVitals`. That excluded path and DLL internals are not reproduced. The common mock read-only text pane is an explicit authored departure. Values, units and timestamps are compiled strings; they are never parsed, converted or interpreted. `SYNTH-002` has empty Vitals.

Problem List/Allergies occupy the upper row and full-width Vitals the lower row of a scrollable workspace. Selection, explicit focus return and footer actions reveal the appropriate row. Header/navigation/status remain outside workspace scrolling. Enter/Space/View/double-click explicitly open detail; Escape closes and returns to its originating table. Preserve Notes automatic loading and Orders/Results explicit activation, browser cancellation returning to local filters, and exact synthetic identities.

The bundled Fluent table's public `has-focus` does not reflect its internal keyboard scope. Cover Sheet list-focus branches were removed from the test probe rather than treated as actual focus. The integrated journey verifies read-only detail focus and closed/selection state; native arrows after Escape separately check return. UIA snapshots, actual native input, callback/widget probes and user speech reports remain distinct. Milestone 7's combined Narrator pass is historical; no new Vitals speech pass may be claimed without the user's report.

## Reproduce and evidence handling

Close any running mock before rebuilding. Use the explicit installed Python interpreter, not the Windows Store placeholder:

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_vitals.py
& $ChartPython scripts\verify_vitals_checkpoint.py
```

Current automated paths and protocol are Milestone 8 (`M8_*`, 51 checkpoints); the runner only accepts Milestone 8 so it cannot overwrite historical receipts with a current binary. All Milestone 2–7 evidence and historical analysis bytes must remain unchanged. `.gitattributes` preserves Vitals analysis and Milestone 8 log bytes for hashes.

`Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2` uses real timers, then leaves SYNTH-001 / Cover Sheet / VITAL-03 selected and detail closed. Review/minimum/scale launches start at desktop origin. The supported native skill uses `@oai/sky` through node_repl; after a stale window cache, refresh/reset the session and select the current returned window. Full-window screenshots may accompany a 16x16 related surface; exclude the latter from geometry judgments. Do not change Windows settings.

## Remaining action and boundaries

The bounded code/automated/native checkpoint is saved separately from the remaining [Vitals listening checklist](milestone-8.md#separate-vitals-listening-checklist). Do not reuse a historical Narrator pass. No full accessibility, physical IME/dead-key, monitor-DPI transition, clinical compatibility or original-runtime parity claim is supported.

Keep everything mock-only: no clinical server, transport/credentials, clinical imports, entry/editing, graphs/trends, conversions, interpretation, printing or signing; no original CPRS execution, VistA implementation or bundled DLL internals. Preserve generation/patient/panel/item ownership, stale/duplicate success/failure guards and empty/error distinctions. Continue on the current checkout and preserve later user changes. The local milestone checkpoint/tag does not authorize pushing or publishing.

At the largest supported application scale (200%), the authored default window uses 1180x700 logical pixels; the ordinary 1180x800 default would extend below the reviewed 1440-pixel desktop. Other defaults remain 1180x800 and the minimum is 980x680. The compact default is a bounded policy for the reviewed setup, not a general monitor-fit or DPI-transition guarantee.
