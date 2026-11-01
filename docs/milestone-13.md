# M13: read-only Notes author/date filtering

Status: **approved and implemented; Linux automated validation passed;
Windows native/listening acceptance pending**. Work branch: `m13-notes-filters`.
Baseline:
`64280376dfc7dc5c32679c941a542b6ef3ebf54b`; runtime source is unchanged from the
96-test `8fec66d` baseline. Owner: project manager / technical reviewer.

The published analysis intake and current-feature reconciliation are complete at
their stated static-evidence level. See the [continuation review](analysis-review-2026-11-01.md).
The [initial evidence-only proposal](milestone-13-evidence-proposal.md) remains a
historical checkpoint. Its absent-bundle dependency has been resolved by the
published tree, not by recovering the excluded original ZIP or binaries.

## User outcome and scope

A user can narrow the existing invented Notes list by one synthetic author and
an inclusive date range, combine those controls with the current substring
filter, reset the view, and read matching notes through the existing automatic
selection-to-reading flow. Patient changes and filter changes cannot expose stale
text or another patient's notes.

Keep the existing flat list, compiled fixtures, newest-first ordering with ID tie
breaks, automatic text loading, explicit error/retry and read-only text. Do not
add editing, saving, signatures, pagination, provider directories, live transport,
server view-context calls, original dialogs or FileMan/timezone conversion.
Nine invented patients remain the runtime roster. Do not broaden other tabs.

## Evidence and authored departures

| Evidence | Supported observation | Deliberate mock policy / unresolved behavior |
| --- | --- | --- |
| Resource `01444c3c`, [TfrmNotesByAuthor](../reverse-engineering/evidence/static/forms/0391-TFRMNOTESBYAUTHOR.json) | Caption List Signed Notes by Author; author selector; ascending/descending radio group; OK/Cancel; author-fetch/Non-VA checkbox bindings | Use compiled synthetic author identities/options. Do not copy signed-only eligibility, Non-VA lookup, provider permissions or original sort/default rules. |
| Resource `01445284`, [TfrmNotesByDate](../reverse-engineering/evidence/static/forms/0392-TFRMNOTESBYDATE.json) | Beginning/ending date controls; DateOnly=False and RequireTime=False; sort group; OK/Cancel | Propose date-only ISO calendar bounds over invented timestamps. Inclusive bounds, open ends, validation and reset rules are authored policy, not recovered date/time behavior. |
| Form bindings / MAP candidates | Author OK `00cf1898`, cancel `00cf188c`; date OK `00cf235c`, cancel `00cf256c` | These four handlers are unresolved in the discovered-function catalog. Stored binding does not prove effective runtime routing or return semantics. |
| Existing Notes exports `00e202f8`, `00e19480`, `00a0b870`; Rust `notes.rs` | Selection-to-reading static relationship; current mock has a working owned read-only reader | Preserve mock request generations and ownership guards. Do not port original access/PCE/notification/edit-related branches. |

Every new filter rule below is **P (prototype policy)**. The resource observations
are **B (bounded static evidence)**. Original signed-note eligibility, author
lookup rules, FileMan dates, default range, timezones and complete dialog return
contracts remain **U (unresolved)**. No original behavior is inferred from a
matching label.

## Requirements and acceptance criteria

| ID | Requirement | Required meaningful acceptance evidence |
| --- | --- | --- |
| NF01 | Typed filter value includes existing text query, optional synthetic author key, optional start/end calendar date. All fields participate in the list request key. | Combined predicates produce exactly the expected fixture IDs; two authors with the same display label remain distinguishable by stable authored keys. Any extra note fixture is invented and preserves the nine-patient roster. |
| NF02 | Blank date bounds are open. Nonblank dates use strict YYYY-MM-DD calendar dates; start <= end. Include both boundary dates; keep established newest-first/ID order. | Boundary, one-sided, empty-intersection, leap-day, invalid-calendar and reversed-range cases. Invalid edits show a validation message, clear transient note text/selection and invalidate old requests; they do not issue a provider request. |
| NF03 | Changing any valid filter clears list selection/body immediately, increments generation and requests a new owned list. Late or duplicate list/body successes and failures cannot replace the new view. | Delayed author/date changes, reset, tab change and patient-change races; matching generation plus exact patient/filter tuple is required. Recheck each returned row against all predicates, fixing the current Notes/Orders filter-validation asymmetry as part of this requirement. |
| NF04 | Reset clears all author/date/text filters for the current patient, loads a fresh list, and leaves no selected note/body. Patient commit and selector cancellation use a documented fresh default filter state. | Reset/cancel retains committed chart identity; old same-note IDs under a prior patient cannot open; canceled selector returns to the local filter. Invalid/pending edits must not survive a patient change. |
| NF05 | Author options come only from owned compiled fixture data; an unknown key is rejected. Never derive identity from display label or treat synthetic status as recovered TIU authorization. | Unknown author and duplicate-label cases; denied/unavailable patient fixtures remain inaccessible. Signed-only original captions do not hide invented draft/addendum records without a separately authored requirement. |
| NF06 | Loading, valid empty result, invalid date input, provider error and successful empty body remain distinct. Retry repeats the exact valid filter tuple deliberately. | Empty/error/retry and successful-empty-document cases; no stale body is shown during errors. |
| NF07 | Keyboard users can reach, identify, edit and reset all filters and read text. Existing Ctrl+F, Enter, Escape and Ctrl+O behavior is preserved. | Native forward/reverse Tab, author choice, date edits, reset, automatic reading and cancellation; accessible names/errors identify committed synthetic patient and field. No unintended write action exists. |
| NF08 | Layout and speech work at default/minimum sizes at 100/125/150/175/200 percent application scale on the new build. | Fresh synthetic geometry/timer evidence, build-bound native visual/keyboard observations and separate user listening result for affected Notes controls across the ten samples; long Unicode author labels and visible validation errors remain reachable. |

