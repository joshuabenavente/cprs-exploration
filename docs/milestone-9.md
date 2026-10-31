# Milestone 9: mock-only Active Medications

Adds the fourth Cover Sheet panel with recovered Medication and Status headings. [The contract](../specifications/active-medications.md) distinguishes thirteen focused static targets, four bounded VMT slots, authored local fixtures and unresolved semantics. Original detail RPC and report-viewer dispatch are excluded; the panel opens only the mock's read-only text pane. No instructions or medication dates are invented beyond the recovered two-column structure.

## Reproduce

Close the mock before building. Use the installed interpreter explicitly (sandbox LOCALAPPDATA can differ):

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_active_medications.py
& $ChartPython scripts\verify_active_medications_checkpoint.py
```

Current automation accepts only Milestone 9, with `M9_*` logs. Native review uses `scripts/Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2`. The final review state is SYNTH-001 / Cover Sheet / MED-03 selected with detail closed. Close each process before the next launch. Process-local scale overrides do not change Windows settings or establish monitor-DPI transitions. The compact 200% default remains 1180x700 logical; other defaults remain 1180x800, minimum 980x680.

## Evidence status

Formatting, warning-denied Clippy, all 87 core tests, locked/offline build, immediate callback smoke and 61 timed checkpoints passed (82 deliveries, 34 stale replies rejected). All ten default/minimum native layout samples passed at 100%, 125%, 150%, 175% and 200%. Native keyboard, pointer activation, read-only selection, horizontal scrolling and cancellation checks passed. [Automated](../validation/milestone-9/automated.json), [integrated](../validation/milestone-9/integrated.json), [native](../validation/milestone-9/native-ui.json), [static](../validation/milestone-9/static.json) and [bounded acceptance](../validation/milestone-9/acceptance.json) receipts bind the result to the final executable. Earlier evidence is unchanged (424 files checked); the exact incoming handoff is preserved separately. The current [handoff](handoff.md) records final status. At native handoff the mock was left at default 100%, SYNTH-001 / Active Medications / Alpha (MED-01) selected with detail closed. The user subsequently reported **The medication listening checklist passes.** Bounded Milestone 9 acceptance is complete. User listening remains separate from automated and native checks; no recorded audio or independent agent verification of speech is claimed. The user subsequently authorized a local commit of the accepted Milestone 9 work on 31 October 2026. No push or publication is authorized.

## Separate Active Medications listening checklist

Use invented SYNTH-001 with Narrator enabled. Tab through the Cover Sheet to Active Medications and confirm that its panel, patient identity and selected medication label are spoken. Select Alpha; Enter should read matching MED-01 local detail and Demo active A. Escape should return to the medication table; Down then Space should read MED-02 / Demo active B. Confirm the View action identifies Active Medications. Check Gamma's extended label including Zoë 李, and the matching MED-03 text/status. Ctrl+O then Escape should preserve SYNTH-001 while clearing medication selection/detail. Open SYNTH-002 and confirm the empty panel is described as synthetic emptiness. Report missing, incorrect or stale speech separately from visible labels and native keys.

The user reported that this separate medication checklist passes. Historical Milestone 7 and 8 listening results remain separate. No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical-compatibility claim is supported.
