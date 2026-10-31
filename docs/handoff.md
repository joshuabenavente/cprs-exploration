# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. **Milestone 10: mock-only, read-only Cover Sheet Appointments** is implemented. Final automated, focused static and native layout/keyboard verification passed. The separate appointment listening check is pending. Do not mark milestone acceptance complete until that new listening result is reported.

## Checkout and preserved baseline

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration`.
- Local branch: `codex/milestone-10-appointments`, from accepted Milestone 9 commit `84b3301`. Startup checkout was clean; no running mock was found. On 31 October 2026, the user subsequently authorized committing and pushing the current work. This delivery preserves the pending appointment listening check.
- Private GitHub destination: `https://github.com/joshuabenavente/cprs-exploration`, configured as `origin`. The checkout previously had no remote. Publish this milestone branch without merging it into another branch; use the branch log for its resulting commit ID.
- [Exact incoming handoff](../validation/milestone-10/startup-handoff.md) and [historical byte manifest](../validation/milestone-10/historical-bytes.json) preserve the startup state. The manifest covers 617 previously tracked analysis/validation files, including Milestone 2-9 receipts. Do not regenerate old receipts with the current executable.
- Historical Milestone 9 implementation, native checks and separate user-reported medication listening pass remain in [Milestone 9](milestone-9.md). They do not establish appointment speech behavior.

## Milestone 10 implementation

[The report](milestone-10.md), [recovered/authored contract](../specifications/appointments.md), [static receipt](../validation/milestone-10/static.json), [automated receipt](../validation/milestone-10/automated.json) and [timed journey](../validation/milestone-10/integrated.json) document the result.

Twelve focused MAP targets use the existing Ghidra project with `-noanalysis`. Raw assembly/direct call sites, assembly-aware separate annotations and four bounded appointment VMT slots are under `analysis/appointments/`. Bounded Delphi finally continuations expose row population and EndUpdate omitted from pseudocode. Constructor headings are **Date/Time**, **Location**, **Action Req**. Piece 2 supplies caption, with a conditional original date-formatting path; pieces 3 and 4 pass through MixedCase to subitems. Original OnGetDetail calls configured `ORNet.CallVistA`; inherited OnShowDetail calls `ReportBox`. All original transport/viewer/write/encounter/print dispatch is excluded. Class names and read-only flags are not proof of safe dispatch. No original CPRS execution or DLL internals were used.

The fifth full-width panel is below Active Medications; Vitals stays full-width, with Problem List/Allergies together above it. The scrollable workspace is 1400 logical pixels high to prevent panel/footer overlap found in the first native sample. Header/navigation/status stay fixed. Appointment fixtures use independent APPT identities and AppointmentDisplay payloads. Dates, locations and Action Req values are compiled invented literal strings without parsing, conversions, relative labels, scheduling calculations or interpretation. They do not derive from or change visit/header context, medications or Orders. SYNTH-002 has an empty list.

Selection only highlights. Enter/Space/View/double-click explicitly open matching local read-only text, initially focused for reading. Escape clears text and returns to its originating table. Selector opening clears all five selections/detail immediately; cancellation preserves the committed chart. Exact patient/panel/item ownership, request generations and stale/duplicate success/failure rejection remain in force. Empty/error/retry stay distinct. Notes automatically loads selected text; Orders/Results retain explicit opening and existing filters/cancellation behavior.

## Validation and reproduction

