# Integrated mock Chart acceptance contract

## Scope

Milestone 12 establishes separate fresh evidence for the shared-layout validation fixes merged after Milestone 11. It adds no transport, imports, authentication, scheduling actions, order entry/signing, interpretation, printing, original-client execution, domain panel or static recovery. Historical static evidence and Milestone 2–11 receipts remain unchanged. Milestone 10 added focused, hash-pinned Appointments evidence and documented its authored local read-only policy in `appointments.md`. Cover Sheet content sizing derives from intrinsic layout requirements plus padding, bounded below by the viewport. Focus reveal uses the table/heading or View/help geometry, with scroll clamping.

The opt-in `--integration-check` runs the normal desktop callbacks with `immediate=false`, the compiled mock provider, and the Slint winit/software event loop. List/search/chart/detail timers retain their normal delays, including the slower scenarios. Each actual delivery records operation, synthetic owner/key, generation, and the core's accepted/rejected decision. Normal launches do not collect this audit.

The driver starts each action once, polls readiness with 25 ms timers, verifies an endpoint, and advances. Readiness is based on delivered replies and UI bindings, with a five-second per-check and ninety-second journey deadline. These are test bounds, not performance guarantees. Closing the window before completion fails the check. `--keep-open` leaves the completed synthetic review state open; it is only valid with `--integration-check`.

At each poll, exposed browser text and core rows must belong to the committed synthetic patient; inactive browser bindings must be empty. Opening patient selection must clear browser text and all five Cover Sheet selections/details. These checks sample application bindings, not the screen compositor, physical keyboard, UIA provider, or speech.

## Journey coverage

| Area | Required behavior |
| --- | --- |
| Duplicate patient search | Fast MORGAN reply wins over slow M; both MORGAN synthetic IDs remain distinguishable; only explicit confirmation commits SYNTH-004. |
| Cover Sheet | Closing an in-flight detail invalidates it; the next panel detail belongs to the current patient and initially focuses the read-only reading pane. |
| Vitals | Selection is explicit; closed requests are rejected, the close callback retains the Vitals row, failed detail retries use real timers, a late failure cannot reopen another tab, selector cancellation clears transient state, repeated item IDs stay scoped to the new patient, and empty Vitals is successful. |
| Active Medications | Explicit selection/activation, close race, retained row, unavailable detail and successful retry, late failure after tab change, selector cancellation, same IDs under a new owner and synthetic empty panel. |
| Appointments | Explicit selection/activation, close race, retained row, unavailable detail and successful retry, late failure after tab change, selector cancellation, same IDs under a new owner and synthetic emptiness. Literal Date/Time, Location and Action Req text stays separate from chart visit context and scheduling actions. |
| Notes | Automatic selection loads text; a late NOTE-01 cannot replace NOTE-02. A pending old-patient note is rejected after a different MORGAN commits; the same note ID under the new patient loads only that owner's text. |
| Cross-tab lists | Both the ordinary and slower Orders list replies must be rejected after moving to Results. No inactive list or text bindings may reappear. |
| Results | Selection alone does not load text. Explicit opening requests it; late REPORT-01 cannot replace REPORT-02 or steal focus from the filter. Close invalidates in-flight text and retains selection. Empty REPORT-04 is successful. Filtering invalidates pending text. |
| Errors and retry | Failed Results list and Orders detail retries use real timers. Late list/detail errors cannot replace recovered or different-tab state. Failure stays distinct from successful empty data. |
| Patient cancellation | Canceling while an order is pending preserves the committed patient/tab, reloads an unselected list, clears old text, and returns focus to the Orders filter. Results cancellation likewise returns to its filter. |
| Access decisions | Acknowledgment is required before PATEL commits; decline preserves the current chart. RIVERA denial leaves the previous chart committed. |
| Empty patient | SYNTH-002 successfully has empty Notes, Orders, and Results without carrying prior text or marking the lists unavailable. |
| Review checkpoint | Return to SYNTH-001, verify long Unicode REPORT-03, then verify and close VITAL-03, MED-03 and APPT-03. After the layout probes, restore Problems/Allergies to no selection and Vitals/Medications/Appointments to VITAL-03/MED-03/APPT-03, with detail closed. This does not assert native table focus. |

## Keyboard and accessibility contract

