# External interface specification

This catalog describes static client interface evidence in the pinned executable. An import, literal or call site does not establish a production endpoint, server registration, authorization, response grammar, or effective side effects. Those uncertainties are retained as interface requirements for further recovery.

## Operating-system imports

[imports.jsonl](evidence/static/imports.jsonl) contains every parsed normal and delayed import: DLL name, symbol/ordinal, import kind and IAT virtual address. There are 803 normal entries and 638 delayed entries. Delayed imports matter because enumerating only the normal import directory omits dependencies.

Representative boundaries:

| Boundary | Examples and IAT addresses | What is established |
| --- | --- | --- |
| Memory management | `borlndmm.dll!@Borlndmm@SysGetMem$qqri` `0125bec8` | Imported allocator entry; allocator ownership and cross-module ABI still require caller review |
| Socket transport | `ws2_32!socket` `0125bfd0`, `recv` `0125bfd4`, `send` `0125bfe4`, `closesocket` `0125bfd8` | Socket facilities are available; framing, encryption and error handling require broker-path analysis |
| HTTP | `WinHttpOpen` `0125c58c`, `WinHttpConnect` `0125c568`, `WinHttpOpenRequest` `0125c584`, `WinHttpSendRequest` `0125c5a0` | HTTP capabilities are linked; concrete URLs, credential routing and proxy policy are separate questions |
| Smart card | `SCardEstablishContext` `0125c964`, `SCardListReadersA` `0125c968`, `SCardConnectA` `0125c96c` | Smart-card API dependency; certificate and login behavior not implied by presence |
| Identity | `secur32!GetUserNameExW` `0125c974` | OS identity lookup dependency |
| Desktop integration | USER32, GDI32, COMCTL32, SHELL32, OLE32/OLEAUT32, WTSAPI32, printing and cryptography entries | Complete entry-level catalog is preserved; workflow-specific use remains function evidence |

The inventory separately recognizes six-byte x86 `JMP [IAT]` thunks whose target words exactly match parsed IAT entries. Their forwarding behavior can be marked analyzed while the external callee contract remains unresolved. See [verified thunks](catalog/verified-import-thunks.jsonl).

## PE exports

The executable exposes two entries, preserved in [exports.json](evidence/static/exports.json):

| Ordinal | Name | Address |
| ---: | --- | --- |
| 1 | `dbkFCallWrapperAddr` | `01253648` |
| 2 | `__dbk_fcall_wrapper` | `00413214` |

The first address is in data rather than established executable code. No callable ABI is inferred merely from the export name. Neither export is identified here as a clinical API.

## Broker call surface

`ORNet.CallVistA` has eight MAP-addressed overloads. Their entries are `009ad778`, `009ad7ec`, `009ad864`, `009ad880`, `009ad900`, `009ad924`, `009ada1c`, and `009ada80`. `CallBroker` is `009af1ec`; `TRPCBroker.Call` is `0099f884`. Overloads must be keyed by address rather than name alone.

The `009ad778` overload saves incoming EAX/EDX/ECX, creates a `TStringList` at call `009ad78e`, passes it toward `009ada80` at `009ad7b3`, and frees it at `009ad7d0` through a Delphi cleanup path. This establishes temporary result-list ownership in this overload. The final cleanup continuation and return contract require ABI review; automatically generated C parameters are not a wire API.

`rCore.setSubSetOfPatients` `011cdeb0` constructs a two-element argument area, loads RPC literal address `011cdf04` into EAX at `011cded8`, and calls `009ada80` at `011cdedd`. The instruction pattern establishes a call with constructed arguments. It does not establish the server's parameter names or accepted encodings.

## Patient and encounter RPC references

The following names are recovered from selected client wrappers. [RPC literal use sites](catalog/rpc-literal-use-sites.jsonl) record instruction addresses that reference candidates throughout discovered function bodies. Those cross-references are evidence of use, while the argument role still requires dataflow review.

