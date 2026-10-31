# Milestone 11 startup handoff: layout, accessibility and reproducibility

Prepared 31 October 2026 for a fresh session. **Planning checkpoint only: Milestone 11 implementation has not started.** Read this file and [the current handoff](handoff.md) before editing. The user requested this preparation after the Milestone 10 commit/push; start the bounded work when instructed in the next session.

## Starting state

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration`.
- Published implementation baseline: `61adc983ca0b59858fe241248ea8476c7bd2d76f` on `codex/milestone-10-appointments`, following implementation commit `c247c82`. The handoff preparation commit follows that baseline; use `git log -1` for its ID.
- Private remote: `https://github.com/joshuabenavente/cprs-exploration.git`, named `origin`. Before preparation, the branch was clean and local/remote implementation heads matched. Do not reset to another branch or assume a `main` branch exists; the first published branch is the milestone branch.
- No mock process was found during preparation. Recheck at startup and close any running mock normally before rebuilding. Earlier native handoff window state is historical.
- Runtime: Rust/Slint native mock, nine compiled invented patients, five Cover Sheet panels, Notes, Orders and Results. No runtime import of original analysis or cross-project code.
- Milestone 9 acceptance is complete. Milestone 10's bounded code/static/automated/native checkpoint passes; **Appointments listening remains pending**. Its [acceptance receipt](../validation/milestone-10/acceptance.json) intentionally has `milestone_acceptance_complete: false`.
- M10 evidence: 96 core tests, 71 timed checkpoints, 92 deliveries, 38 stale replies rejected, ten native layout samples, twelve focused static functions and four VMT slots. These are baseline evidence, not M11 results.
- Baseline ignored executable SHA256: `de217b49353b923172e62f7500eb20322aecec2cc0aa7c275d8c764e2d2288fd`. [Recorded tools](../validation/milestone-10/automated.json): Rust 1.99.1, Cargo 1.99.1. Binary, tools, caches, original specimen and Ghidra database are ignored local prerequisites, not repository deliverables.

## Objective and bounded scope

Harden the existing shared Cover Sheet layout, affected accessibility behavior and reproducibility. Add no domain panel or tab. The fifth panel exposed dependence on a fixed workspace height: increasing it from 1060 to 1400 logical pixels fixed footer overlap, but the total remains manually maintained. Replace that total with sizing derived from actual visible content and layout requirements while preserving existing chart behavior.

1. Make Cover Sheet content height follow visible content, with the viewport as a lower bound. Account for panel minima, headings, spacing, padding, View/help controls and fixture footer. Avoid a parent/content height dependency loop. Keep patient header, navigation and status fixed; do not substitute a different hardcoded total for 1400.
2. Preserve the top Problem List/Allergies row and full-width Vitals, Active Medications and Appointments rows. Retain useful table widths, horizontal scrolling and reachable reading/View/Close actions. Keep selector and browser sizing behavior separate.
3. Make focus-driven reveal use the relevant panel/control geometry. Verify forward/reverse Tab through every panel, explicit activation, initial reading-pane focus and Escape return without jumping to an unrelated row. Fluent's public table `has-focus` is not proof of its internal keyboard focus.
4. Establish a clean Windows checkout/build check and CI for formatting, warning-denied Clippy, core tests and desktop compilation. Use the locked dependency graph and record toolchain/environment details. Distinguish initial dependency bootstrap from cached offline checks. Desktop callback/timer checks in CI require a supported desktop session; record them separately if unavailable. CI is not native layout or speech evidence.

No additional Ghidra recovery is needed unless a concrete missing static fact emerges. This milestone addresses authored mock layout and validation infrastructure. Consults is a later candidate, outside M11.

## Required behavior preservation

