# Cover Sheet synthetic vertical slice

Milestone 3 recovery and original two-panel policy are historical below. The current app adds a third Vitals panel and a two-row scroll layout; see [the Milestone 8 contract](vitals.md). Notes, Orders and Results are now implemented. Existing ownership/detail guards extend to all three panels.

The slice extends patient selection into two read-only panels: Problem List and Allergies, then item detail. It uses the same pinned CPRS Chart 1.33.214.5 specimen as milestone 1. Original CPRS execution, server behavior, clinical data, editing, printing, and other panel types remain outside the slice.

## Recovered evidence

The [target list](../provenance/cover-sheet-targets.txt) selects 31 MAP-named functions. Their [instruction and decompiler exports](../analysis/cover-sheet/decompiled/workflow-functions.tsv), [call sites](../analysis/cover-sheet/decompiled/workflow-calls.tsv), and [separate address/literal annotations](../analysis/cover-sheet/resolved/workflow-evidence.json) are static evidence. Decompiler completion is not complete recovery of Delphi control flow or types.

| Evidence | Supported observation | Limit |
| --- | --- | --- |
| `TFRMCOVERSHEET` resource | Borderless client-aligned page, grid, two stored columns and two rows, empty `ControlCollection` | Each extended80 value decodes to 50; this does not establish the runtime arrangement |
| `TCoverSheet.OnInitCoverSheet`, `OnDisplay`, and parameter `NewCoverSheetControl` methods | Runtime parameter/control construction and grid population; separate Problem List and Allergies control classes | Site configuration and all indirect dispatch types remain unverified |
| `TfrmCoverSheet.OnDisplayPage` at `00fd94a8` | First-display counters, calls through `iCoverSheetIntf.CoverSheet`, and focus-related dispatch | Virtual slot meanings and exception continuations need further review |
| `TfrmCoverSheet.OnClearPtData` at `00fd9450`, `TCoverSheet.OnClearPtData` at `00bee374`, panel `OnClearPtData` at `00bd3688`, and `ClearListView` at `00bd35d0` | Page/service/panel clearing paths; list clearing and accessibility-manager setup | These are separate static paths; the exports do not prove every runtime dispatch edge |
| `_CPRS` panel form | Read-only row-selecting report list; keyboard, mouse, selection, and focus event bindings; no stored columns | Columns are created in code; inherited defaults are not expanded |
| Allergies constructor at `00bd67fc` | Exact column literals `Agent`, `Severity`, `Signs/Symptoms` | This does not establish complete row/response contracts |
| Problem List constructor at `00bda47c` | Exact column literal `Problem List` | Visible panel heading/configuration is a separate concern |
| `lvDataKeyDown` at `00bd4180` | Enter (`0x0d`) and Space (`0x20`) call `DisplayItemDetail` | The Rust focus and asynchronous model are authored |
| `lvDataSelectItem` at `00bd43c4` | A selected item updates stored selection state | This handler alone does not open details |
| `lvDataMouseDown` | Calls detail display under a stored flag | The flag's runtime configuration is unresolved; the mock double-click gesture is authored |
| `OnShowDetail` at `00bd4908` | Detail-title literal ` Item Detail: ` and MAP-resolved call to `fRptBox.ReportBox` at `01007fec` | Do not assume the separately embedded `TfrmCoverSheetDetailDisplay` form is used by this path |
| `TFRMCOVERSHEETDETAILDISPLAY` resource | Read-only memo, Lucida Console, both scrollbars, no wrapping, Close and Print controls | This form exists in the binary; its runtime use has not been established |

The observed `ORWCV1 COVERSHEET LIST`, `ORWCV START`, `ORQQPL DETAIL`, `ORQQAL DETAIL`, and `ORQQAL LIST` literals are interface clues only. No broker transport, registration, argument contract, permissions, or response semantics are implemented or verified.

## Authored Rust behavior

The two panels appear side by side in a single row, using the recovered list columns. This deliberately bounded arrangement is not a reconstruction of a site's full configurable Cover Sheet. Other tabs remain labeled placeholders. Every row, agent, severity, symptom, and detail is invented; an empty panel expressly does not assert a clinical finding.

The chart snapshot contains the patient identifier, panel ownership, and rows. A successful chart commit requires the requested patient to match the header, Cover Sheet owner, and every row; per-panel item identifiers must be nonempty and unique. Header and panel data commit together. Missing, foreign, or duplicate identifiers block the commit and preserve the prior chart.

Single-click or arrows select an item. Enter, Space, the detail button, and authored double-click activation share one detail request path. A request is scoped by generation, patient ID, panel kind, and item ID. A detail response must match all keys. Closing, opening patient selection, changing tabs, or successfully switching patients invalidates pending detail work. Old or duplicate responses cannot reopen the pane or replace current content.

Opening patient selection clears item selections and detail state immediately. Cancel preserves the committed chart and tab, with details closed and selections reset. An access denial or failed chart load preserves the committed chart. Switching patients resets both panels' selections before any new detail can open. Item IDs intentionally repeat between synthetic patients to exercise patient scoping.

Details show loading, loaded read-only text, or an explicit error. Errors clear previous body content; retry is a deliberate user action. The active patient header remains visible above the detail pane. Background chart controls are hidden or disabled while it is open. Close or Escape returns focus to the originating table. The pane is an in-window group, not a recovered native CPRS dialog. Printing is omitted.

All content is compiled into the mock. The nine fixtures include `ZÁRATE, ZOË 李` (`SYNTH-009`) for Unicode data-flow checks and an empty Allergies panel on `SYNTH-002`. Unicode case conversion and CJK matching do not establish physical IME composition support.

## Acceptance and evidence

[Nine core scenarios](../crates/chart-core/tests/cover_sheet.rs) exercise correct item identity, close/reopen generations, same item IDs across patients, mismatched detail keys, foreign/duplicate panel data, empty versus error/retry, cancel clearing, activation prerequisites, and Unicode matching. The previous 19 patient workflow tests remain regression coverage. The desktop callback harness exercises the rendered properties and common activation paths separately from native input.

See the [milestone 3 handoff](../docs/milestone-3.md), [static receipt](../validation/milestone-3/static.json), [automated receipt](../validation/milestone-3/automated.json), and [native observations](../validation/milestone-3/native-ui.json). Scaling, keyboard, UIA, speech, and IME evidence must retain their individual limits.
