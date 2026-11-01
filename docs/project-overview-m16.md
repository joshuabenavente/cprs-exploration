# Project state after M16

Current policy update: functional testing is now limited to 100%, at default
and minimum sizes. Keyboard/focus/navigation and screen-reader checks are
excluded; other scales are deferred until functional work is finished. The
[active policy](validation-policy.md) and
[functional checklist](../validation/milestone-16/functional-100/manual-checklist.md)
supersede previous acceptance gates below. Application features are retained.

Current Linux functional policy verification passed 148 Rust tests, 20 protocol
checks and three 100% journeys of 109 checkpoints. Both default/minimum sizes
passed. See the [current acceptance record](../validation/milestone-16/functional-100/acceptance.json).
Windows functional results for the new policy/build remain to be collected;
excluded keyboard/screen-reader checks do not block this phase.

The following sections retain the earlier M16 delivery/evidence context.

M16 [PR #11](https://github.com/joshuabenavente/cprs-exploration/pull/11) is merged
after final-head portable-core and Windows code/build CI passed. Topic branches
are pruned; only main remains. The delivery follow-up updates documentation only,
with runtime/build files identical to the checked PR head.

Latest Windows attempt: the user supplied an M16 automated receipt summary
with passed=False and matrix_requested=True, plus a new receipt executable hash.
The [attempt report](../validation/milestone-16/windows/matrix-attempt-report.json)
records the fields. The failed step/log is needed before diagnosing or rerunning;
current native/listening acceptance remains pending.

The project is a working synthetic offline Rust/Slint chart prototype. Its
patient selection, chart navigation and read-only readers are implemented and
covered by automated regression checks. The earlier ten-sample pass report was followed by a historical-M12-matching
hash and now a failed rebuilt M16 matrix attempt; current acceptance remains
unresolved. Full original CPRS behavioral parity
has not been established.

## What works

| Area | Current implementation |
| --- | --- |
| Patient selection | Nine invented patients; name/Unicode/ID/demo-lookup search, four-row paging, Demo roster, exact-ID preview, explicit confirmation, authored acknowledgment/denial/deceased cases and committed-chart preservation. M16 validates candidate fields, query/mode membership and page/cursor structure. |
| Cover Sheet | Problems, Allergies, Vitals, Active Medications and Appointments, with owned read-only details and distinct loading/empty/error/retry states. |
| Notes | Text, synthetic author and inclusive calendar filters, Reset, automatic owned reading, long Unicode and empty-note fixtures. |
| Orders | Text, mock-status and calendar filters, Reset, explicit detail opening/close, long Unicode and empty-detail fixtures. |
| Results | One invented interim-style report family, text/calendar filters, Reset and explicit owned report detail. |
| Shared behavior | Fixed patient identity/footer, keyboard/focus/reveal hooks, scrolling and asynchronous generation/ownership guards. Late and duplicate replies are rejected. |

M13 added Notes author/date filtering, M14 Results dates, M15 Orders dates/status
combinations, and M16 search-page integrity. M16 closes the deferred C01 boundary
gap: a current reply with malformed candidate data or inconsistent pagination
cannot expose selectable rows. A new simulation exercises the typed invalid-page
path through normal callbacks and timers. Fixture count and clinical scope remain
unchanged. Structural validation does not prove provider dataset completeness.

## What the evidence establishes

The M16 [acceptance checkpoint](../validation/milestone-16/acceptance.json) and
[delivery checkpoint](../validation/milestone-16/merge-checkpoint.json) identify
their checked source/build/executable and CI commits. The final Linux run passed
148 Rust tests, 18 protocol/isolation tests, format, warning-denied Clippy,
desktop build and callback smoke. Eleven verified journeys each passed 121
checkpoints with 158 deliveries and 70 rejected replies. All ten default/minimum
size samples at 100/125/150/175/200% scale passed; all 2,517 startup evidence files
were preserved. The targeted minimum-200 capture is synthetic visual evidence.

Hosted Windows code/build CI passed on the exact PR head recorded in the
delivery checkpoint.
It does not establish interactive keyboard, layout, UIA or speech acceptance.
Current M16 Windows native visual/keyboard and Narrator results are **user-reported
passes across all ten combinations**, from the reply “all pass” to the supplied
checklist. See the [supplemental report](../validation/milestone-16/windows/user-acceptance.json).
The supplied Windows SHA256 exactly matches the historical M12 acceptance
record. The [binding review](../validation/milestone-16/windows/build-binding-review.json)
records this conflict; M16 acceptance is not established by the supplied identity.
The user reports Windows Git HEAD `1617e03` (same tracked runtime/build inputs
as the checked M16 head) and confirms the M16 Windows automated receipt is
missing. The [source checkpoint](../validation/milestone-16/windows/source-checkpoint-review.json)
records this. A fresh build/matrix binding is needed. No raw
Windows source/build receipts, screenshots or independent listening rerun were
inspected here. M12's historical user-reported acceptance stays bound to its old executable;
M13/M14/M15 receipts retain their capture-time status. The M16 checklist can
validate the combined current build without retroactively accepting those builds.

## Reverse engineering and fidelity

The published static-analysis intake was audited earlier and remains byte-bound
by preserved evidence. Its catalog contains 43,371 entries: 2,245 classified only
within limited machine-pattern/thunk scope, 183 partially analyzed and 40,943
semantically unresolved. It includes 325 decoded forms and 4,371 stored event
bindings. These counts describe inventory and bounded findings, not implemented
behavior. No new original-client execution or semantic recovery occurred in M16.

The mock's filtering, dates, paging, generations and access demonstrations are
explicit authored policies. Larger original-client areas remain unresolved or
unimplemented: Notes trees/pagination, Orders grouping/multiple selection,
configuration-driven panels/report families and original server/date/permission
contracts. Live VistA integration, credentials, prescribing, signing, clinical
writes and DLL/original execution remain outside this project's runtime scope.

## Recommended next work

1. Complete and verify the new Windows M16F100 functional receipt, then report
   manual functional results for default-100 and minimum-100. Preserve previous
   attempts and use the [update/rebuild guide](m16-windows-rebuild.md).
2. Continue the next bounded read-only feature after functional acceptance.
   Keyboard navigation/focus and screen readers are excluded from this phase;
   revisit other scales only after functional work is finished.
3. Retain old Windows artifact recovery as archival follow-up. Original server/
   alias/paging semantics and five transport/save/login/DLL targets remain deferred.

Standing commit/push/merge/prune approval is recorded in
[delivery workflow](delivery-workflow.md). M16 delivery status and branch cleanup
are recorded in its checkpoint; no M17 implementation has started.