| Wrapper family | Referenced RPC names | Contract gaps |
| --- | --- | --- |
| `rCore.setSubSetOfPatients` `011cdeb0` | `ORWPT LIST ALL` | Cursor/ordering/null rules, response grammar, server limits |
| `rCore.setRPLPtList` `011cdfb4` | `ORQPT READ RPL` | Restricted-list membership, three constructed argument roles, effective filtering |
| `ListPtByLast5` `011cd5e0`; RPL variant `011cd7b0` | `ORWPT LAST5`, `ORWPT LAST5 RPL` | Identifier validation, duplicates, access restrictions |
| `ListPtByFullSSN` `011cd988`; RPL variant `011cdbf0` | `ORWPT FULLSSN`, `ORWPT FULLSSN RPL` | Identifier semantics, validation, disclosure policy |
| `ListPtTop` `011cde60` | `ORWPT TOP` | Ordering, source population and cardinality |
| `GetPtIDInfo` `011ce3e4` | `ORWPT ID INFO`, `ORWPT2 ID INFO` | Returned fields, branch conditions, nullability |
| Sensitive-access wrapper `011ce0fc` | `DG SENSITIVE RECORD ACCESS` | Access decision encoding, acknowledgement/audit flow, authorization enforcement |
| `rCore.SelectPatient` `011cec4c` | `ORWPT SELECT`, `ORWPT1 PRCARE`, `ORWPT INPLOC`, `ORWPT GET FULL ICN` | Patient/encounter field layout, identity reconciliation and failure handling |

## Document, order and report interfaces

| Domain | Selected literals | What remains unresolved |
| --- | --- | --- |
| TIU document listing | `TIU DOCUMENTS BY CONTEXT`, `ORWTIU GET LISTBOX ITEM` | Context enums, list metadata and tree grouping |
| TIU reading | `TIU GET RECORD TEXT`, `TIU DETAILED DISPLAY` | Ordinary-body versus detailed-display formats, permissions and error rows |
| Order list | `ORWORR AGET`, `ORWORR RGET`, `ORB FOLLOW-UP ARRAY` | Abbreviated row formats, follow-up branching and date/status meaning |
| Visible order fields/text | `ORWORR GET4LST`, `ORWORR GETTXT` | Batching, field ordering, expansion and null behavior |
| Order detail | `ORQOR DETAIL`, through wrapper `011dabac` | Detail additions, response formatting, effective permissions |
| Order filters | `ORWORDG REVSTS` | Server status catalog and effective filter values |
| Selected interim results | `ORWLRR INTERIMS`, through `00c86c80` | Selected-test branch inputs and framing |
| Lab date navigation | `ORWLRR NEWOLD`, through `00c87324` | Date semantics and response grammar |

The [bounded clinical-write review](evidence/batch-0001) includes signing, submission, release, and lock wrappers. Its raw code and assembly are evidence; a separate review note records conclusions without treating a successful decompilation as a recovered server contract.

## Configured and dynamic interfaces

`rLabs.Interim` `00c867c8` and `rReports.LoadReportText` `00c03f50` accept a supplied RPC name and contain missing-configuration paths. The interim path refers to file 101.24. A fixed `ORWLRR INTERIMS` literal in a different branch must not be substituted as the contract of every interim report request.

Medication detail `00bd615c` and appointment detail `00bd7cb8` call `CPRSParams`, invoke configured interface slot `0x38`, read row/patient state and reach `ORNet.CallVistA` at `00bd61d6` / `00bd7d3b`. The inherited `getDetailRPC` `00bd59e0` reads a string at configured-object offset `0x2c`. Effective interface binding and server contracts remain unresolved.

## DLL and help artifacts

The uploaded directory includes `borlndmm.dll`, `GMV_VitalsViewEnter.dll`, `RoboEx32.dll`, `WebView2Loader.dll`, and `YS_MHA_A_XE10.dll`, plus compiled help files and a Vitals DLL MAP. File sizes and hashes are in [the input manifest](evidence/static/summary.json). A filename's presence alone does not establish that the executable invokes a particular export. Dynamic-load configuration, export signatures, cross-module allocator ownership and DLL internals need separate evidence.

## Required interface recovery before compatibility work

For each used operation, recover argument ordering/types, scalar/list framing, string encoding, row/field grammar, null/sentinel distinctions, ownership, errors, timeout/retry behavior, session/context preconditions and authorization effects. Match an exact server/source snapshot where available. Preserve unresolved fields as opaque values until their use is verified. No connection to an external clinical system has been made during this analysis.
