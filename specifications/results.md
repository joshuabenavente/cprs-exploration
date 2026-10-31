# Mock-only Results: one interim-style laboratory report browser

## Scope and evidence

This milestone studies the pinned CPRS Chart 1.33.214.5 specimen and implements one synthetic report list/text view in Rust. The shell label **Results** and its position are prototype navigation. The recovered form caption is **Laboratory Results Page**; this work does not recover all original Chart tab behavior.

`analysis/results/` retains the complete 25,661-byte `TFRMLABS` resource decode and focused exports of 12 MAP functions, with assembly, direct call sites, and separate literal/callee annotations. The executable/MAP hashes remain those in `provenance/chart.lock.json`. `scripts/verify_results.py` checks inputs, MAP addresses, complete export coverage, and evidence hashes. Automatic whole-program analysis is disabled.

| Source evidence | Bounded finding |
| --- | --- |
| `TFRMLABS` / `tvReports` | Read-only `TORTreeView`, caption Available Reports, click bound to `tvReportsClick`. |
| `TFRMLABS` / `lstDates` | Date Range list with Today, One Week, One Month, Six Months, One Year, Two Year, All Results, and a date-range choice. These strings are evidence, not implemented mock filters. |
| `TFRMLABS` / `lvReports` | Read-only, multi-select report list with selection/key/column handlers. This is part of a broader report browser and is not a proven per-interim-report wire schema. |
| `TFRMLABS` / `Memo1` | Courier New, no wrapping, initially hidden, with enter/key handlers. Its extracted properties do not establish original read-only behavior. The mock explicitly enforces read-only text as authored policy. |
| `ClearPtData` `00ea4440` | Calls inherited clearing, clears several collections/text surfaces through indirect dispatch, blanks web state, and hides tab controls. Concrete ownership/reset guards in Rust are authored safeguards. |
| `DisplayPage` `00ea4504` | Calls report-tree loading and report selection paths; original report configuration and context remain broader than this slice. |
| `tvReportsClick` `00eb4c1c` | Contains `3:ALL TESTS BY DATE`, `1:MOST RECENT`, cumulative, selected-tests, worksheet, graph and other report choices. Multiple display paths reach `rReports.LoadReportText`; this milestone does not reproduce them all. |
| `lstDatesClick` `00ea9ee4`, call `00eaa438` | Interim branch calls `rLabs.Interim`, checks for empty returned text, and contains the explicit no-results-for-date-range message. Other branches and remote handling remain separate. |
| `rLabs.Interim` `00c867c8` | Uses a supplied RPC name; missing configuration produces the file-101.24 error text and support message. It does not establish a fixed RPC contract, parameter schema, registration type, permissions, or server behavior. |
| `rLabs.setInterimSelect` `00c86c80`, call `00eaa533` | Contains `ORWLRR INTERIMS` on a separate selected-tests branch. It is a static clue, not the contract for this mock. |
| `rLabs.GetNewestOldest` `00c87324` | Contains `ORWLRR NEWOLD`; no live date-navigation semantics are asserted. |
| `rReports.LoadReportText` `00c03f50` | Also uses a supplied RPC name and a missing-configuration path. No runtime behavior was observed. |

Decompiler ABI, managed strings, indirect dispatch, and exception paths remain uncertain. Numeric-callee annotations omit some already-named calls; direct-call TSV and assembly preserve those call sites. No original CPRS process was executed, and the Rust runtime does not load analysis outputs.

## Authored runtime contract

The single report type is **Invented interim-style text**. The dated list, report IDs, title/specimen/location metadata, substring filter, newest-first ISO timestamp sorting, explicit Open/Close gestures, and reading pane are authored prototype policy. They do not translate FileMan dates, original report identifiers, clinical values, status codes, reference ranges, units, or abnormal flags.

Every patient and report is compiled invented data. Each ordinary accessible fixture has four reports: two duplicate titles with different `REPORT-xx` IDs, a long Unicode report, and a successful empty report. SYNTH-002 has an empty list. IDs repeat between patients to exercise owner checks. Text uses invented training tokens, with no real laboratory measurements or interpretation.

The workspace keeps independent list/detail generations. List replies must match their pending request, active patient, tab, and filter; all rows must have the correct owner, unique typed IDs, valid authored timestamps, nonempty metadata, the supported report type, and matching filter text. Detail replies must match pending generation, active patient, selected report, and response identity. Stale/duplicate success and failure replies are ignored.

Selecting a row clears prior text and highlights only. Enter, native double-click, or View report detail requests text. Escape or Close detail clears text and pending delivery, retains selection, and returns to the list. Filters, tab changes, opening patient selection, and chart commits invalidate old requests. Canceling patient selection preserves the committed patient/tab and reloads a fresh unselected Results list. Ctrl+F focuses the Results filter; Ctrl+O opens patient selection.

List unavailable, report detail unavailable, and slow-reply simulations exercise errors and retry separately from successful empty states. A retry repeats the current operation; changing the scenario reloads the current filtered list. Report 01 is slower than Report 02 in the slow scenario.

## Acceptance and exclusions

RT01–RT15 cover duplicate titles, owner/ID checks, request generations, stale success/failure and duplicate delivery, filtering, patient/tab/cancel changes, successful empty list/text, error/retry, malformed metadata and dates, Unicode/long text, explicit activation/close, denied/unavailable fixtures, and unsupported identifiers/report types. Existing patient/Cover Sheet/Notes/Orders cases remain regressions.

Native validation covers keyboard activation/close, selectable read-only text, filtering, empty/error/retry display, and minimum/default layout samples at 100% and 200% application scale. Spoken output requires a separate user listening result; earlier Notes/Orders passes do not establish Results speech. Full assistive-technology conformance, physical IME/dead keys, intermediate scale/monitor changes, original-client equivalence, and server/site compatibility are not established by automated checks.

Graphs, numeric result grids, other report categories, remote sites, date-range dialogs, clinical interpretation, printing/export, result acknowledgment, ordering, signing, credentials, live transport, and clinical data import are excluded.
