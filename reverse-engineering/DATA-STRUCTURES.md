# Data structure catalog

Addresses are image virtual addresses in the pinned x86 executable. Numeric words are little endian. Machine-readable [class records](evidence/static/classes.jsonl), [managed literals](evidence/static/managed-literals.jsonl.gz), [MAP symbols](evidence/static/map-symbols.jsonl.gz), [forms](evidence/static/forms), and [Ghidra metadata changes](evidence/metadata-changes.json) accompany this catalog.

## Managed string literal header

The extractor validates 26,025 literal candidates by header fields, extent, terminator and decodability. It accepts element widths 1/2 and code pages 0/1200/1252/65001, requires static reference count `-1`, and rejects unsupported control characters. This identifies a bounded set of literals, not every allocated string representation.

For character pointer `P`, the recovered prefix is:

| Relative offset | Width | Meaning |
| --- | --- | --- |
| `P-12` | 2 | Code page word |
| `P-10` | 2 | Element width in bytes |
| `P-8` | 4 | Signed reference count; validated static literals use `-1` |
| `P-4` | 4 | Character-element count, excluding terminator |
| `P` | length × width | Character bytes |
| `P + length × width` | width | Zero terminator |

Reference-count and assignment helper calls in the instruction listings support managed string operations. Their complete allocation, aliasing, copy-on-write, exception and ownership contracts have not been ported. Ghidra receives the 12-byte `RecoveredCPRS/DelphiManagedStringHeader` type where existing listing data permits insertion. The change report records both applications and preserved conflicts.

## Partial class metadata prefix

For each validated class symbol address `M`, the word at `M` equals `M+0x58`, its VMT base `V`. A short string at the class-name pointer matches the MAP class name exactly. Instance sizes are bounded, and parent references are read from file-backed words. The catalog contains 2,554 records passing these checks.

| Offset from `M` | Width | Recovered interpretation |
| --- | --- | --- |
| `0x00` | 4 | Self VMT virtual address, `V=M+0x58` |
| `0x04`–`0x1c` | 7 × 4 | Preserved words; individual table roles not established here |
| `0x20` | 4 | Address of byte-counted class-name string; also `V-0x38` |
| `0x24` | 4 | Instance size in bytes; also `V-0x34` |
| `0x28` | 4 | Parent-reference address; dereferenced value identifies parent VMT where present |

This is a 44-byte partial metadata type, **not an instance layout**. Declaring the unknown words prevents the type from presenting unsupported RTTI table meanings as recovered facts.

Representative validated instances:

| Class | Metadata `M` | VMT `V` | Instance bytes | Parent |
| --- | --- | --- | ---: | --- |
| `uCore.TPatient` | `011d06e8` | `011d0740` | 148 | `System.TObject` |
| `rOrders.TOrder` | `011d7948` | `011d79a0` | 172 | `System.TObject` |
| `Trpcb.TRPCBroker` | `0099d694` | `0099d6ec` | 284 | `System.Classes.TComponent` |
| `fPtSel.TfrmPtSel` | `00e7f05c` | `00e7f0b4` | 1,356 | `fBase508Form.TfrmBase508Form` |
| `fFrame.TfrmFrame` | `00fe5ea8` | `00fe5f00` | 1,916 | `fBase508Form.TfrmBase508Form` |
| `System.Classes.TStringList` | `004a7300` | `004a7358` | 76 | `System.Classes.TStrings` |
| Vitals panel | `00be1cf4` | `00be1d4c` | 900 | Common CPRS panel |
| Appointments panel | `00bd7520` | `00bd7578` | 892 | Common CPRS panel |
| Active Medications panel | `00bd5adc` | `00bd5b34` | 892 | Common CPRS panel |

Size includes inherited state. These extents do not identify field alignment, managed-value ownership, initialization, or serialized representation.

## Validated Cover Sheet dispatch windows

Three historical bounded VMT exports contain 15 byte-verified words. Offsets below are relative to the corresponding class VMT base, not an object pointer.

| Slot | Appointments | Active Medications | Vitals |
| --- | --- | --- | --- |
| `0x20c` | `OnAddItems` `00bd7954` | `OnAddItems` `00bd5eec` | Not included in the historical bounded slot sample |
| `0x210` | `OnGetDetail` `00bd7cb8` | `OnGetDetail` `00bd615c` | `OnGetDetail` `00be279c` |
| `0x214` | Common `OnShowDetail` `00bd4908` | Common `OnShowDetail` `00bd4908` | Override `00be22f4` |
| `0x21c` | Common `ClearListView` `00bd35d0` | Common `ClearListView` `00bd35d0` | Common `ClearListView` `00bd35d0` |
| `0x238` | Unrecovered in bounded sample | Unrecovered in bounded sample | `OnUpdateVitals` `00be2334` |

The common detail method `00bd41b4` dispatches through get/show slots. Vitals' override shows why an interface-compatible method can have different side effects. Inherited slot mapping establishes target identity; it does not prove effective runtime permissions.

## Display row projections

These are client field accesses observed in bounded instruction listings. Piece numbers are one based and use the client helpers' naming. They are **not complete RPC response schemas**.

| Panel / entry | Observed projections | Important unknowns |
| --- | --- | --- |
| Vitals `00be2474` | Caret-delimited rows; piece 2 caption; pieces 5+6 joined for Value; piece 4 date conversion/format; pieces 7+optional 8 qualifiers; attached delimited object | Clinical meaning of raw pieces, units, null rules, date timezone and transport framing |
| Active Medications `00bd5eec` | Preprocess with `rMeds.ExtractActiveMeds` `00add94c`; piece 2 caption, piece 4 subitem, MixedCase calls, object attachment | Complete medication classification rules, status semantics, input mutation and upstream schema |
| Appointments `00bd7954` | Null piece-1 branch uses piece 2 caption; otherwise piece 2 date formatting; pieces 3/4 subitems; object attachment | Identity/null sentinel meaning, date system, action semantics and configured RPC |

The medication and appointment bodies contain Delphi finally continuations missing from straightforward pseudocode. Historical exports explicitly preserve bounded MAP spans and decoded continuation instructions. Their boundaries remain documented approximations where literal pools share those spans.

## Signature-result prefix

The newly reviewed `rTIU.SignDocument` function writes a byte at its incoming result pointer at `00a0c771` after comparing caret piece 1 with `0`, then assigns caret piece 2 as a managed string at result offset 4 at `00a0c78e`. `RecoveredCPRS/TIUSignResultPrefix` records that eight-byte prefix: one equality-result byte, three uninterpreted padding/alignment bytes, and a four-byte UTF-16 managed-string pointer. It is a type definition in Ghidra; no unverified register-ABI prototype was forced. Full server response semantics remain unresolved. See [the bounded review](REVIEW-NOTES.md).

## Form resource model

Each decoded component preserves class, instance name, inherited/inline flags, child position, stored properties and children. Collections preserve item indices and property dictionaries. Binary property payloads retain byte counts and resource-level hashes; the decoder does not recover bitmap internals as form properties. Full binary resource bytes remain in the executable.

Stored event names are associated with MAP method candidates by root form class and method suffix. Ambiguous/no-match bindings remain recorded. This describes stored configuration and does not prove handler reachability or runtime event routing.

## Unrecovered structures

Full patient/encounter/change records, order records, TIU metadata rows, broker parameter variants, response lists, interface vtables, PCE structures and DLL ABI records remain unresolved at field level. Decompiler-generated `undefined4`, implicit register arguments, and object offsets are not promoted to complete types. They appear in inventory signatures with provenance and uncertainty so a reimplementation cannot silently rely on guessed layouts.
