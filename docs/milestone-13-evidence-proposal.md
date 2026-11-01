# M13 proposal: evidence reconciliation and portable read-only baseline

Status: **planned; new-analysis reconciliation blocked on bundle availability**.
Owner: project manager / technical reviewer. Baseline:
`8fec66d98b969c9c91f91bf56afaddbbe49357cf` on local `work`.
This plan establishes priorities; it does not claim M13 implementation complete.

The current mock passes all 96 portable core tests. Its accepted Windows build
has inherited automated evidence, targeted native captures, and user-reported
ten-combination native/listening acceptance. The new whole-program analysis is
absent from this environment. The next useful deliverable is a coherent,
inspectable evidence baseline that preserves those distinctions. No new domain
feature or broad refactor is needed to deliver it.

## Scope and sequence

| Order / work item | Concrete deliverable | Dependency / completion condition |
| --- | --- | --- |
| 1 / E01: acquire and verify analysis | External workspace containing bundle hash/size/file manifest, specimen EXE/MAP hash comparison, original final receipt, coverage and uncertainty catalog checks. Keep original archive and raw files intact. | Bundle path/link required. List ZIP entries and check traversal/symlink/uncompressed-size hazards before extraction. Read documentation as evidence; do not run bundled scripts automatically. |
| 2 / E02: reconcile read-only contracts | Versioned feature-to-evidence crosswalk extending the current matrix; decision entries for every conflict affecting patient selection, five panels, Notes, Orders and Results. | E01. Inspect the requested README, specification, inventory, architecture, data structures, interfaces, behavior, review notes, reimplementation plan, coverage, uncertainties, final receipt and progress files. Use address-filtered queries for exports. |
| 3 / E03: preserve Windows evidence portability | Exact accepted `a88c…` executable available as an explicitly located archival artifact; SHA256 and source/build manifest verification; supplemental result linking historical receipts without rewriting them. | Artifact location required. Reuse the current read-only follow-up verifier when its expected exact artifact is restored. A differing rebuild is a separate build with separate validation. |
| 4 / E04: portable baseline and status | Independent Linux receipts plus a durable status/risks/decision register, current operational pointers, and explicit pass/blocked/not-run fields. | Independent review checks and historical-byte snapshot already delivered in this review. Extend only for new changes. Never route new runs into M2–M12. |
| 5 / E05: select next product slice | One scoped proposal with requirement IDs, evidence addresses, authored departures, tests and native/listening impact. | E02 complete. Prefer an existing read-only workflow gap with user value; do not infer required feature work from function counts. |

The reviewed source, traceability matrix, test logs, artifact audit and historical
snapshot are starting deliverables for E02/E04. They do not substitute for E01 or
E03. Working on available items while an artifact is missing is authorized.

## Acceptance criteria

1. **Inputs are accounted for.** Record archive SHA256 and exact specimen EXE/MAP
   hashes. Match the EXE to
   `7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544`
   and MAP to
   `70fa1e8287a30895778711fe2a38d33eb095962b290b9985ec084700d9f4d08a`.
   Different bytes require a separate specimen record and separate conclusions.
   Catalogs/receipts must reconcile their populations and explicit uncertainties.
2. **Every current feature is traceable.** All matrix rows have a requirement,
   evidence class and location/address (or explicit authored/unresolved label),
   Rust symbol, test/receipt and remaining gap. Any new claim has a bounded source
   export and scope, not just a name/import/string or generated C output.
3. **Contradictions have dispositions.** Independently inspect the supplied TIU
   CosignDocument/SignDocument exports; preserve query versus mutation semantics
   with their exact call/literal sites. Reconcile the Vitals overridden dispatch
   with existing assembly/VMT evidence. Keep the local read-only substitution.
   Preserve historical 0/10 index fields, report remapping and overwritten-log
   correction. Do not silently repair history or promote user reports to captures.
