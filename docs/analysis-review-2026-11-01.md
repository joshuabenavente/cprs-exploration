# Analysis review after publication intake

This is the pre-implementation review checkpoint. The user subsequently approved
[M13](milestone-13.md); current implementation and fresh acceptance state are in
[the handoff](handoff.md) and [project status](project-status.json).

The offline Rust implementation remains at the previously tested runtime source:
96 core tests, warning-denied core Clippy and formatting passed in this session.
The published reverse-engineering evidence is now available and internally
consistent. It supports bounded static corrections and richer traceability; it
does not establish full CPRS behavioral recovery or production compatibility.

Fetched and fast-forwarded local `work` from `8fec66d` to
`64280376dfc7dc5c32679c941a542b6ef3ebf54b`, the published analysis commit on
`origin/main`. The upstream change adds only `reverse-engineering/`; no runtime,
dependency, build or prior validation file changed. Earlier uncommitted review
edits were preserved. The analysis folder has 956 files / 41,495,674 stored bytes.
An [intake receipt](../validation/analysis-review-2026-11-01/intake.json) pins every
file. No branch/remote content was published by this review.

The prior [repository-only review](project-review-2026-11-01.md) remains a record
of the initial missing-input checkpoint. This continuation supersedes its
missing-analysis conclusions. The original ZIP, EXE/MAP, DLLs and Ghidra database
remain unavailable: [PUBLICATION.md](../reverse-engineering/PUBLICATION.md)
explicitly excludes them. The Git commit and publication hashes now provide the
available distribution's identity. Archive identity and fresh raw-binary
verification are separate, still unavailable claims.

## Independently checked in this continuation

The standalone [audit](../validation/analysis-review-2026-11-01/audit_analysis.py)
streams catalogs and writes only a separate
[review receipt](../validation/analysis-review-2026-11-01/audit.json). It does not
execute supplied scripts or expand catalogs into the evidence tree.

| Check | Result | Meaning / limit |
| --- | --- | --- |
| Publication manifest | 950/950 stored size/hash bindings match | Exact published bytes. |
| Publication validation receipt | 955/955 listed file hashes match | Its own receipt is the 956th file, outside its self-hash set. |
| Gzip recovery | 18/18 streams decompress to exact source size/SHA256 | Restores original catalog identities without running PowerShell; no full decompiled corpus was loaded into review context. |
| Original final-receipt bindings | All 20 script and 10 document hashes agree with source-manifest hashes; 26 also match stored bytes directly | Four Markdown documents have publication edits, discussed below. |
| Inventory | 43,371 unique entries: 41,948 internal, 1,423 external; 2,245 analyzed / 183 partial / 40,943 unresolved | Every row has evidence, uncertainty, physical-module, subsystem, relationship and assignment-basis fields. Counts and subsystem totals reconcile; this is a census/consistency check. |
| Scope catalogs | 1,518 forwarding thunks; 727 small patterns; 325 form files; 4,371 event bindings; 2,554 class records; 243,857 calls; 38,574 unresolved indirect sites; 3,355 archived direct edges | Counts independently streamed. Their semantic truth is not established merely by counting. |
| Specification/checkpoint consistency | Coverage objects in `coverage.json`, `specification.json` and `progress.json` agree; declared EXE/MAP hashes match historical locks | Raw EXE/MAP were not rehashed locally. |
| Bounded exports | 44 exports, 39 distinct functions, 4,953 listed instructions; all 627 E8 encodings in those listings decode to their printed destinations | Independent arithmetic from exported bytes, not fresh comparison to PE bytes. The original receipt's 204,270-call PE-byte audit remains inherited. |
| Recovered metadata | Change records contain 2,554 class-prefix, 32 string-header and 25 function-name applications; five cleanup repairs retained | Application records are inspectable, but the excluded Ghidra database was not reopened. |
| Historical crosswalk / preservation | All 367 reference copies match their recorded hash and existing repository bytes exactly; all 1,424 pre-review analysis/validation files and all 956 publication files remain unchanged | New review evidence is stored separately. |

Read the requested README, specification index, inventory/architecture/data/
interface/behavior/review/reimplementation documents, uncertainty catalog and
progress records. Inspected address-filtered inventory rows and the relevant
batch ASM/literal annotations, alongside historical focused evidence. The
ten uncertainty categories U01–U10 remain applicable.

## Findings and dispositions

