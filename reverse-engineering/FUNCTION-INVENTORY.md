# Function inventory and coverage

The saved project defines **41,948 internal functions** and **1,423 external function entries**, totaling **43,371**. Every entry has an address, name provenance, physical module attribution where available, provisional logical subsystem, review status, evidence and uncertainties.

Full inventories: [JSON](catalog/function-inventory.json.gz), [JSONL](catalog/function-inventory.jsonl.gz), [TSV](catalog/function-inventory.tsv.gz). [Static relationships](catalog/function-relationships.jsonl.gz) preserve call sites/counts, incoming/outgoing function targets, literal addresses and RPC-name candidates per entry. [Raw Ghidra inventory](evidence/inventory-reviewed/program.json) preserves original signatures/storage and metadata.

## Review status

| Status | Functions | Meaning |
| --- | ---: | --- |
| Analyzed within explicit scope | 2,245 | 1,518 byte-verified IAT forwarding thunks and 727 exact small-body instruction patterns; underlying callee/ABI or high-level meaning can remain unresolved |
| Partially analyzed | 183 | Historical focused exports and new bounded reviews; semantic and exception/ABI limits are retained |
| Unresolved | 40,943 | Inventoried and structurally classified, without sufficient behavioral review |

**Classification is complete for the discovered inventory. Whole-executable behavioral recovery and exhaustive code discovery are not complete.** Analyzed does not mean that a complete clinical workflow or external contract is recovered.

## Subsystem coverage

| Subsystem | Total | Analyzed | Partial | Unresolved |
| --- | ---: | ---: | ---: | ---: |
| compiler-runtime-and-libraries | 23,858 | 1,977 | 0 | 21,881 |
| cover-sheet-and-vitals | 297 | 15 | 50 | 232 |
| documentation-encounters-and-reminders | 1,434 | 8 | 27 | 1,399 |
| external-libraries | 1,423 | 0 | 0 | 1,423 |
| orders-medications-and-consults | 3,078 | 8 | 33 | 3,037 |
| other-application-modules | 9,924 | 159 | 9 | 9,756 |
| patient-context-and-shell | 530 | 2 | 32 | 496 |
| results-reports-and-graphs | 849 | 3 | 12 | 834 |
| shared-controls-and-accessibility | 1,241 | 13 | 0 | 1,228 |
| transport-authentication-and-integration | 737 | 60 | 20 | 657 |

Grouping follows MAP module ranges, symbols and domain naming, with a recorded assignment basis. The [subsystem catalog](catalog/subsystems.json) lists every module. Shared generic code can have multiple MAP aliases at one address; preserve all aliases instead of assigning semantic intent from one primary name.

## Discovery and evidence

- Imported 65,610 unique file-backed MAP symbols. Symbols include data and class metadata and are not counted as functions.
- Seeded 10,641 provisional code-entry candidates from class-table pointers, serialized handlers, historical function entries and selected MAP routines. The seed report records creation/existing/conflict results.
- Default whole-program analysis exhausted an 8 GB Java heap in AddressTableAnalyzer before saving. A baseline was then saved; controlled discovery disabled address-table creation, decompiler-wide passes, aggressive scanning and stack analysis. The corrected pass completed in 137 seconds without timing out. Logs and exact options are retained.
- Preserved 243,857 static call sites, including 38,574 with no resolved call-reference target. Independently verified 204,270 direct E8 destinations from target bytes, with zero mismatches.
- Verified 3,355 distinct archived direct-call sites and reconciled all 147 historical entry addresses into the current function inventory.
- Cataloged 27,151 instruction references to structurally validated managed literals, including 1,097 references to RPC-like candidates. A use site alone does not establish an argument or server contract.
- Function discovery can still miss unnamed callbacks, exception continuations or indirect targets, and can mistake data for code. [Historical-entry gaps](catalog/historical-entry-discovery-gaps.json), [indirect calls](catalog/unresolved-indirect-calls.jsonl.gz) and [uncertainties](catalog/uncertainties.json) preserve limits.

## Significant changes in Ghidra

- Applied exact MAP labels/names, plus function naming for metadata-guided entries.
- Applied partial class-prefix types at 2,554 validated addresses and managed-literal headers at 32 addresses.
- Defined TIUSignResultPrefix from validated result writes; no guessed function prototype was forced.
- Repaired five confirmed Delphi finally-handler/normal-return continuation spans. No executable bytes were patched.

## Next specific batch

- `009ad030` `ORNet.SetParams`: Recover exact broker argument construction and overload contract.
- `00e19034` `fNotes.TfrmNotes.SaveEditedNote`: Recover note-save branches beneath SaveCurrentNote.
- `009916c8` `Wsockc.TXWBWinsock.NetStart`: Recover transport startup beneath NetworkConnect.
- `00996390` `RpcSLogin.StartProgSLogin`: Recover secure-connection program construction and launch boundary.
- `01192018` `rMisc.LoadDll`: Recover plugin search/loading and error behavior.

The prepared address file is [0004-next-addresses.txt](batches/0004-next-addresses.txt). Continue connected caller/callee batches, checkpointing statuses and uncertainty after each one.
