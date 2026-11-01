# CPRS Chart recreation: current handoff

Updated 31 October 2026 (Mountain time). **M10 and M12 listening are user-reported passes; the separate M12 native visual/keyboard matrix remains open.** Read [M12 protocol and checklists](milestone-12.md), [listening reports](../validation/milestone-12/listening-reports.json) and the actual [M12 checkpoint receipt](../validation/milestone-12/acceptance.json) before claiming completion.

## Starting point and scope

- M12 work branch: `work/m12-evidence-and-native-review`, created from `main` at `d040c2e78b6103284c021d1025d194c9e91fa832`. [PR #4](https://github.com/joshuabenavente/cprs-exploration/pull/4) tracks its delivery and final-head checks; inspect the PR state and current Git refs for merge/prune status. PR #3 merged `9ef0647` and silent-log fix `6a01c99`; that earlier review branch was pruned locally/remotely.
- The user approved an M12 path/protocol, fresh evidence and attempting the native matrix plus outstanding listening checks. No domain feature is added.
- Runtime remains a Rust/Slint native mock with nine compiled invented patients, five Cover Sheet panels, Notes, Orders and Results. No live transport/server/RPC, credentials, clinical data/imports, original CPRS execution, VistA/DLL work, clinical writes or cross-project functionality.
- [Incoming handoff](../validation/milestone-12/startup-handoff.md) and [startup manifest](../validation/milestone-12/historical-bytes.json) preserve all 719 previously tracked analysis/validation files, including M11. Workstation SHA256 and baseline Git blob identity are separate checks; pre-existing CRLF normalization is historical, not permission to rewrite evidence.

## Current validation

The active runner accepts **only `-Milestone 12`** (the default), writes `validation/milestone-12/`, and uses `M12_*` journey logs. CI artifact paths, integrated/hardening verifiers, clean checkout, geometry probes and native review launcher moved together. New M12 evidence has byte-preserving Git attributes. Do not use historical writers to regenerate M2–11 receipts.

The journey has 83 checkpoints, 92 actual deliveries and 38 rejected stale replies. Ten panel layout/reveal checks dispatch synthetic Slint Tab/Shift+Tab events after scrolling their target out of view; the footer check is separate. `review-final-state` restores Problems/Allergies to no selection and Vitals/Medications/Appointments to VITAL-03/MED-03/APPT-03, with detail closed. The generic Cover Sheet probe does not establish table focus.

Every step log, including silent formatting, is hashed. The integrated receipt also hashes the automated receipt. Seven temporary-tree validation-tool tests cover M11 rejection, output isolation, silent logs, failed-run cleanup and receipt/log rejection. Their synthetic Cargo/parser fixtures are separate from the 96 core tests and actual desktop journey.

```powershell
.\scripts\Test-MockChart.ps1
python scripts\verify_integrated.py
python scripts\test_validation_protocol.py
.\scripts\Test-CoverSheetLayout.ps1
python scripts\check_clean_checkout.py
python scripts\verify_hardening.py
python scripts\audit_m12_bytes.py
```

The full runner is cached/offline. `-CodeOnly -Bootstrap` separates initial locked dependency fetch from offline code/build checks and skips desktop callbacks/timers. The clean checker exports a private-index Git tree with `core.autocrlf=false` and `core.longpaths=true`, verifies historical blobs, excludes ignored originals/tools, and uses an empty target; registry caches can be reused. The ten-sample matrix repeats default/minimum sizes at 100%, 125%, 150%, 175% and 200%. These are synthetic dispatch/binding/geometry checks, not native input or visual review. Read the receipts for actual outcomes.

Local M12 results passed: all six runner steps, 96 core tests, the 83-checkpoint journey, all ten probe samples, seven validation-tool tests and the fresh checkout/build. The latter verified 719 historical blobs and retained the 167 legacy CRLF-only differences. Eight deliberate receipt/source/build-binding mismatches were rejected and restored, including the later listening-report bindings; see [rejection checks](../validation/milestone-12/receipt-rejections.json). CI results identify their checked implementation commit in [CI status](../validation/milestone-12/ci-status.json); final publication checks are linked from PR #4.

## Native and listening work

The supported computer-use helper failed `list_windows`, a retry after two seconds, and a reset/reinitialization attempt with: `Computer Use native pipe is unavailable: failed to connect native pipe: The system cannot find the file specified. (os error 2)`. [Native status](../validation/milestone-12/native-status.json) records all attempts and the current executable. No native capture, keyboard or visual pass follows from the synthetic matrix.

After restoring the supported helper, run `.\scripts\Review-CoverSheet.ps1 -Matrix`. The launcher binds review to the M12 receipt/executable and writes only M12 output. Review all five panels, upper/middle/lower content, footer/fixed frame, forward/reverse Tab, arrows, explicit activation, initial reading focus, Escape return, Ctrl+O cancellation, resize repetition, Unicode/empty panels and read-only selection/scrolling at every supported size/scale. Record native input, settled UIA, focus probes and speech separately.

Current executable SHA256: `21f1cde24ce21d39218846ba8a183f9263475207aacae5f7c75b0167153434c4`; confirm it against `automated.json`. The user replied "m10 and m12 pass" to the separate listening-checklist request. [Supplemental reports](../validation/milestone-12/listening-reports.json) record a user-reported M12 affected-controls pass for this build and a separate M10 Appointments pass for SHA256 `de217b49353b923172e62f7500eb20322aecec2cc0aa7c275d8c764e2d2288fd`. Build bindings come from the preceding checklists; the reply did not repeat hashes. No audio capture or independent speech verification is claimed. The historical M11 listening pass remains scoped to SHA256 `1673037d3f1e90b671cbf910ebc53fcee08971ba997160d2275e3fbe1ccdfdd8`; original M10/M11 receipts retain their capture-time status.

M12 acceptance remains incomplete until the native visual/keyboard matrix is recorded. The [published Windows clone](../validation/milestone-12/published-clone.json) and [implementation CI](../validation/milestone-12/ci-status.json) passed on `d0e83eb`; the final report/verifier follow-up retains local tests and PR #4 tracks its head checks. The next task is the ten-sample native matrix before another domain slice. No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical-compatibility claim is supported.