4. **Build evidence is explicit.** Recover and hash the accepted Windows EXE,
   verify all 28 source/build inputs, complete crate file set, 16 logs, stored
   journey sets and geometry, index files and supplemental binding. If absent,
   E03 remains blocked and the milestone cannot claim full completion. Do not
   infer an exact executable hash from matching source.
5. **Regression and preservation pass.** Reuse the independent 96-test Linux,
   Clippy and formatting results if application/build inputs are unchanged.
   Actual Rust changes require appropriate locked/offline core and desktop checks,
   new callback/timer evidence for affected behavior, and build-bound native and
   listening checks for affected controls. Write all new evidence in a new M13
   destination with source/build/log hashes. Existing historical bytes must match
   the pre-change manifest; add evidence instead of regenerating old receipts.
6. **The checkpoint is actionable.** Status includes per-item pass/blocked/not-run,
   risks, decisions, exact next command/action, dependencies and artifact paths.
   No runtime transport, credentials, original process/DLL integration, real
   clinical data, prescribing, signing, scheduling or persistence is introduced.

Full native matrix recapture is not a prerequisite for this documentation-only
milestone if the existing exact EXE and its accepted evidence can be verified.
User-reported acceptance remains valid at that level. Independent client-area
measurements and audio are separate limitations, not retroactive requirements to
repeat the user's report. Changed UI/build inputs require fresh affected checks.

## Reverse-engineering priority

First inspect existing new evidence, not another broad analysis run. The highest
value work is comparing the new catalog entries/exports against current feature
requirements, specifically TIU query/sign separation and the already documented
Vitals dispatch boundary. Check raw instruction/constant/call evidence whenever
the old and new interpretations differ. Missing exception paths or virtual-slot
types should be resolved only to answer a concrete requirement question.

| Prepared target | Relevance to M13 / disposition | Trigger for any bounded follow-up |
| --- | --- | --- |
| `009ad030 ORNet.SetParams` | Defer. Argument marshaling does not improve an offline compiled-fixture UI. | Only a documented conflict about a currently cited wrapper's argument construction; this still would not establish a server contract. |
| `00e19034 fNotes.TfrmNotes.SaveEditedNote` | Defer. Write workflow is outside scope. | Only if needed to explain an ambiguous edge in an existing read-navigation claim. Inspect immediate callers/branch boundary, not an editing implementation. |
| `009916c8 Wsockc.TXWBWinsock.NetStart` | Defer. Live socket transport has no runtime dependency in the mock. | None for this milestone. |
| `00996390 RpcSLogin.StartProgSLogin` | Defer. Login/credentials are outside runtime scope. | None for this milestone. |
| `01192018 rMisc.LoadDll` | Defer. Dynamic loading is intentionally excluded. | Only a static documentation conflict about the already excluded Vitals/DLL boundary; never execute or load the DLL. |

All five target names/addresses were independently found in the historical MAP
inventory. That lookup establishes neither their semantics nor a reason to
implement them. No additional headless/Ghidra run is warranted before inspecting
the missing bundle's existing bounded work.

## Risks and next action

The primary risk is treating a large inventory as recovered behavior. The second
is losing executable/receipt bindings when moving between Windows and cloud.
Stale current-tense documentation can send a reviewer to historical writers;
current pointers must take precedence. A separate external analysis workspace
also risks provenance loss if copied into Git without archive/manifest binding.

**Exact next action:** obtain a local path or accessible link for
`cprs-reverse-engineering.zip`; compute its SHA256 and list entries without
executing them; extract safely to `/workspace/reverse-engineering` separately
from this repository; read `README.md`, `specification.json`,
`validation/final-receipt.json`, `catalog/coverage.json` and
`catalog/uncertainties.json` first. Then perform E02's feature-address crosswalk.
If unavailable, leave E01/E02 blocked and locate the exact Windows artifact for
E03; do not substitute new transport work.
