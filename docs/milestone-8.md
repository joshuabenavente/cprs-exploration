# Milestone 8: synthetic read-only Cover Sheet Vitals

Milestone 8 adds a third synthetic panel, with recovered `Vital`, `Value`, `Date Taken` and `Quals` headings and authored fixture values/units/timestamps/details. Problem List and Allergies remain together above the full-width Vitals row. The workspace scrolls while the patient header, navigation and status stay fixed.

The [Vitals contract](../specifications/vitals.md) separates static observations, authored policy and unresolved semantics. Ten MAP targets were exported with focused Ghidra analysis and whole-program analysis disabled. Raw assembly, direct call sites, annotations and four bounded VMT entries are hashed in [static evidence](../validation/milestone-8/static.json). The original Vitals show-detail override reaches a write-access-checked viewer path. The mock deliberately uses its read-only text pane instead; no original viewer, DLL or server path is executed or implemented.

## Reproduce

Close the mock before rebuilding. From an ordinary PowerShell session:

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_vitals.py
```

The current validation script accepts only Milestone 8. New output goes to `validation/milestone-8/`; prior receipts remain historical and unchanged. The integrated protocol is `M8_*`, with 51 required checkpoints. The harness invokes callbacks with normal timers; it does not inject physical keys or listen to speech.

For native layout review use `scripts/Start-MockChart.ps1 -IntegratedReview`, optionally `-MinimumSize`, and `-ScaleFactor 1`, `1.25`, `1.5`, `1.75` or `2`. Close each instance before launching another. The journey ends on SYNTH-001 / Cover Sheet / selected VITAL-03 with detail closed. `M8_WINDOW` records actual client pixels/scale. Scale overrides do not change Windows settings or establish monitor-DPI transitions.

## Evidence status

Final automated validation passed: formatting, warning-denied Clippy, all 78 core tests, locked/offline build, immediate callback smoke and the 51-checkpoint timed journey (72 actual deliveries, 30 rejected stale replies). Evidence is recorded separately in [automated](../validation/milestone-8/automated.json), [integrated](../validation/milestone-8/integrated.json), [native/listening](../validation/milestone-8/native-ui.json) and [acceptance](../validation/milestone-8/acceptance.json) receipts. The current handoff is the status authority. Run `scripts/verify_vitals_checkpoint.py` after the native receipt is complete to bind all current receipts and native logs to the final mock.

The bundled Fluent table's public `has-focus` property does not track its internal keyboard scope. Therefore the Cover Sheet table branches were removed from the automated focus probe. The timed journey still verifies actual read-only detail-text focus, closed state and retained/cleared selection. Native arrow behavior after Escape separately establishes table return. No fake focus flag or delayed focus workaround is used. Immediate UIA snapshots can lag native input; snapshots are reported separately from settled behavior.

## Separate Vitals listening checklist

Use only SYNTH-001 invented records. With Narrator enabled, Tab to Vitals, select Temperature and confirm the synthetic patient identity and selected item label are spoken. Enter should move to matching read-only VITAL-01 detail, including the invented value/unit and timestamp; Escape should return to Vitals. Down should select Pulse, and Space should open VITAL-02. Tab through the View item detail action and confirm its accessible name identifies Vitals. Ctrl+O then Escape should preserve the committed chart and clear Vitals selection/detail; an empty SYNTH-002 Vitals panel should announce synthetic emptiness without implying a clinical finding. Report missing, incorrect or stale speech separately from visible labels and keyboard behavior.

Milestone 7's combined user-reported Narrator pass remains historical. A new Vitals pass requires the user's report. Full assistive-technology conformance, original-client parity, clinical compatibility, physical IME and monitor-DPI transitions remain unverified.

No clinical server, transport, credentials, imported clinical records, entry/editing, graphs, unit conversion, interpretation, printing, signing, original-client execution, VistA internals or DLL internals are part of this checkpoint. Nothing is pushed or published.

At the largest supported application scale (200%), the authored default window uses 1180x700 logical pixels; the ordinary 1180x800 default would extend below the reviewed 1440-pixel desktop. Other defaults remain 1180x800 and the minimum is 980x680. The compact default is a bounded policy for the reviewed setup, not a general monitor-fit or DPI-transition guarantee.

All ten final-executable default/minimum layout samples passed at 100%, 125%, 150%, 175% and 200%. Actual geometry and full-window capture dimensions are in `native-ui.json`; the preliminary clipped 200% capture is explicitly excluded. Native minimum-200% Up/Enter/Tab/Escape/Ctrl+O behavior and 501-character read-only text selection passed. Spoken output remains pending the separate user report.
