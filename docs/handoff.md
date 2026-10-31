# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. **Milestone 9: mock-only, read-only Cover Sheet Active Medications** is implemented. Automated, focused static and native layout/keyboard verification passed. The user separately reported: **The medication listening checklist passes.** Bounded Milestone 9 acceptance is complete.

## Checkout and preserved baseline

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration` (CPRS Remake).
- Local branch: `codex/milestone-9-active-medications`, from `68363c0` on the accepted Milestone 8 checkout. Milestone 8 implementation `79a4cb2` / `milestone-8-mock` is unchanged. The user has authorized a local Milestone 9 commit only; no push or publication.
- Incoming intentional handoff bytes, including approved Milestone 9 startup, are preserved exactly in [startup-handoff.md](../validation/milestone-9/startup-handoff.md). No reset/default-branch switch occurred. No running mock was found at startup.
- [Historical byte manifest](../validation/milestone-9/historical-bytes.json) binds 424 previous analysis/evidence files. Milestone 2–8 receipts and all prior tracked analysis remain unchanged.
- Historical Milestone 8 acceptance and user-reported Vitals listening remain in [Milestone 8](milestone-8.md) and [its acceptance receipt](../validation/milestone-8/acceptance.json). They do not establish medication speech behavior.

## Milestone 9 result

The [milestone report](milestone-9.md), [recovered/authored contract](../specifications/active-medications.md), [static receipt](../validation/milestone-9/static.json), [automated receipt](../validation/milestone-9/automated.json) and [timed journey](../validation/milestone-9/integrated.json) explain the bounded result.

Thirteen focused Ghidra MAP exports used the existing project with `-noanalysis`. Raw assembly/direct call sites, separate annotations and four bounded ActiveMeds VMT slots are under `analysis/active-medications/`. OnAddItems includes bounded Delphi finally continuations. Constructor headings are **Medication** and **Status**; piece 2 populates the caption and piece 4 the status after client preprocessing. `OnGetDetail` calls configured `ORNet.CallVistA`; inherited `OnShowDetail` calls `ReportBox`. Those original transport/viewer/write-related paths are excluded. Class naming and list-view read-only flags are not safety proof. No original CPRS execution or DLL internals were used.

A fourth full-width panel sits below full-width Vitals, with Problem List and Allergies above them in the scrollable workspace. Header/navigation/status stay fixed. Medication labels/statuses are compiled invented strings with separate MED identities and `MedicationDisplay` payloads, independent of Orders. No instruction/date fields are added because their detail structure is unresolved. Selection highlights; Enter/Space/View/double-click open the matching local read-only pane, initially focused for reading. Escape closes/clears text and returns to its originating table. Selector opening clears all four selections/detail immediately; cancellation preserves the committed chart. Exact patient/panel/item ownership, generation guards and stale/duplicate success/failure rejection remain in force. Empty/error/retry remain distinct; SYNTH-002 has an empty medication list.

## Validation and reproduction

Formatting, warning-denied Clippy, **87 core tests**, locked/offline build and immediate callback smoke passed. The **61-checkpoint** real-timer journey passed with **82 deliveries / 34 stale replies rejected**, preserving Notes automatic loading and Orders/Results explicit activation, filters and cancellation behavior.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_active_medications.py
& $ChartPython scripts\verify_active_medications_checkpoint.py
```

The installed interpreter path is explicit because sandbox LOCALAPPDATA may differ. The runner accepts only Milestone 9 and writes only `validation/milestone-9/`; current logs use `M9_*`. Historical milestone receipts must not be regenerated with the current executable. Close the running mock before rebuilding.

Native review uses `Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2`. It leaves SYNTH-001 / Cover Sheet / MED-03 selected and detail closed. Largest-scale default remains compact 1180x700 logical to fit the reviewed 1440-pixel desktop; other defaults are 1180x800, minimum 980x680. Process-local overrides do not change Windows settings or establish monitor-DPI transitions.

The supported computer-use skill uses `@oai/sky` via node_repl. Select exactly one returned mock window. A 16x16 related surface can accompany the full-window capture; use the full screenshot ID for coordinate input and exclude the small surface from geometry judgments. Fluent table public `has-focus` does not reflect its internal keyboard scope. Keep callback/focus probes, actual native arrows after Escape, settled UIA snapshots and user speech reports distinct.

## Acceptance and boundaries

