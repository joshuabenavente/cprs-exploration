# CPRS Chart first analysis milestone

The reference is the local CPRS Chart client version 1.33.214.5, whose executable identifies patch OR*3.0*639. This milestone establishes the local analysis environment, checks the accompanying MAP against the executable, and specifies patient selection into the chart shell for a future synthetic Rust prototype.

The static milestone is complete: the headless environment launches, the focused project is saved, 41 selected functions have decompiler and instruction exports, and the workflow contract is written. The [validation receipt](../analysis/validation/milestone-1.json) records 33 passing static checks. All 226 stored event bindings across the four extracted forms resolve to MAP symbols. This does not establish that those handlers execute correctly at runtime.

## Scope

The target is `cprs/CPRSChart.exe`. Its MAP and selected embedded form resources provide static evidence. DLL imports are interface boundaries; bundled DLL internals, terminal settings in `vista/`, VistA server implementation, and clinical connectivity are outside this milestone. The CPRS executable has not been launched.

## Reference identity

| Input | Size | SHA256 |
| --- | ---: | --- |
| CPRSChart.exe | 18,141,088 bytes | `7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544` |
| CPRSChart.map | 23,636,974 bytes | `70fa1e8287a30895778711fe2a38d33eb095962b290b9985ec084700d9f4d08a` |

The [reference lock](../provenance/chart.lock.json) pins these inputs. Their presence in the workspace establishes the analyzed specimen; it does not independently authenticate its distribution. No exact public Delphi source snapshot for this build has been established. Older CPRS source is not treated as proof of this binary's behavior.

## Ghidra environment

Ghidra 12.2 and Temurin JDK 25.0.5+8 were downloaded from their official release assets and SHA256 verified against release metadata. Python 3.14.8 runs the standard-library inventory and DFM scripts. The [toolchain lock](../tools/toolchain.lock.json) records URLs and digests.

Ghidra's headless launcher starts successfully with workspace-local settings, caches, and temporary files. It identifies the target as `x86:LE:32:default` with compiler specification `borlanddelphi`. The loader added zero dependency binaries to the project. It read local DLL exports to resolve imported names, including Windows exports; this is distinct from analyzing those DLLs as project targets.

## MAP compatibility

The executable's image base is `0x00400000`. MAP segment starts for `.text`, `.itext`, `.data`, and `.bss` equal the corresponding PE virtual addresses, and all four segment sizes match. The MAP entry `0002:00006034` resolves to the PE entry address `0x01224034`.

The MAP's `.tls` start is zero and does not match the PE TLS section address. TLS labels are excluded rather than assigned a guessed relocation. The zero-length `.pdata` entry is also excluded. File-backed labels are exported in [chart-symbols.tsv](../analysis/inventory/chart-symbols.tsv).

The focused project imported 65,610 labels with zero importer failures and initially seeded 34 workflow functions. The focused export was then expanded to 41 entry points, including overloaded broker calls. That label count includes runtime and data symbols; it is not a count of recovered application functions. The importer and exporter pin the executable hash. Entry-point and section agreement, readable workflow code, and form-handler references support using this MAP for this specimen; they do not prove reproducibility from its original build inputs.

## Saved project and workflow exports

The saved project is `analysis/projects/CPRSChartFocused.gpr`, containing `CPRSChart.exe`. Whole-program automatic analysis is disabled. Forty-one selected functions have C-like decompiler output and instruction listings under `analysis/decompiled/`. The [function register](../analysis/decompiled/workflow-functions.tsv) gives their entry addresses and export status; the [call-site table](../analysis/decompiled/workflow-calls.tsv) resolves direct calls through MAP labels and marks indirect calls explicitly. The project also contains loader-created functions; its total function count is not a measure of completed manual analysis.

For `fFrame.TfrmFrame.mnuFileOpenClick`, ordinary flow-following stopped at a Delphi finally trampoline. The exporter seeds the continuation at `0x00ff4e2e` and bounds the body before the next MAP public at `0x00ff56a0`. Its instruction listing then contains calls to `fPtSel.SelectPatient` at `0x00ff50d3` and `0x00ff51ca`, and multiple calls to `SetupPatient`, including `0x00ff5276`. The C output still omits some exception continuation paths. The instruction listing and call-site table are the evidence for these edges.

The resolver preserves raw Ghidra output and writes separate MAP names and string-literal annotations. Literal extraction validates the Delphi string header, element width, reference count, length, terminator, and file-backed address. It does not assign server parameter types or permissions to recovered RPC names.

## Form resources

The PE inventory contains 590 resource leaves and 23 direct import descriptors. Four selected form resources were copied by exact file offsets and decoded completely:

| Resource | Bytes | Purpose |
| --- | ---: | --- |
| TFRMPTSEL | 15,169 | Patient-selection controls and events |
| TFRMFRAME | 27,420 | Main chart frame and tab controls |
| TFRMPTSELMSG | 1,355 | Patient-selection message form |
| TFRMDUPPTS | 2,363 | Duplicate-patient dialog |

The [inventory](../analysis/inventory/chart-inventory.json) records resource paths, RVAs, file offsets, and sizes. Raw resource copies and decoded JSON are under `analysis/resources/`. These are inherited forms; omitted properties are not assumed to equal a guessed base default. The decoder omits binary image content from JSON while preserving its byte count.

## Analysis limits

The first whole-program automatic pass exhausted a 4 GB Java heap in `SharedReturnJumpAnalyzer` before saving the imported program. Its log is retained at `analysis/logs/initial-full-analysis.log`. It also reported delay-import table warnings, some Windows export-parsing warnings, two invalid-PNG detections at `0x0122e251` and `0x012352f8`, and decompiler unreadable-address warnings. The focused project was subsequently imported and saved successfully with whole-program analysis disabled. The four selected DFM resources passed complete parsing and byte-for-byte extraction checks separately.

Decompiled output requires manual interpretation of Delphi managed types, exceptions, indirect calls, and calling conventions. A successful decompilation does not establish backend RPC metadata, site permissions, accessibility, clinical safety, or live compatibility. No GUI or assistive-technology validation of CPRS has been performed.

## Rust handoff

The [workflow specification](../specifications/patient-selection-chart.md) separates binary observations from proposed prototype policy. Its [16 synthetic acceptance cases](../specifications/patient-selection-cases.json) were specified during milestone 1 and subsequently implemented and checked in [milestone 2](milestone-2.md). [Milestone 3](milestone-3.md) extends the mock into two Cover Sheet panels.
