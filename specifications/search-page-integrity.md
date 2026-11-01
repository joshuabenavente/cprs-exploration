# Patient-search page integrity (M16)

B: the existing patient-selection specification records `cboPatientNeedData`
references to `rCore.setSubSetOfPatients` / `setRPLPtList`, direction-sensitive
cursor operations and alias literals. P: every exact schema/validation rule here.
I: validating pages fits the existing provider/state boundary. U: complete
original alias/paging algorithm, server limits, order and access semantics.
No additional original execution or reverse-engineering recovery is claimed.

| ID | Contract | Verification |
| --- | --- | --- |
| SP01 | Only the exact active generation/query/mode/cursor/direction reply while selection is open may apply. Matching malformed replies become an error and consume the request; stale/duplicate successes and failures cannot change newer state. | Forged tuple, delayed and duplicate malformed/recovery tests. |
| SP02 | Candidate IDs are unique within the page. Name/location are nonblank with no control characters, birth date follows the existing strict Gregorian fixture policy (years 1900–2026), and lookup is lowercase x plus four ASCII digits. | Whole-page rejection for duplicate IDs and malformed metadata. |
| SP03 | Every row satisfies the existing trimmed Unicode uppercase name substring or exact ID/lookup search and the authored Demo roster IDs when that mode is selected. | Wrong query/mode, Unicode/exact lookup and duplicate-name fixtures. |
| SP04 | Page start equals the request cursor offset (zero for an initial request), is aligned to the authored PAGE_SIZE=4, and rows number exactly min(4,total-start). Nonempty totals require start < total; zero totals require start=0 and no rows/cursors. Arithmetic must not overflow. | Start/count/total/empty/overflow boundary tests. |
| SP05 | Previous is exactly start-4 when start>0; next is exactly end when end<total. All cursors carry canonical trimmed-uppercase query and exact mode. Initial requests go forward; cursors must be scoped and aligned. | Missing/extra/self-loop/skipped/foreign cursors, first/middle/final page navigation. |
| SP06 | A rejected page exposes no rows, preview, acknowledgment, page actions or chart request, and leaves the committed chart unchanged. Recovery is a new search; empty success and provider error remain distinct. | Selected/acknowledged/committed state tests and callback scenarios. |
| SP07 | Add only an Invalid search page simulation (index 15; existing indices stable) returning typed rows with an inconsistent start. It exercises core response rejection through the ordinary timer/callback path. Existing malformed-fixture and unavailable simulations remain. | Callback smoke, malformed reply recovery, paging/roster/empty timer checkpoints. |
| SP08 | Retain all 112 M15 journey checkpoints, fixture IDs and read-only browsers; use isolated M16 receipts and freeze previous supported writers before writes. | Full Rust/protocol/isolation checks, source/executable/log/history binding and ten default/minimum size/scale samples; separate Windows native checklist. |

Validation checks page structure and the requested predicates. It cannot prove
that a provider's total or rows represent the complete authoritative dataset,
verify cross-page uniqueness without retained pages, or recover original server
paging. It does not consult compiled fixtures to replace the provider boundary.
Patient count remains nine; page size four is authored, never an inferred CPRS
server limit. No new sorting, aliases, persistence, clinical data, permissions,
transport, credentials, signing or writes are implemented.
