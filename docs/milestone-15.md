# M15: read-only Orders date filtering

Status: approved and implemented; full automated validation in progress.
Work is on `m15-orders-date-filters` from planning commit `b8e1f21`.
Baseline: M14 merged at `e93c9a03c8ae802d54a7252c0ff95fedec4385b4`; see the
[handoff](handoff.md) and [merge receipt](../validation/milestone-15/m14-merge-checkpoint.json).

## Goal and scope

Extend the existing Orders reader with optional inclusive beginning/ending
calendar days and Reset. Combine them with the current text and mock-status
filters. Reuse M14's small `CalendarDay` helper without broad refactoring.
Keep nine invented patients, four invented orders per nonempty fixture, the
existing three mock statuses, six display columns and explicit detail opening.

Filter the calendar portion of `OrderSummary.date`, the existing invented order
timestamp. Do not parse the Start / Stop display string or imply interval overlap,
clinical activity, original order-placement semantics, FileMan or timezone rules.
The current fixture places ORDER-01/02/03/04 on October 30/29/28/27, 2026.
Reset clears query and bounds and restores All mock statuses, retaining the
committed patient and scenario. Scenario changes preserve filter values; invalid
inputs stay invalid without a provider request until corrected or reset.

## Evidence and remaining uncertainty

- **B, bounded static observation:**
  `analysis/orders/resources/TFRMORDERVIEW.dfm.json` contains `chkDateRange`
  (Only List Orders Placed During Time Period), `calFrom` / `calThru` (`TORDateBox`),
  `calChange`, and separate OK/Cancel handlers. The existing Orders contract
  records `RefreshOrderList` at `0117b000`, detail at `0117cc00`, double-click
  dispatch at `0117f5dc`, and clearing at `01179ba0`.
- **P, authored policy:** strict ASCII Gregorian YYYY-MM-DD, years 0001–9999,
  inclusive bounds, open blank ends, Reset, filtering the mock `date` field,
  immediate invalidation, request ownership and asynchronous rejection rules.
- **I, inference:** date filtering is a bounded extension of the current reader
  consistent with the stored form. The resource alone does not recover behavior.
- **U, unresolved:** original date defaults, placement versus start/stop semantics,
  inclusivity, view persistence, server filtering, timezone conversion, status
  catalogs, permissions, dialog return behavior and effective accessibility.

No new reverse engineering is required for this authored scope. Before claiming
closer fidelity, resolve the address-keyed `chkDateRangeClick`, `calChange` and
`cmdOKClick` bindings and inspect only their bounded caller/callee paths. No handler
address is asserted here without a verified binding. The five prepared broker,
save, login and DLL targets remain deferred; none is a dependency.

## Requirements and acceptance criteria

| ID | Contract | Required verification |
| --- | --- | --- |
| OF01 | One typed tuple carries query, mock status and optional bounds in each owned list request; patient and generation must match exactly. | Combined predicate tests, forged tuple tests and late reply journeys. |
| OF02 | Bounds use `CalendarDay`: strict ASCII YYYY-MM-DD, no surrounding whitespace, blank means open, beginning <= ending. | Leap/century/year limits, equal and one-sided bounds, partial/Unicode/reversed inputs. |
| OF03 | Every edit clears rows, selection and detail immediately and invalidates list/detail generations. Invalid input sends no provider request, has patient-scoped validation and no provider-error retry. | Pending success/failure, duplicate and recovery tests; actual desktop timer checkpoints. |
| OF04 | Provider and response enforce every predicate, exact owners, unique IDs, nonblank required metadata and strict digit-only timestamp fields. Preserve newest-first then ID ordering. | Reject malformed, foreign and out-of-range rows as a whole; regress text/status filtering and sorting. |
| OF05 | Reset restores query/date/status defaults; tab/patient/selector transitions clear transients. Cancel retains the committed patient/tab and reloads defaults. | Reset from loading/invalid/empty/error/detail states; patient collision and cancel races. |
| OF06 | Loading, input validation, successful empty list, provider error and empty detail remain distinct. List retry preserves the valid tuple; detail retry preserves the selected owned item. | State tests and delayed scenarios; no clinical-error interpretations. |
| OF07 | Highlighting never opens detail. View/Enter/double-click opens it; Escape/Close invalidates detail, retains selection and returns list focus. Ctrl+F and accessible labels identify the current patient and date rules. | Callback/timer coverage and separate native keyboard/Narrator observations. |
| OF08 | Filter/status/scenario/date/Reset controls, table, detail and actions remain reachable with fixed patient/footer visible at both sizes and all five scales. | Intrinsic Orders card height and geometry probes; ten-sample synthetic matrix, then separate Windows native evidence. |

