# M14: read-only Results date filtering

Status: implemented; Linux automated matrix passed; Windows native/listening
acceptance pending. Work is on `m14-results-date-filters`, from merged main
`62bd340501f0d7753e1807cec12d7a967f8fb403`. M13 PR #8 is merged and its local
and remote branches pruned; final-head portable and Windows code/build CI passed.
M13 Windows native and Narrator acceptance remain pending.

Contract: [Results filtering](../specifications/results-filtering.md), RF01–RF08.
Bounded static evidence supports the date-control direction; exact dates/reset,
validation and race behavior are explicitly authored policy, not original fidelity.

Sequence: persist startup hashes and merge receipt; implement typed filter/core
validation and focused tests; wire date inputs/reset and intrinsic Results layout;
add real timer/geometry coverage; isolate M14 runner/verifier/protocol/CI paths;
run offline tests/build/callback/journey and ten synthetic size/scale samples;
write build-bound acceptance limits and publish a reviewable draft PR.

Risks: invalid edits or repeated report IDs can expose stale detail unless both
list and detail generations are invalidated; response rows must satisfy all
predicates. Intrinsic card height must permit keyboard scrolling. Linux virtual
display evidence does not establish Windows visual, keyboard or Narrator results.
All historical evidence is immutable; new receipts belong under milestone-14.

Exact next action: obtain explicit M14 publication approval after automatic review
blocked the push, then publish a draft PR and verify code/build CI. Perform the
M14 Windows matrix and affected-controls native/Narrator checklist. Do not merge
M14 without further instruction.

## Implementation checkpoint

The Results workspace now carries raw date inputs for editing and a typed
`ResultsFilter` in every pending list request. Starting any edit invalidates
list/detail generations and removes previous rows/selection/text before parsing.
Invalid input returns no request and keeps a distinct patient-scoped status.
Provider and response predicates enforce the same inclusive range and substring
membership; timestamps also reject signed or nondigit clock fields. Reset and
existing tab/patient/selector clearing restore defaults.

The shared `CalendarDay` parser is the existing strict Notes Gregorian rule,
extracted into a small module with `NoteDate` retained as a public alias. Notes
still uses its owned author/date filters and automatic reader. General date
errors now come from the shared parser and retain each workspace's context.
No fixtures, patient roster, report families or access rules were broadened.

Desktop fields identify the synthetic patient and inclusive format in their
accessible labels. The Results card uses its intrinsic layout height and exposes
filter/reading geometry. Explicit activation/close semantics remain intact.
Nine real-timer checkpoints extend all 91 M13 checkpoints to 100; M14 delivery
logs include the full typed Results filter. M14 scripts/CI use separate paths;
historical M13 writer entry points fail before opening output files.

Focused validation: 116 Rust tests (ten new RF tests), 16 protocol/isolation
tests, warning-denied workspace Clippy, format/build/callback smoke passed.
First synthetic journey: 100 checkpoints, 122 deliveries, 53 rejected stale
replies. All ten default/minimum samples at 100/125/150/175/200 percent passed,
with the same 100/122/53 counts in all eleven journeys. All 2,447 pre-M14
evidence files remain byte-identical. These checks are not Windows native or Narrator evidence.


## Review and acceptance limits

[Acceptance checkpoint](../validation/milestone-14/acceptance.json) binds the
Linux executable, source/build inputs, logs, protocol tests, startup history and
static review. [Synthetic minimum-200 capture](../validation/milestone-14/linux/synthetic-visual-review.json)
shows readable new date/reset controls and stable fixed frame. Matrix geometry
checks controls on edit and the reading pane after explicit activation. It does
not establish physical key navigation or spoken output on Windows.

No implementation/automation failures remained after the full run. The next
native work must use the new Windows executable, source/build-bound matrix and
[Results checklist](../validation/milestone-14/native-checklist.md). M13 remains
merged with its own native/listening acceptance pending; older M12 acceptance
remains bound to its historical build. No acceptance was inherited.


Publication checkpoint: local implementation commit `d00d534`; Git push was
rejected before execution by automatic approval review, which interpreted prior
publication approval as M13-only. No M14 PR exists and M14 CI has not run. The
[block receipt](../validation/milestone-14/publication-block.json) records the
exact action and reason. All implementation/validation work is concrete and
reviewable locally; the remaining upload needs explicit approval for this M14
branch and its code/documentation/validation evidence. Do not merge without a
separate instruction.
