# Reimplementation plan

The recovered evidence supports a staged replacement effort and an inventory of remaining work. It does not yet support claiming complete CPRS compatibility. [Coverage](catalog/coverage.json) quantifies reviewed forwarding functions, partially reviewed routines and unresolved routines. A module assignment or successful decompilation is not implementation-ready behavior.

## 1. Preserve the reproducible reference

Pin the executable, MAP, supplied DLLs and help files to the input manifest. Retain Ghidra version, language/compiler IDs, import options, analysis timeout, scripts, logs, changes and inventories. Re-run `extract_static.py` to validate bytes/resources and `consolidate.py` after Ghidra changes. Function identity is address plus specimen hash; preserve all MAP aliases and overload addresses.

Keep evidence as immutable inputs to review. Store interpretation separately, with supporting instruction/data addresses, confidence and limitations. Treat the saved Ghidra project as a derived artifact that can be rebuilt from the pinned input and scripts.

## 2. Finish semantic requirements before compatibility claims

Use the complete classified inventory to select connected batches rather than arbitrary address order. Start with the high-fan-in broker overloads and patient-context boundaries, then document, order and report service wrappers, then the UI callers and plugin integrations. Trace shared state and error propagation across each batch.

For every routine promoted to analyzed status, recover meaningful branches, inputs/outputs, hidden register arguments, side effects, object ownership, exception cleanup and caller obligations. Resolve indirect calls through validated class/interface tables. Function interiors reached after Delphi finally trampolines need explicit continuation analysis. Keep unknown paths as specific questions with exact next addresses.

The current exact next actions are recorded in [PROGRESS.md](PROGRESS.md) and [progress.json](progress.json), including selected function entries. A continuation should resume those actions without reloading all decompiled output.

## 3. Define a typed compatibility boundary

Separate patient identity, encounter state, pending changes, view context, domain records, broker session and display models. Derive field meanings from actual accesses and exact server contracts. Do not adopt decompiler `undefined4` types as application interfaces or infer a complete object layout from its instance size.

Preserve opaque delimited values while field semantics remain unresolved. Record encoding, scalar/list framing, positional field rules, nulls, sentinels and date representations for each operation. A row projection is a display transformation, not a complete server schema.

For broker operations, recover parameter order/types and result/error behavior in both caller and callee. Distinguish dynamically configured RPC names from fixed literals. OS and DLL contracts need explicit calling conventions, allocator ownership and lifetimes. Imported API presence is insufficient to specify integration behavior.

## 4. Implement components by evidence-backed contracts

| Component | First supported work | Completion gate |
| --- | --- | --- |
| Reference loader/catalog | PE/MAP metadata, resources, class/literal catalogs and stable address identities | Exact hashes, bounds checks and repeatable catalog counts |
| Core context model | Patient setter, encounter/change clearing and chart-page lifecycle | Recovered context-change/cancel/access branches and field ownership |
| Display models | Stored forms and explicitly recovered row projections | Complete selected view paths, null/error behavior and effective configuration |
| Broker adapter | Exact operation definitions and a deterministic test double | Verified serialization, response grammar, auth/context, failures and retries |
| Notes/results/order viewing | Recovered list/detail selection and reset behavior | All relevant calls/branches and view-context effects documented |
| Editing/signing/ordering | Implement only after independent write-path requirements are recovered | Locks, validation, permissions, signatures, server effects and rollback/error handling established |
| Plugin/integration layer | Explicit configured dispatch contracts | DLL exports/ABIs and complete caller/callee behavior recovered |
| UI shell/accessibility | Stored hierarchy and verified input/event behavior | Inheritance/runtime handlers, focus/navigation and accessibility behavior validated |

A synthetic prototype may choose stronger race/ownership guards, different layouts or a restricted feature set. Those choices must be labeled design policy, not behavior recovered from this specimen. Existing Rust synthetic code can provide implementation examples but cannot serve as an oracle for original semantics.

## 5. Validate with meaningful oracles

- **Static extraction checks:** compare every instruction/literal/VMT claim with the pinned bytes; verify address mapping, resource extents and complete parser consumption.
- **Structural checks:** reconcile every discovered function with a status, physical module, logical subsystem, evidence and specific uncertainties; track MAP/code gaps separately from functions.
- **Contract checks:** test serializers/parsers using inspectable, authorized examples or exact-match source-derived cases. Include empty/error/malformed data, encoding, delimiter escaping, nulls and date boundaries.
- **State-machine checks:** verify patient changes, pending edits, access decisions, cancellation, locks, partial failures and retry behavior using recovered preconditions and effects.
- **Component equivalence checks:** compare deterministic algorithms at the input/output level where source and disassembly establish the algorithm. Shared names alone do not establish equivalence.
- **UI/integration checks:** stored resources are a starting point. Runtime navigation, inheritance, dispatch, site configuration and external effects require separate evidence before parity claims.

The original target has not been executed during this work. Dynamic reference execution or interaction with external systems remains outside the present authorization; the static workflow can continue independently.

## 6. Close uncertainty with explicit acceptance criteria

Whole-program behavioral completion requires more than classifying the current Ghidra inventory: assess missed/false function discovery, resolve required indirect dispatch, finish domain record/interface schemas, establish effective access/signature policy, recover configuration-driven paths, and validate relevant DLL boundaries. Every remaining uncertainty must be either resolved or retained as a documented limitation on the replacement's scope.

Deliver a traceability matrix from each required feature to claims, functions, structures, interfaces and tests. A buildable implementation without that traceability does not establish fidelity to this executable.