Concrete fixture checks: 2026-10-28 through 2026-10-29 yields ORDER-02/03;
Mock active narrows that to ORDER-03; Mock pending yields ORDER-02. Query
`zoë 李` with that range yields ORDER-03. An equal 2026-10-29 range yields
ORDER-02, while Mock active with that equal range is a successful empty list.
Verify one-sided ranges and Reset, SYNTH-002 empty list, ORDER-04 empty detail,
unavailable list/detail, Unicode/long text and cross-patient repeated IDs.

## Delivery sequence and dependencies

1. Pin the merged M14 baseline and hash all existing validation evidence before
   running any new writer. Preserve raw receipts and recorded acceptance limits.
2. Write `specifications/orders-filtering.md` from OF01–OF08 and update the
   existing Orders contract/traceability with authored versus recovered behavior.
3. Add the typed tuple and focused ownership/date/state tests in `orders.rs`;
   tighten only the affected order timestamp validator. Keep existing Notes and
   Results behavior, fixture IDs and patient count unchanged.
4. Wire inputs/Reset, labels and intrinsic Orders layout. Add real delayed-reply
   checkpoints and filter/reading geometry to the existing integrated journey.
5. Create isolated M15 runner/verifier/protocol/PowerShell/CI receipt paths.
   Freeze M14 writers before they can replace historical evidence, including
   every supported entry point. Test rejection before output files are opened.
6. Run format, warning-denied workspace Clippy, Rust tests, desktop build,
   callback smoke, protocol/isolation checks, one integrated journey and all ten
   default/minimum scale samples (100/125/150/175/200%). Reconcile actual counts;
   require every retained M14 checkpoint and the new OF cases to pass.
7. Bind executable/source/build inputs/logs/geometry to a new M15 receipt.
   Independently verify bindings and byte preservation. Publish and merge only
   under authorization covering M15; M14 approval does not authorize its export.

Dependencies are the merged M14 calendar helper, existing Orders fixtures and
delayed provider, locked toolchain/dependencies, synthetic display tooling and
a Windows desktop for native acceptance. No new patient/report types, services,
grouping, multiselect, sorting options, persistence, live transport, credentials,
original execution, DLL loading, signing or clinical writes are included.

## Native backlog and acceptance boundaries

M13 and M14 native visual/keyboard and Narrator observations remain pending for
their own builds. Do not transfer M12 acceptance or M14 CI to M15. Before M15 is
accepted, run its fresh Windows source/build-bound matrix and affected Orders
checklist at all ten combinations; record requested/observed geometry, focus,
screenshots and exact EXE SHA256. Record Narrator listening independently.
Linux synthetic checks and hosted Windows compilation cannot close that gate.

Prioritize native validation as soon as a Windows session is available. New M15
evidence can exercise the current combined build but cannot retroactively change
the capture-time M13/M14 receipts. Track passed, failed, blocked and not-run
separately. Plan review and implementation progress are separate from acceptance.

Risks: filtering the wrong timestamp, stale detail after invalid edits, tuple
mismatch, fixed-height clipping and historical evidence overwrite. OF01–OF08,
the explicit field policy, isolated writers and the native gate address them.

Implementation checkpoint: [OF01–OF08 contract](../specifications/orders-filtering.md)
and typed Orders tuple/core/UI are implemented. Sixteen focused Orders filter
Rust tests supplement the retained suite. The real timer journey retains all 100
M14 checkpoints and adds twelve Orders checkpoints. Historical M14 runner,
verifier, protocol-main and review launcher now exit before writes; M15 has its
own runner/verifier/protocol/CI/PowerShell paths. The complete Linux matrix is
running; native Windows/Narrator observations remain not run. Exact next action:
finish validation, independently verify receipt bindings and historical bytes,
then commit the reviewable M15 implementation and evidence.
