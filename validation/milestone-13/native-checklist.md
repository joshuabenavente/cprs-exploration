# M13 affected-controls native and listening checklist

Status: not run in this Linux cloud session. Linux Xvfb callback/timer/geometry
results are synthetic. Previous M12 native and Narrator passes belong to another
executable and cannot establish M13 acceptance.

On the Windows checkout, close the mock, inspect local changes and use the M13
source. Run `scripts/Test-MockChart.ps1 -Matrix` with an installed Python
interpreter (`-Python` selects it); add `-Bootstrap` only if locked dependencies
are not cached. Then run `python scripts/verify_integrated.py` and
`python scripts/test_m13_protocol.py`. Outputs belong to
`validation/milestone-13/windows/`.

Use `scripts/Review-NotesFilters.ps1 -Size default -ScaleFactor 1` to prepare a
review sample; repeat default/minimum at 1, 1.25, 1.5, 1.75 and 2. The launcher
requires a full current Windows matrix receipt and verifies source, executable
and log bindings. It leaves SYNTH-001 / Notes open after the synthetic journey.
Wait for the list to settle. Its log/JSON proves preparation only.

For every sample, record exact executable SHA256, requested size/scale,
independently observed client geometry where available, settled UIA/focus and
full-window captures separately from speech.

1. Tab forward/back through text filter, scenario, author, Reset, beginning and
   ending dates, table, reading text and actions. Confirm focus reveals each
   target and fixed patient/navigation/status remain visible.
2. Choose AUTHOR-01 and AUTHOR-02. Both have the invented label Demo clinician A
   but yield NOTE-01 and NOTE-02 respectively. Select a row to load text
   automatically. Confirm patient/note/author identities and read-only behavior.
3. Filter beginning/ending to 2026-10-29 with AUTHOR-02: NOTE-02 remains. Combine
   a nonmatching text query to obtain explicit empty success. Check a one-sided
   range and Reset. Reset clears all four fields and selection/body.
4. Enter 2026-02-30, a reversed range and a partial/Unicode date. Each clears
   rows/body and shows a patient-scoped validation message, without becoming a
   provider failure or exposing a retry action for invalid input. Recover with
   valid dates.
5. Select AUTHOR-03 for the long Unicode author and NOTE-03. Read/scroll/select
   text, verify Zoë 李 and the final long-note marker. Enter focuses reading;
   Escape returns to the list. Text entry cannot alter the note.
6. With slow replies, change author/date/text and Reset before delivery. Open
   patient selection and cancel while filtered/invalid/loading: retain the chart,
   default all filters, clear selection/body and focus the text filter. Switch
   patients and tabs; old note IDs/text must not reappear.
7. Check list-unavailable/retry retains the valid full tuple; text-unavailable
   retry; successful empty body NOTE-04; empty SYNTH-002; denied fixture access.
8. Repeat relevant navigation after resize. With Narrator separately verify
   author keys/labels, date instructions/errors, Reset, exact synthetic patient,
   selection and read-only body are spoken without stale identity. Record a
   user-reported result independently of UIA/captures; do not infer speech from
   the geometry journey.

Store new native/speech receipts under M13, with the tested Windows build hash
and per-sample outcomes. Keep blocked/not-run/failed distinct from passed. No
clinical data, original client, DLL, transport, write or signing action is used.
