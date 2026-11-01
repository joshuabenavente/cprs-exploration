# M16: patient-search page integrity

Status: implementation in progress on `m16-search-page-validation`, from merged
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

Exact next action: implement SP01–SP08 and focused tests before desktop wiring.
