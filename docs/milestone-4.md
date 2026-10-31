# Milestone 4: read-only mock Notes

The new Notes browser uses compiled, invented records. It shares the existing committed patient header and patient-selection/access guards. Cover Sheet remains available; Orders and Results remain placeholders. No original CPRS component or analysis artifact is loaded by the Rust runtime.

Run `scripts/Start-MockChart.ps1`; choose CARTER, JAMIE / SYNTH-001, then Notes. Selecting a row loads its document automatically. Duplicate titles intentionally have different note IDs. The Unicode record contains 80 invented sections for scrolling; “Empty body demonstration” loads successfully with no document text. SYNTH-002 has no invented notes.

Ctrl+F focuses the Notes filter. Filter by title, subject, author, location, or mock note ID; `李` finds the Unicode record. Enter from the list or “Read selected note” moves focus into the read-only text; Escape returns to the list. Ctrl+O opens patient selection and clears Notes transient data. Cancel keeps the committed patient and Notes tab and reloads its list without restoring a previous selection or body. Native clipboard observations and any unresolved limits are recorded in `validation/milestone-4/native-input.json`.

Clipboard behavior depends on the launch context observed here. The shell-launched process accepted manual typing but failed paste; the same executable opened through the native app launcher successfully copied and pasted the invented Unicode string. The user subsequently confirmed that manual paste also works after the final native relaunch. This is a user-reported result, distinct from the tool checks. For manual use, open `target/debug/cprs-chart-mock.exe` from Explorer or run the script from an ordinary user PowerShell session. That ordinary-shell route has not been separately validated here. No security settings or input-code workaround were introduced. Bulk text delivery from the automation tool remains a separate limitation.

The Notes scenario control provides list failure, document failure, and slow replies. Reset it to Normal notes to recover. Retry buttons repeat only the requested mock operation; they do not silently change the simulation. NOTE-01 responds more slowly than NOTE-02 in the slow scenario. Changing rows clears the previous body immediately, and request generations discard late deliveries.

## Evidence and implementation

The [Notes specification](../specifications/notes.md) separates stored-form and instruction findings from authored behavior. Three forms were decoded completely. Twenty focused MAP-named functions retain assembly, decompilations, call sites, and resolved literals. The static receipt pins these outputs to the original executable/MAP hashes. The ordinary document-text wrapper is distinct from the detailed-display wrapper; RPC strings are clues only.

The flat-list layout, fixed newest-first ordering, substring filter, status labels, keyboard focus actions, mock data, asynchronous generation guards, and in-window body pane are authored policy. The original has a tree and context-dependent list visibility, plus editor/PCE/notification paths that this milestone excludes. Enter/double-click handlers inspected in the original specifically recognize SHOW MORE; they are not evidence for general document-edit activation.

`crates/chart-core/src/notes.rs` defines owned summaries, list/document requests, state, response validation, deterministic ordering, and compiled payload generation. Each document delivery must match both the active patient and selected note as well as its pending generation. Lists reject wrong owners, duplicate note IDs, blank titles, and malformed timestamps. Empty results are separate from provider errors; an empty document is a successful, separately labeled outcome.

`crates/chart-desktop/ui/notes-view.slint` provides a five-column list and a selectable, read-only Courier New text view. The adapter preserves unchanged row models and keeps focus in the list during background document retrieval. A scrolling workspace keeps the patient header/navigation fixed at smaller sizes and larger application scale factors.

## Reproduce checks

Close the mock before rebuilding. Offline automated checks are written only under `validation/milestone-4/`; earlier milestone receipts remain historical.

```powershell
.\scripts\Test-MockChart.ps1
$ChartPython = "$env:LOCALAPPDATA\Python\pythoncore-3.14-64\python.exe"
& $ChartPython scripts\inspect_notes.py
.\scripts\Analyze-Notes.ps1
& $ChartPython scripts\resolve_workflow.py --notes
& $ChartPython scripts\verify_notes.py
```

Keep the Ghidra GUI project closed during the focused export. Do not enable whole-program analysis. Native visual/keyboard/input observations, automated callback/core checks, static-source evidence, and Narrator speech remain separate categories. Narrator spoken output remains unverified at the user's earlier request. No original-client runtime behavior, server contract, permission model, live connectivity, or clinical compatibility is established.

The final build passed formatting, warning-free Clippy, 40 core workflow tests (12 Notes cases plus 28 regressions), an offline build, and callback smoke checks. Native checks covered long Unicode text selection and attempted overwrite, successful empty document/list states, list/text failure and retry, Enter/Escape focus paths, patient-selection cancellation, and 100%/200% minimum-size samples. Immediate UIA focus snapshots sometimes lagged native caret/selection, and an indexed action at 200% selected the wrong navigation button; screenshot coordinates/native keys supplied separate evidence. Complete assistive-technology conformance, physical IME/dead keys, and intermediate Notes scale factors remain unverified.
