# Reverse engineering checkpoint

Status: **every discovered function classified; high-level behavioral recovery remains partial**. Target: CPRSChart.exe, `7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544`. No target execution occurred.

Inventory: 41,948 internal + 1,423 external entries. Statuses: 2,245 analyzed within explicit machine-level scope; 183 partial; 40,943 unresolved. Detailed coverage is in `catalog/coverage.json`.

## Next specific action

Export and analyze batch 0004: ORNet.SetParams 009ad030; fNotes.SaveEditedNote 00e19034; Wsockc.NetStart 009916c8; RpcSLogin.StartProgSLogin 00996390; rMisc.LoadDll 01192018. Verify caller ABI, exception continuations, argument schemas and effects, then update address-keyed statuses.

The address file is `batches/0004-next-addresses.txt`. Resume the saved project `projects/CPRSChart.gpr`; use `-noanalysis` for focused exports so bounded reviews do not repeat discovery. Read only that batch and connected evidence, then checkpoint.

## Completed evidence

- Target and MAP hashes exactly match historical exports.
- All 43,371 current function entries have status, subsystem, evidence, structural relationships and uncertainties.
- Controlled discovery succeeded; default analyzer heap failure and the corrected options are preserved.
- 325 forms decoded; 2,554 class metadata records validated and typed.
- 24,793 historical instruction records, 410 literals, 15 VMT words, and 204,270 direct-call destinations byte checked.
- New reviews cover 39 distinct functions; five verified continuation repairs have re-exports.
- Markdown documents, structured specification, full catalogs and reproducibility instructions are persisted.

## Remaining uncertainty

Unresolved routines, indirect dispatch, field layouts, external contracts, configuration, clinical write behavior and missed/false discovery are cataloged explicitly. This checkpoint is not a claim of full behavioral equivalence or an implementation-ready clone.