| ID / priority | Finding | Evidence and delivery consequence |
| --- | --- | --- |
| A01 / P1 | Complete classification is not complete discovery or semantics. | Coverage explicitly sets `full_behavioral_recovery_complete=false` and `discovery_complete_for_executable=false`. About 94.4% of entries are semantically unresolved. The 2,245 analyzed entries have forwarding/small-pattern scope, not recovered clinical algorithms. No unsupported completion claim was found in the reviewed summary documents. |
| A02 / P1 | Querying the cosignature action and signing a record are distinct. | Repaired `00a0b3e0`: literal loaded at `00a0b40e`, CallVistA at `00a0b413`, compare with `COSIGNATURE` at `00a0b420`, SETZ at `00a0b425`, return continuation at `00a0b447`. `00a0c6fc`: `TIU SIGN RECORD` at `00a0c742` / call `00a0c747`. These are now supported B-class observations from published exports. Neither proves complete server effects/permissions. No signing functionality belongs in the mock. |
| A03 / P1 | The signature result is only a prefix. | `00a0c76e` computes equality of piece 1 with `0`; `00a0c771` stores a byte; `00a0c78e` assigns piece 2 at +4. Do not rename this byte a fully understood success flag or treat the eight-byte prefix as a complete Pascal/server result contract. |
| A04 / P1 | Vitals integration crosses a DLL boundary. | Existing show/update slots and write-access call are corroborated. New exports show `LoadVitalsDLL` `00ae6bd4` calling `rMisc.LoadDll` at `00ae6c23`, cached handle `01237fc0`, export-name reference `GMV_ViewPatientVitals` at `00ae6cf9`, and indirect call at `00ae6ef6`. DLL ABI/effects remain unresolved (U05/U06). Retain the authored local detail pane. |
| A05 / P1 | Original Notes read navigation is not a pure read function. | Behavior and focused selection exports contain write-access, notification and PCE work. `SetViewContext` `00e1df9c` reaches `SaveCurrentNote` `00e1946c` → unresolved `SaveEditedNote` `00e19034`. A read-only implementation must port selected display requirements, not the entire original event handler. |
| A06 / P2 | Four original document hashes differ from published Markdown for a documented reason. | BEHAVIOR, DATA-STRUCTURES, FUNCTION-INVENTORY and README were adapted for publication. Source hashes match the original receipt; stored hashes match the publication manifest/receipt. Do not call this evidence corruption, change historical hashes, or claim all published docs are byte-identical to originals. |
| A07 / P2 | Raw exports say unresolved while the final inventory says partial for reviewed substantive functions. | All 44 raw batch annotation status labels are export-time `unresolved`. Consolidated address-keyed catalog labels the reviewed TIU/Vitals routines `partially_analyzed`. This is a stage/scope distinction; use final inventory for census and keep raw exports unchanged. |
| A08 / P2 | Automatic-analysis status differs by stage. | Controlled discovery had analysis enabled; final export snapshot used noanalysis. Initial default 8 GB failure and later 137-second successful controlled pass are separate attempts. Neither the original focused noanalysis project nor a later successful discovery pass establishes complete recovery. |
| A09 / P2 | The general reimplementation plan prioritizes broker/write/integration recovery; the mock has different dependencies. | Its ordering is useful for a future compatibility project. The five prepared targets are all unresolved in the final inventory and do not support the next synthetic read-only feature. Defer them rather than inheriting that batch as the mock backlog. |
| A10 / P2 | Raw assets and accepted Windows mock EXE are still missing. | They limit reproduction and complete historical executable binding. Preserve that archival backlog. They need not block designing a new authored synthetic feature with fresh validation of its own build. |

The new evidence does not expose a demonstrated Rust regression in the reviewed
feature set. The current gaps remain original Notes trees/pagination/filters,
Orders grouping/multi-selection, broader Results report/date selection,
configuration-driven panels and effective runtime accessibility. These must
remain distinct from defects against the authored mock contract. Static forms
and MAP names alone cannot close those fidelity gaps.

## Recommended next implementation milestone

Recommend **M13: read-only Notes author/date filtering**, replacing the earlier
evidence-only proposal now that published intake and reconciliation have been
completed. The [earlier proposal](milestone-13-evidence-proposal.md) is retained;
the [current M13 plan](milestone-13.md) defines scope, requirement IDs, acceptance
criteria, dependencies and evidence requirements. Implementation has not begun.

The existing browser has only a combined substring filter. The two decoded
forms explicitly supply author selection and beginning/ending date inputs. This
is a bounded user-facing extension of existing read-only behavior with no
transport or write dependency. Its exact synthetic filtering semantics are P,
not an attempted translation of original signed-note permissions, FileMan dates,
timezones, sort rules or server view-context behavior.

Additional reverse engineering that could improve this milestone is narrowly
bounded: author OK `00cf1898`, date OK `00cf235c`, and immediate return/cancel
boundaries; then only their immediate callers if needed to separate view context
from save behavior. These handlers are presently unresolved. Existing resource
evidence is sufficient to define an explicitly authored mock feature, so this
research is optional for that scope and mandatory only before claiming closer
original behavior. No new Ghidra run was performed without the reference inputs.

## Checkpoint and next specific action

The [traceability matrix](traceability-2026-11-01.md) now links the publication and
adds proposed filtering rows. [Project status](project-status.json) records the
completed intake/crosswalk, archival limitations, revised priority and exact next
action: write the proposed Notes filtering contract for NF01–NF08 from the M13
plan, then implement it only as separately scoped implementation work. This
assignment is review/planning, so no Rust feature code was added.

The previous portable test receipts remain applicable because neither incoming
commit nor this continuation changes runtime/build inputs. No desktop journey,
native input, listening, original client, DLL or live-system action was executed.
