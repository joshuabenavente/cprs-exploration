# CPRS Chart reverse engineering specification

The uploaded archive contains **CPRSChart.exe 1.33.214.5**, a 32-bit Delphi Windows client. Its SHA-256 is `7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544`; executable and MAP exactly match the historical focused exports.

**Every discovered function is classified. High-level behavioral recovery remains partial.** The saved inventory contains 41,948 internal functions and 1,423 external entries: 2,245 analyzed within explicit forwarding/small-instruction scope, 183 partially analyzed, and 40,943 unresolved. No target code was executed and no external systems were modified.

## GitHub copy

These reports and JSON files are available directly in this folder. Large catalogs are gzip-compressed; run `./Expand-Catalogs.ps1` from PowerShell to restore their original paths after checkout. See [PUBLICATION.md](PUBLICATION.md) for what is included and how to copy this folder into the Windows checkout. The original validation receipt describes the source workspace; the publication manifest separately records copied and compressed files.

## Deliverables

| Deliverable | Readable document | Structured evidence |
| --- | --- | --- |
| Architecture | [ARCHITECTURE.md](ARCHITECTURE.md) | [Subsystems](catalog/subsystems.json), [graph](catalog/subsystem-call-graph.json) |
| Function inventory | [FUNCTION-INVENTORY.md](FUNCTION-INVENTORY.md) | [JSON](catalog/function-inventory.json.gz), [JSONL](catalog/function-inventory.jsonl.gz), [TSV](catalog/function-inventory.tsv.gz), [relationships](catalog/function-relationships.jsonl.gz) |
| Data structures | [DATA-STRUCTURES.md](DATA-STRUCTURES.md) | [Classes](evidence/static/classes.jsonl), [literals](evidence/static/managed-literals.jsonl.gz), [field accesses](catalog/verified-field-accesses.jsonl) |
| External interfaces | [EXTERNAL-INTERFACES.md](EXTERNAL-INTERFACES.md) | [Imports](evidence/static/imports.jsonl), [exports](evidence/static/exports.json), [DLLs](catalog/components.json), [RPC use sites](catalog/rpc-literal-use-sites.jsonl) |
| Behavior | [BEHAVIOR.md](BEHAVIOR.md), [REVIEW-NOTES.md](REVIEW-NOTES.md) | [Verified claims](catalog/verified-claims.json), [bounded review](evidence/batch-0001/annotations.json) |
| Reimplementation | [REIMPLEMENTATION-PLAN.md](REIMPLEMENTATION-PLAN.md) | [Specification index](specification.json), [uncertainties](catalog/uncertainties.json) |
| Reproduction | [REPRODUCE.md](REPRODUCE.md) | [Validation](validation/final-receipt.json), [options](evidence/analysis-options.json) |
| Checkpoint | [PROGRESS.md](PROGRESS.md) | [progress.json](progress.json), [next batch](batches/0004-next-addresses.txt) |

## Evidence and verification

- Decoded all 325 binary forms with complete consumption; preserved 4,371 stored event bindings.
- Validated 2,554 class metadata records and applied partial types in Ghidra, plus 32 managed-string header applications and a signature-result prefix type definition.
- Compared 24,793 archived instruction records, 410 literals and 15 VMT words with uploaded bytes: zero mismatches.
- Independently checked 204,270 direct E8 call destinations: zero mismatches. Preserved 243,857 static call sites and 38,574 unresolved indirect sites.
- Reviewed 39 distinct new functions in bounded batches; re-exported five after repairing confirmed Delphi cleanup continuations.
- Cataloged 803 normal imports, 638 delayed imports, two executable exports and 69 DLL export entries.

The saved project is [projects/CPRSChart.gpr](PUBLICATION.md#local-reference-assets). Open it with Ghidra 12.2 and keep its adjacent `.rep` directory. No Ghidra MCP tools were exposed; analysis used the installed local headless engine. The default pass exhausted an 8 GB heap; controlled discovery then completed successfully in 137 seconds without timing out.

## Interpretation limits

Classification is not complete semantic recovery. An analyzed thunk delegates external behavior; an analyzed getter can still have unknown Pascal field meaning and caller preconditions. MAP names, generic aliases, decompiled C and resource bindings are evidence inputs, not guarantees of runtime behavior. Server contracts, many instance fields, configuration-driven dispatch, clinical write policy and substantial function semantics remain unresolved. The existing synthetic Rust prototype is not a behavioral oracle.

The full JSON inventory is intentionally large. Prefer JSONL/TSV or address-filtered queries for bounded inspection. Resume from the exact next action in the checkpoint rather than loading all decompiled output.
