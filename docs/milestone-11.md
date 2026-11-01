# Milestone 11: shared Cover Sheet hardening

Implementation `10f21c4` was merged as `be30bcd` through [PR #1](https://github.com/joshuabenavente/cprs-exploration/pull/1) from the subsequently pruned `codex/milestone-11-hardening` branch into then-default `codex/milestone-10-appointments`, from handoff commit `da4298807b9e24017352bd247f382315cc4c8d9d`. The runtime remains compiled, invented, mock-only and read-only. No domain panel, original-client execution, recovery work or connectivity was added. Milestone acceptance remains open for native review; actual remote CI results are recorded in `ci-status.json`. The user reported the separate final-build M11 listening checklist passed (reply: "checks pass"). M10 Appointments listening is still pending.

Local validation passed formatting, warning-denied Clippy, 96 core tests, desktop compilation, immediate callback smoke, 82 timed checkpoints, all ten default/minimum geometry probe samples, and the corrected fresh Windows checkout/build. All 686 historical worktree files and Git identities were verified; new M11 evidence passed exact staging/checkout byte checks. See [the bounded receipt](../validation/milestone-11/acceptance.json). These automated results leave native review open; M11 listening is a separate user-reported pass.

Development now continues on `main`; all obsolete milestone branches were confirmed as ancestors before pruning. The [main consolidation receipt](../validation/milestone-11/main-consolidation.json) records passing CI on the promoted published head, preserved tags and evidence, and updated branch/default tracking.

## Layout and focus changes

The workspace now takes the Cover Sheet layout's intrinsic minimum plus its surrounding padding, with the viewport as its lower bound. Each panel contributes its heading, minimum table, View button, help text, internal spacing and padding. The top Problem List/Allergies row remains shared; Vitals, Active Medications and Appointments remain full-width. The fixture footer participates in the layout. No replacement total height is maintained, and selector/browser sizing remains separate.

Reveal uses the actual table/heading or View/help coordinates relative to the workspace viewport and clamps to valid scroll bounds. Tab key release inside a panel observes entry into Fluent's private table focus scope; View focus reveals its own controls. This avoids relying on the public table `has-focus`. This path compiles and its geometry callbacks pass; actual forward/reverse native Tab behavior still needs review. Empty panels have an accessible group description including their synthetic owner and explicit synthetic emptiness.

Pending/committed ownership, request generations, literal fixtures, explicit Cover Sheet activation and the separate Notes/Orders/Results behavior are preserved. The timer journey additionally checks all five cleared selections when opening selection, and Appointments binding row counts.

## Reproduce local checks

Close the mock before building. Rust 1.99.1, rustfmt and Clippy are pinned in `rust-toolchain.toml`.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = 'C:\Users\soapo\AppData\Local\Python\pythoncore-3.14-64\python.exe'
& $ChartPython scripts\verify_integrated.py
.\scripts\Test-CoverSheetLayout.ps1
& $ChartPython scripts\check_clean_checkout.py
& $ChartPython scripts\verify_hardening.py
& $ChartPython scripts\audit_m11_bytes.py
```

The runner accepts only M11. Logs/receipts use `validation/milestone-11/` and `M11_*`; do not regenerate M2–10 receipts. `Test-MockChart.ps1 -CodeOnly -Bootstrap` separates initial `cargo fetch --locked` from subsequent cached `--locked --offline` checks, and omits desktop callbacks/timers. The default full check is offline and requires prior dependency bootstrap.

The journey preserves the prior 71 checkpoints and adds eleven: five heading/table/card geometry checks, five reverse-order View/help reveal checks and one fixture-footer reachability check. It has 82 checkpoints, 92 actual deliveries and 38 rejected stale replies. There are still 96 core tests. The matrix repeats that journey at default/minimum sizes and 100%, 125%, 150%, 175% and 200%. These are timer, binding, geometry and widget-focus probes, without injected keys, compositor inspection, UIA or spoken-output claims.

## Checkout, evidence and CI

The incoming [handoff](../validation/milestone-11/startup-handoff.md) and [manifest](../validation/milestone-11/historical-bytes.json) preserve 686 tracked historical analysis/validation files. Workstation SHA256 and baseline Git blob identity are separate invariants. A raw checkout differs from the older workstation bytes for 167 files, solely because of pre-existing CRLF normalization; the old manifests are not rewritten. New M11 evidence has byte-preserving attributes and a separate private-index staging/checkout audit.

`check_clean_checkout.py` creates a fresh Git-tree checkout using a private index and `core.autocrlf=false`. It identifies the current uncommitted tree, leaves the real index/branch alone, excludes ignored specimens/tools/caches, starts with an empty target, bootstraps locked dependencies, then runs formatting, warning-denied Clippy, all tests and desktop compilation. The existing Cargo registry can be reused. This is a local Windows checkout/build check; the subsequent fresh private-remote Windows clone of implementation `10f21c4` passed code/build checks, recorded in `published-clone.json` (including 686 historical Git blobs and all 29 initial M11 evidence files). Source hashes and toolchain/OS/PowerShell details are recorded in its receipt. Source hashes use raw LF Git-tree bytes; current source is compared after CRLF-to-LF normalization, while historical evidence is still required to match exact workstation bytes.

The first attempt passed its code/build steps but failed receipt generation because Windows PowerShell could not resolve `Get-FileHash` in its inherited module environment. Its failed receipt/log are preserved as `clean-attempt-1.*`. The runner now hashes with .NET SHA256 directly, without requiring module auto-loading; the corrected fresh checkout passed all checks, including receipt generation.

The [workflow](../.github/workflows/mock-checks.yml) adds Windows desktop code/build checks and Ubuntu core checks. Both bootstrap the locked dependency graph before offline checks. Hosted code checks omit interactive callbacks/timers, native review and listening. The checkout and artifact actions are pinned to verified release commits ([checkout](https://github.com/actions/checkout/releases/tag/v6.0.1), [upload-artifact](https://github.com/actions/upload-artifact/releases/tag/v6.0.0)). No ignored originals or workstation caches are uploaded. Windows desktop code/build and Ubuntu portable-core push/PR CI passed on implementation `10f21c4`, recorded in `ci-status.json`; these code/build jobs remain distinct from native or spoken-output evidence.

## Native review and listening status

The supported computer-use helper could not connect to its Windows pipe, including after the documented retry and reset. [Native status](../validation/milestone-11/native-status.json) records the exact error. No M11 native keyboard/layout pass or captures are claimed. Use:

```powershell
.\scripts\Review-CoverSheet.ps1 -Matrix
# Single sample:
.\scripts\Review-CoverSheet.ps1 -Size minimum -ScaleFactor 2
```

The launcher requires the executable recorded in the successful M11 automated receipt. The historical Appointments launcher refuses the new executable before it can overwrite M10 logs. The review journey leaves SYNTH-001 / Cover Sheet / APPT-03 selected, detail closed. Defaults stay 1180x800, minimum 980x680, compact 200% default 1180x700 logical pixels. Scale overrides are process-local.

For every size/scale, inspect upper, middle and lower content, all five panels' tables/View/help controls, the fixture footer, and fixed header/navigation/status. Use forward/reverse Tab, arrows, Enter, Space, View, double-click and Escape for each panel. Confirm the selected row is retained, reading focus starts in the text pane, and Escape returns to the originating table. Check long Unicode text, horizontal text/table scrolling, read-only text selection, empty SYNTH-002 panels and repeat navigation after resizing and Ctrl+O cancellation. Record native input, settled UIA, focus probes and listening separately.

### Separate M11 affected-controls listening checklist

Use the final M11 executable SHA256 `1673037d3f1e90b671cbf910ebc53fcee08971ba997160d2275e3fbe1ccdfdd8` (also in `automated.json`). With Narrator enabled:

1. Open SYNTH-001. Tab forward and backward through all five panels. Confirm the panel name, committed synthetic patient and selected item are spoken as focus reveals the appropriate table or View action.
2. For each panel select a row, open with Enter or Space, and confirm the selected item's local text is spoken from the initially focused read-only pane. Escape must return to that same table; use an arrow and reopen to check that speech follows the new row.
3. Check View identifies its panel. Read long Unicode medication/appointment text, including Zoë 李, without missing/stale ownership announcements.
4. Ctrl+O then Escape must preserve SYNTH-001 while clearing panel selections/detail. Repeat Tab/reveal after resizing. Open SYNTH-002 and confirm the empty-panel description says synthetic emptiness, without implying a clinical finding.
5. Report pass/fail, the build hash, panels/actions checked and any missing, incorrect or stale speech. Visible text and keyboard callbacks alone do not establish spoken behavior.

The user replied "checks pass" to the separate final-build M11 Narrator checklist request in this session. This is recorded as a user-reported M11 listening pass for the identified build and checklist scope; no audio recording or independent speech verification is claimed. Full native matrix review remains pending. This M11 report retains its build and scope. It does not backdate or silently complete the still-open [M10 Appointments checklist](milestone-10.md#separate-appointments-listening-checklist). No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical compatibility claim follows from this checkpoint.
