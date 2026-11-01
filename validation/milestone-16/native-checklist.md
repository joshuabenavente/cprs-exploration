# M16 current-build native and listening checklist

Status: NOT RUN. Use a fresh M16 Windows executable and its own source/build/EXE
bindings. Linux callbacks/geometry/captures and hosted compilation are separate.
M12 speech acceptance and M13–M15 historical receipts are not inherited.

Run `scripts/Test-MockChart.ps1 -Matrix` (optionally `-Bootstrap`), then
`python scripts/verify_integrated.py` and `python scripts/test_m16_protocol.py`.
Use `scripts/Review-SearchPages.ps1 -Size default -ScaleFactor 1`, repeating
both default/minimum sizes at 1, 1.25, 1.5, 1.75 and 2. The launcher verifies
bindings and leaves SYNTH-001 patient selection open; it records preparation only.

For each of the ten samples retain the exact Windows EXE SHA256, source/build
bindings, requested/observed size/scale, settled screenshots and keyboard/focus
observations. Record Narrator listening separately. Mark failed, blocked and
not-run explicitly; do not infer a pass from screenshots or UIA.

1. Tab/Shift+Tab through query, mode, scenario, candidates, Previous/Next,
   selection/Cancel and acknowledgment. Fixed committed header/footer remain
   visible; focus reveals controls and exposes exact synthetic identity.
2. All fixtures / blank query shows 1–4 of 9, then 5–8 and 9 of 9. Forward/back
   navigation enables correct buttons and clears preview. Unicode SYNTH-009 and
   duplicate MORGAN IDs remain distinguishable. Demo roster has four authored
   IDs and still denies SYNTH-006; no access policy is overridden.
3. Choose Invalid search page: no rows, preview, paging or confirmation is
   available; malformed status is readable. The committed chart stays unchanged.
   Recover with Normal, change queries/modes and cancel during slow replies.
   Late successes/failures must not restore old candidates or change the chart.
   Search unavailable, malformed fixture and successful empty remain distinct.
4. Open the exact patient explicitly; acknowledgments/denial/deceased flags retain
   their authored behavior. Confirm header identity and independent tab states.
5. Exercise current Notes text/author/date filters, duplicate author labels,
   inclusive dates, invalid-date clearing, Reset and automatic read-only reading.
6. Exercise current Orders query/status/date combinations and Results query/date
   combinations; invalid edits/reset/cancel clear old rows/detail. Highlighting
   only selects; View/Enter/double-click opens exact owned detail. Close/Escape
   retains the row and returns list focus. Long Unicode and empty detail remain.
7. Exercise all five Cover Sheet panels, read-only details and independent
   empty/error/retry cases; old-patient text must never reappear after transitions.
8. Separately listen with Narrator for correct patient/row IDs, paging totals,
   malformed/empty/error/loading distinctions, filter labels/errors/Reset,
   acknowledgments and read-only documents. Record actual listening observations.

Store new current-build results under milestone-16/windows only. This checklist
can establish acceptance of the combined M16 build; it cannot retroactively mark
historical M13/M14/M15 builds accepted. Historical reruns are archival follow-up.
