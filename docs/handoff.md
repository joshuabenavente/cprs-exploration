# Current handoff: CPRS Chart Rust recreation

Updated 31 October 2026. **Milestone 11 is published; native acceptance remains open.** Read [M11 results and remaining checks](milestone-11.md). Native layout/keyboard review is unavailable in this session because the supported computer-use native pipe cannot connect. M11 affected-controls listening is a user-reported pass on the identified final build (reply: "checks pass"). M10 Appointments listening remains pending. Windows desktop code/build and Ubuntu core PR CI passed on implementation `10f21c4`; the fresh published Windows clone also passed. Receipts preserve the actual outcomes. Do not mark either milestone fully accepted or reuse M10 native results as M11 evidence.

## Checkout and preserved baseline

- Workspace: `C:\Users\soapo\Documents\AI-Work\projects\cprs-exploration`.
- Current branch: `main`, tracking `origin/main`; GitHub default and `origin/HEAD` are now `main`. The user authorized all four consolidation steps; latest published-head Windows/Ubuntu CI passed before promotion. All eight obsolete local branches and the old remote M10 branch were pruned only after verifying ancestry. All seven tags and all 718 previously tracked evidence files were preserved. See [main consolidation receipt](../validation/milestone-11/main-consolidation.json).
- Historical implementation branch: `codex/milestone-11-hardening`, created from clean handoff commit `da4298807b9e24017352bd247f382315cc4c8d9d` on `codex/milestone-10-appointments`. The user authorized commit, push, merge and pruning on 31 October 2026. Implementation `10f21c4` was merged through [PR #1](https://github.com/joshuabenavente/cprs-exploration/pull/1) in `be30bcd` into the then-default `codex/milestone-10-appointments`. That history is now consolidated on `main`; the old branch names remain provenance only. M11 publication and subsequent main-consolidation receipts preserve each delivery checkpoint.
- Public remote: `https://github.com/joshuabenavente/cprs-exploration.git`, named `origin`; default branch is `main`. The user requested public publication, and public visibility was verified through an unauthenticated GitHub API request. Historical private-clone/publication receipts describe their original checkpoints.
- [Incoming handoff](../validation/milestone-11/startup-handoff.md) and [startup manifest](../validation/milestone-11/historical-bytes.json) preserve 686 tracked historical analysis/validation files. Verify both worktree SHA256 and baseline Git blob identity. The pre-existing 167 CRLF-only Git/worktree differences are intentional historical conventions, not modified evidence.
- No running mock was found at startup. Matrix checks launch and close their own synthetic windows; recheck processes before rebuilding. No original CPRS process was launched.

## Milestone 11 implementation

The Cover Sheet uses `cover-layout.min-height + surrounding padding`, bounded below by the viewport. Panel minima derive from headings, table, View/help, gaps and padding; the fixture footer participates in the layout. No manually maintained replacement total is used. Problem List/Allergies share the top row; Vitals, Active Medications and Appointments stay full-width. Selector and browser sizing policies are separate.

Reveal uses actual control coordinates and clamps scroll bounds. Captured Tab key release handles entry into Fluent's private table focus scope; View focus reveals its button/help. Empty panels now expose a synthetic-owner/emptiness accessible group description. Compilation and geometry probes pass; actual native Tab/return still needs full review; speech is covered only by the separate user-reported M11 listening pass.

The normal runtime/core/provider remain mock-only. All nine invented fixtures, literal dates/values, explicit Cover Sheet activation, pending/committed ownership and stale/duplicate response rejection remain in place. Notes still loads selection automatically; Orders/Results still require explicit opening. No new domain panel, Consults implementation or static recovery was added.

Rust 1.99.1 with rustfmt/Clippy is pinned. The workflow adds Windows desktop code/build and Ubuntu core checks; hosted checks omit desktop callbacks/timers and speech. The runner accepts only M11 and emits `M11_*` logs to M11 paths. New `Review-CoverSheet.ps1` binds review to the tested M11 executable. The M10 Appointments launcher now refuses a different executable before writing old paths.

## Validation and reproduction

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
.\scripts\Test-CoverSheetLayout.ps1
& $ChartPython scripts\check_clean_checkout.py
& $ChartPython scripts\verify_hardening.py
& $ChartPython scripts\audit_m11_bytes.py
```

Close the mock before building. The default runner uses cached locked/offline dependencies. For initial bootstrap or code-only checks, use `Test-MockChart.ps1 -CodeOnly -Bootstrap`: `fetch --locked` is separate from later offline checks. Logs declare UTF-8. Native stderr from Cargo is retained; actual exit codes determine success.

Formatting, warning-denied Clippy, 96 core tests, desktop build, immediate callback smoke and the 82-checkpoint real-timer journey pass on the current executable. The prior 71 checkpoints remain; eleven new heading/table/card, reverse View/help and footer geometry checks add no provider deliveries. The journey retains 92 deliveries / 38 stale replies rejected. All ten geometry probe samples and the corrected fresh Windows checkout/build also pass. Status is recorded in [M11 acceptance](../validation/milestone-11/acceptance.json); consult its actual receipts before claiming completion.

The clean checkout checker exports the current uncommitted Git tree through a private index with explicit `core.autocrlf=false`, uses an empty target, verifies historical blobs and excludes ignored specimens/tools/caches. Existing Cargo registry data may be reused. The initial snapshot check is separate from the later published private-remote clone check in `published-clone.json`; the latter passed against implementation commit `10f21c4`. The first attempt passed code/build but failed receipt hashing under Windows PowerShell; `clean-attempt-1.*` preserves that failure. The corrected runner uses .NET SHA256 without module auto-loading.

New M11 receipts have byte-preserving Git attributes and a separate private-index staging/checkout audit. No historical receipts should be regenerated with the new executable. Do not use `verify_appointments_checkpoint.py` for M11.

## Post-M11 review fixes (branch `review/m11-validation-fixes`)

A read-only review of `b774e9b` found validation gaps, not runtime defects. This branch changes test/validation code only; **no committed receipt was regenerated**, so `validation/milestone-11/` still describes the `10f21c4` executable and its 82-checkpoint journey. Fresh evidence for this branch needs a separate protocol decision (for example an M12 path) before running `Test-MockChart.ps1` here, because the runner writes into `validation/milestone-11/`.

- The layout and reveal-View checkpoints now move focus with dispatched Slint Tab/Shift+Tab events after scrolling the target out of view, so they fail if the Tab-release or View-focus reveal handlers are removed. They previously called `reveal` directly. This is synthetic window dispatch, not native OS input.
- New checkpoint `review-final-state` restores the review selections that the layout probes disturbed (journey: 83 checkpoints; deliveries unchanged at 92/38).
- `Test-MockChart.ps1` deletes this mode's receipt and step logs before running, and records each step log's SHA-256. The verifiers reject changed step logs, CI runs for a different commit, and `crates/` file-set drift since the clean checkout.
- Clean-checkout and byte-audit checkouts enable `core.longpaths`; Python reads use extended-length paths.

The longest tracked path is 147 characters. For a manual Windows clone, use a short base path or `git clone -c core.longpaths=true …`.

## Remaining work

1. Restore the supported computer-use helper and run `Review-CoverSheet.ps1 -Matrix`. The exact availability failure is in [native status](../validation/milestone-11/native-status.json). Inspect all five panels, upper/middle/lower content and fixed frame at default/minimum sizes, 100%, 125%, 150%, 175% and 200%. Native forward/reverse Tab, arrows, explicit activation, initial reading focus, Escape return, Ctrl+O cancellation, resize repetition, Unicode/empty panels and read-only scrolling/selection remain required.
2. The user reported the separate final-build [M11 affected-controls listening checklist](milestone-11.md#separate-m11-affected-controls-listening-checklist) passed (reply: "checks pass"); keep that user-reported evidence scoped to this build. Retain M10's [separate Appointments listening status](milestone-10.md#separate-appointments-listening-checklist) as pending until an actual scoped report is received. Later-build results must not be backdated.
3. Publication/merge/prune and consolidation onto `main` are complete. Consult PR #1 and `publication.json` for the merge/prune record, and `ci-status.json` for passing push/PR CI outcomes on implementation `10f21c4`. The published Windows clone passed formatting, warning-denied Clippy, all tests and desktop compilation without ignored originals/tools. Publication does not establish native acceptance.

Current ignored executable SHA256: `1673037d3f1e90b671cbf910ebc53fcee08971ba997160d2275e3fbe1ccdfdd8`. Review starts SYNTH-001 / Cover Sheet / APPT-03 selected, detail closed. Default is 1180x800 logical, minimum 980x680, compact 200% default 1180x700. Process-local scale overrides do not establish monitor-DPI transition behavior.

Keep callback/focus probes, native input, settled UIA, compositor observations and user speech reports distinct. No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical-compatibility claim is supported. No live transport/server, credentials, clinical data/imports, VistA implementation, DLL internals, prescribing/order entry, signing, printing, interpretation, scheduling actions, encounter changes, reminders, capacity calculations or cross-project functionality. A future read-only slice remains a separate decision after this hardening checkpoint.
