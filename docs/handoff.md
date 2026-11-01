# CPRS Chart recreation: current handoff

M14 implementation and Linux validation are complete locally at `d00d534` on
`m14-results-date-filters`. Publication is blocked: automatic approval review
rejected the push because it limited prior publication authorization to M13.
No M14 branch or draft PR was uploaded/created. See the
[publication-block receipt](../validation/milestone-14/publication-block.json).
Exact next action: obtain explicit approval to publish M14 code, documentation
and validation evidence to `joshuabenavente/cprs-exploration` and open a draft PR;
then push and check code/build CI. M14 merge remains unauthorized.

M14 is active on `m14-results-date-filters`, from merged `main`
`62bd340501f0d7753e1807cec12d7a967f8fb403`. [M13 PR #8](https://github.com/joshuabenavente/cprs-exploration/pull/8)
merged after both final-head portable-core and Windows desktop code/build CI jobs
passed; local/remote M13 branches are pruned. See the new
[merge checkpoint](../validation/milestone-14/m13-merge-checkpoint.json).
M13 Windows native/Narrator acceptance remains pending; merging did not promote it.

M14 adds query plus optional inclusive beginning/ending strict calendar bounds,
Reset, invalid-input clearing and full owned filter/generation validation to the
existing read-only Results reader. Highlighting remains separate from report
activation. Nine invented patients and one invented report family remain unchanged.
See [plan](milestone-14.md) and [contract](../specifications/results-filtering.md).
Current code passed format, warning-denied workspace Clippy, 116 Rust tests,
16 protocol tests, build/callback smoke and the complete ten-sample Linux matrix.
Each journey has 100 checkpoints, 122 deliveries and 53 stale-reply rejections.
All 2,447 pre-M14 evidence files remain byte-identical. See the
[acceptance checkpoint](../validation/milestone-14/acceptance.json) and
[targeted synthetic visual review](../validation/milestone-14/linux/synthetic-visual-review.json).
After explicit M14 publication approval: publish the draft PR, verify code/build
CI, then perform the fresh Windows matrix and separate native/Narrator checks.
M14 merge is not authorized.
New validation uses `validate_m14.py`, `verify_m14.py` (also available through
`verify_integrated.py`), `Test-MockChart.ps1`, `Review-ResultsFilters.ps1`, and
`validation/milestone-14/`. Historical M13 writers now fail before writing.
Windows native/listening checks require a fresh Windows build and the
[M14 checklist](../validation/milestone-14/native-checklist.md); Linux synthetic
geometry does not establish those results.

M13 implementation delivered author keys, dates/reset, invalidation and layout
with 106 Rust tests, 14 protocol tests and ten Linux samples, each 91 checkpoints,
104 deliveries and 43 rejections. Its [acceptance receipt](../validation/milestone-13/acceptance.json)
and all prior evidence retain their capture-time bytes/statuses. Revisit M13
native work only from the M13 source/build with separate new evidence.

The following analysis/repository review paragraphs retain the pre-implementation
checkpoints and their original evidence limits.

Latest checkpoint, 1 November 2026 (Mountain time): local `work` is now at
`6428037`, fast-forwarded to the analysis-only publication commit. Prior review
edits were preserved; runtime/build inputs are unchanged. The repo's
`reverse-engineering/` folder is available. Independent checks verified 950
manifest entries, 955 publication-receipt files, 18 gzip source hashes and the
43,371-entry inventory; all 367 historical reference copies match exactly.
Repaired published exports support the TIU query/sign distinction and corroborate
the excluded Vitals/DLL boundary. Raw original binaries/project and the accepted
Windows mock EXE remain unavailable, so their byte checks were not rerun.
See the [analysis review](analysis-review-2026-11-01.md), updated
[traceability](traceability-2026-11-01.md) and [status/backlog](project-status.json).
Recommended next implementation milestone is [M13 read-only Notes author/date
filtering](milestone-13.md); the initial evidence-only proposal is preserved.
Exact next action: write the Notes filtering contract for NF01–NF08, declaring
synthetic author IDs, inclusive calendar-date rules, filter request keys,
invalid-input/reset/cancel behavior and exclusions before implementation.
This continuation changes documentation/evidence only; no new Rust/native/speech
execution, original/DLL execution, commit or remote publication occurred.

The following repository-only review paragraph records the earlier missing-input
checkpoint; the analysis availability and next action above supersede it.

Review checkpoint, 1 November 2026 (Mountain time): the available repository was
reviewed at clean `work` / `8fec66d`. Independent Linux formatting, warning-denied
core Clippy and all 96 core tests passed. Retained follow-up logs, source/build
inputs, index artifacts and historical snapshots were audited separately; the
accepted Windows executable and original specimen are absent here. The requested
`/workspace/reverse-engineering/` workspace/ZIP is also absent, so its new semantic
claims remain unverified. See the [critical review](project-review-2026-11-01.md),
[feature traceability](traceability-2026-11-01.md), [M13 proposal](milestone-13.md)
and [durable status/backlog](project-status.json). Exact next action: obtain and
hash/list the analysis bundle, extract it separately, then inspect its provenance
and feature-relevant bounded evidence. No runtime change, new Windows/native run,
original-client execution, commit or publication was made by this review.

Current follow-up executable SHA256: `a88cddab73f0d9978587c1ad211e1f93783acd31f1983dddfbe369d1ce20c6c3`. Local code/build checks, 96 core tests, callback smoke, the 83-checkpoint journey and all ten size/scale-bound geometry samples passed. Targeted native minimum-200 and default-100 captures show clear third rows. Minimum-200 System > Size/Ctrl+O/cancellation and subsequent navigation passed after settled observation; the original anomaly's cause is unproven and no shortcut code changed. See the [follow-up report](../validation/milestone-12/native-followup/report.md) and [hashed index](../validation/milestone-12/native-followup/index.json). Native visual/keyboard and Narrator listening are now **user-reported passes across all ten size/scale combinations** (default/minimum at 100%, 125%, 150%, 175%, 200%); see the [supplemental acceptance receipt](../validation/milestone-12/native-followup/user-acceptance.json). The exact report was "everything passes", clarified as "All ten combinations". Independent native client-area measurements, audio capture and automated native matrix verification remain unavailable. The new default-100 launcher log is hashed as preparation evidence only. The index retains its capture-time 0/10 and pending-listening fields; its original report hash resolves to the [preserved report](../validation/milestone-12/native-followup/report-before-user-acceptance.md) through the supplemental receipt. Publication is tracked by the branch pull request; inspect its merge state and current Git refs.

Native finding follow-up on `work/m12-native-review`: the current source restores `StandardTableView`'s intrinsic minimum instead of forcing 140px, and the geometry journey now checks clearance below fixture rows for Fluent's overlay scrollbar. Separate evidence and the later user-reported acceptance are linked above. Use `Test-CoverSheetFollowup.ps1 -Matrix`, `python scripts/verify_cover_followup.py`, and `Review-CoverSheetFollowup.ps1`; output stays in `validation/milestone-12/native-followup/`. Original M12 checkpoint receipts below remain capture-time evidence for the old build. Read the [follow-up report](../validation/milestone-12/native-followup/report.md) for the distinction between captured observations and later user-reported acceptance.

Evidence correction: the baseline review launcher reused the untracked `layout-minimum-200.log` during the follow-up reproduction. Its bytes now describe the rerun and do **not** match the original native index's preparation-log hash. The old index and all native-review captures remain unchanged; the other nine preparation logs match. See `validation/milestone-12/native-followup/preparation-log-correction.json`. Do not claim that original log was preserved.

Previous native review resumption (original executable): Computer Use connected successfully on `work/m12-native-review` at `9fa2d77`. All ten `Review-CoverSheet.ps1 -Matrix` launches have native keyboard/UIA observations and captures in [the supplemental native report](../validation/milestone-12/native-review/report.md) and [hashed index](../validation/milestone-12/native-review/index.json), subject to the preparation-log correction above. Full protocol sign-off remained **0/10**: minimum-width appointment scrollbar overlap was observed, a supplemental minimum-200 resize/input anomaly was unresolved, and the report lists outstanding per-sample interactions. The matrix process exited 0. Historical receipts and listening reports retain their capture-time status, including prior connection failures.

Updated 31 October 2026 (Mountain time). **The current-build native visual/keyboard matrix and Narrator listening are user-reported passes, 10/10 each.** The sections below describe original-build capture-time evidence and earlier review steps; the current-build supplemental receipt above records the later confirmation. Read [M12 protocol and checklists](milestone-12.md), [listening reports](../validation/milestone-12/listening-reports.json) and the actual [M12 checkpoint receipt](../validation/milestone-12/acceptance.json) before claiming completion.

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

## Historical original-build native and listening work

The supported computer-use helper failed `list_windows`, a retry after two seconds, and a reset/reinitialization attempt with: `Computer Use native pipe is unavailable: failed to connect native pipe: The system cannot find the file specified. (os error 2)`. [Native status](../validation/milestone-12/native-status.json) records all attempts and the current executable. No native capture, keyboard or visual pass follows from the synthetic matrix.

Recheck after PR #4: the documented retry/reset sequence still returned the missing native pipe, and the separate CUA inventory failed with the same native error plus an unavailable browser host. No native actions or samples were collected. See [recheck receipt](../validation/milestone-12/native-recheck-20261101T020956468320.json). Resume the already approved matrix when the native connection is restored.

After restoring the supported helper, run `.\scripts\Review-CoverSheet.ps1 -Matrix`. The launcher binds review to the M12 receipt/executable and writes only M12 output. Review all five panels, upper/middle/lower content, footer/fixed frame, forward/reverse Tab, arrows, explicit activation, initial reading focus, Escape return, Ctrl+O cancellation, resize repetition, Unicode/empty panels and read-only selection/scrolling at every supported size/scale. Record native input, settled UIA, focus probes and speech separately.

Original M12 checkpoint executable SHA256: `21f1cde24ce21d39218846ba8a183f9263475207aacae5f7c75b0167153434c4`; confirm it against `automated.json`. The user replied "m10 and m12 pass" to the separate listening-checklist request. [Supplemental reports](../validation/milestone-12/listening-reports.json) record a user-reported M12 affected-controls pass for this build and a separate M10 Appointments pass for SHA256 `de217b49353b923172e62f7500eb20322aecec2cc0aa7c275d8c764e2d2288fd`. Build bindings come from the preceding checklists; the reply did not repeat hashes. No audio capture or independent speech verification is claimed. The historical M11 listening pass remains scoped to SHA256 `1673037d3f1e90b671cbf910ebc53fcee08971ba997160d2275e3fbe1ccdfdd8`; original M10/M11 receipts retain their capture-time status.

At the original checkpoint, M12 acceptance remained incomplete until the native visual/keyboard matrix was recorded; the later current-build user-reported passes are recorded above. The [published Windows clone](../validation/milestone-12/published-clone.json) and [implementation CI](../validation/milestone-12/ci-status.json) passed on `d0e83eb`; the final report/verifier follow-up retains local tests and PR #4 tracks its head checks. The ten-sample matrix was the next task at that checkpoint; the current-build supplemental receipt now records both user-reported checklists as passed. No full accessibility, physical IME/dead-key, monitor-DPI transition, original-client parity or clinical-compatibility claim is supported.