- Keep pending and committed patient identity separate; preserve acknowledgments, denied/unavailable access, cancellation and atomic chart ownership.
- Opening selection clears all five panel selections and detail/pending work; cancellation retains the committed chart. Patient/panel/item ownership and request generations reject stale/duplicate successes and failures.
- Cover Sheet selection only highlights. Enter, Space, View and double-click explicitly open matching local read-only text, initially focused for reading. Escape clears text and returns to its originating table while retaining selection.
- Notes automatically loads selected text; Orders/Results require explicit opening. Preserve filters, errors, retries, cancellation focus and long Unicode text.
- Vitals and appointment dates/values remain literal authored strings. Appointments stays independent of visit/header context, Orders and medications. Action Req is display text only.
- Keep empty synthetic lists distinct from unavailable detail. Retain all nine fixtures, including duplicate-name, Unicode and denied/unavailable cases; add no clinical records/imports.

## First actions in the next session

```powershell
git status --short --branch
git log -3 --oneline
git remote -v
```

Inspect subsequent user changes and preserve them. Read [M10 results](milestone-10.md), [the Appointments contract](../specifications/appointments.md), [the integrated contract](../specifications/integrated-chart.md) and [publication-review.json](../validation/milestone-10/publication-review.json). Recheck mock processes. When instructed to start, create a local branch such as `codex/milestone-11-hardening` from the current handoff checkpoint; do not discard M10 history.

Before changing runners or receipts, preserve the incoming handoff as `validation/milestone-11/startup-handoff.md` and create a startup manifest for all previously tracked analysis/validation files. There are 686 at preparation, including M10 evidence; compute the live set if the checkout changes. Record baseline commit IDs and distinguish worktree hashes from Git blob identity.

