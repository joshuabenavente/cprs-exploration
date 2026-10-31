# CPRS Chart patient selection and chart shell

This specification defines the first synthetic Rust slice: choose a patient and open that patient's chart shell. Its reference is the local CPRS Chart 1.33.214.5 executable and MAP pinned in [chart.lock.json](../provenance/chart.lock.json). Binary observations below describe this specimen. The Rust state model and acceptance cases are authored prototype policy; they do not establish live VistA compatibility.

## Reference controls

The extracted [patient-selection form](../analysis/resources/TFRMPTSEL.dfm.json) is named `frmPtSel` and captioned `Patient Selection`. Its stored client size is 868 by 573, with minimum outer constraints of 800 by 600. These are resource values; runtime DPI, inherited defaults, and layout adjustments are not measured.

| Control | Stored properties and bindings |
| --- | --- |
| `cboPatient` | `TORCheckComboBox`, simple style, `LongList=True`, `LookupPiece=2`, `Pieces=2,3`, `Sorted=False`, `TabOrder=0` |
| Search hint | `Enter name or use "Last 4" (x1234) format` |
| Search events | `OnChange=cboPatientChange`, `OnNeedData=cboPatientNeedData`, `OnKeyPause=cboPatientKeyPause`, `OnDblClick=cboPatientDblClick`, plus enter, exit, key, and mouse handlers |
| `cmdOK` | Caption `OK`, `TabOrder=1`, `OnClick=cmdOKClick` |
| `cmdCancel` | Caption `Cancel`, `Cancel=True`, `TabOrder=2`, `OnClick=cmdCancelClick` |
| Demographics area | Label `Patient Demographics`; selection and key-pause paths reference `ShowIDInfo` and `ClearIDInfo` |
| Notifications | Pending and Processed tabs, with processing controls; these are outside the first Rust slice |

The extracted [chart frame](../analysis/resources/TFRMFRAME.dfm.json) contains `mnuFileOpen`, captioned `Select &New Patient...`, bound to `mnuFileOpenClick`. Its `tabPage` is a bottom-aligned `TTabControl` bound to `tabPageChange`. The stored resource does not give the complete runtime tab population. Do not invent its order from this resource alone.

## Observed workflow

The [call-site table](../analysis/decompiled/workflow-calls.tsv) records instruction addresses and MAP names. The [resolved evidence](../analysis/resolved/workflow-evidence.json) associates numeric decompiler references and validated Delphi string literals with each selected function.

1. **Request a patient change.** `fFrame.TfrmFrame.mnuFileOpenClick` at `0x00ff4658` references change tracking and calls `AllowContextChangeAll`. Within its MAP-bounded instruction span, calls at `0x00ff50d3` and `0x00ff51ca` enter `fPtSel.SelectPatient`; several subsequent sites call `SetupPatient`, including `0x00ff5276`. Their presence establishes the menu-to-selector-to-chart connection, while exact branch predicates require further exception-flow reconstruction.
2. **Construct the selector.** `fPtSel.SelectPatient` at `0x00e81038` creates the form, references default-list retrieval and notification clearing, invokes a virtual form operation, copies a result flag, and frees the form. This is consistent with a modal selection lifecycle. The virtual operation and flag meanings have not been validated at runtime.
3. **Retrieve and display candidates.** `cboPatientChange` references full-identifier and last-five lookup wrappers, including restricted-list variants. `cboPatientNeedData` references `rCore.setSubSetOfPatients` and `rCore.setRPLPtList`. It also contains direction-sensitive cursor manipulation, caret-piece operations, and the literal ` -- ALIAS`. These observations support preserving a cursor/provider boundary; they do not establish a server row limit or the complete alias and paging algorithm.
4. **Confirm a selected record.** `cboPatientDblClick` calls `cmdOKClick` after a nonempty-key check. The OK handler contains an empty-selection message, a call to `DupLastSSN`, a call to `uCore.AllowAccessToSensitivePatient`, a death-date check with confirmation text, and a call to `SelectPtByDFN`. These checks must remain visible in the implementation model rather than treating a highlighted row as a committed chart identity.
5. **Apply the patient identity.** `SelectPtByDFN` at `0x00e8303c` references CCOW context-change handling, calls `uCore.TPatient.SetDFN`, clears encounter and changes objects, and sets encounter fields in conditional paths. `TPatient.SetDFN` calls `rCore.SelectPatient`, which references patient and encounter RPCs. Exact Delphi record layouts, context rules, and field meanings remain untyped.
6. **Populate the chart shell.** `SetupPatient` at `0x00ff1f14` performs patient-header/control updates and calls `SetupPtInfoPanel`. `SetActiveTab` at `0x01004578` calls `tabPageChange`; `tabPageChange` also calls `SetupPtInfoPanel`. The first Rust slice should refresh the header and view state for one committed patient identity.