Formatting, warning-denied Clippy, **96 core tests**, locked/offline build and immediate callback smoke passed on the corrected executable. The **71-checkpoint** real-timer journey passed with **92 deliveries / 38 stale replies rejected**. Current logs use `M10_*`; the runner accepts only Milestone 10 and writes only `validation/milestone-10/`.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
& $ChartPython scripts\verify_appointments.py
& $ChartPython scripts\verify_appointments_checkpoint.py
```

The interpreter path is explicit because sandbox LOCALAPPDATA can differ. Close the mock before rebuilding. Windows PowerShell treats native stderr as ErrorRecord; the runner retains Cargo progress but judges success by process exit code.

Publication verification distinguishes unchanged historical Git blobs from the historical manifest's workstation bytes. Some pre-existing Git blobs normalize CRLF; that is an older checkout convention, not a changed historical receipt. New Milestone 10 exports/receipts use explicit byte-preserving Git attributes. A clean-clone, cross-platform validation has not been performed, and full static reproduction still needs the ignored pinned specimen/tools.

Static reproduction: `Analyze-Appointments.ps1`, `inspect_appointments.py`, `resolve_workflow.py --appointments`, then `verify_appointments.py`. The appointment exporter uses a fresh milestone-local Ghidra script cache after an existing OSGi cache failed; historical analysis exports were not rewritten. Read assembly alongside decompilation and retain unresolved semantics.

Native review: `Start-MockChart.ps1 -IntegratedReview [-MinimumSize] -ScaleFactor 1|1.25|1.5|1.75|2`. `Review-Appointments.ps1 -Size default|minimum -ScaleFactor ...` additionally writes the current sample log; `-Matrix` runs both sizes from the selected scale upward, waiting for each window to close. Timed review ends at SYNTH-001 / Cover Sheet / APPT-03 selected, detail closed. Default sizes are 1180x800 logical, minimum 980x680, compact 200% default 1180x700. Overrides are process-local and do not change Windows settings or establish monitor-DPI transitions.

The supported [computer-use skill](C:/Users/soapo/.codex/plugins/cache/openai-bundled/computer-use/26.1027.30824/skills/computer-use/SKILL.md) uses `@oai/sky` via node_repl. Select exactly one returned mock window. Exclude the related 16x16 surface from geometry judgments and use the full screenshot ID for coordinate input. Fluent public table `has-focus` does not reflect its internal keyboard scope; actual native arrows after Escape establish return. Keep settled UIA text, native input, callback/focus probes and user speech reports distinct. See [native notes](../validation/milestone-10/native-notes.md).

## Remaining acceptance and boundaries

All ten default/minimum layout samples passed at 100%, 125%, 150%, 175% and 200%. Native Enter/Space/View/double-click/Escape/Tab/arrows/Ctrl+O, text selection, horizontal scrolling and selector cancellation passed. See [native receipt](../validation/milestone-10/native-ui.json) and [bounded acceptance receipt](../validation/milestone-10/acceptance.json). Upper/middle panels were also inspected at default 100% and minimum 200%; the ten scale samples focus on Appointments and fixed frame/footer geometry. The mock is left at default 100%, SYNTH-001 / Appointments, detail closed.

The remaining user check is the new [separate Appointments listening checklist](milestone-10.md#separate-appointments-listening-checklist). Do not reuse medication speech evidence. No recorded audio, independent speech verification, full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical-compatibility claim is supported. Commit/push authorization does not establish listening acceptance.

## Situation and recommended next steps

The project is a runnable native Rust/Slint mock with nine invented patients, patient selection/preview/access simulations, five Cover Sheet panels (Problem List, Allergies, Vitals, Active Medications, Appointments), and read-only Notes, Orders and Results browsers. Milestone 9 is accepted; Milestone 10's code, static, automated and native checkpoint passes, with its separate user listening result pending. This is a bounded synthetic client recreation, without demonstrated original-client runtime parity or live clinical compatibility.

1. Complete the Appointments listening checklist and record the actual result. Correct any missing or stale speech before marking Milestone 10 accepted.
2. Recommended Milestone 11: harden shared Cover Sheet layout, accessibility and reproducibility before adding another domain panel. The fifth-panel footer overlap exposed dependence on a fixed 1400-pixel workspace height. Replace that sizing policy with content-driven sizing, preserve per-panel focus/reveal/return behavior, and exercise all five panels across the existing size/scale matrix. Add a clean Windows checkout/build check that handles the historical line-ending convention explicitly; introduce automated CI for portable code checks while retaining separate native/listening evidence. Preserve the current ownership/race protections.
3. After that checkpoint, select one next read-only Chart slice and recover its display/detail/clear paths before implementation. A Consults browser is a candidate, not an approved or recovered Milestone 12 contract. Keep all fixtures invented and all original transport/write/encounter/print paths excluded.

The recommendation does not authorize another milestone or live connectivity. Publication preparation also preserves raw Milestone 10 evidence bytes through `.gitattributes` and updates the current integrated acceptance contract to the M10 protocol. Historical analysis and Milestone 2-9 receipts remain unchanged.

Keep everything mock-only: no booking, rescheduling, cancellation, check-in, reminders/notifications, encounter creation/selection changes, capacity/overlap analysis, transport/credentials, clinical imports, live connectivity, VistA implementation, interpretation, signing, printing, original CPRS execution or DLL internals. No full Appointments tab or scheduling application.

Final corrected ignored executable SHA256: `de217b49353b923172e62f7500eb20322aecec2cc0aa7c275d8c764e2d2288fd`.
