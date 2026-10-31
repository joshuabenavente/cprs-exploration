# Integrated mock Chart acceptance contract

## Scope

Milestone 7 validates the existing synthetic patient selector, Cover Sheet, Notes, Orders, and Results as one application. It adds no clinical features, transport, imports, authentication, order entry/signing, interpretation, printing, or original-client execution. Static workflow evidence remains the historical, hash-pinned evidence from milestones 1–6. No new original-binary behavior is claimed.

The opt-in `--integration-check` runs the normal desktop callbacks with `immediate=false`, the compiled mock provider, and the Slint winit/software event loop. List/search/chart/detail timers retain their normal delays, including the slower scenarios. Each actual delivery records operation, synthetic owner/key, generation, and the core's accepted/rejected decision. Normal launches do not collect this audit.

The driver starts each action once, polls readiness with 25 ms timers, verifies an endpoint, and advances. Readiness is based on delivered replies and UI bindings, with a five-second per-check and ninety-second journey deadline. These are test bounds, not performance guarantees. Closing the window before completion fails the check. `--keep-open` leaves the completed synthetic review state open; it is only valid with `--integration-check`.

At each poll, exposed browser text and core rows must belong to the committed synthetic patient; inactive browser bindings must be empty. Opening patient selection must clear browser text. These checks sample application bindings, not the screen compositor, physical keyboard, UIA provider, or speech.

## Journey coverage

| Area | Required behavior |
| --- | --- |
| Duplicate patient search | Fast MORGAN reply wins over slow M; both MORGAN synthetic IDs remain distinguishable; only explicit confirmation commits SYNTH-004. |
| Cover Sheet | Closing an in-flight detail invalidates it; the next panel detail belongs to the current patient and initially focuses the read-only reading pane. |
| Notes | Automatic selection loads text; a late NOTE-01 cannot replace NOTE-02. A pending old-patient note is rejected after a different MORGAN commits; the same note ID under the new patient loads only that owner's text. |
| Cross-tab lists | Both the ordinary and slower Orders list replies must be rejected after moving to Results. No inactive list or text bindings may reappear. |
| Results | Selection alone does not load text. Explicit opening requests it; late REPORT-01 cannot replace REPORT-02 or steal focus from the filter. Close invalidates in-flight text and retains selection. Empty REPORT-04 is successful. Filtering invalidates pending text. |
| Errors and retry | Failed Results list and Orders detail retries use real timers. Late list/detail errors cannot replace recovered or different-tab state. Failure stays distinct from successful empty data. |
| Patient cancellation | Canceling while an order is pending preserves the committed patient/tab, reloads an unselected list, clears old text, and returns focus to the Orders filter. Results cancellation likewise returns to its filter. |
| Access decisions | Acknowledgment is required before PATEL commits; decline preserves the current chart. RIVERA denial leaves the previous chart committed. |
| Empty patient | SYNTH-002 successfully has empty Notes, Orders, and Results without carrying prior text or marking the lists unavailable. |
| Review checkpoint | Return to SYNTH-001 and open the long Unicode REPORT-03 in Results. |

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

Inspect default and minimum windows at 125%, 150%, and 175% process-local application scale. Record requested sizing, actual client pixels/scale from the review run, and full-window capture dimensions. Confirm the reading pane and lower actions remain inside their card and are reachable by scrolling/focus, with fixed patient header/navigation/status. These samples do not establish Windows monitor-DPI transition behavior.

Use native keyboard checks for Ctrl+F/Ctrl+O/Enter/Escape, explicit versus automatic loading, selection retention, and Cover Sheet detail focus. Reobserve after asynchronous input before judging completion; immediate UIA focus/document state can lag. The combined Narrator checklist must be recorded separately from historical Notes/Orders/Results passes. Full assistive-technology conformance and physical IME/dead-key composition remain unverified unless separately demonstrated.
