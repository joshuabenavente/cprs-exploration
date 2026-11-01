# Mock-only read-only Orders

Scope: the pinned CPRS Chart 1.33.214.5 / OR*3.0*639 specimen and a synthetic Rust list/detail slice. Runtime records are compiled invented fixtures. Order entry, changes, discontinuation, release, review/verification, signing, printing, broker connectivity, and clinical-data import are excluded.

## Recovered static evidence

The focused exporter processes 24 requested MAP names at 26 distinct MAP addresses: `rOrders.LoadOrdersAbbr` has three overloads. All 26 retain instruction listings, decompilations, call-site tables, and separate MAP/literal annotations under `analysis/orders/`. Both `TFRMORDERS` (12,083 bytes) and `TFRMORDERVIEW` (4,095 bytes) were decoded with complete resource consumption. `validation/milestone-5/static.json` verifies the original executable/MAP and the generated evidence hashes. Whole-program automatic analysis remains disabled.

| Finding | Evidence | Boundary |
| --- | --- | --- |
| The form separates View Orders from Write Orders. | `TFRMORDERS.dfm.json`: `lstSheets` caption View Orders, `lstWrite` caption Write Orders, and distinct handlers. | The mock implements a viewing slice only. Even `lstSheetsClick` contains event-management/write-related branches; it is not a pure read API to translate wholesale. |
| The original list is owner drawn and supports multiple selection. | `lstOrders`: `TCaptionListBox`, `MultiSelect=true`, draw/measure/hint handlers, `OnDblClick=lstOrdersDblClick`. | The prototype deliberately uses a single-select standard table. Original grouping, row drawing, and multiple-detail sequencing are not reproduced. |
| Named header sections are Service, Order, Start / Stop, Provider, Nurse, Clerk, Chart, Status, Location. | `hdrOrders.Sections` also has two unnamed sections, one with stored width zero. | The mock adopts the six display columns Service, Order, Start / Stop, Provider, Status, Location. Review-related and unnamed columns are excluded. Stored widths are not runtime layout proof. |
| Active and Current views are distinct. | `mnuViewActiveClick` at `0117bdd0` uses the caption Active Orders (includes Pending & Recent Activity); `mnuViewCurrentClick` at `0117beb8` uses Current Orders (Active & Pending Status Only). Their instruction paths pass different constants to `SetOrderView`. | The mock's All mock statuses/Mock active/Mock pending/Mock complete filters are authored fixture policy, not translations of those constants or server semantics. |
| List refresh and visible-field retrieval are separate paths. | `RefreshOrderList` at `0117b000` calls `ClearOrders`, three MAP overloads of `LoadOrdersAbbr`, sorting, and list-building helpers. `RetrieveVisibleOrders` at `0117e3f0` calls `RetrieveOrderFields` at `011ddc0c`. | The local iteration/batching seen in the latter is not a recovered server limit or pagination contract. Notifications, events, display groups, and default-view behavior remain incomplete. |
| Double-click opens the existing detail handler. | `lstOrdersDblClick` at `0117f5dc` directly calls `mnuViewDetailClick` at `0117cc00`. That handler checks selection, loops selected items, calls `getDetailOrder` at `011dabac`, and reaches MAP-resolved `fRptBox.ReportBox` at `01007fec`. | Delphi register ABI, type recovery, indirect dispatch, exception continuations, package-specific detail additions, and full original dialog behavior remain uncertain. The mock supports one selected item and an authored in-window detail pane. |
| Detail retrieval differs from abbreviated-list and plain-text retrieval. | `getDetailOrder` retains `ORQOR DETAIL`; the three abbreviated-list wrappers retain `ORWORR AGET`, `ORB FOLLOW-UP ARRAY`, and `ORWORR RGET`; `RetrieveOrderFields` retains `ORWORR GET4LST`; `TextForOrder` retains `ORWORR GETTXT`. | These are static interface clues. Argument/response types, registrations, permissions, site behavior, and runtime compatibility are not established. |
| Patient clearing explicitly clears Orders state. | `ClearPtData` at `01179ba0` calls its inherited clearing path, an indirect list operation, `ClearOrderSheets`, and `rOrders.ClearOrders`, plus other cleanup. | The Rust clearing and generation rules are authored; no original process is executed. |
| Custom status/service/date/sort choices exist. | `TFRMORDERVIEW`: read-only status and service trees, date-range controls, Reverse Chronological Sequence, Group Orders by Service, OK/Cancel. `ListOrderFiltersAll` retains `ORWORDG REVSTS`. | M15 adds authored inline calendar bounds and Reset (orders-filtering.md); no custom-view dialog, service grouping, persisted default, or live status catalog is implemented. |

