# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. **Milestone 8: mock-only, read-only Cover Sheet Vitals** is implemented and validated. The user separately reported: **Vitals listening checklist passes**. The user now requested a new chat to start **Milestone 9: mock-only, read-only Active Medications on the Cover Sheet**.

## Checkout and checkpoint

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration` (CPRS Remake).
- Branch: `codex/milestone-8-vitals`, created from the clean current handoff `7f37325`, preserving the full Milestone 7 history.
- Current runtime: invented patient selection; Cover Sheet Problem List, Allergies and Vitals; Notes; Orders; interim-style Results. No original CPRS or clinical connection.
- Milestone 8 evidence: [handoff/results](milestone-8.md), [Vitals contract](../specifications/vitals.md), [static](../validation/milestone-8/static.json), [automated](../validation/milestone-8/automated.json), [integrated](../validation/milestone-8/integrated.json), [native/listening](../validation/milestone-8/native-ui.json), [bounded acceptance](../validation/milestone-8/acceptance.json).
- Formatting, warning-denied Clippy, all 78 core tests, locked/offline build, immediate callback smoke and 51 real-timer checkpoints passed. The journey observed 72 deliveries and rejected 30 stale replies.
- All ten final native layout samples passed: default/minimum at 100%, 125%, 150%, 175%, 200%. At 200% the default uses compact 1180x700 logical sizing. Native minimum-200% arrows/Enter/Tab/Escape/Ctrl+O, text selection and cancellation passed. Ordinary native-launch 100% Tab/Down/Space/Escape also passed; the app was left on SYNTH-001 with Temperature selected for listening; the user subsequently reported the separate checklist passing.
- Final executable SHA256: `a79bebeece2d5e03fbf0f414bf4c461ffbbf588a125f4f33c00e33e98ae4202f`. It is an ignored build output, never a committed deliverable.
- Implementation checkpoint: `79a4cb2`, tagged `milestone-8-mock`. Follow-up commit `68363c0` records the user listening pass; the implementation tag remains unchanged. No push/publication.

## Recovery and authored policy

Focused Ghidra 12.2 export used `-noanalysis`, ten MAP functions and four bounded VMT slots. Assembly/call-site evidence, original input hashes and static verification remain separate from runtime. See `provenance/vitals-targets.txt`, `analysis/vitals/` and `scripts/Analyze-Vitals.ps1`, `inspect_vitals.py`, `verify_vitals.py`.

Constructor columns are Vital, Value, Date Taken and Quals. Row population and `OnGetDetail` format fields from delimited objects; complete server semantics are unresolved. The Vitals `OnShowDetail` slot dispatches to `OnUpdateVitals`, which checks write access and calls `ViewPatientVitals`. That excluded path and DLL internals are not reproduced. The common mock read-only text pane is an explicit authored departure. Values, units and timestamps are compiled strings; they are never parsed, converted or interpreted. `SYNTH-002` has empty Vitals.

Problem List/Allergies occupy the upper row and full-width Vitals the lower row of a scrollable workspace. Selection, explicit focus return and footer actions reveal the appropriate row. Header/navigation/status remain outside workspace scrolling. Enter/Space/View/double-click explicitly open detail; Escape closes and returns to its originating table. Preserve Notes automatic loading and Orders/Results explicit activation, browser cancellation returning to local filters, and exact synthetic identities.

The bundled Fluent table's public `has-focus` does not reflect its internal keyboard scope. Cover Sheet list-focus branches were removed from the test probe rather than treated as actual focus. The integrated journey verifies read-only detail focus and closed/selection state; native arrows after Escape separately check return. UIA snapshots, actual native input, callback/widget probes and user speech reports remain distinct. Milestone 7's combined Narrator pass remains historical. Milestone 8 now has its own scoped user-reported Vitals pass, without recorded audio or independent agent verification of speech.

## Reproduce and evidence handling

Close any running mock before rebuilding. Use the explicit installed Python interpreter, not the Windows Store placeholder:

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_vitals.py
& $ChartPython scripts\verify_vitals_checkpoint.py
```

Current automated paths and protocol are Milestone 8 (`M8_*`, 51 checkpoints); the runner only accepts Milestone 8 so it cannot overwrite historical receipts with a current binary. All Milestone 2–7 evidence and historical analysis bytes must remain unchanged. `.gitattributes` preserves Vitals analysis and Milestone 8 log bytes for hashes.

`Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2` uses real timers, then leaves SYNTH-001 / Cover Sheet / VITAL-03 selected and detail closed. Review/minimum/scale launches start at desktop origin. The supported native skill uses `@oai/sky` through node_repl; after a stale window cache, refresh/reset the session and select the current returned window. Full-window screenshots may accompany a 16x16 related surface; exclude the latter from geometry judgments. Do not change Windows settings.

