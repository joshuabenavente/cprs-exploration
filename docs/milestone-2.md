# Mock Rust patient selection and chart shell

The native Windows prototype implements patient selection, demographic preview, a committed patient header, and a read-only chart shell. All eight records are invented and compiled into the application. The desktop is labeled mock-only throughout. It has no broker transport, endpoint configuration, credentials, clinical writes, or patient-file import.

## Run the app

From the workspace root:

```powershell
.\scripts\Start-MockChart.ps1
```

Use `-Rebuild` after source changes, or run `cargo run -p cprs-chart-mock --locked --offline`. The native executable is `target/debug/cprs-chart-mock.exe`. The app uses Slint 1.18.1 with the winit backend, software renderer, Windows accessibility integration, and a light desktop style. Exact dependencies are recorded in `Cargo.lock`.

## Mock workflows

Search by a display-name fragment, exact synthetic ID, or demo lookup such as `x1001`. The demo lookup codes are not SSNs. The provider preserves fixture order and pages four rows at a time. `All fixtures` and `Demo roster` are invented list modes; the roster is not an access-control mechanism. They do not implement the original CPRS restricted-patient list rules.

Selecting a row previews its identifier, fixture birth date, training location, and mock access decision. The active chart remains unchanged until confirmation succeeds and the matching chart snapshot loads. OK and double-click use the same confirmation path. Cancel discards pending work while preserving any active chart. With no active chart, Cancel returns to an empty shell rather than closing the application.

| Fixture | Demonstration |
| --- | --- |
| CARTER, JAMIE · SYNTH-001 | Allowed selection; demo lookup `x1001` |
| NGUYEN, RILEY · SYNTH-002 | Another allowed chart for patient-switch checks |
| MORGAN, ALEX · SYNTH-003 and SYNTH-004 | Duplicate names with distinct IDs and fixture birth dates |
| PATEL, SAM · SYNTH-005 | Explicit mock access acknowledgment |
| RIVERA, TAYLOR · SYNTH-006 | Mock access denied |
| STONE, CASEY · SYNTH-007 | Mock access decision unavailable; opening is blocked |
| WATTS, JORDAN · SYNTH-008 | Synthetic deceased-record acknowledgment |

The simulation selector exposes normal operation, unavailable search, malformed results, unavailable chart loading, and slow search. Normal responses are delayed briefly in the UI event loop. Slow search alternates response delays by query length so older requests can arrive after newer ones. Each request carries a generation; stale or duplicate search responses and canceled chart responses are ignored.

The Overview tab shows training location, an invented visit, and a synthetic summary. Notes, Orders, and Results show explicit unimplemented placeholders. These tab names and their order are authored prototype navigation, not a recovered CPRS tab contract. The fixed fixture date is 31 October 2026; it is not a live-data timestamp.

Keyboard bindings include Ctrl+O for selection, Ctrl+F for search, Enter in search to focus the result table, arrows to select a row, Enter or the OK button to confirm, and Escape to dismiss the prompt or cancel selection. Standard controls expose focus and accessibility properties. Runtime observations and their limits are recorded separately from source-level support.

## Implementation

`crates/chart-core` contains synthetic identifiers, strict fixture parsing, the provider trait, cursor requests, access decisions, chart snapshots, and the state machine. It has no third-party dependencies. `crates/chart-desktop` contains the Slint view and adapter. Neither crate imports anything from the Ghidra analysis, original CPRS files, terminal profiles, or another project.

`pending` selection and `active` chart identity are separate. The adapter snapshots the mock provider per scheduled response; later simulation changes cannot reinterpret an earlier response. The state machine commits the patient header and chart snapshot together only when the response matches the pending request and exact identifier. Editing the query, paging, changing list mode, and canceling invalidate pending selection and chart work. Mock acknowledgment is bound to the pending ID and is rechecked before chart loading.

The fixture parser rejects malformed field counts, invalid synthetic IDs, invalid fixture dates, invalid lookup codes, unknown access decisions, and duplicate IDs. Its pipe-separated format is local to this prototype and is not a CPRS or VistA wire contract. Authored Rust disallows unsafe code; the generated Slint module has a narrowly scoped allowance.

## Verification

Close the running mock app, then run the reproducible offline checks with:

```powershell
.\scripts\Test-MockChart.ps1
```

The script checks formatting, Clippy with warnings denied, workspace tests, the Windows build, and a UI callback smoke run. Logs and an executable hash are written under `validation/milestone-2/`. The callback smoke invokes the generated UI callbacks with immediate mock responses; it does not simulate native mouse input or assistive technology.

The [automated receipt](../validation/milestone-2/automated.json) records all five checks passing, including 19 core tests and the callback smoke. The [acceptance matrix](../validation/milestone-2/acceptance.json) maps each original case to its evidence. After app access was approved, bounded native visual, mouse, and keyboard checks were completed; the [native UI record](../validation/milestone-2/native-ui.json) lists individual observations and limits.

Native checks covered duplicate-name navigation into SYNTH-004, a read-only chart and Notes placeholder, reopening and canceling without changing the current chart, PATEL's acknowledgment prompt, WATTS's deceased-record prompt and keyboard acceptance, RIVERA's denied switch, forward paging, and the unavailable-search simulation. Enter, arrows, Ctrl+O, Ctrl+F, Tab focus, and Escape were exercised. The demographic preview was constrained to its intended width, and the Demo lookup column was widened after visual inspection. The final executable was then checked for complete result headers, native OK selection into SYNTH-001, and keyboard reopening/cancellation while preserving that chart. It was left open on the synthetic Overview for review.

These observations cover the default 1180 by 800 client size. Minimum-size resizing, high-DPI variations, exhaustive traversal, screen readers, and Unicode/IME entry remain unverified. Bulk literal-text injection through the helper did not populate search; ordinary native character input and the input's accessible value setter worked. Some accessibility focus captures lagged the visible focus indicator.

The core tests cover exact-ID duplicate-name selection, pending/active identity separation, stale and duplicate responses, scoped forward/backward cursors, cancellation during chart loading, access denial and unavailable decisions, acknowledgment requirements, malformed/empty/error results, mismatched chart identities, failed loads, queued selection events during prompts, and placeholder tabs. The [original acceptance cases](../specifications/patient-selection-cases.json) remain prototype policies, not original CPRS runtime results.

Visual layout, native keyboard behavior, and assistive-technology evidence must be labeled according to what was actually observed. Enabling Slint's accessibility feature does not establish screen-reader compatibility. This milestone does not establish CPRS feature parity or production clinical compatibility.
