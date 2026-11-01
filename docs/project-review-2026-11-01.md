# Project review: 1 November 2026

This is the initial repository-only checkpoint. The later
[analysis publication review](analysis-review-2026-11-01.md) resolves the
missing-analysis blocker and supersedes the next-milestone recommendation below.
The original receipts remain unchanged; current status is in
[project-status.json](project-status.json).

The implementation is a functioning, bounded offline mock with a healthy portable
core. The clean starting checkout was `work` at
`8fec66d98b969c9c91f91bf56afaddbbe49357cf`; `work` is the only local branch.
All 96 core tests, warning-denied core Clippy and workspace formatting passed in
this review. Existing source/build bindings and retained M12 follow-up artifacts
are consistent. Original-client parity and complete behavioral recovery are not
established.

The requested new analysis review is **blocked on missing inputs**:
`/workspace/reverse-engineering/` and its ZIP do not exist in this instance.
Searches of workspace files, attachments, shared downloads and Library files found
only the pasted request, not that bundle. Neither the original EXE/MAP nor the
reviewed Windows mock EXE is present. The supplied analysis summary is recorded
as an inherited claim, not as inspected evidence. The rest of this review is
complete for the available repository. No application code was changed.

Recommend **M13: reconcile analysis provenance and establish a portable,
reproducible read-only baseline**, before selecting another feature. Its concrete
delivery gates are in [the milestone plan](milestone-13.md). The feature-level
[traceability matrix](traceability-2026-11-01.md) and machine-readable
[project status](project-status.json) provide the continuation checkpoint.

## Consequential findings

| Priority / ID | Finding and evidence | Consequence / disposition |
| --- | --- | --- |
| P0 / F01 | New `specification.json`, inventories, coverage/uncertainty catalogs, final receipt and bounded exports are absent. | Do not integrate their semantic claims or call M13 complete. Obtain the bundle and verify its provenance before relying on it. |
| P1 / F02 | Reviewed Windows mock SHA256 is `a88cddab73f0d9978587c1ad211e1f93783acd31f1983dddfbe369d1ce20c6c3`; the actual EXE is absent. Source inputs match, but this does not reconstruct its executable bytes. | Complete source-to-EXE verification remains blocked. Recover the exact artifact; a rebuilt EXE requires separate evidence and does not inherit old native acceptance. |
| P1 / F03 | M12 native/listening acceptance across ten combinations is user-reported. Independent captures cover targeted minimum-200 and default-100 interactions. `user-acceptance.json` says the user did not repeat the hash; binding comes from preceding instructions. | Accept the report at its stated evidence level. Do not promote it to an independently observed ten-sample pass or demand that the user repeat already accepted listening solely for this documentation review. |
| P1 / F04 | `specifications/vitals.md`, VMT `0x214`/`0x238`, and assembly at `00be2312`, `00be2356`, `00be23d5` show show-detail dispatch to update/write-access/Vitals integration. | This finding is already documented in historical focused recovery. Rust deliberately substitutes a local read-only pane. Preserve that departure; do not wire original detail dispatch into the mock. |
| P1 / F05 | The supplied summary distinguishes `CosignDocument` querying a signature action from `SignDocument` issuing `TIU SIGN RECORD`. Existing MAP inventory locates them at `00a0b3e0` and `00a0c6fc`; no focused semantic exports for them are present. | The names/addresses are independently located; the new semantic finding is unverified here. It supports a documentation boundary, not a signing feature. |
| P2 / F06 | Older Cover Sheet text calls three panels current and describes implemented tabs as placeholders; medication/appointment specs call M9/M10 the current runner; M12 protocol text calls the old `21f1…` EXE current and retains its missing-pipe checkpoint. | These are stale operational descriptions, not proof of a runtime regression. Added current-status pointers and historical labels while retaining the earlier descriptions and receipts. Follow `native-followup` instructions for the accepted changed build. |
| P2 / F07 | Historical `native-followup/index.json` has 0 complete native samples, while later supplemental acceptance has user-reported 10/10. Its report hash maps to `report-before-user-acceptance.md`. | Chronology and evidence type explain the apparent contradiction. All 94 indexed files verify with this explicit mapping. Do not rewrite the index to say 10/10. |
| P2 / F08 | The original minimum-200 preparation log was overwritten before this review; the correction receipt records both hashes. | Irrecoverable historical bytes remain a disclosed limitation. All 607 files in the later follow-up preservation snapshot still match. That snapshot cannot repair earlier loss. |
| P2 / F09 | CI status and published-clone receipts identify earlier implementation commit `d0e83eb`; they do not establish current-head CI for `8fec66d`. | Report these as inherited, commit-bound results. Current remote CI/PR state was not queried; no new Windows CI claim is made. |

## What was independently verified

Evidence is under
[`validation/project-review-2026-11-01/`](../validation/project-review-2026-11-01/).
The [portable receipt](../validation/project-review-2026-11-01/portable-checks.json)
contains commands, exit codes and log hashes. Rust/Cargo are 1.99.1 on Linux.