`GetOrderText`, `GetPlainText`, `GetStartStopText`, and `NameOfStatus` provide additional rendering/literal evidence. The original status literals do not give the mock's three statuses clinical meaning. All prototype status labels explicitly say Mock.

## Authored runtime behavior

One flat invented order list is sorted by fixed invented timestamp descending, with mock order ID as a deterministic tie breaker. Text filtering matches order ID, service, order description, provider, mock status label, and location using Unicode lowercase matching, without accent folding. The separate status filter is typed fixture policy. Responses must contain records matching the requested filters.

Selection only highlights a row and updates its patient/order identity. Enter, double-click, or View order detail explicitly requests read-only detail. Escape or Close detail clears the document, invalidates pending detail replies, retains the selection, and restores list focus. Ctrl+F focuses the Orders filter; Ctrl+O opens patient selection. Document text is selectable and scrollable; it has no editing or clinical-action callbacks.

List keys include generation, patient ID, text/status/date filter tuple. Detail keys include an independent generation, patient ID, and order ID. Applying a reply requires the matching pending request, active patient, Orders tab, and selected order; detail response owner and ID must also match. Old and duplicate successes and failures are discarded. A list rejects foreign owners, duplicate IDs, blank required metadata, malformed invented timestamps, and rows outside the requested filters.

Changing text/status/date filters clears rows, selection, and detail before the new list loads. Selecting another order clears old detail immediately. Leaving Orders, opening patient selection, or committing a new chart clears all Orders transient state. Canceling patient selection preserves the committed patient/tab and reloads a fresh all-status list, without restoring old selection or detail.

Input validation (no provider request), loading, successful empty lists, no filter matches, list failure, closed detail, detail loading, detail failure/retry, and a successful empty detail response are distinct. Retry repeats only the indicated mock operation. Scenario controls provide list failure, detail failure, and delayed responses. In the slow scenario ORDER-01 detail is delayed longer than ORDER-02 to exercise races.

SYNTH-002 has no invented orders. Other accessible fixtures have four records: duplicate descriptions with distinct IDs, a long Unicode detail, and a successful empty-detail fixture. IDs deliberately repeat across patients so tests must preserve the patient key. All text is invented training content, not clinical instructions.

## Acceptance

OT01–OT15 cover exact identity, duplicate descriptions, deterministic sorting, stale/duplicate replies, cross-patient collisions, tab/selector cancellation, filtering, explicit detail activation/close, malformed records, empty/error/retry states, Unicode/long text, and denied/unavailable fixtures. Native visual/keyboard checks, user-reported Narrator results, and source/static evidence remain separate from core and callback checks. Existing Milestone 4 listening results do not establish speech behavior for the new Orders controls.

## M15 Orders calendar extension

[OF01–OF08](orders-filtering.md) defines strict inclusive bounds on the invented
order timestamp and Reset to query/date blanks plus All mock statuses. Invalid
edits immediately clear both list and detail generations; retries and scenario
changes retain inputs. This does not implement Start / Stop interval semantics
or original order-placement dates. Existing explicit activation remains intact.
