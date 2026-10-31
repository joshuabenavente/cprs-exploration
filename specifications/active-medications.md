# Active Medications Cover Sheet viewing slice (Milestone 9)

Static recovery uses the pinned CPRS Chart 1.33.214.5 / OR*3.0*639 specimen. The original executable is never run. No clinical source, transport, credentials, imports, VistA implementation or DLL internals are used.

## Recovered structure and boundaries

[Thirteen MAP targets](../provenance/active-medications-targets.txt) were exported in the existing focused Ghidra project with `-noanalysis`. [Raw assembly and direct call sites](../analysis/active-medications/decompiled/workflow-functions.tsv), [separate annotations](../analysis/active-medications/resolved/workflow-evidence.json) and [four bounded VMT slots](../analysis/active-medications/vmt.json) are bound to pinned input hashes by [static verification](../validation/milestone-9/static.json). Decompiler output does not establish Delphi register ABI, exception flow or complete runtime semantics; the assembly controls the observations below. OnAddItems includes an explicitly bounded MAP span through `00bd615b` and decoded finally continuations, because normal flow-following stops at Delphi trampolines.

| Path | Static observation | Limit / mock policy |
| --- | --- | --- |
| Factory `00bd63d8`, Create `00bd5e48` | Factory loads class pointer `00bd5adc` and calls constructor. Constructor calls common CPRS Create at `00bd5e62`, adds Medication then Status at `00bd5e70` / `00bd5e81`, and collapses columns. | Actual site widths, configuration and original runtime appearance remain unknown. |
| Common Create `00bd34b4` | Configures the list view, including SetReadOnly. | A read-only list does not prove safe detail actions or effective authorization. |
| OnAddItems `00bd5eec` | Begins list update, dispatches clear slot `0x21c` at `00bd5f49`, calls ExtractActiveMeds at `00bd5f72`, constructs `^`-delimited objects, passes piece 2 through MixedCase to caption (`00bd6027–00bd6048`), passes piece 4 through MixedCase to subitems (`00bd604d–00bd6071`) and attaches the object (`00bd6078`). First row piece 1 equals literal `0` and original input count equals one controls collapse/expand. | These accesses do not establish a server schema, clinical status meaning or sorting contract. No sentinel is copied as a clinical finding. |
| ExtractActiveMeds `00add94c` | Client preprocessing filters/mutates input strings and labels, reads delimited pieces and calls a status-related helper. | Exported to bound row population only. Its clinical selection/classification rules, patient context and helper semantics are not reproduced; no nested helper recovery is needed for invented rows. |
| DisplayItemDetail `00bd41b4` and VMT | ActiveMeds slots `0x20c`, `0x210`, `0x214`, `0x21c` resolve to OnAddItems, ActiveMeds OnGetDetail, inherited OnShowDetail and ClearListView respectively. Common detail dispatch calls `0x210` then `0x214`. | Class names and inherited UI alone do not establish read-only safety. |
| OnGetDetail `00bd615c` | Calls CPRSParams, invokes its interface slot `0x38`, reads row piece 1 and current patient state, then calls `ORNet.CallVistA` at `00bd61d6`. Inherited getDetailRPC `00bd59e0` reads a configured string at object offset `0x2c`. | RPC name, configured interface binding, arguments, response semantics and permission effects are unresolved. No transport or detail RPC is implemented or invoked. |
| Inherited OnShowDetail `00bd4908` | Calls `fRptBox.ReportBox` at `00bd4979`. | The original viewer and any viewer/write/print dispatch remain excluded and unexecuted; its internals are not recovered here. The mock uses its own read-only text pane. |
| Clearing | Common OnClearPtData `00bd3688` dispatches `0x21c`; bounded ActiveMeds VMT maps it to ClearListView `00bd35d0`. Service OnClearPtData `00bee374` iterates controls through an interface. | Supports the clearing structure, not complete runtime event order. |

## Authored contract

The fourth panel is a full-width row below full-width Vitals, with Problem List and Allergies together above them. Workspace scrolling leaves patient header, navigation and status fixed. Focus, selection and View actions reveal their own row. Medication text has a wide, horizontally scrollable column; the recovered Status column follows it. The authored layout does not reproduce the original configurable grid.

Fixtures use separate `MED-01`–`MED-03` identities and `MedicationDisplay` status strings, with exact synthetic patient ownership. They neither reuse nor derive from Orders. Labels and statuses are invented. No instructions or medication dates are added: neither is a separate recovered display field, and the RPC detail format remains unresolved. Values are never parsed, normalized, classified, calculated or interpreted. SYNTH-002 has an empty medication list, labeled only as synthetic emptiness.

Selection highlights only. Enter, Space, View item detail and double-click explicitly open matching local text. The initial focus is the read-only text pane. Escape clears its text and returns to the originating table, retaining selection. Opening patient selection immediately clears all four selections and any detail/pending work; cancellation retains the committed chart. Generations plus patient/panel/item identity reject stale/duplicate successes and failures. Chart validation rejects foreign owners, blank IDs/labels, per-panel duplicate IDs, missing medication payloads and medication/Vitals payloads on the wrong panel. Empty lists, unavailable detail and deliberate retry remain distinct.

No full Medications tab, prescribing, renewal, discontinuation, reconciliation, interaction checking, dose calculations, interpretation, signing, printing, server access, original viewer or write-related dispatch exists in this mock.

## Validation boundaries

Nine medication core tests extend the 78-test baseline, including fixture/request independence from Orders. Immediate callbacks and the real-timer journey cover explicit activation, close races, retained selection, error/successful retry, late failure after tab change, selector cancellation, same IDs under a different owner, emptiness and final review state. The current runner writes only Milestone 9 receipts with `M9_*` protocol; historical analysis and Milestone 2–8 evidence are preserved.

Native input and layout checks are separate from callbacks, widget focus probes and UIA snapshots. Fluent's public table `has-focus` does not reflect its internal keyboard scope; no table-focus claim uses that property. Actual native arrows after Escape establish table return. UIA can briefly retain loading text; settled observations are recorded separately. A new affected-controls user listening check is required. Previous Narrator passes are historical, with no new medication speech claim.
