# Orders date filtering (M15)

P (authored prototype policy): all calendar, Reset and concurrency semantics below.
B (bounded observation): `analysis/orders/resources/TFRMORDERVIEW.dfm.json` has
`chkDateRange` (Only List Orders Placed During Time Period), `calFrom`, `calThru`,
`calChange` and separate OK/Cancel bindings. Existing detail dispatch is recorded
at `0117cc00` and `0117f5dc` in orders.md. I: a bounded extension fits this reader.
U: original placement/start-stop semantics, defaults, inclusivity, FileMan,
timezones, persistence, server filtering, permissions and runtime accessibility.

| ID | Contract | Verification |
| --- | --- | --- |
| OF01 | Typed tuple contains query, mock status and optional calendar bounds; generation and patient plus the full tuple identify each request. | Combined predicates, forged tuple and generation tests; timer races. |
| OF02 | Nonblank bounds are strict ASCII YYYY-MM-DD, Gregorian years 0001–9999, inclusive. Blank is open; whitespace is invalid; beginning <= ending. Filter only the first ten characters of the invented order timestamp, never Start / Stop intervals. | Equal/one-sided, leap/century/year limits, partial/Unicode/reversed tests. |
| OF03 | Every edit clears rows/selection/detail and invalidates both pending channels before parsing. Invalid input sends no provider request, shows patient-scoped validation and offers no provider-error retry. | Late/duplicate success/failure, invalid recovery and desktop timer checks. |
| OF04 | Provider validates tuple consistency/range; response validates owner, unique IDs, required nonblank metadata, strict digit-only timestamp and every predicate. Sort newest-first then ID. | Whole-response rejection of malformed/out-of-filter rows, query/status/date regressions. |
| OF05 | Reset clears query/dates and restores All mock statuses for current patient; scenario remains. Tab/patient/selector clearing restores defaults; cancel retains committed patient/tab and reloads defaults. Scenario changes preserve values, including invalid inputs. | Loading/invalid/empty/error/detail reset and lifecycle races. |
| OF06 | Loading, invalid input, valid empty, provider error and empty detail remain distinct. Retry preserves exact valid tuple; detail retry remains selected and owned. | State and real timer scenarios. |
| OF07 | Highlight only selects. View/Enter/double-click opens read-only detail. Escape/Close retains selection, invalidates detail and returns list focus. Ctrl+F focuses query. Labels identify patient/date rules. | Callback/timer checks plus separate native keyboard/listening checklist. |
| OF08 | All filters, scenario, Reset, table, reading and actions remain reachable at default/minimum and 100/125/150/175/200% scale with fixed frame visible. | Intrinsic Orders height, filter/reading probes and ten synthetic samples; separate Windows native/keyboard/Narrator observations. |

Keep nine invented patients, four orders per nonempty fixture, three mock statuses,
six columns and existing detail behavior. No new services, grouping, multiselect,
sort options, persistence, original execution, live transport, credentials,
clinical data, signing or writes. M13/M14 native acceptance is not inherited.
