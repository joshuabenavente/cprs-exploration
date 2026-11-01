# M16: patient-search page integrity

Status: merged after final-head portable/Windows code-build CI and full Linux
matrix passed; native/listening pending. Implementation used
`m16-search-page-validation`, from merged
M15 delivery `223fb96`. Standing commit/push/merge/prune authorization applies.

At the baseline, the matching-request guard in `apply_search` accepted arbitrary
typed pages. M16 closes backlog C01 by validating candidate metadata/filter membership,
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

M16 [PR #11](https://github.com/joshuabenavente/cprs-exploration/pull/11) merged
after final-head CI passed; its topic branch is pruned locally/remotely. See the
[delivery record](../validation/milestone-16/merge-checkpoint.json) and
[project overview](project-overview-m16.md). No M17 implementation has started.
Exact next action: fresh combined-build Windows matrix and the
[native/listening checklist](../validation/milestone-16/native-checklist.md).
These observations remain not run; merge and code/build CI do not establish them.

## Supplemental user report

The user reported **“all pass”** for the ten-combination visual/keyboard and
Narrator checklist. The [raw report](../validation/milestone-16/windows/user-acceptance.json)
retains those user-reported passes. The subsequently supplied Windows EXE SHA256
exactly matches the historical M12 acceptance record; the
[binding review](../validation/milestone-16/windows/build-binding-review.json)
records this conflict. The user then reported Windows Git HEAD `1617e03` and
confirmed the M16 matrix receipt is missing. The source has checked M16 runtime/
build inputs, but executable/native applicability remains unresolved. Use the
[rebuild guide](m16-windows-rebuild.md) and
[source checkpoint](../validation/milestone-16/windows/source-checkpoint-review.json). No independent native
or speech rerun is claimed; original raw receipts/checklists remain unchanged.

## Windows matrix attempt update

The user supplied an M16 receipt summary with passed=False, matrix_requested=True
and a new executable hash. See the
[attempt report](../validation/milestone-16/windows/matrix-attempt-report.json).
Failure step/log and actual Get-FileHash output remain unavailable. Preserve the
attempt and diagnose the failed check before rerunning; current native acceptance
remains pending. Earlier user/hash/source reports retain their capture-time scope.