| Review activity | Result | Limit |
| --- | --- | --- |
| `cargo fmt --all -- --check` | Passed | Formatting only. |
| `cargo clippy -p chart-core --all-targets --locked --offline -- -D warnings` | Passed | Core crate; desktop not rebuilt. |
| `cargo test -p chart-core --locked --offline` | 96 passed: patient workflow 19, Cover Sheet 9, Notes 12, Orders 15, Results 15, Vitals 8, medication 9, appointment 9 | Mock domain behavior, not original-client behavior. |
| Follow-up source/build binding | 28/28: 18 exact, 10 LF/CRLF-only; complete crate file set matches | Normalization is accepted only for source/build text; evidence hashes are exact. |
| Recorded follow-up logs | All 16 log hashes match; the integrated log and ten geometry logs each contain the required 83 checkpoints and 92 deliveries / 38 rejections; ten requested geometries match recorded geometry | These are newly audited stored executions, not newly executed desktop journeys. |
| Follow-up index / preserved M12 snapshot | 94/94 indexed artifacts and 607/607 preserved files match | Report remapping is explicit. No recovery of the overwritten earlier preparation log. |
| Static receipts M3, M4, M5, M6, M8, M9, M10 | All 521 referenced artifact entries match their stored hashes | Some artifacts recur across milestones. No fresh comparison to absent original executable bytes. |
| Supplemental acceptance | Same EXE hash across checks/index/acceptance, complete unique ten-sample set, preparation log and preserved-report hashes match | Verifies receipt consistency, not user speech or execution provenance independently of the receipt. |
| Captures 008 and 037 | Reinspected the retained screenshots and UIA records: all three appointment rows are clear; minimum-200 rightmost text requires horizontal scrolling | Targeted retained visuals, no fresh native input or independent client-area measurement. |
| Historical preservation | All 1,424 tracked `analysis/` and `validation/` files match the pre-review snapshot | Review adds separate files; no historical receipt/raw artifact was rewritten. |

The repeatable [artifact audit](../validation/project-review-2026-11-01/audit_review.py)
writes only its own review result. It reads the required checkpoint set without
invoking historical receipt writers. Its detailed results are in
[artifact-audit.json](../validation/project-review-2026-11-01/artifact-audit.json).
The official follow-up verifier was not represented as passing: it requires the
missing Windows executable. No original process, DLL, transport or clinical
system was invoked. No native keyboard, timer journey or Narrator session was
rerun.

## Implementation assessment and intentional gaps

`AppState` separates highlighted and committed patient identities. Chart commit
validates header/Cover Sheet ownership; independent generations and patient/item
keys reject stale deliveries. Notes selection automatically requests text;
Orders and Results require explicit activation. UI code uses read-only reading
widgets, compiled fixtures, local timers, and deliberate error/retry scenarios.
The shared Cover Sheet widget now inherits its table's intrinsic minimum; the
journey checks clearance for the overlay scrollbar. Tests exercise ownership,
duplicate IDs, races, clearing, empty versus failure, and Unicode data flow.

The implementation is intentionally much narrower than CPRS. Missing original
Notes trees, SHOW MORE pagination and author/date dialog behavior; Orders
multi-selection, grouping and write sheets; Results date-range/report-tree
families; configurable Cover Sheet grids and live permissions are fidelity
gaps, not violations of the authored mock contract. No evidence reviewed here
justifies adding them wholesale. Statuses, timestamps, filters, row IDs, retries,
focus policy and the flat Results report schema are authored behavior.

Two defensive inconsistencies merit a later bounded decision if provider
boundaries are expanded: `apply_search` accepts a matching `SearchPage` without
validating duplicate rows/cursor metadata, and `apply_notes_list` validates
owner/IDs/title/date without rechecking row query membership, unlike Orders and
Results. Current compiled providers construct/filter those results themselves;
these observations are not a demonstrated wrong-patient display in the shipped
mock. Record a provider contract before adding guards/tests; do not start a
generic provider refactor during this review.

## Assessment of the new analysis summary

The reported counts reconcile arithmetically: 41,948 + 1,423 = 43,371 entries;
2,245 + 183 + 40,943 = 43,371 classifications; and 1,518 + 727 = 2,245 limited
analyses. Even if confirmed, about 94.4% of classified entries remain semantically
unresolved. Inventory completeness, typed metadata, decoded event bindings,
successful decompilation and direct-call-byte agreement measure different things
from algorithm or runtime recovery. The 39 reviewed functions are a separate
bounded-review count. Do not add these figures together as recovered features.

The historical inventory's 65,610 MAP symbols is a different population from
discovered internal/external function entries; the difference alone is not a
contradiction. The reported 325 forms / 4,371 events / 2,554 class prefixes /
32 string headers / five cleanup repairs / 204,270 checked call destinations
remain unverified claims until the corresponding catalogs, raw exports and
receipt arrive. Matching specimen hashes would establish the same bytes as
historical research, not distribution authenticity or complete behavior.

Use the matrix's **B / P / I / U** labels consistently: B means a bounded static
observation supported by available historical exports; P is authored prototype
policy; I is an interpretation; U is unresolved or unavailable evidence.
No newly supplied semantic claim has been promoted to B in this review.

## Continuation

Start with the exact action in [project-status.json](project-status.json): locate
the missing bundle, hash and list it without executing its contents, safely
extract it outside this repository, and read its README/specification/final
receipt and coverage/uncertainty catalogs. Reconcile only addresses relevant to
the existing read-only slices first. The [M13 plan](milestone-13.md) ranks the five
prepared continuation targets and defines when more reverse engineering earns
priority. The review is a local documentation/evidence change; it has not been
committed or published.