## Implementation sequence and dependencies

1. Write `specifications/notes-filtering.md` from NF01–NF08, declaring authored
   dates, author keys, invalid-input behavior, reset/cancel semantics and exclusions.
   Add the matrix mapping before coding. This is the exact next action.
2. Extend `NotesListRequest` / `NotesWorkspace` and compiled author metadata in
   `crates/chart-core/src/notes.rs`; implement predicates in provider and response
   validation, preserving the existing ownership/generation model. Add focused
   contract/race tests in `tests/notes.rs`; no generic provider refactor.
3. Extend `ui/notes-view.slint` and desktop bindings/callbacks. Keep filter state
   synchronization separate from note selection-to-reading; add new real-timer
   race and layout checkpoints to `integrated_check.rs`.
4. Introduce an isolated M13 validation destination/protocol before running the
   changed app. Retain M12's full required journey coverage; explicitly record the
   new checkpoint set/count rather than assuming 83 remains correct. CI/artifact
   paths and verifiers must use the new destination together. Test protocol
   isolation in temporary trees if runner behavior changes.
5. Run locked/offline core tests, workspace formatting, warning-denied Clippy,
   desktop build, callbacks and timer journeys. On Windows collect the affected
   native/scale/listening evidence tied to the new executable. Document any
   blocked checks separately; do not label incomplete acceptance passed.

The exact old Windows EXE remains an archival follow-up, not a prerequisite for
this new mock feature. New-build acceptance cannot inherit the old binary's
native/listening passes. Missing reference binaries prevent additional original
byte checks, not the definition of these explicitly authored mock policies.

## Reverse engineering that materially supports this milestone

Use the already decoded forms and existing read-selection exports first. If
closer original fidelity is needed, statically inspect only author OK
`00cf1898`, date OK `00cf235c` and their return/cancel boundaries, then immediate
callers needed to separate returned filters from save/context operations.
`SetViewContext` `00e1df9c` reaches a save wrapper, so do not mechanically port it.
No new Ghidra run was performed: the reference EXE and project are excluded from
the publication. Further original-semantic claims require those inputs.

The five prepared targets remain deferred:

| Target | Decision and relevance |
| --- | --- |
| `009ad030 ORNet.SetParams` | No dependency for fixture filtering; defer broker serialization. |
| `00e19034 fNotes.SaveEditedNote` | Outside read-only scope; investigate only if needed to explain an ambiguous excluded save edge. |
| `009916c8 Wsockc.NetStart` | No transport runtime; defer. |
| `00996390 RpcSLogin.StartProgSLogin` | No login/credentials runtime; defer. |
| `01192018 rMisc.LoadDll` | No DLL runtime; existing bounded Vitals evidence sufficiently identifies the excluded boundary. |

## Risks and completion gate

Main risks are borrowing original signed-note eligibility from a caption,
accepting invalid/ambiguous dates, treating author labels as identities, and stale
list/body delivery after filter edits. NF01–NF06 address these directly. Added
controls also risk layout/focus regressions; NF07–NF08 require fresh evidence.

Completion requires NF01–NF08, current source/build/log-bound receipts, unchanged
historical evidence and a final handoff with exact next action. Partial code or
synthetic-only checks do not complete native/listening acceptance.

## Implementation checkpoint

The user approved implementation and requested a new Codex terminal. The terminal
was opened in this chat; implementation proceeds on `m13-notes-filters` while
preserving the earlier review edits. The [filter contract](../specifications/notes-filtering.md)
now precedes the core/UI changes. `notes.rs` supplies stable author keys, strict
calendar days, full filter request identity, validation/empty/error distinction,
response predicates and invalidation. The Notes UI supplies author/date/reset
controls and an intrinsic-height card so the extra fields cannot push reading
text outside its container. Existing automatic reading and read-only text remain.

Ten contract tests extend the 96-case baseline. Eight new desktop checkpoints
extend the previous 83-checkpoint journey to 91. M13 uses its own protocol and
platform directories; new receipt rejection/isolation tests exercise the runner
and verifier. The Windows CI artifact paths and launch instructions use M13.
No M2–M12 writer was used with the changed executable.

Current Linux results: formatting, warning-denied workspace Clippy, all 106 Rust
tests, desktop build, callback smoke, 14 temporary-tree protocol tests and all ten
size/scale journeys passed. Each journey has 91 checkpoints, 104 deliveries and
43 rejected stale replies. The verifier checks 16 step logs, source/build inputs,
executable identity, exact checkpoint sets, geometry and historical preservation.
All 2,404 pre-M13 analysis/publication/validation files remain byte-identical.
These Xvfb/software-renderer checks are synthetic. Windows code/build, native
keyboard/visual and new-build Narrator evidence are tracked separately.

See [`validation/milestone-13/`](../validation/milestone-13/) for current results
and the [native/listening checklist](../validation/milestone-13/native-checklist.md)
for the remaining build-bound Windows work. The old accepted Windows EXE remains
an archival item; it supplies no acceptance for this new build.
