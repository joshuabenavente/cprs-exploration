# Milestone 10: mock-only Cover Sheet Appointments

The fifth Cover Sheet panel uses recovered **Date/Time**, **Location** and **Action Req** headings. [The contract](../specifications/appointments.md) distinguishes static observations, authored display policy and unresolved original dispatch. Separate APPT identities and literal invented strings do not change the chart visit. All details use the mock's read-only text pane.

## Reproduce

Close the mock before building:

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_appointments.py
& $ChartPython scripts\verify_appointments_checkpoint.py
```

Current automation accepts only Milestone 10 and writes `validation/milestone-10/` with `M10_*` logs. Historical receipts must not be regenerated with the current executable. Focused recovery uses `Analyze-Appointments.ps1`, `inspect_appointments.py` and `resolve_workflow.py --appointments`; it never executes CPRS.

Native review uses `scripts/Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2`. The timed journey leaves SYNTH-001 / Cover Sheet / APPT-03 selected, detail closed. Other default sizes remain 1180x800 logical, minimum 980x680, compact 200% default 1180x700. Overrides are process-local, without Windows display changes or monitor-transition claims.

## Evidence status

Static verification passed for twelve focused functions and four VMT slots. Final formatting, warning-denied Clippy, 96 core tests, locked/offline build, immediate callback smoke and 71 real-timer checkpoints passed (92 deliveries, 38 stale replies rejected). Native Enter/Space/View/double-click/Escape/Tab/arrows/Ctrl+O, read-only text selection, horizontal scrolling and selector cancellation passed. All ten default/minimum layout samples passed at 100%, 125%, 150%, 175% and 200%; upper and middle panels were additionally inspected at default 100% and minimum 200%. The first native sample exposed overlapping help/footer text; increasing the scrollable Cover Sheet height to 1400 logical pixels corrected it, and the final executable reran automated checks. See [native notes](../validation/milestone-10/native-notes.md), [native receipt](../validation/milestone-10/native-ui.json), [automated receipt](../validation/milestone-10/automated.json), [integrated receipt](../validation/milestone-10/integrated.json) and [bounded checkpoint](../validation/milestone-10/acceptance.json).

All 617 previous tracked analysis/validation files remain byte-identical. At native handoff the mock was left open at default 100%, SYNTH-001 / Appointments, detail closed; its current window state is not implied by this historical observation. Appointment listening remains pending. The user subsequently authorized committing and pushing the current checkpoint on 31 October 2026. The private destination and recommended next steps are recorded in the [handoff](handoff.md); publication does not establish listening acceptance.

## Separate Appointments listening checklist

With Narrator enabled, open invented SYNTH-001. Tab through Cover Sheet to Appointments; confirm the panel, patient identity and selected Date/Time text are spoken. Open APPT-01 with Enter and confirm Nov 02, 2026@09:00, Training location Alpha and Demo action A match the selected row. Escape should return to its table; Down then Space should open APPT-02 with Nov 03, 2026@14:30, Training location Beta and Demo action B. Confirm the View action identifies Appointments. Open APPT-03 and confirm the extended Gamma location including Zoë 李 and Demo action C. Ctrl+O then Escape should preserve SYNTH-001 while clearing appointment selection/detail. Open SYNTH-002 and confirm the empty panel is described as synthetic emptiness. Report missing, incorrect or stale speech separately from visible text/native keys.

Listening is pending until the user reports this separate checklist. Earlier listening passes do not establish appointment speech behavior. No audio recording or independent agent verification of speech is claimed.