| Context | Keyboard behavior |
| --- | --- |
| Patient selector | Ctrl+F focuses patient search; Enter confirms or acknowledges; Escape backs out of acknowledgment or cancels selection. The committed header remains unchanged until successful chart delivery. |
| Cover Sheet | Enter/Space opens a selected panel item. Initial detail focus is the read-only text; Escape closes and restores the originating panel. Ctrl+O opens selection when detail is closed. |
| Notes | Ctrl+F focuses local filtering. Enter from the filter moves to the list; selection automatically loads text; Enter from a selected row focuses the reading pane. Escape returns to the list and retains the note text. |
| Orders/Results | Ctrl+F focuses local filtering. Selection only highlights. Enter/double-click/View explicitly opens read-only text. Escape/Close clears it, invalidates pending delivery, retains selection, and returns to the list. |
| Browser selection cancellation | Ctrl+O opens patient selection. Cancel/Escape reloads an unselected list for the same patient/tab and focuses that tab's local filter. |

Patient-table, browser-list, and read-only document accessible names include the selected synthetic identity. Cover Sheet panels include the committed synthetic patient and selected item. UIA names and actual widget focus are separate observations: the read-only `keyboard-focus` binding is a test probe, is not displayed, and does not establish UIA or speech conformance.

Notes' automatic loading and Orders/Results' explicit activation remain intentional differences. Ctrl+F is not advertised on Cover Sheet, where no local filter exists. Read-only text remains selectable and scrollable. A native input event, actual focus/caret behavior, a UIA snapshot, and user-reported Narrator listening are distinct evidence categories.

## Layout and listening acceptance

Inspect default and minimum windows at every supported process-local application scale: 100%, 125%, 150%, 175% and 200%. Record requested sizing, actual client pixels/scale from the review run, and full-window capture dimensions. Confirm the reading pane and lower actions remain inside their card and are reachable by scrolling/focus, with fixed patient header/navigation/status. These samples do not establish Windows monitor-DPI transition behavior.

Use native keyboard checks for Ctrl+F/Ctrl+O/Enter/Escape, explicit versus automatic loading, selection retention, and Cover Sheet detail focus. Reobserve after asynchronous input before judging completion; immediate UIA focus/document state can lag. The user reported passes for the separate current-build M12 affected-controls listening checklist and historical M10 Appointments checklist; build-specific supplemental reports live in `validation/milestone-12/listening-reports.json`. The user-reported M11 pass stays bound to its historical executable, and Milestone 7–9 Narrator/listening results remain historical. Listening reports do not complete the native visual/keyboard size/scale matrix. Full assistive-technology conformance and physical IME/dead-key composition remain unverified unless separately demonstrated.

Current protocol is `M12_CHECK` / `M12_DELIVERY` / `M12_LAYOUT` / `M12_WINDOW` / `M12_INTEGRATED_PASS`, with 83 required checkpoints verified by `verify_integrated.py`. `Test-MockChart.ps1` accepts only Milestone 12 to prevent writing current-binary logs into historical milestone paths. All new receipts/logs live in `validation/milestone-12/`, whose Git attributes preserve their bytes. Automated receipts hash every step log, including silent steps; the integrated receipt also binds the automated receipt bytes. CI artifact paths, the clean-checkout checker, probe matrix, native review launcher and hardening verifier use M12 together.

Cover Sheet table return is verified natively, because the bundled Fluent table public `has-focus` does not reflect its internal keyboard scope. The automated `keyboard-focus` probe reports Cover Sheet actions generically after closing; it does not pretend to observe a table focus target. Read-only detail and browser filter probes remain separate.

At the largest supported application scale (200%), the authored default window uses 1180x700 logical pixels; the ordinary 1180x800 default would extend below the reviewed 1440-pixel desktop. Other defaults remain 1180x800 and the minimum is 980x680. The compact default is a bounded policy for the reviewed setup, not a general monitor-fit or DPI-transition guarantee.

The historical M11 journey preserved 71 prior checkpoints and added five heading/table/card geometry checks, five reverse-order View/help reveal checks, and one fixture-footer reachability check. Its default/minimum scale matrix used callbacks and geometry probes without native input or screenshot inspection. Fluent private-scope Tab entry uses captured key release, while View focus reveals its own controls; native forward/reverse Tab and return behavior remain pending and are carried into M12. CI code/build checks and a local fresh Git-tree Windows build are separate from native/listening evidence. Historical M11 results are in `docs/milestone-11.md`; current commands and limits are in `docs/milestone-12.md`.

The fixes merged through PR #3 drive the ten panel layout/reveal checkpoints with dispatched Slint Tab/Shift+Tab events after moving the target out of view; the footer checkpoint checks reachability separately. `review-final-state` restores all five panel selections (83 checkpoints). M12 records fresh runs of that journey under its own protocol. Committed M11 receipts remain the 82-checkpoint record of `10f21c4`; see `docs/milestone-12.md` and `docs/handoff.md`.
