# Behavioral specification

This specification records supported static behavior and unresolved paths. Addresses refer to the pinned uploaded executable. [Verified direct edges](catalog/verified-archived-call-edges.jsonl), [literal use sites](catalog/literal-use-sites.jsonl.gz), raw Ghidra exports, form resources and byte-check receipts support the observations. A call establishes a static relationship; path conditions and runtime effects require additional verification where noted.

## Startup

Entry `01224034` establishes an EBP frame, registers Delphi exception state through `FS:[0]`, and begins calls including `00413340` at `01224048`, `ORSystem.BorlandDLLVersionOK` at `01224061`, and type-library registration `00df6cc4` at `0122406e`. The version-check result controls a branch to `01224173`; the helper contains BORLNDMM.DLL missing/version error messages. The startup routine and helper are included in the bounded review batches. Do not assume unconditional startup from the entry-point name.

## Patient selection and chart change

1. **Request a change.** `fFrame.TfrmFrame.mnuFileOpenClick` `00ff4658` references change tracking and `AllowContextChangeAll`. Its MAP-bounded listing contains selector calls at `00ff50d3` and `00ff51ca`, and patient setup at `00ff5276`. Delphi finally trampolines cause straightforward pseudocode to omit part of this span; call-site bytes are controlling evidence for these edges.
2. **Construct the selector.** `fPtSel.SelectPatient` `00e81038` creates the form, obtains default-list/context information, invokes a virtual form operation, copies a result flag and frees the form. Modal lifecycle is a supported interpretation; the virtual method identity and result-flag meaning remain incompletely typed.
3. **Retrieve candidates.** `cboPatientChange` `00e825c4` references full-identifier and last-five lookups and their restricted variants. `cboPatientNeedData` `00e82980` references subset/restricted-list wrappers, direction-sensitive cursor manipulation, piece helpers and ` -- ALIAS`. Server paging size and the complete alias/cursor algorithm remain unresolved.
4. **Confirm.** Double-click routes toward the same OK handler after checking a nonempty key. `cmdOKClick` `00e82d44` has an empty-selection message, duplicate-identifier helper, sensitive-access call at `00e82e08`, death-date call at `00e82e14`, confirmation text and commit helper. Exact branch predicates and the audit/acknowledgement protocol remain unresolved; merely highlighting a row is not evidence of committed identity.
5. **Commit context.** `SelectPtByDFN` `00e8303c` contains CCOW/context handling, calls patient setter at `00e830cb`, clears encounter at `00e830d7`, and clears changes at `00e830e3`. Conditional encounter location/date/provider updates follow. `TPatient.SetDFN` `011d4918` calls `rCore.SelectPatient` at `011d496c`.
6. **Refresh shell.** `SetupPatient` `00ff1f14` updates patient-oriented controls and reaches `SetupPtInfoPanel` `00ff2f08`. `SetActiveTab` `01004578` calls `tabPageChange` `00ff1ae8`, which also reaches patient-info setup. Full tab population and all lifecycle ordering are unresolved.

Cancellation includes a conditional `No patient selected. Close CPRS Yes or No?` path. `FormCloseQuery` `00e85bec` calls cancellation. This does not establish that every cancellation exits the application.

## Cover Sheet composition and clearing

The Cover Sheet service has initialization, display, patient-switch and patient-clear methods. Clearing `00bee374` iterates controls through an interface. Common panel clearing `00bd3688` dispatches slot `0x21c`; validated subclasses map this to `ClearListView` `00bd35d0`. The latter brackets list clearing with update operations. These relationships establish explicit reset mechanisms but not complete event order or atomicity.

Common detail dispatch `00bd41b4` obtains an attached row object and invokes get/show slots `0x210` / `0x214`. Common show method `00bd4908` calls `fRptBox.ReportBox` at `00bd4979`. Configured subclasses can replace these paths, so shared UI must not be treated as a uniform read-only interface.

Problem List detail wrapper `00bf026c`, allergy detail `00bf0374`, and allergy list `00bf05e8` provide additional domain-specific boundaries. Full upstream response grammars and clinical meanings remain unresolved.

## Vitals

Constructor `00be2090` calls the common constructor, adds columns `Vital`, `Value`, `Date Taken`, `Quals`, then collapses columns. `OnAddItems` `00be2474` uses an empty-input literal `^No Vitals Found.`, constructs caret-delimited row objects, populates the projections in the data catalog and attaches each row object. The sentinel describes a client display branch and is not proof of a clinical absence.

Detail building `00be279c` clears a destination and formats lines headed `Vital ..........`, `Date/Time ......`, `Value ..........`, `Conv. Value ....`, and `Qualifiers .....`. The row date format literal is `MMM DD, YYYY@hh:nn`, while the detail literal is `MMM DD, YYYY@hh:mm`. Preserve that discrepancy as observed evidence; do not silently correct it into assumed intended behavior.

Vitals' show override `00be22f4` invokes slot `0x238` at `00be2312`. The VMT maps that slot to `OnUpdateVitals` `00be2334`, which calls `uWriteAccess.WriteAccess` at `00be2356` and `uVitals.ViewPatientVitals` at `00be23d5`. This is a permission/integration boundary. A method named ShowDetail is not sufficient evidence of no write-related effects. DLL behavior and effective permissions remain unresolved.

## Active Medications

Factory `00bd63d8` loads the class metadata reference and calls constructor `00bd5e48`. The constructor adds `Medication` then `Status` and collapses columns. `OnAddItems` `00bd5eec` begins update, dispatches clear, calls `rMeds.ExtractActiveMeds` at `00bd5f72`, constructs caret-delimited row objects, projects pieces 2/4 through MixedCase helpers and attaches objects.