Carry the pending [Appointments listening check](milestone-10.md#separate-appointments-listening-checklist). It can be completed against the reviewed M10 build before implementation. If not completed, preparatory M11 work may proceed while M10 acceptance remains open. Later build/listening results must identify their build and affected scope; do not silently backdate or reuse older speech evidence.

## Working files

| File | Role |
| --- | --- |
| `crates/chart-desktop/ui/app.slint` | Current 1400px `content-height`, workspace/panel layout, `reveal-cover` and `focus-cover`. |
| `crates/chart-desktop/ui/cover-panel.slint` | Panel/table minima, headings, horizontal overflow, accessible names and View/help controls. |
| `crates/chart-desktop/src/main.rs` | Binding synchronization, panel IDs and callback/focus behavior; change only as needed for layout integration. |
| `crates/chart-desktop/src/integrated_check.rs` | Existing timer journey and ownership/focus probes; add meaningful layout/reveal observations without calling them native keys or speech. |
| `scripts/Test-MockChart.ps1`, `scripts/verify_integrated.py` | Migrate the active runner, output path and protocol together to M11; never write current-binary logs into old milestone paths. |
| `scripts/Review-Appointments.ps1` | Historical M10 launcher writes M10 paths. Add an M11 review launcher/output destination instead of using it with the M11 binary. |
| `scripts/verify_appointments_checkpoint.py` | Historical M10 checkpoint writer. After replacing the M10 binary, use a new M11 checkpoint verifier rather than regenerating M10 acceptance. |
| `.github/workflows/` | No workflow exists at preparation. Add Windows build/code checks without uploading ignored originals, tools or workstation caches. |
| `.gitattributes` | Preserve new raw evidence/receipt bytes explicitly before staging; do not bulk-renormalize old evidence. |
| `docs/handoff.md`, `specifications/integrated-chart.md` | Update active milestone/protocol, actual evidence and remaining acceptance at delivery. |

## Evidence, tooling and line endings

Preserve tracked analysis and M2–10 receipts. Write new recovery/automation/native/acceptance output only under M11 paths. Use `M11_*` consistently when advancing the timer protocol; update driver, runner, verifier and documentation together. Preserve the 96-core-test / 71-checkpoint baseline and explain intentional coverage/delivery-count changes. Do not claim recorded M10 passes as new M11 executions.

The publication audit found **167 pre-existing Git/worktree differences, all CRLF normalization**, among the 617 pre-M10 historical files. Workstation-byte manifests and unchanged Git blobs are separate invariants. All 69 new M10 analysis/validation files were committed byte-for-byte using `.gitattributes`. Fresh-checkout validation must distinguish these cases; do not rewrite old receipts/expected hashes to make a clone pass. Preserve new M11 bytes explicitly and verify staged/committed blobs against intended evidence.

Read the supported computer-use skill before native automation: `C:/Users/soapo/.codex/plugins/cache/openai-bundled/computer-use/26.1027.30824/skills/computer-use/SKILL.md`. It uses `@oai/sky` through `node_repl`. Select exactly one returned mock window; refresh after asynchronous changes or detected user input. A related 16x16 surface may accompany the full capture: use the full screenshot ID for coordinates and exclude the small surface from geometry judgments. Activate an occluded mock before judging layout. Keep callbacks/focus probes, native keys, settled UIA and user speech separate.

Installed Python at preparation: `C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe`. Verify availability; sandbox LOCALAPPDATA may differ. Windows PowerShell can wrap ordinary Cargo stderr as ErrorRecord: retain output and judge exit codes. Declare log encoding; M10 normalized completed PowerShell UTF-16 review logs to UTF-8. Gate commit/push on actual check exit codes rather than continuing after a failed audit.

## Acceptance criteria

1. Content-driven Cover Sheet sizing keeps all panels, View/help controls and footer reachable and separated, with fixed header/navigation/status. Inspect upper, middle and lower content at default/minimum sizes for 100%, 125%, 150%, 175% and 200%. Preserve the compact 200% default (1180x700 logical), ordinary 1180x800 defaults and 980x680 minimum unless measured evidence justifies a documented change. Process-local scale overrides do not establish monitor-DPI transitions.
2. Native forward/reverse Tab, arrows, Enter/Space/View/double-click, Escape, Ctrl+O cancellation, read-only selection/scrolling and reveal/return pass for every affected panel. Check long labels/Unicode, empty SYNTH-002 panels and repeated navigation after resizing/cancellation. Distinguish native focus observations from widget probes.
3. Formatting, warning-denied Clippy, locked core tests, desktop build, callback smoke and the extended timer journey pass with M11 receipts. Preserve ownership, stale-response and browser keyboard behavior. Add focused checks that expose layout/reveal failures rather than tests that mirror implementation.
4. A clean Windows checkout bootstraps/builds/tests the mock without the ignored CPRS specimen or Ghidra tools. Keep static-recovery prerequisites separate. Record actual CI run/check outcomes and unsupported desktop-session checks; an unexecuted workflow is not a CI pass.
5. Preserve historical worktree evidence and baseline Git identity under their documented conventions. New M11 raw evidence/receipts survive staging/checkout with intended bytes and bind to the actual executable/logs.
6. Request a separate affected-controls listening checklist for the final M11 build. Record pending/reported results accurately and retain the still-open M10 appointment status. No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical compatibility claim follows from these bounded checks.
7. Update the active handoff with implementation, actual checks, unresolved limits and reproducible commands. Keep recommendations separate from completed work and follow current delivery instructions for commits/pushes.

## Scope exclusions

Mock-only runtime: no live server/RPC transport, credentials, authentication, clinical data/imports, VistA implementation, bundled DLL internals, original CPRS execution, prescribing/order entry, signing, printing, interpretation, scheduling actions, encounter changes, reminders, overlap/capacity calculations or cross-project imports. No Consults implementation or extra domain panel in M11.

## Fresh-session prompt

> Read `docs/handoff.md` and `docs/milestone-11-handoff.md`, then start Milestone 11: shared Cover Sheet layout, accessibility and reproducibility hardening. Preserve historical evidence and the pending Milestone 10 Appointments listening status. Inspect the current branch and user changes before editing; keep the runtime mock-only.