The cancellation handler references `No patient selected. Close CPRS Yes or No?` in one conditional path. `FormCloseQuery` calls `cmdCancelClick`. This is evidence of a conditional close-confirmation path, not proof that every cancellation closes CPRS.

## RPC references in the selected wrappers

The following strings are present in calls through `ORNet.CallVistA`. They identify interfaces to investigate; no server registration, input declarations, permissions, or production endpoint has been established.

| Wrapper | RPC literal |
| --- | --- |
| `rCore.setSubSetOfPatients` | `ORWPT LIST ALL` |
| `rCore.setRPLPtList` | `ORQPT READ RPL` |
| `rCore.ListPtByLast5` and restricted variant | `ORWPT LAST5`, `ORWPT LAST5 RPL` |
| `rCore.ListPtByFullSSN` and restricted variant | `ORWPT FULLSSN`, `ORWPT FULLSSN RPL` |
| `rCore.ListPtTop` | `ORWPT TOP` |
| `rCore.GetPtIDInfo` | `ORWPT ID INFO`, `ORWPT2 ID INFO` |
| `rCore.CheckSensitiveRecordAccess` | `DG SENSITIVE RECORD ACCESS` |
| `rCore.SelectPatient` | `ORWPT SELECT`, `ORWPT1 PRCARE`, `ORWPT INPLOC`, `ORWPT GET FULL ICN` |

The subset wrapper packs two values for `ORWPT LIST ALL`; the restricted-list wrapper packs three for `ORQPT READ RPL`. Decompiled variant construction is not a server parameter specification. The sensitive-access helper contains result-dependent dialogs and another helper call on an acknowledgement path. Production access and audit behavior must be reconciled separately; the prototype uses explicit synthetic decisions.

## Rust prototype contract

Use separate values for `pending_patient_id` and `active_patient_id`. Search text and display names are not identifiers. A fixture can use an invented stable value such as `SYNTH-001`; this is a prototype identifier, not an asserted VistA DFN format.

| State | Event | Required prototype behavior |
| --- | --- | --- |
| Chart open or no patient | Open selection | Preserve the current active identity while creating selection state |
| Selection ready | Query edited | Clear the pending identity, increment a request generation, and request candidates |
| Loading | Matching response | Show rows, an explicit empty result, or an explicit error |
| Loading | Older response | Discard the response without changing current rows or identity |
| Results | Row chosen | Store its exact fixture identifier and update preview demographics |
| Pending selection | OK or double-click | Run the same confirmation path and synthetic access/deceased-record decisions |
| Confirmation | Denied, unavailable, or declined | Keep the current chart identity and return to selection |
| Confirmation | Accepted | Load the synthetic chart for that identifier, then commit the header and view together |
| Selection | Cancel | Close selection and preserve any previously active chart identity |
| Chart loading | Old-patient response | Discard it; never place the prior patient's content under the new header |

A mock provider should expose candidate lookup with an explicit list mode, cursor, direction, and request generation; demographic preview; a typed synthetic access decision; and chart-shell loading by stable identifier. It should return distinct success-with-rows, success-empty, parse-error, and provider-error outcomes. These are defensive interface choices for Rust, not inferred CPRS wire types.

The first UI should provide the selector, preview area, patient header, and a read-only synthetic view. Unimplemented tabs should say so explicitly. It should contain no broker transport, credentials, real patient data, order submission, note signing, notification processing, or clinical writes. Toolkit selection follows a representative Rust screen evaluation for keyboard operation, tables, text, scaling, and accessibility.

The [16 acceptance cases](patient-selection-cases.json) define the first implementation checks. Their executed automated and bounded native evidence is recorded in the [milestone 2 acceptance matrix](../validation/milestone-2/acceptance.json). Match original control relationships and navigation before expanding into editing workflows.

## Limits on fidelity

These forms inherit base properties that have not been expanded. Virtual calls, Delphi managed values, condition flags affected by runtime helpers, exception continuations, and some record layouts remain unresolved. In particular, the menu handler's pseudocode omits some paths visible in its instruction listing; the direct call sites establish its relevant edges. Do not mechanically translate the generated C into Rust or interpret decompiler-produced constant conditions as proven application logic.

Exact restricted-list selection rules, duplicate-identifier resolution, paging behavior, context cancellation, tab population, access/audit policy, and runtime appearance remain fidelity follow-ups. The authored mock state model is sufficient to implement a bounded synthetic slice while those reference questions are investigated.