## Acceptance and boundaries

The bounded Milestone 8 scope is accepted, including the separate user-reported [Vitals listening checklist](milestone-8.md#separate-vitals-listening-checklist). The current acceptance receipt binds the same executable and automated/native evidence to that report. `staged-evidence.json` is historical byte verification for implementation commit `79a4cb2`; `listening-evidence.json` verifies the follow-up receipt bytes. No full accessibility, physical IME/dead-key, monitor-DPI transition, clinical compatibility or original-runtime parity claim is supported.

Keep everything mock-only: no clinical server, transport/credentials, clinical imports, entry/editing, graphs/trends, conversions, interpretation, printing or signing; no original CPRS execution, VistA implementation or bundled DLL internals. Preserve generation/patient/panel/item ownership, stale/duplicate success/failure guards and empty/error distinctions. Continue on the current checkout and preserve later user changes. The local milestone checkpoint/tag does not authorize pushing or publishing.

At the largest supported application scale (200%), the authored default window uses 1180x700 logical pixels; the ordinary 1180x800 default would extend below the reviewed 1440-pixel desktop. Other defaults remain 1180x800 and the minimum is 980x680. The compact default is a bounded policy for the reviewed setup, not a general monitor-fit or DPI-transition guarantee.


## Milestone 9 startup: Active Medications

The user approved starting the recommended scope in a new chat. Continue from the current local checkout on `codex/milestone-8-vitals`, including `68363c0` and this uncommitted handoff update. Inspect status and preserve any subsequent user changes. Do not reset to a project default branch. This chat is finished editing the checkout before dispatching the new chat. A local `codex/` milestone branch may be created from this state.

The following MAP candidates have been inventoried, but their Milestone 9 display behavior has not been exported/recovered:

| Target | Address |
| --- | --- |
| `mCoverSheetDisplayPanel_CPRS_ActiveMeds.TfraCoverSheetDisplayPanel_CPRS_ActiveMeds.Create` | `00bd5e48` |
| `mCoverSheetDisplayPanel_CPRS_ActiveMeds.TfraCoverSheetDisplayPanel_CPRS_ActiveMeds.OnAddItems` | `00bd5eec` |
| `mCoverSheetDisplayPanel_CPRS_ActiveMeds.TfraCoverSheetDisplayPanel_CPRS_ActiveMeds.OnGetDetail` | `00bd615c` |
| `oCoverSheetParam_CPRS_ActiveMeds.TCoverSheetParam_CPRS_ActiveMeds.NewCoverSheetControl` | `00bd63d8` |

Recover construction, displayed fields, row population, detail dispatch and patient clearing before choosing the display contract. Inspect inherited paths and bounded VMT entries as needed; class names alone do not establish viewing safety. Preserve assembly/direct call sites, hashes and unresolved Delphi/response semantics. Use the existing focused Ghidra project with `-noanalysis`; no whole-program analysis, original CPRS execution, server contact or DLL internals. Milestone 8's Vitals display override demonstrates why original viewer/write-related dispatch must be checked explicitly and excluded when outside the approved viewing slice.

Implement one fourth synthetic Cover Sheet panel, with invented medication labels and authored instruction/status/date strings only where supported by the recovered display structure. Keep its fixtures and identities separate from Orders. Values are display strings, with no clinical inference or calculations. Use a sufficiently wide medication table with scrolling while preserving Vitals' usable width and the current Problem List/Allergies panels. Preserve explicit Enter/Space/View/double-click detail activation, initial read-only text focus, Escape return, patient-selection clearing/cancellation and the existing browser keyboard behavior.

Extend the 78-core-test / 51-timed-checkpoint baseline with medication ownership, same IDs across patients, stale/duplicate success and failure, empty/error/retry and clearing cases. Extend immediate callback smoke and the normal-timer journey. Write new evidence only under Milestone 9 paths, update the runner/verifiers/log protocol consistently, and preserve Milestone 2–8 receipts and prior analysis bytes. Verify native default/minimum layout at all supported process-local scales, including the compact 200% default, with actual geometry recorded. Callback/focus probes, native behavior, UIA snapshots and a new separate affected-controls user listening report remain distinct. Do not reuse Milestone 8's Narrator result as a medication pass.

Exclude prescribing, renewal, discontinuation, medication reconciliation, interaction checking, dose calculations, interpretation, signing, printing, transport/credentials, clinical imports, live connectivity, VistA implementation, original CPRS execution and DLL internals. Implement and validate the bounded work, not merely a plan; document authored policy and unresolved semantics and keep this handoff current. Inspect/close the possibly still-open mock before rebuilding using the supported computer-use skill.

No new commit, push or publication is authorized by this chat transfer. Prepare a reviewable validated local result; obtain explicit authorization before committing. The earlier local checkpoint authorization was for Milestone 8.
