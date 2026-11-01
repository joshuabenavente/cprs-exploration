# Results date-range filtering (M14)

All date semantics below are P (authored prototype policy). B (bounded static
observation): published TFRMLABS resource `0373-TFRMLABS.json` exposes a
Date Range list with custom/today/week/month/year/all entries and `lstDatesClick`.
The address-filtered export `00ea9ee4` reaches interim-report retrieval.
I (inference): a date-filter extension fits the existing Results reader.
U (unresolved): exact original defaults, inclusivity, relative dates, FileMan,
timezones, server filtering, permissions and dialog return behavior.

| ID | Contract | Verification |
| --- | --- | --- |
| RF01 | Typed filter contains existing Unicode lowercase substring query plus optional beginning/ending calendar days. All fields, patient and generation identify a request. | Combined exact-ID and forged-request tests; real timer edit/reset races. |
| RF02 | Nonblank bounds are strict ASCII YYYY-MM-DD, Gregorian years 0001–9999, inclusive; blank is open and beginning <= ending. Whitespace is invalid. | Boundaries, one-sided, leap/century, invalid/reversed/Unicode cases. |
| RF03 | Any edit clears rows, selection and detail immediately and invalidates pending list/detail successes and failures. Invalid input shows patient-scoped validation, issues no provider request and offers no error retry. | Stale/duplicate/invalid tests and timer checkpoints. |
| RF04 | Provider validates filter; response validates owner, unique IDs, nonblank metadata, exact report type, strict timestamp and all predicates. Newest-first then ID order. | Malformed/out-of-filter rows rejected as a whole. |
| RF05 | Reset clears all three fields for current patient and requests a fresh list. Tab/patient/selector cancellation uses fresh defaults; committed patient survives cancel. | Reset/default/ownership races. |
| RF06 | Loading, invalid input, valid empty, provider error, successful empty detail remain distinct. Retry preserves exact valid tuple. | Core state tests and timer journey. |
| RF07 | Highlighting remains separate from explicit View/Enter/double-click activation. Close/Escape retains selection and invalidates detail. Ctrl+F focuses query. Keyboard labels identify committed patient and inclusive date rules. | Callback/timer checks; new native keyboard/listening checklist remains required. |
| RF08 | Date/status/list/detail/actions remain reachable at default/minimum sizes and 100/125/150/175/200% scale. | Synthetic geometry matrix plus separate build-bound Windows visual/keyboard/Narrator observations. |

Keep four invented reports, one interim-style report type, nine invented patients,
read-only offline fixtures and existing detail controls. Do not add report types,
relative presets, original execution, live RPC, clinical data, writes/signing,
FileMan/timezone conversion or credentials. Shared strict calendar parsing is a
small local helper also used by Notes, whose behavior remains unchanged.
