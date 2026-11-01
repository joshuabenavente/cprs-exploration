# Milestone 12: fresh validation protocol and native-review checkpoint

## Scope and provenance

The user approved a separate M12 destination after PR #3 merged the four validation findings and silent-log correction. Baseline: `d040c2e78b6103284c021d1025d194c9e91fa832` on `main`; work branch: `work/m12-evidence-and-native-review`. M12 changes validation/protocol infrastructure and documentation, with no new domain behavior or live connectivity.

The [startup manifest](../validation/milestone-12/historical-bytes.json) captures all 719 previously tracked analysis/validation files. Baseline Git blob IDs and workstation SHA256 values are independent checks. [The incoming handoff](../validation/milestone-12/startup-handoff.md) retains the pre-M12 state. M2–11 receipts, including M11's 82-checkpoint record, are preserved. The current journey has 83 checkpoints, 92 deliveries and 38 rejected stale replies.

## Output contract

`Test-MockChart.ps1` accepts only M12. Current logs and receipts live in `validation/milestone-12/`, with `protocol: M12` in machine receipts and `M12_CHECK`, `M12_DELIVERY`, `M12_LAYOUT`, `M12_WINDOW`, `M12_INTEGRATED_PASS` / `M12_INTEGRATED_FAIL` in journey output. The runner removes its mode's stale receipt/step logs before a run, creates logs for silent steps and records their hashes. The integrated verifier binds its output to those logs, the executable and the automated receipt bytes.

The native review launcher, synthetic matrix, clean checker, verifiers and CI artifact paths use the same destination. `audit_m12_bytes.py` replaces the active M11 audit writer; new Git attributes preserve M12 evidence bytes. Seven validation-tool tests execute in temporary roots with historical sentinels and deliberately invalid inputs; their synthetic fixtures never become build/native evidence. The tooling receipt binds exercised scripts to their hashes.

## Reproduce and inspect results

```powershell
.\scripts\Test-MockChart.ps1
python scripts\verify_integrated.py
python scripts\test_validation_protocol.py
.\scripts\Test-CoverSheetLayout.ps1
python scripts\check_clean_checkout.py
python scripts\verify_hardening.py
python scripts\audit_m12_bytes.py
```

Use the installed workspace Python. The full runner uses `--locked --offline`; `-CodeOnly -Bootstrap` fetches locked dependencies first and omits desktop callbacks/timers. The fresh Windows Git-tree build starts with an empty target and no ignored originals/Ghidra tools; registry caches can be reused. Its receipt identifies the exported tree, not a remote published build. Private-index checkouts enable long paths and Python historical reads use extended Windows paths.

Inspect the actual [automated checks](../validation/milestone-12/automated.json), [journey](../validation/milestone-12/integrated.json), [tooling tests](../validation/milestone-12/tooling-review.json), [probe matrix](../validation/milestone-12/probe-run.json), [fresh checkout](../validation/milestone-12/clean-checkout.json), [checkpoint summary](../validation/milestone-12/acceptance.json) and [byte audit](../validation/milestone-12/byte-audit.json) for outcomes and evidence types. The synthetic matrix repeats default/minimum sizes at 100%, 125%, 150%, 175% and 200%; every journey requires 83 checkpoints and the 92/38 baseline.

Recorded local results: formatting, warning-denied Clippy, all 96 core tests, desktop build, callback smoke, the integrated journey, all ten probe samples and seven validation-tool tests passed. The fresh Windows checkout passed code/build checks and verified 719 historical blobs; 167 legacy files differed from workstation bytes only by their pre-existing CRLF convention. [Five receipt rejection checks](../validation/milestone-12/receipt-rejections.json) caught changed step-log bytes, changed automated-receipt bytes, an added `crates/` file, mismatched CI commit and mismatched native-status executable; all mutations were restored and the normal verifier passed again. CI/native mismatch inputs in that test are in-memory fixtures, not actual runs. The historical M10 review launcher also refused the new executable before writing historical output.

Current executable SHA256: `21f1cde24ce21d39218846ba8a183f9263475207aacae5f7c75b0167153434c4`. No M12 remote CI or published-clone result is claimed; [CI status](../validation/milestone-12/ci-status.json) is pending. Prior PR #3 CI is historical and does not validate this migration. The summary deliberately leaves milestone acceptance incomplete.

## Native visual and keyboard matrix

The supported computer-use helper cannot connect to its Windows pipe (`os error 2`) after its documented retry and reset/reinitialization attempt. [Native status](../validation/milestone-12/native-status.json) records all three attempts. There are no new native samples/captures. Synthetic Slint events and geometry readings do not replace this evidence.

Once the supported helper is available:

```powershell
.\scripts\Review-CoverSheet.ps1 -Matrix
# One sample:
.\scripts\Review-CoverSheet.ps1 -Size minimum -ScaleFactor 2
```

The launcher requires the current M12 automated receipt/executable. The completed journey starts review at SYNTH-001 / Cover Sheet, Problems and Allergies unselected, VITAL-03/MED-03/APPT-03 selected and detail closed. It does not prove native table focus. Defaults are 1180x800 logical, minimum 980x680, and compact 200% default 1180x700. Application scale overrides do not establish monitor-DPI transitions.

For every one of the ten size/scale samples:

1. Inspect upper, middle and lower content, all five panel tables/View/help controls, fixture footer and fixed header/navigation/status. Capture actual client geometry and the complete window.
2. Tab forward/backward through each panel. Use arrows, Enter, Space, View and double-click to open matching read-only detail. Verify initial reading focus, Escape return and retained selection; reobserve after asynchronous changes.
3. Check long Unicode medication/appointment text, horizontal scrolling, read-only selection/scrolling and empty SYNTH-002 panels. Repeat navigation after resizing and Ctrl+O cancellation. Preserve the committed patient while clearing transient selections/detail on selector entry.
4. Record native inputs, settled UIA/focus observations, screenshots and listening separately, bound to this executable and requested/actual size/scale. A successful launcher/journey is preparation, not a native review pass.

## Current-build listening checklist

With Narrator enabled, use the M12 executable above and `.\scripts\Start-MockChart.ps1 -IntegratedReview`. The launcher runs the synthetic journey before leaving the review state open. Report the build hash, panels/actions checked, pass/fail and any missing, incorrect or stale speech.

1. Tab forward/backward through all five panels. Confirm panel name, committed synthetic patient and selected item are spoken as focus reveals its table or View action.
2. For each panel select a row and open with Enter/Space or View. Confirm matching local text is spoken from the initially focused read-only pane. Escape must return to the same table; arrow to another row and reopen.
3. Check the View label identifies its panel. Read long medication/appointment Unicode text, including Zoë 李, without stale ownership announcements.
4. Ctrl+O then Escape preserves SYNTH-001 while clearing selections/detail. Repeat after resizing. Open SYNTH-002 and confirm empty-panel descriptions state synthetic emptiness without implying a clinical finding.

No M12 listening pass is recorded yet. The previous M11 user report stays bound to its old executable. The [M10 Appointments checklist](milestone-10.md#separate-appointments-listening-checklist) also remains pending and requires a separate report identifying its historical build, SHA256 `de217b49353b923172e62f7500eb20322aecec2cc0aa7c275d8c764e2d2288fd`. Record a report against M12 under M12, not in historical M10 evidence.

This checkpoint supports no full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical compatibility claim. Runtime stays synthetic and mock-only.
