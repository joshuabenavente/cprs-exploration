# M16: patient-search page integrity

Status: implemented; complete Linux matrix passed; hosted CI and native follow-up pending on `m16-search-page-validation`, from merged
M15 delivery `223fb96`. Standing commit/push/merge/prune authorization applies.

The matching-request guard in `apply_search` currently accepts arbitrary typed
pages. M16 closes backlog C01 by validating candidate metadata/filter membership,
unique IDs, bounded page lengths, exact requested offsets and scoped previous/next
cursors before exposing rows. It adds one authored invalid-page simulation to
exercise the boundary through normal callbacks/timers. No patient fixtures,
clinical behavior, original execution or live interfaces are added.

Contract: [SP01–SP08](../specifications/search-page-integrity.md). Static original
patient subset/direction observations support a provider boundary; all exact
page-size/cursor/validation rules are authored mock policy. No new reverse
engineering is needed. Original paging/alias/server behavior remains unresolved.

Sequence: preserve startup hashes; write contract; core row/request/page
validation and focused malformed/overflow/ownership tests; desktop simulation,
callback smoke and real paging/recovery checkpoints; isolate M16 writers and
freeze M15 writers; Rust/protocol/build/callback checks and eleven journeys across
the ten-sample scale matrix; bind and verify new evidence; publish, verify CI,
merge and prune. Then deliver an evidence-backed project overview.

Native Windows visual/keyboard and Narrator observations remain pending for the
current build. This Linux environment cannot perform them. New M16 validation
must not promote historical M13/M14/M15 receipts or reuse M12 speech acceptance.
Keep native backlog explicit while completing the portable milestone.

Validation: 148 Rust tests, 18 protocol/isolation tests, format, warning-denied
workspace Clippy, desktop build and callback smoke passed. Eleven journeys each
passed 121 checkpoints with 158 deliveries and 70 stale replies rejected; all ten
default/minimum size/scale samples passed. All 2,517 startup evidence files remain
byte-identical. See [acceptance](../validation/milestone-16/acceptance.json) and
[technical review](../validation/milestone-16/technical-review.json).

Published as [draft PR #11](https://github.com/joshuabenavente/cprs-exploration/pull/11).
Exact next action: verify final-head code/build CI, merge and prune under standing
authorization. The [project overview](project-overview-m16.md) records
implemented features, evidence limits, fidelity gaps and recommended next work.
No M17 implementation is started. Fresh combined native Windows/listening
acceptance remains not run.
