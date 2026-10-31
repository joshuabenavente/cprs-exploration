# Appointments Cover Sheet viewing slice (Milestone 10)

This is static research on pinned CPRS Chart 1.33.214.5 / OR*3.0*639 and an authored synthetic Rust panel. The original executable is never run. No server, credentials, clinical imports, VistA implementation or DLL internals are involved.

## Recovered facts

[Twelve MAP targets](../provenance/appointments-targets.txt) were exported from the existing focused project with `-noanalysis`. [Raw instructions and direct calls](../analysis/appointments/decompiled/workflow-functions.tsv), [separate annotations](../analysis/appointments/resolved/workflow-evidence.json), [four bounded VMT slots](../analysis/appointments/vmt.json) and [static verification](../validation/milestone-10/static.json) bind the observations to the pinned specimen. Decompiler success does not establish complete Delphi ABI, exception flow or runtime behavior. OnAddItems spans only its MAP-bounded range through `00bd7cb7`; explicitly decoded finally continuations expose instructions missing from its pseudocode. Appointment annotations also inspect raw assembly references.

| Path | Static observation | Limit / authored policy |
| --- | --- | --- |
| Factory `00bd7f30`, Create `00bd787c` | Factory loads class pointer `00bd7520` and calls Create. Constructor calls common Create, adds **Date/Time**, **Location**, **Action Req** at `00bd78a4`, `00bd78b5`, `00bd78c6`, then CollapseColumns. | Site configuration, widths and original runtime appearance are unknown. No Clinic or Status heading is inferred. |
| OnAddItems `00bd7954` | Begins list update. Empty incoming strings receive a literal sentinel. First row piece 1 is tested with GetPieceIsNull; the null branch collapses columns and supplies a literal caption. Other input expands columns. | Neither sentinel nor branch establishes absence of real appointments or a server contract. The mock has an explicitly empty synthetic case. |
| Row population continuation `00bd7a61` | Enumerates strings and constructs `^`-delimited objects. When piece 1 is null, piece 2 becomes caption (`00bd7adf` / `00bd7ae9`); otherwise GetPieceAsTDateTime for piece 2 (`00bd7afd`) and FormatDateTime (`00bd7b1a`) supply caption. Piece 3 (`00bd7b33`) and piece 4 (`00bd7b5a`) pass through MixedCase and are added as subitems. Object attaches at `00bd7b7b`; finally EndUpdate appears at `00bd7be9`. | Display structure only. No date parser, formatter, timezone conversion, sorting, scheduling calculation, action classification or normalization is ported. Helpers are named from MAP, not recovered server semantics. |
| DisplayItemDetail `00bd41b4` and bounded VMT | Slots `0x20c`, `0x210`, `0x214`, `0x21c` map to appointment OnAddItems, appointment OnGetDetail, inherited OnShowDetail and ClearListView. Common detail dispatch calls get/show slots. | List-view read-only flags and class names do not prove safe dispatch. |
| OnGetDetail `00bd7cb8` | Calls CPRSParams; invokes configured interface slot `0x38`; reads current patient and row piece 1; calls `ORNet.CallVistA` at `00bd7d3b`. Inherited getDetailRPC reads configured object text. | Original RPC name, argument/response contract, permissions and effects are unresolved. All original transport dispatch is excluded. |
| Inherited OnShowDetail `00bd4908` | Calls `fRptBox.ReportBox` at `00bd4979`. | Original viewer and any downstream write, print or encounter-related behavior are excluded and unexecuted. This is not proof that original viewer paths are read-only. |
| Patient clearing | Common OnClearPtData dispatches slot `0x21c`; bounded appointment VMT maps it to ClearListView `00bd35d0`. Cover Sheet service clearing iterates controls through an interface. | Supports clearing structure, not full original event order. |

## Authored mock contract

Appointments is a fifth full-width panel below Active Medications, with Vitals above it and Problem List / Allergies sharing the top row. Workspace scrolling leaves patient header, navigation and status fixed. Each lower panel reveals its own row on focus, selection and View activation. Table columns preserve recovered order with horizontal scrolling for long labels.

Rows have separate `APPT-01`–`APPT-03` identities and `AppointmentDisplay` payloads. `CoverItem.label` holds literal Date/Time text; the payload holds Location and Action Req. Dates, locations and action text are invented compiled strings. They are independent of visit/header context, Orders and medication fixtures. Action Req is display text only. There is no appointment action behind it. SYNTH-002 has an empty list; unavailable detail and deliberate retry are separate states.

Selection only highlights. Enter, Space, View and double-click explicitly open matching local text with initial focus in the read-only text pane. Escape clears text and returns to the originating table while retaining selection. Opening patient selection immediately clears all five selections and pending detail; cancellation preserves the committed chart. Generations plus exact patient/panel/item ownership reject stale and duplicate successes and failures. Chart validation rejects foreign owners, blank IDs/labels, per-panel duplicate IDs, missing appointment payloads and payloads attached to the wrong panel.

No booking, rescheduling, cancellation, check-in, reminders, encounter creation/selection changes, overlap/capacity analysis, relative dates, clinical interpretation, signing, printing, full Appointments tab or live connection is implemented.

## Evidence boundaries

Core cases cover display strings, identities, same IDs under different patients, wrong payloads, empty/error/retry, close/reopen, selector cancellation, tab changes and stale/duplicate deliveries. The current runner writes only Milestone 10 receipts and `M10_*` logs. Earlier tracked analysis and Milestone 2–9 evidence are preserved by a startup hash manifest.

Native input, UIA snapshots, callback/focus probes and user listening evidence are separate. Native scale overrides do not establish monitor-DPI transitions. Earlier medication/Vitals listening passes remain historical; a new appointment listening check is required. No original-client parity, complete accessibility or clinical compatibility is claimed.