The [native receipt](../validation/milestone-9/native-ui.json) records ten passed default/minimum layout samples and native Enter/Space/View/double-click/Escape/Tab/arrows/Ctrl+O, text selection, horizontal scrolling and selector cancellation. The [bounded checkpoint](../validation/milestone-9/acceptance.json) is complete, including the user-reported pass of the separate [Active Medications listening checklist](milestone-9.md#separate-active-medications-listening-checklist). This is scoped user listening evidence, without recorded audio or independent agent verification of speech; it is separate from historical Narrator results. At native handoff the app was left at default 100%, SYNTH-001, Alpha / MED-01 selected, detail closed; its current window state was not rechecked during receipt recording. Full accessibility, physical IME/dead-key, monitor-DPI transitions, clinical compatibility and original-client parity remain unverified.

Keep everything mock-only: no clinical server, transport/credentials, clinical imports, prescribing, renewal, discontinuation, reconciliation, interactions, dose calculations, interpretation, signing, printing, live connectivity, VistA implementation, original CPRS execution or DLL internals. No full Medications tab.

Final ignored executable SHA256: `e7b5056cfb688033cd3ed9dc1994a81d9d50e386c73fb4917b32eb213cbb0773`.

**The user explicitly authorized committing the accepted Milestone 9 work locally on 31 October 2026. No push or publication is authorized.** The local checkpoint includes implementation, focused recovery, automated/native receipts and the separate user-reported medication listening pass. Use the branch log for the resulting commit ID. `local-review.json` records the pre-commit worktree snapshot; listening follow-up hashes describe the state at that earlier recording.

## Recommended Milestone 10: read-only Cover Sheet Appointments

**Recommendation only; implementation has not been requested or approved.** The user requested a next-milestone recommendation and this handoff update. The recommended next increment is a fifth synthetic Cover Sheet panel for Appointments. It extends the existing patient-owned list/detail workflow, with four focused MAP candidates already inventoried. Reuse of that workflow is a planning inference; appointment display behavior and read-only dispatch safety have not yet been recovered.

| Inventoried candidate (not behaviorally recovered for Milestone 10) | Address |
| --- | --- |
| `mCoverSheetDisplayPanel_CPRS_Appts.TfraCoverSheetDisplayPanel_CPRS_Appts.Create` | `00bd787c` |
| `mCoverSheetDisplayPanel_CPRS_Appts.TfraCoverSheetDisplayPanel_CPRS_Appts.OnAddItems` | `00bd7954` |
| `mCoverSheetDisplayPanel_CPRS_Appts.TfraCoverSheetDisplayPanel_CPRS_Appts.OnGetDetail` | `00bd7cb8` |
| `oCoverSheetParam_CPRS_Appts.TCoverSheetParam_CPRS_Appts.NewCoverSheetControl` | `00bd7f30` |

If approved, begin from the resulting local Milestone 9 checkpoint on this checkout; inspect `git status` and `git log -1` and preserve subsequent user changes. Do not reset to a default branch. A new local `codex/` milestone branch may be proposed when work starts. The Milestone 9 local-commit authorization does not authorize later commits, pushes or publication.

First perform bounded static recovery of construction, actual headings, row population, detail dispatch and patient clearing. Use the existing focused Ghidra project with `-noanalysis`, preserve raw assembly/direct call sites and hashes, and inspect inherited paths and bounded VMT entries as needed. Explicitly identify and exclude original RPC, viewer, write, encounter-changing and print dispatch; class names and read-only list flags are not safety proof. No original CPRS execution or DLL internals. Do not assume Date, Clinic, Status or any other display field from the class name; document recovered facts, authored policy and unresolved semantics separately.

Then add only the fifth mock panel, with invented appointment labels and authored display strings limited to the recovered structure. Keep appointment fixtures and identities separate from the chart's existing visit/header strings, Orders and other panels. Dates/times, if supported, remain literal authored text without parsing, timezone conversion, relative-time labels, clinical inference or scheduling calculations. Use an empty synthetic case and explicit unavailable-detail/retry cases. Retain a scrollable workspace and usable widths for Vitals and Active Medications, with header/navigation/status fixed; decide the appointment row layout after recovering its actual fields.

Preserve selection-only highlighting; explicit Enter/Space/View/double-click detail opening; initial read-only text focus; Escape return; exact patient/panel/item ownership; generation guards; stale/duplicate success and failure rejection; selector clearing/cancellation; and Notes/Orders/Results keyboard behavior. Extend the 87-core-test / 61-timed-checkpoint baseline with appointment identity, same IDs across patients, empty/error/retry, clearing and race cases. Write new recovery and validation only under Milestone 10 paths, update current runner/verifier/log protocol consistently, and preserve all Milestone 2–9 receipts and prior analysis bytes. Check native default/minimum layouts at 100%, 125%, 150%, 175% and 200%, keeping the compact 200% default. Use the supported computer-use skill and request a new separate appointment listening check; Milestone 9 speech evidence stays historical. Close any running mock before rebuilding.

Exclude booking, rescheduling, cancellation, check-in, encounter creation/selection changes, reminders/notifications, capacity or overlap analysis, transport/credentials, clinical imports, live connectivity, VistA implementation, interpretation, signing, printing, original CPRS execution and DLL internals. This recommendation does not expand into a scheduling application or a full Appointments tab.
