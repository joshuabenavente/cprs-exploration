# Orders grouping by service (M17)

B (bounded observation): the decoded `chkByService` checkbox in
`analysis/orders/resources/TFRMORDERVIEW.dfm.json` contains the caption
“Group Orders by Service” (line 399). This establishes a grouping affordance.
U: original grouping algorithm, service identifiers, ordering, persistence,
server rules, permissions and accessibility behavior. P: every exact rule below
is authored synthetic mock policy, not a claim of original parity.

| ID | Contract | Verification |
| --- | --- | --- |
| OG01 | Default is Flat list, newest timestamp first, then exact order ID. Group by service projects the validated/filter-matching records into services ordered by case-sensitive label, then newest timestamp and exact ID within service. | Stable ordering, equal-date tie and exact-label tests; callback/timer table binding. |
| OG02 | Headings are presentation only, one per nonempty service. They have no order ID, cannot select/open details or arm a double-click. Clicking a heading preserves the previous real selection/detail (or no selection). | Headings before/after real selection; repeated heading release; no-detail checks. |
| OG03 | UI indices resolve projected rows through patient and exact order ID. Duplicate descriptions do not identify orders. Selection alone does not open detail; explicit View/double-click and Close preserve existing semantics. | ORDER-02 vs duplicate-title ORDER-01; grouped Unicode long detail; Close retains projected selection. |
| OG04 | Grouping changes clear rows/selection/detail, invalidate pending list/detail channels, preserve query/status/date/scenario, and request fresh data for a valid filter. Repeated same-mode choice does not start another request. Grouping is presentation state; provider filter/request types stay unchanged. Generation and exact pending request reject old/duplicate replies, even after toggling away and back. | Core late success/error/duplicate tests; real list and detail races. |
| OG05 | Text/status/date filtering happens before grouping. Empty/error/invalid views have no headings. Invalid dates remain invalid across grouping changes and issue no provider request. Retry preserves grouping and exact valid filters. | Combined Unicode/status/calendar predicates, empty/error/retry/invalid checks. |
| OG06 | Reset view clears all filters and grouping to Flat; scenario remains. Tab/patient/selector changes restore Flat and default filters, reject late replies and retain existing committed-patient rules on cancellation. No persistence. | Reset and lifecycle/ownership tests; selector/tab timer races. |
| OG07 | Keep nine invented patients and four orders per nonempty fixture, the three mock statuses, six columns and exact existing order IDs. Assign services A/B/A/C to ORDER-01/02/03/04 so a group has two records. Service labels are exact presentation keys only, never patient/order identity; do not infer a backend service catalog. | Fixture grouping/empty-patient tests; existing suite. |
| OG08 | Active acceptance is functional only at 100%, default and minimum windows. Current keyboard/navigation/focus and screen-reader checks are excluded; additional scales deferred. Preserve app keyboard/scaling functionality and prior evidence. | New M17F100 source/executable/log-bound protocol and manual checklist; freeze M16F100 writers. |

No multiselect, clinical actions, live transport, new patient imports, credentials,
original executable/DLL execution, service permissions or original behavior
claims are included. The earlier M15 “no grouping” scope is extended by M17 only;
its historical acceptance is unchanged. Existing date/filter rules remain in
[Orders filtering](orders-filtering.md).
