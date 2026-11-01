# M12 native finding follow-up

This follow-up fixes table-row clipping without adding a domain feature. The
shared Cover Sheet component no longer forces a 140px table minimum; it inherits
Fluent's 200px minimum. The layout remains driven by the component's intrinsic
minimum. A new journey assertion checks that each panel's fixture rows leave at
least 14 logical pixels for the overlay horizontal scrollbar.

## Evidence boundaries

Original M12 executable:
`21f1cde24ce21d39218846ba8a183f9263475207aacae5f7c75b0167153434c4`.
Records 001-006 reproduce its appointment overlap at minimum size/requested 200%
and show Ctrl+O opening patient selection after a native maximize (bounded width
1962 to 2560), followed by Escape retaining SYNTH-001. The first indexed Maximize
action did not resize the window; the later coordinate action did. An outward
drag endpoint was rejected as outside the capture bounds.

The first changed build froze 100% scale during compilation. Its code checks and
journeys passed, but its requested scale matrix was invalid. See the preserved
[attempt](attempt-1-compile-scale/README.md). Record 007 and the first follow-up
launcher log belong to that invalid-scale attempt. The runner now unsets
`SLINT_SCALE_FACTOR` while compiling, then sets it only for runtime samples.
Runner and verifier enforce reported scale and client dimensions.

## Corrected automated results

Executable SHA256:
`a88cddab73f0d9978587c1ad211e1f93783acd31f1983dddfbe369d1ce20c6c3`.
Formatting, warning-denied Clippy, all 96 core tests, desktop build, callback
smoke and the 83-checkpoint timer journey passed. All ten geometry journeys
passed the new scrollbar-clearance assertion and requested/reported client
size/scale checks, retaining 92 deliveries and 38 rejected stale replies.
See [checks](checks.json). `python scripts/verify_cover_followup.py` independently
verified the source/build bindings, log hashes, complete checkpoint sets,
geometry/scale and unchanged M12 files during this corrected run. These are
local synthetic dispatch/binding/geometry results, not native matrix sign-off.

Corrected-build native observations are recorded separately below.
Native captures supply bounded outer-window dimensions, not independent native
client-area measurements. Synthetic input, native SendInput/UIA, visual
observations, and user listening reports remain separate evidence types.

## Corrected native observations

Records 008-036 cover the corrected build at minimum size/requested 200%.
Preparation reported 1960x1360 client pixels and application scale 2. All three
appointment rows are visible with the horizontal scrollbar below them.
Horizontal native scrolling reveals Action Req and Demo action C without
crossing the selected third row. Enter opens APPT-03 with initial read-only text
focus; the settled body includes Zoë 李. Ctrl+A selects its text, and an `x` key
does not change the document. Escape returns to the selected appointment table.

System > Size, Right, Right, Enter changes the bounded capture width from 1962
to 1973. The sizing Enter also opens the selected detail; Escape closes it.
Ctrl+O initially returns a stale table UIA snapshot, but the next settled
observation shows patient selection with search focused. Escape retains
SYNTH-001 and clears the visible upper-panel selections. Subsequent Tab, Down,
Space opens PROB-01 with initial reading focus; Escape returns to its table.
Native coordinate double-click on the second problem opens PROB-02; after
Escape, Tab then Enter on View opens PROB-02 again.

The earlier resize/Ctrl+O anomaly was not reproduced after settling this
sequence. Its original cause is not established, and no shortcut code changed.
This is a targeted check, not a pass for every resize method, panel or scale.

Records 037-043 cover default size/requested 100%, with preparation reporting
1180x800 and scale 1. The third appointment row is fully visible; all three
columns fit. Reverse Tab reveals the medication View action and table. Its third
row is clear, Enter opens MED-03 including Zoë 李 with initial reading focus, and
Escape returns to the selected medication table. Both review windows were
closed normally; both launcher processes exited 0.

## Preparation-log correction

The baseline launcher reused the untracked `layout-minimum-200.log` during the
reproduction. It now contains rerun preparation output and no longer matches
the original native index hash. The original hash, all native capture records,
and the other nine matching preparation logs remain available. See the
[correction receipt](preparation-log-correction.json). Original M12 checkpoint
receipts were not regenerated. The follow-up preservation snapshot starts after
this rerun and proves no additional changes during its checks; it does not
recover overwritten bytes.

## Acceptance

M12 native acceptance remains incomplete. No speech/listening report exists for
the changed executable. No new CI or fresh remote-clone validation is claimed.
Original M10/M12 listening reports remain scoped to their original builds.
The runtime remains synthetic and mock-only.

Next acceptance work: complete all requested activation methods, upper/middle/
lower content and footer review, forward/reverse traversal, read-only scrolling,
empty SYNTH-002 panels, and resize/cancellation repetition for every sample on
this new executable. The two targeted samples above are not full sample
sign-offs; the other eight have new synthetic geometry coverage only. Independent
native client-area measurements and a new-build listening report remain absent.
Use `Review-CoverSheetFollowup.ps1 -Size minimum -ScaleFactor 2` (or the other
supported size/scale combinations), never the original receipt-bound launcher
for this build. Start a new appended evidence range rather than replacing these
native records.

## Publication verification

The follow-up verifier now resolves captured evidence paths within the current
checkout and accepts only LF/CRLF normalization for source/build text. Evidence
and executable hashes remain byte-exact. The native launcher delegates source
binding checks to that verifier. These publication changes do not alter the
executable or regenerate the recorded journeys. Follow-up tools have byte-exact
Git attributes. The native index tool hashes describe the publication versions.
