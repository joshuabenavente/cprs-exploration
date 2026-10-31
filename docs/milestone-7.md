# Milestone 7: integrated chart validation and accessibility hardening

The mock now has a repeatable desktop journey using real Slint timers, in addition to its core tests and immediate callback smoke. The journey checks cross-tab and cross-patient behavior and records accepted/rejected deliveries. The [integrated acceptance contract](../specifications/integrated-chart.md) defines the workflow and keyboard differences.

Accessibility changes put selected synthetic identities into patient/list/document accessible names, put initial Cover Sheet detail focus on its read-only text, and return browser selection cancellation to the active tab's filter. The toolbar advertises shortcuts for the current context. Notes still loads selection automatically; Orders and Results still require explicit opening. A read-only focus observation binding supports the opt-in check and is never displayed as product UI.

## Reproduce

Close any running mock before rebuilding. Run from an ordinary local PowerShell session:

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\verify_integrated.py
```

This runs formatting, Clippy, the existing 70 core cases, offline build, immediate callback smoke, and the real-timer desktop journey. The latter invokes callbacks in the shown desktop event loop; it does not inject physical keys or hear speech. New receipts/logs go only under `validation/milestone-7/`.

For a repeatable native review state:

```powershell
.\scripts\Start-MockChart.ps1 -IntegratedReview -ScaleFactor 1.25
.\scripts\Start-MockChart.ps1 -IntegratedReview -MinimumSize -ScaleFactor 1.25
```

Close each instance before opening the next sample. Repeat at 1.5 and 1.75. Integrated review runs the timed journey and then leaves SYNTH-001 / Results / long REPORT-03 open. `M7_WINDOW` reports actual client pixels and application scale; requested/default dimensions alone are not proof of actual window geometry. Scale overrides are process-local and do not change Windows display settings. The native app launcher remains the previously verified clipboard path for ordinary launches; shell-started review samples are primarily for layout.

Scale-override, minimum-size, and integrated-check launches place the window at the desktop origin. An initial default 150% review had been clipped below the desktop because of Windows' cascade placement; that capture was not counted as a layout pass. The final layout matrix is rerun after deterministic placement, without changing display settings.

## Validation results

The final executable passed formatting, warning-free Clippy, all 70 existing core tests, immediate callback smoke, and the 41-checkpoint real-timer journey. The journey observed 62 deliveries and rejected 26 stale replies. Its ownership/inactive-binding checks and focus probes passed. `validation/milestone-7/integrated.json` records the checkpoints and delivery decisions and hashes the log; these are callback/binding observations, not injected native input or speech.

All six final scale samples also completed the journey and were inspected natively. With the long Unicode Results report open, the reading pane and View/Close actions fitted inside their card through focus scrolling, and patient header/navigation/status stayed visible. Actual client pixels were 1475x1000 and 1225x850 at 125%, 1770x1200 and 1470x1020 at 150%, and 2065x1400 and 1715x1190 at 175% (default and minimum respectively). The recorded full-window captures included the window frame; 16x16 related surfaces were excluded from geometry judgments. Logs and native observations are in `validation/milestone-7/`.

The ordinary native-launch 100% keyboard tour verified both MORGAN identities in the patient table name, Cover Sheet initial text focus and return to its originating panel, Notes automatic loading with text retained on Escape, and Orders/Results explicit opening with text cleared on Escape and selection retained. Ctrl+A demonstrated actual reading-pane text focus. Native Ctrl+O/Escape restored local filters on Notes at 100% and Results at minimum 175%; the timed journey separately verified Orders cancellation focus. Immediate UIA selected-name/document/focus snapshots sometimes retained prior state; fresh captures, native arrow navigation, caret, and text selection established the corresponding settled behavior separately.

The combined listening checklist for the changed Milestone 7 labels and focus behavior remains unverified pending a separate user report. Earlier scoped Notes, Orders, and Results listening passes are preserved as historical evidence.

## Combined manual checklist

Use only the invented records. With Narrator on, verify the patient ID and selected report identity in Results, Ctrl+F to its filter, and Escape returning to its list. On Notes, select a row and use Enter to read its text; Escape returns to the list with text retained. On Orders, confirm selection does not open text, then Enter reads the matching item and Escape clears it while retaining the row. On Cover Sheet, select a Problem List item and press Enter: focus should start in read-only detail, and Escape should restore the panel. From a browser tab, Ctrl+O then Escape should return to its filter. Report missing/incorrect labels or speech separately from visual/keyboard behavior.

The current milestone is an offline synthetic checkpoint. No original CPRS process or clinical server is involved, and runtime code does not load analysis output. Original-client parity, clinical compatibility, server contracts/site permissions, full assistive-technology conformance, monitor-DPI changes, and physical IME/dead keys remain outside the demonstrated scope.
