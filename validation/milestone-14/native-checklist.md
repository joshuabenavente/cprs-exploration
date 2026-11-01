# M14 affected Results controls: native and listening acceptance

Status: NOT RUN. Linux virtual X11 callbacks/timers/geometry are synthetic;
M12 user acceptance and pending M13 observations do not establish M14 acceptance.

On Windows run `scripts/Test-MockChart.ps1 -Matrix` (optionally `-Bootstrap`),
`python scripts/verify_integrated.py` and `python scripts/test_m14_protocol.py`.
Use `scripts/Review-ResultsFilters.ps1 -Size default -ScaleFactor 1`, then repeat
both default/minimum at 1, 1.25, 1.5, 1.75 and 2. Launcher verifies the current
full matrix source/executable/log bindings, runs the synthetic journey and leaves
SYNTH-001 Results open; its output is preparation only.

For each sample, record exact Windows executable SHA256, requested/observed
size/scale, settled screenshots and keyboard/focus observations; separately
record the user's Narrator listening result.

1. Tab forward/back through query, scenario, beginning/ending, Reset, list,
   reading and actions. Focus reveals its target; fixed patient/footer stay visible.
2. Use 2026-10-28 through 2026-10-29: REPORT-02/03 only. Query Alpha narrows to
   REPORT-02; zoë 李 narrows to REPORT-03. Open bounds and equal dates are inclusive.
   Empty query/date intersection shows success, not provider error. Reset clears
   all three fields, selection and detail while retaining the committed patient.
3. Enter invalid/partial/Unicode/reversed dates. Rows and detail clear immediately;
   owner-scoped validation is readable, retry is absent. Recover with valid dates.
4. Highlighting only selects. View/Enter/double-click opens the exact report.
   Read/select/scroll the long Unicode REPORT-03 and final marker. Text stays
   read-only. Close/Escape retains selection, clears detail and returns to list.
5. With slow replies change dates/query/reset while list/detail is pending; late
   success/failure must not replace the view. Ctrl+O/cancel during filtered/invalid
   or loading states retains patient/tab, defaults filters and returns query focus.
   Commit another patient and change tabs; old IDs/text must not reappear.
6. List-unavailable/retry retains query and date bounds; detail-unavailable retry
   stays separate. REPORT-04 empty detail and SYNTH-002 empty list are successes.
7. Repeat after resize. Separately listen with Narrator: inclusive instructions,
   errors, Reset, exact patient/report identity, list and read-only detail must be
   spoken accurately. Do not infer speech from geometry/UIA/captures.

Store new build-bound native/speech receipts only under milestone-14/windows.
Keep not-run/blocked/failed distinct from passed; no clinical/original/live/write
operation is involved. No M14 merge is authorized by these checks.
