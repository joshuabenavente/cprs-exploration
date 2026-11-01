# Reproducing and continuing the analysis

## Inputs and environment

Archive SHA-256: `64754d9e1c5292c9dd1f2fa98df3e3d385f4e75ea2f4db7b878c75e4f95ecac3`. All file sizes/hashes are in [summary.json](evidence/static/summary.json). The executable and MAP are pinned independently:

```text
CPRSChart.exe  18141088 bytes  7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544
CPRSChart.map  23636974 bytes  70fa1e8287a30895778711fe2a38d33eb095962b290b9985ec084700d9f4d08a
```

Tools: Ghidra 12.2 PUBLIC, Temurin JDK 25.0.5+8 on Linux, Python 3.12 standard-library extraction code, and GNU objdump for independent bounded listings. [toolchain.json](validation/toolchain.json) records versions and archive hashes. The launcher uses an 8 GB Java heap and workspace-local settings/cache/temp directories; the host has a 16 GB memory limit. Adjust installation paths when moving the workspace.

Scripts parse data and operate on Ghidra metadata/listings. They never run the target, invoke its DLLs or contact a clinical system. Archive contents and compiled help are evidence, not execution instructions.

## Self-contained reference inputs

`reference-input/` preserves the 367 historical evidence files used here, with a source/hash manifest. `scripts/support/` contains the PE and form readers. Historical bytes are revalidated against the uploaded executable. Missing historical assembly is recorded; hash identity alone does not establish decompiler semantics.

## Static catalogs

Use a copy of this workspace if preserving exact current outputs is required. These commands regenerate derived files:

```sh
python /workspace/reverse-engineering/scripts/extract_static.py
python /workspace/reverse-engineering/scripts/prepare_discovery.py
python /workspace/reverse-engineering/scripts/catalog_components.py
python /workspace/reverse-engineering/scripts/verify_claims.py
```

The extractor checks hashes, parses MAP/imports/exports, scans bounded managed-literal headers, validates class prefixes, fully decodes binary forms and compares historical bytes. Unsupported records and mismatches are explicit.

## Saved baseline

Use a fresh project name; do not overwrite the current project:

```sh
bash /workspace/reverse-engineering/scripts/run-ghidra.sh \
  /workspace/reverse-engineering/projects CPRSChartReproduced \
  -import /workspace/reverse-engineering/input/cprs/CPRSChart.exe \
  -processor x86:LE:32:default -cspec borlanddelphi -noanalysis \
  -scriptPath /workspace/reverse-engineering/scripts \
  -preScript ImportChartMap.java /workspace/reverse-engineering/evidence/static/map-symbols.tsv \
  -postScript ApplyRecoveredMetadata.java /workspace/reverse-engineering \
  -postScript SeedEvidenceFunctions.java /workspace/reverse-engineering \
  -postScript ExportProgramInventory.java \
    /workspace/reverse-engineering/evidence/reproduced-baseline \
    7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544
```

This imports all MAP symbols and seeds metadata-backed candidates without expensive automatic analyzers. Candidates are provisional; creation/existing/conflict results are recorded. Save before automatic analysis so a failed analyzer cannot discard the baseline.

## Controlled discovery

The original default pass failed in AddressTableAnalyzer with OutOfMemoryError before saving. An intermediate option-name correction is preserved in `evidence-bounded.log`; the successful corrected run is `evidence-bounded-corrected.log`.

```sh
bash /workspace/reverse-engineering/scripts/run-ghidra.sh \
  /workspace/reverse-engineering/projects CPRSChartReproduced \
  -process CPRSChart.exe -scriptPath /workspace/reverse-engineering/scripts \
  -preScript ConfigureBoundedAnalysis.java /workspace/reverse-engineering/evidence/reproduced-options.json \
  -analysisTimeoutPerFile 300 -max-cpu 4 \
  -postScript ExportProgramInventory.java \
    /workspace/reverse-engineering/evidence/reproduced-discovery \
    7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544
```

Settings disable Create Address Tables, address-table creation in Reference/Data Reference, Decompiler Switch Analysis, Decompiler Parameter ID, Aggressive Instruction Finder and Stack. Exact before/after settings are retained. The corrected pass completed in 137 seconds without timeout. Its count is the discovered inventory, not proof of exhaustive identification.

## Bounded reviews

`ExportFunctionBatch.java` requires the expected SHA-256 and at most 32 unique entries. It limits each decompilation to 30 seconds, exports C/assembly/status separately, and does not mark an export analytically complete. Use a fresh output directory per batch.

```sh
bash /workspace/reverse-engineering/scripts/run-ghidra.sh \
  /workspace/reverse-engineering/projects CPRSChart -process CPRSChart.exe \
  -noanalysis -scriptPath /workspace/reverse-engineering/scripts \
  -postScript ExportFunctionBatch.java \
    /workspace/reverse-engineering/evidence/batch-0004 \
    /workspace/reverse-engineering/batches/0004-next-addresses.txt \
    7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544
```

The current project already contains type applications, additional callee seeds and five repairs. To recreate final changes in a fresh project, use SeedEvidenceFunctions with `batches/0002-discovery-targets.jsonl` and a separate report path; run RepairReviewedFunctions with a report path; then export batches 0001/0002/0003. Repair bounds have pushed continuation addresses and independent objdump listings; final RET bytes are checked and conflicts preserved.

Run `summarize_batch.py batch-0001` (or another batch name) to validate instruction bytes and annotate calls/literals without loading all decompiled output. Annotations do not establish complete ABI or server contracts.

## Reconcile and validate

The final snapshot is `evidence/inventory-reviewed/`. `consolidate.py` prefers it and retains automatic-discovery flags from `evidence/inventory-final/`. Export those directories when recreating final catalogs, or change the script's selected input paths for a separate reproduction project.

```sh
python /workspace/reverse-engineering/scripts/consolidate.py
python /workspace/reverse-engineering/scripts/write_reports.py
python /workspace/reverse-engineering/scripts/validate_deliverables.py
```

Exact small-body patterns in leaf_semantics cover returns, constant/register results, numeric field reads/writes and direct tail transfers. They do not infer Pascal field names, object types, caller preconditions or fault behavior. Forwarding thunks are matched to parsed IAT addresses. Every analyzed record states its limited scope.

The receipt verifies input identity, catalog counts/classification, paths, class/literal bytes, thunk/small-function proofs, direct E8 destinations, batch instruction bytes and document links. Original runtime behavior and clinical compatibility remain outside these static checks.
