# Mock Cover Sheet handoff

The Rust mock now opens patient selection into a Cover Sheet with Problem List and Allergies panels, then read-only item details. All nine patients and every item are invented and compiled into the application. Notes, Orders, and Results remain explicit placeholders. There is no broker transport, endpoint configuration, patient-file import, credential handling, printing, or clinical write path.

## Run and inspect

```powershell
.\scripts\Start-MockChart.ps1
```

Use `-Rebuild` after editing source. Search `CARTER` for two populated panels, `NGUYEN` for an empty Allergies panel, `MORGAN` for distinct same-name patients, or `zárate` / `李` for the Unicode fixture. Choose `Detail unavailable` in patient selection before opening a chart to exercise the item error and explicit retry controls.

Select an item with a click or arrows. Enter, Space, double-click, and the detail button use the same activation path. Close or Escape returns to its table. The committed patient header stays visible during details. Ctrl+O opens patient selection; cancel preserves the chart and tab while clearing item selection and detail state.

For repeatable minimum-size application-scale checks:

```powershell
.\scripts\Start-MockChart.ps1 -MinimumSize -ScaleFactor 1.25
```

The minimum client size is 980 by 680 logical pixels. The patient header, navigation, and status stay fixed while the workspace can scroll. Focusing a lower detail/confirmation button scrolls it into view; the search and table focus helpers return the workspace to the top. The minimum-size check also positions the window at the top left for repeatable work-area checks.

Scale overrides 1, 1.25, 1.5, 1.75, and 2 are process-local and restored by the launcher. They exercise Slint's scaling and layout; they do not change or validate Windows monitor DPI settings. The required physical client size at 200% is 1960 by 1360 pixels, so available work area must still be considered separately. The minimum-size flag is passed as a typed string array to avoid PowerShell expanding a lone argument into characters.

## Recovered basis and authored policy

The [Cover Sheet specification](../specifications/cover-sheet.md) separates recovered observations from the prototype's choices. Six embedded resources were decoded completely. Thirty-one focused functions have MAP names, instruction listings, decompilations, call sites, and separate literal/address annotations. All are tied to the existing executable/MAP hashes. The [static receipt](../validation/milestone-3/static.json) records the evidence hashes and limits.

The executable's Cover Sheet is a dynamically populated grid. Its stored form has no child panels. The Rust two-panel, single-row arrangement is authored, using the recovered Problem List and allergy columns. Enter and Space activation is supported by the instruction evidence. The mock's double-click gesture, asynchronous generation guards, layout, empty/error messages, and in-window detail pane are authored policies. The original `OnShowDetail` export resolves to `fRptBox.ReportBox`; the separate embedded detail form has not been proved to be that path's active dialog.

The original RPC literals remain static clues. No request format, server registration, site configuration, permissions, response behavior, or clinical compatibility has been established.

## State and implementation

`crates/chart-core/src/cover_sheet.rs` defines the two panel kinds, patient-owned item rows, detail keys, and compiled mock payloads. A chart commits only when the patient identifier matches the header, panel owner, and every row, with unique nonempty item identifiers per panel. Header and rows change atomically.

Detail requests include generation, patient ID, panel, and item ID. Responses must match all four. Closing, selecting another patient, or changing tabs invalidates pending details. Item IDs deliberately repeat between patients to test that the patient key cannot be omitted. Selection/detail state clears when patient selection opens and when a new chart commits. An old chart remains intact if a switch fails or is canceled.

The desktop adapter preserves unchanged table models to maintain focus. Its panel key handlers do not add extra tab stops. Table height constraints keep panel buttons and hints inside their panels. A bounded scrolling workspace prevents the full page height from forcing the window below the display at larger scale factors; acknowledgment increases its content height, and focus scrolls lower actions into view. The detail pane keeps the patient header visible and disables or hides background actions. Its read-only, nonwrapping text view uses Lucida Console and supports scrolling. No analysis files or original CPRS components are loaded by the Rust runtime.

## Verification and limits

Run the checks with the mock closed:

```powershell
.\scripts\Test-MockChart.ps1
```

The [automated receipt](../validation/milestone-3/automated.json) records formatting, Clippy with warnings denied, 28 passing core tests, the Windows build, and the callback smoke. The [acceptance map](../validation/milestone-3/acceptance.json) links nine new core scenarios and retains 19 patient-selection regressions. The callback harness separately checks panel models, selected item properties, shared activation/double-click paths, clearing, empty/error/retry, and Unicode fixture identity. It uses immediate in-memory replies and is not native-input validation.

The [native UI record](../validation/milestone-3/native-ui.json) records the actual executable hash, geometry/scale samples, keyboard and mouse observations, Unicode input path, UIA focus, and assistive-technology limits. A native tab-order check found and removed extra focus stops. The final executable was checked at 100%, 125%, 150%, 175%, and 200% application scale, with populated panels and details additionally checked at 200%. A stale loading status found during error testing was corrected and rechecked through retry and close.

The user chose to record spoken output as unverified; no Narrator speech pass is claimed. Some UIA focus snapshots lagged visible focus, and indexed popup clicks were unreliable; a wrong mock option was detected from its resulting value and corrected with the keyboard. Bulk helper typing and a local synthetic copy/paste attempt did not populate search; their cause is unestablished. Unicode matching/rendering through the accessible value setter passed, while physical IME composition and an actual Windows display-DPI matrix remain unverified.

Reproduce the static evidence with the Ghidra GUI project closed:

```powershell
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\inspect_cover_sheet.py
.\scripts\Analyze-CoverSheet.ps1
& $ChartPython scripts\resolve_workflow.py --cover-sheet
& $ChartPython scripts\verify_cover_sheet.py
```

These commands use the pinned, focused project with whole-program analysis disabled. They write under `analysis/cover-sheet/` and `validation/milestone-3/`. Historical milestone 1 and 2 receipts are preserved. Raw resources, original distributions, downloaded tools, Ghidra databases, caches, and Rust binaries remain ignored.

## Local delivery

The milestone 2 checkpoint is `7923c5b`, tagged `milestone-2-mock`. This work is isolated on `work/milestone-3-cover-sheet`, with its completed checkpoint tagged `milestone-3-mock`. The final mock is left open on SYNTH-001's populated Cover Sheet for review. Review the specification and receipts together with the implementation before expanding panel coverage. Physical IME composition, heard screen-reader announcements, and an actual Windows monitor/DPI/work-area matrix remain separate validation tasks unless supported by observations in the native record.
