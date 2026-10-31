# Milestone 5: mock-only read-only Orders

Orders now provides one flat invented-record list and an explicit read-only detail action. Patient selection, Cover Sheet, and Notes remain available; Results remains a placeholder. Every runtime record is compiled synthetic data, and no original CPRS component or analysis output is loaded by the application.

Run `scripts/Start-MockChart.ps1` from an ordinary user PowerShell session, or open `target/debug/cprs-chart-mock.exe` directly. The prior milestone established a launch-dependent clipboard failure in the tool shell; native app-launcher copy/paste and the user's manual paste retest passed. Do not interpret a restricted-shell clipboard failure as a new Orders input defect without a launch comparison.

Choose CARTER, JAMIE / SYNTH-001, then Orders. The list shows Service, Order, Start / Stop, Provider, Status, and Location. Horizontal scrolling exposes columns that do not fit at narrower widths. Filter by text or the separate mock-status selector. These three demo statuses are authored fixture policy, not VistA status codes.

A single selection highlights an order without fetching detail. Enter, double-click, or View order detail opens its read-only text. Escape or Close detail clears the text and pending reply, keeps the row selected, and returns focus to the list. Ctrl+F focuses the Orders filter; Ctrl+O opens patient selection. Canceling selection preserves the committed patient and tab and reloads a fresh list with no old selection/detail.

The first two orders deliberately share a description and have different IDs. ORDER-03 contains long invented Unicode detail; ORDER-04 succeeds with an empty detail response. SYNTH-002 has no invented orders. Scenarios exercise unavailable lists, unavailable detail, and slow replies; ORDER-01 responds more slowly than ORDER-02 in the slow scenario. Retry repeats the selected operation, and resetting the scenario reloads the current filtered list.

## Evidence and policy

The [Orders specification](../specifications/orders.md) distinguishes recovered facts from authored behavior. Two forms were decoded completely. Twenty-four requested MAP names produced 26 function exports because LoadOrdersAbbr has three overloads. Assembly, decompilations, direct calls, and separate annotations remain pinned by `validation/milestone-5/static.json`. Whole-program analysis is disabled.

The original has an owner-drawn, multi-select list, display groups, context-dependent views, and a report-box detail path. Its Active view includes pending/recent activity; its Current view is separately labeled active/pending only. The mock deliberately exposes one flat single-select view, invented status/text filtering, fixed timestamp sorting, and an in-window text pane. It does not translate source constants, registration types, server responses, site permissions, or clinical state semantics.

`crates/chart-core/src/orders.rs` defines typed mock order IDs/status filters, patient-owned summaries, separate list/detail generations, response validation, and invented payloads. A reply must match its pending request, patient, tab, selection, and response identity. Filtered lists reject wrong-owner, duplicate, malformed, or out-of-filter rows. Patient/tab/filter changes invalidate pending deliveries and clear previous text; explicit detail close preserves selection while invalidating detail delivery.

`crates/chart-desktop/ui/orders-view.slint` implements the viewing controls. The adapter preserves unchanged row models and keys double-click activation by patient/order identity with reset on view changes. The text is read-only and selectable; the workspace scrolls to expose lower actions while the patient header/navigation stay fixed. No entry, modification, discontinuation, release, verification, signing, printing, or live transport is included.

## Reproduce validation

Close the mock before rebuilding. New receipts go only under `validation/milestone-5/`; prior milestone receipts remain historical.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\inspect_orders.py
.\scripts\Analyze-Orders.ps1
& $ChartPython scripts\resolve_workflow.py --orders
& $ChartPython scripts\verify_orders.py
```

Keep the Ghidra GUI project closed during export. Preserve generated evidence bytes, including exporter whitespace; the static receipt verifies their hashes. OT01–OT15 exercise exact identity, explicit activation/close, filtering, stale/duplicate delivery, patient/tab/cancel behavior, empty/error/retry, malformed data, Unicode/long text, and denied/unavailable fixtures. Existing workflow/Cover Sheet/Notes checks remain regressions.

Native UI, spoken-output, input, and automated/static evidence are separate categories. The prior Notes Narrator checklist was user-reported as passing; it does not establish speech behavior for newly added Orders controls. Physical IME/dead keys, full assistive-technology conformance, original-client runtime equivalence, and live server/site compatibility remain unverified.

The final executable passed formatting, warning-free Clippy, 55 core workflow tests (15 Orders cases and 40 regressions), the offline build, and callback smoke checks. Native checks covered explicit activation/close, duplicate descriptions, status/text filtering, unavailable list/detail and retry, read-only long Unicode text, successful empty detail/list states, patient switching/cancellation, and the existing Notes reading pane. Samples used the 1180x800 logical default at 100% and the 980x680 logical minimum at 200%. At the minimum width, table Location values required horizontal scrolling; dragging the scrollbar worked, while a horizontal-wheel attempt did not visibly move the table and is not recorded as passing. Intermediate scales and Windows monitor DPI changes were not tested.

Immediate UIA captures sometimes retained the previous filter/document state or focus label. Settled screenshots and native caret/selection behavior were checked separately, and no exact input-to-paint latency or complete accessibility conformance is claimed. New Orders spoken-output observations belong in `validation/milestone-5/native-ui.json` and must remain separate from the historical Notes listening pass.
