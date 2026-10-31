# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. The user requested an up-to-date handoff and a new chat to start **Milestone 8: a mock-only, read-only Vitals panel on the Cover Sheet**.

## Checkout and completed checkpoint

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration` (Codex project **CPRS Remake**).
- Current branch at handoff: `work/milestone-7-integrated-validation`.
- Milestone 7 implementation: `13c8844`, tag `milestone-7-mock`.
- Latest validation follow-up: `3ceee2b`, recording the user's **Combined Narrator checklist passes** result. A documentation-only handoff commit follows this checkpoint.
- Runtime: Rust/Slint desktop mock with patient selection, Cover Sheet Problem List and Allergies, Notes, Orders, and one interim-style laboratory Results browser. Every record is compiled invented data.
- Current evidence: [Milestone 7 handoff](milestone-7.md), [acceptance receipt](../validation/milestone-7/acceptance.json), [integrated receipt](../validation/milestone-7/integrated.json), and [native/listening receipt](../validation/milestone-7/native-ui.json).
- Final Milestone 7 executable SHA256: `b24609cb9598272eeaff3e5dac046a32a2d45514c40b762220e670d085b390e9`. The executable is an ignored build output, not a committed deliverable.

Formatting, warning-free Clippy, 70 core tests, offline build, immediate callback smoke, and the 41-checkpoint real-timer journey passed. The journey observed 62 deliveries and rejected 26 stale replies. Native default/minimum samples passed at 125%, 150%, and 175%; an ordinary native-launch 100% keyboard tour also passed. The user separately reported the combined Narrator checklist passing. This is scoped user listening evidence, without recorded audio or independent agent speech verification; it does not establish full accessibility conformance.

Earlier milestone documents and receipts are historical. For example, old milestone specifications mention tabs that were placeholders then; those statements do not describe the current app.

## Boundaries to retain

Keep work within CPRS Chart static research and a synthetic Rust runtime. Do not launch the original CPRS client, contact a clinical server, add broker transport/credentials, import clinical data, or implement clinical writes. Keep VistA server implementation, bundled DLL internals, and other projects outside this milestone. Do not push or publish as part of this handoff.

Milestone 8 excludes Vitals entry/editing, graphs/trends, unit conversion, clinical interpretation, printing, and live connectivity. Show invented fixture values/units/timestamps as authored display data. Distinguish recovered binary observations from prototype policy and unverified server semantics.

Retain exact synthetic identities, committed versus pending patient state, independent request generations, stale/duplicate success and failure rejection, and explicit empty/error outcomes. No previous patient's row, selection, or text may survive a transition. Notes loads text automatically; Orders/Results use explicit activation. Cover Sheet details start in read-only text and close back to the originating panel. Browser patient-selection cancellation returns to that tab's local filter.

## Milestone 8 scope and starting evidence

1. Recover Vitals construction, row population, detail display, and patient clearing through focused static evidence. Start with the MAP targets below and the existing common Cover Sheet paths. Trace additional callees only as needed for this viewing slice.
2. Add a synthetic, read-only Vitals panel and details using the recovered display structure, with source limits documented. Preserve the existing two panels.
3. Adapt Cover Sheet layout for a third panel at minimum/default sizes and supported application scales; avoid simply adding a third card to the existing horizontal row.
4. Extend core ownership/race cases, desktop callback smoke, and the real-timer integrated journey. Check native keyboard/layout behavior and request a separate listening check for affected Vitals controls. Save a local reviewable checkpoint.

The current symbol inventory identifies these candidates; they have **not yet been exported or behaviorally recovered for Milestone 8**:

| MAP name | Address |
| --- | --- |
| `mCoverSheetDisplayPanel_CPRS_Vitals.TfraCoverSheetDisplayPanel_CPRS_Vitals.Create` | `00be2090` |
| `mCoverSheetDisplayPanel_CPRS_Vitals.TfraCoverSheetDisplayPanel_CPRS_Vitals.OnAddItems` | `00be2474` |
| `mCoverSheetDisplayPanel_CPRS_Vitals.TfraCoverSheetDisplayPanel_CPRS_Vitals.OnGetDetail` | `00be279c` |
| `mCoverSheetDisplayPanel_CPRS_Vitals.TfraCoverSheetDisplayPanel_CPRS_Vitals.OnShowDetail` | `00be22f4` |
| `oCoverSheetParam_CPRS_Vitals.TCoverSheetParam_CPRS_Vitals.NewCoverSheetControl` | `00be2c84` |

The same class has popup handlers and `OnUpdateVitals`; their names do not authorize an editing implementation. Inspect only as needed to identify and exclude mutating paths.

Pinned source specimen: CPRS Chart `1.33.214.5`, executable metadata `OR*3.0*639`; [input hashes](../provenance/chart.lock.json). No exact matching public source snapshot or runtime/site compatibility is established. Ghidra 12.2 and JDK are pinned in `tools/toolchain.lock.json`; the existing project is `analysis/projects/CPRSChartFocused.gpr`. Use focused export with `-noanalysis`; whole-program analysis previously exhausted its heap. Keep assembly/direct call sites beside decompilations. Close the Ghidra GUI project before headless export. Existing templates include `scripts/Analyze-Orders.ps1`, `scripts/Analyze-Results.ps1`, their inspectors/verifiers, and `scripts/ghidra/ExportChartWorkflow.java`.

## Implementation map and evidence handling

- `crates/chart-core/src/cover_sheet.rs`: panel types, chart ownership, item detail state/requests and fixture details.
- `crates/chart-core/src/lib.rs`: patient provider, chart commit, patient access/acknowledgment and clearing.
- `crates/chart-desktop/src/main.rs`: UI adapter, panel-index mapping, row models, timers and callbacks. Audit every two-panel match/loop when adding Vitals.
- `crates/chart-desktop/ui/app.slint` and `cover-panel.slint`: Cover Sheet layout, detail overlay, keyboard and accessible identity labels. The current Cover Sheet workspace height was sized for one row of cards; a second row needs deliberate scroll/layout treatment.
- `crates/chart-desktop/src/integrated_check.rs`: opt-in normal-timer journey, delivery audit and ownership/focus probes. It injects callbacks, not physical keys.
- `specifications/cover-sheet.md` and `specifications/integrated-chart.md`: recovered evidence, authored behavior and acceptance contracts.

Write new evidence and receipts under Milestone 8 paths. Preserve `validation/milestone-2/` through `milestone-7/` and prior raw analysis bytes. The existing `Test-MockChart.ps1` defaults to Milestone 7, and `verify_integrated.py` currently pins Milestone 7 paths/checkpoints/log protocol. Update or parameterize them consistently before validating the new binary; do not overwrite old receipts or use an old receipt as evidence for a new executable. Extend the log/hash attributes as necessary so staged bytes match the recorded hashes. Keep raw binaries, build outputs, Ghidra caches/projects and original CPRS files out of commits.

The established workflow uses local milestone branches/commits and `milestone-N-mock` checkpoint tags. Continue from the current checkout including this handoff commit; do not reset to a project default branch or discard existing work. Inspect status before changing it. No Milestone 8 implementation has been started in this chat.

## Environment and manual checks

PowerShell on Windows; Rust/Cargo 1.99.1 and Slint 1.18.1 were used with `--locked --offline`. Python is `C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe`. Use explicit UTF-8 when reading Unicode source/receipts; reconfigure Python stdout if printing Unicode to a legacy console encoding.

Inspect whether the mock is still running before building; Windows cannot replace an open executable. The mock was left open after the latest listening check, but its current window state must be refreshed. Use the computer-use skill and supported `@oai/sky` APIs for native UI work. Ordinary native launch is the verified clipboard path; restricted-shell clipboard behavior was launch-dependent in earlier milestones. A new app-access prompt is not evidence that speech has been verified.

Immediate UIA names/focus/documents sometimes lag native input. Reobserve and distinguish UIA snapshots, actual arrow/caret/selection behavior, application focus probes, and user listening. Minimum-position captures can expose a 16x16 related surface; use the full-window screenshot ID for coordinate input. Scale overrides and review/minimum launches start at desktop origin to avoid OS cascade clipping. Do not change Windows display/security/privacy settings. Physical IME/dead keys and monitor-DPI transitions remain unverified; the user reported an ordinary US keyboard, so do not require installing a composition layout for this milestone.