The first-row piece-1 value `0` combined with original input count controls a collapse/expand path. This does not recover clinical status meanings. `ExtractActiveMeds` `00add94c` filters/mutates input and invokes status-related helpers; its full medication inclusion rules and helper semantics remain unresolved.

Detail `00bd615c` uses a configured RPC string/interface and reaches CallVistA at `00bd61d6`. It inherits common show behavior. The response contract, authorization and full viewer behavior are not recovered.

## Appointments

Factory `00bd7f30` and constructor `00bd787c` create a panel with `Date/Time`, `Location`, `Action Req` columns. No separate Clinic or Status heading is supported by this constructor evidence.

`OnAddItems` `00bd7954` distinguishes empty/null-piece cases, collapses/expands columns, enumerates row strings and creates caret-delimited objects. In a null piece-1 branch, piece 2 supplies caption. Otherwise piece 2 passes through date helpers; pieces 3/4 become subitems through MixedCase. Object attachment is at `00bd7b7b`; a finally continuation ends updating at `00bd7be9`.

Detail `00bd7cb8` uses configured interface slot `0x38`, current patient and row piece 1, then calls CallVistA at `00bd7d3b`. The `Action Req` display heading alone does not recover scheduling, check-in, cancellation or other action semantics.

## Notes and documentation

Resources separate a tree, flat list, read text and edit text. The flat list stores Date, Title, Subject, Author, Location and hidden metadata columns. The read surface has stored read-only/plain-text/nonwrapping properties; a separate edit surface exists.

`DisplayPage` `00e146cc` obtains TIU view context; `LoadNotes` `00e21f14` retrieves list data and clears tree state. List selection `00e202f8` and tree change `00e1e870` route toward document selection. `lstNotesClick` `00e19480` calls document text wrapper `00a0b870` at `00e196f8` and carries `Retrieving selected progress note...` text. The same original handler also contains write-access checks, notifications and PCE-related work, so it is not a pure function to mechanically port.

Tree/list key and double-click methods distinguish a `SHOW MORE` marker and reach `GetMoreDocuments` `00e23618`. These edges do not establish a universal Enter-to-read or Enter-to-edit gesture. `ClearPtData` `00e14524` and `ClearTVNotes` `00e14ec4` provide explicit cleanup paths, including temporary change-handler detachment during tree clearing.

Signing, saving without signature, submission and cosigning are separate entry points in the new review batch. Their client checks, lock state, response parsing, error paths and server authorization remain distinct questions; viewing evidence does not specify those write workflows.

## Orders

The resource distinguishes View Orders and Write Orders controls. Its original list is owner drawn and supports multiple selection. Named header sections include Service, Order, Start / Stop, Provider, Nurse, Clerk, Chart, Status and Location plus unnamed sections. A replacement that uses a simple single-selection table is a design change rather than recovered parity.

Active view handler `0117bdd0` and Current view `0117beb8` pass different constants to `SetOrderView` and use distinct explanatory captions. Their exact clinical status sets are not recovered from captions alone.

`RefreshOrderList` `0117b000` clears orders, invokes abbreviated-list overloads and reaches sorting/list-building helpers. `RetrieveVisibleOrders` `0117e3f0` calls `RetrieveOrderFields` `011ddc0c`. Observed local batching does not establish a server pagination limit.

Double-click `0117f5dc` calls detail handler `0117cc00` at `0117f5ee`. The handler checks/iterates selected items, calls `getDetailOrder` `011dabac`, and reaches a report viewer. Additional package-specific branches, exception continuations and full dialog behavior remain unresolved. `ClearPtData` `01179ba0` invokes inherited clearing, order-sheet/list cleanup and domain cleanup.

Order creation, validation, locking, submission, release and signature flows require independent recovery. Representative entries are retained in the bounded review batch, and all other discovered order functions remain in the census with explicit status.

## Results and report browsing

The stored main lab form caption is `Laboratory Results Page`. It has a report tree, date-range list, multi-select report list and several display surfaces. Runtime report categories and configured branches are broader than one interim-text browser.

`DisplayPage` `00ea4504` reaches report-tree loading and selection. `tvReportsClick` `00eb4c1c` distinguishes all-tests-by-date, most-recent, cumulative, selected-test, worksheet, graph and other paths. `lstDatesClick` `00ea9ee4` reaches `rLabs.Interim` at `00eaa438`, checks returned text and contains a no-results-for-date-range message. A separate selected-test branch calls `setInterimSelect` at `00eaa533`.

`rLabs.Interim` `00c867c8` and `rReports.LoadReportText` `00c03f50` use supplied RPC names and have missing-configuration messages. Static branch presence does not recover every report schema, date conversion or remote-site behavior. `ClearPtData` `00ea4440` resets multiple collections, text/web state and controls through direct and indirect dispatch.

## Cross-cutting failure and lifecycle concerns

Delphi exception handling uses `FS` state, cleanup trampolines and indirect jumps. A function ending at an indirect cleanup jump may have further continuations. Neither a decompiler constant-looking condition nor a normal flow-following boundary is accepted as complete proof.

Patient access, write access, cancellation, empty response, missing configuration and transport failure are distinct categories in the observed code. Their complete enumeration and propagation remain per-function follow-ups. The historical prototype's request-generation guards, retry UI, fixture statuses and ownership policies are authored choices and are not asserted as original executable behavior.
