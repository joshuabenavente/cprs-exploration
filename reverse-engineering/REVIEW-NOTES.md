# Bounded subsystem review notes

The new exports cover 39 distinct functions in two batches; a third batch re-exports five functions after confirmed cleanup-continuation repairs. All 44 exports decompiled. Success means an export was produced, not that its Pascal ABI or every branch is known. The annotations independently compare every listed instruction with the uploaded executable and decode direct `E8` destinations from their bytes.

Raw evidence: [batch 1](evidence/batch-0001/annotations.json), [batch 2](evidence/batch-0002/annotations.json), [repaired functions](evidence/batch-0003/annotations.json), and [independent boundary listings](evidence/independent-boundary-listings). All observations below are static.

## Broker locking, calls and context

`ORNet.CallBroker` `009af1ec` calls `LockBroker` at `009af1f6`, updates context at `009af20e`, and calls `CallBrokerInContext` at `009af217`. It saves AL at `009af21c`, unlocks at `009af22c`, and the repaired continuation `009af23b` reloads the saved byte into EAX before return `009af243`. This establishes a result propagated across cleanup. Lock implementation/reentrancy, context-switch outcomes and all raised errors remain unresolved.

Central `CallVistA` `009ada80` includes abort checking at call `009ada93`, broker locking at `009adab0`, parameter setup at `009adaca`, `CallBroker` at `009adae0`, parameter clearing at `009adb18`, and unlocking at `009adb2a`. Its complete finally continuation, overload ABI and success/failure result handling need further reconstruction.

`CallBrokerInContext` `009ae314` includes calls to `ORUnitTesting.FindMockRPC` at `009ae38c`, `ParamToStr` at `009ae3b6`, and call-list locking/deletion/count/unlock at `009ae495`–`009ae4da`. This proves that test/mock-related machinery is present in the specimen; it does not prove that a particular production request takes that branch. No mock path was invoked.

`TRPCBroker.CreateContext` `0099f5dc` references `XWB CREATE CONTEXT` at `0099f693` and calls `XWBHash.Encrypt` at `0099f6c5`. A method name or encryption helper does not recover complete context authorization.

## Connection and authentication branches

`TRPCBroker.SetConnected` `0099f938` includes socket reuse, SSH checks, secure-connection setup, network connection, authentication, connection registration, CCOW context interaction, removal and disconnection. Address anchors include `ExistingSocket` `0099fa4a`, `CheckSSH` `0099face`, `StartSecureConnection` `0099fae8`, `NetworkConnect` `0099fb39`, `AuthenticateUser` `0099fb47`, and `NetworkDisconnect` `0099fee6`.

`AuthenticateUser` `009a0b94` contains distinct login-mode/token paths, calls setting access/verify values, CCOW token retrieval, silent login, SSO token construction, sign-on-form setup and division selection. These are static branches, not a complete login protocol or an assertion that any one credential source is always used. Input lifetimes, branch guards and server-side authorization remain unresolved.

`StartSecureConnection` `009a2e38` obtains username/password values and invokes `RpcSLogin.StartProgSLogin` at `009a2ffc` / `009a300d`. At `009a2f46` it references the exact command-option literal ` -o "StrictHostKeyChecking no" -o "connectionReuse no" `. This records command construction; process-launch implementation, executable selection, complete quoting and effective runtime configuration require the callee's recovery.

## Character translation and XWB encoding

`MFunStr.Translate` `008617bc` iterates one UTF-16 code unit at a time: it copies a one-unit input substring at `0086182a`, finds its one-based position in the source alphabet at `0086183a`, copies the corresponding unit from the destination alphabet at `00861853` when found, and otherwise copies the original unit at `00861873`. Appends are at `0086185e` / `0086187e`, and the result assignment is at `0086188d`. Shorter destination alphabets and malformed inputs require the runtime helper contracts; the observed XWB callers use equal-length alphabets.

The table at `012350e8` contains 20 pointers to validated strings of 94 distinct characters each. [cipher-pads.json](catalog/cipher-pads.json) preserves the exact contents and pointer words. `XWBHash.Encrypt` `00862ab4` calls the MAP-named random initializer, draws two distinct indices with bound 20 at `00862ae5` / `00862af1`, translates from the first alphabet to the second at `00862b1f`, and concatenates a leading `index+0x20` marker, translated text, and trailing `other-index+0x20` marker at `00862b3c`.

`Decrypt` `00862b6c` reads first/last UTF-16 units, subtracts `0x20`, copies the interior beginning at position 2, and calls Translate with the alphabets reversed at `00862bef`. This is a character-substitution/marker scheme in the reviewed client code; the name XWBHash does not imply a hash algorithm. Random seed behavior, malformed-marker handling and any wider transport protection are separate questions. The algorithm was not exercised through the target.

## Signature action versus signing

`rTIU.CosignDocument` `00a0b3e0` passes one constructed integer-like argument to `TIU WHICH SIGNATURE ACTION` (`00a0b413`), compares the returned string with `COSIGNATURE` (`00a0b420`) and records equality with `SETZ BL` (`00a0b425`). Its repaired continuation `00a0b447` moves EBX into EAX before return. This function determines whether the signature action is cosignature; its name alone would misleadingly suggest that it performs the signing action. The server operation's complete effects are not established here.

`rTIU.SignDocument` `00a0c6fc` passes two constructed arguments to `TIU SIGN RECORD` at `00a0c747`. It extracts caret piece 1, compares it to literal `0`, performs `SETZ AL` at `00a0c76e`, and stores the byte at incoming EAX-result pointer offset 0 at `00a0c771`. It then extracts piece 2 and assigns the managed string at result offset 4 at `00a0c78e`. The verified prefix is therefore an equality-result byte and a managed string field at +4; the server's complete success/error grammar and input meaning require further evidence. The `RecoveredCPRS/TIUSignResultPrefix` type records this partial layout without forcing an unverified function prototype.

The signature dialog OK handler `00cf2a44` calls `rCore.ValidESCode` at `00cf2a6f`, has the rejection message `Unrecognized Signature Code`, and calls XWB encoding at `00cf2ab8`. `ValidESCode` `011cb4d8` encodes input at `011cb504`, calls `ORWU VALIDSIG` at `011cb51d`, and checks the call result and returned literal before choosing its boolean result. Effective server authorization is not recovered merely from these client checks.

## Note saving and signing

`SaveCurrentNote` `00e1946c` is a short wrapper that calls `SaveEditedNote` `00e19034` at `00e19478`. This identifies a precise next semantic target rather than treating the wrapper as the entire save operation.

`acSaveNoSigExecute` `00e13350` reaches SaveCurrentNote at `00e133b9`, reloads notes at `00e133da`, and has selection/tree and information-dialog work. `acSignExecute` `00e134e4` is substantially broader: save (`00e1356e`), text/clean-save checks (`00e135c8`, `00e135f6`), signature-action query (`00e13626`), consult/note locking (`00e13674`), action eligibility (`00e1369a`), PCE sign check (`00e136bb`), signature dialog (`00e13798`), actual sign wrapper (`00e137c2`), change-list updates, unlocks (`00e138e3`, `00e138f9`), reload and tree refresh.

Those verified edges support separate save, lock, eligibility, signature, cleanup and refresh phases. They do not establish all predicates, rollback policy, PCE requirements or error handling. All these functions remain partially analyzed at the high-level behavioral scope.

`rTIU.Submit` `00a0d360` references `TIU SET DOCUMENT TEXT` at `00a0d3f8` and calls CallVistA at `00a0d3fd`; it has a returned-list branch, piece extraction and a fallback `An error occurred on the server.` message. Exact request and response layout remains unresolved.

## Order saving, validation, locks and dispatch

`TResponses.SaveOrder` `010f2488` checks quick-order grouping, location and event-related state, reaches `rODBase.PutNewOrder` at `010f2765` / `010f27ec`, and contains event-saving and display/list work. The PutNewOrder routine `010eb48c` sets up a dialog/multiple-parameter object, calls `ORWDX SAVE` at `010eb6a5` and later reaches `rOrders.SetOrderFields` at `010eb9b2`. This separates object preparation, server save and returned-order population. Full order record types, preconditions and server effects remain unresolved.

| Wrapper | Verified RPC literal / call | Additional observation |
| --- | --- | --- |
| SendOrders `011e0544` | `ORWDX SEND`, call `011e05f7` | Parses returned list pieces; contains `This order requires a signature.` and copies results through FastAssign |
| SendReleaseOrders `011e076c` | `ORWDX SENDED`, call `011e0822` | Obtains current specialty/context data and copies returned list state |
| LockPatient `011e0df4` | `ORWDX LOCK`, call `011e0e36` | Piece parsing and local lock-list addition at `011e0ece` |
| LockOrder `011e0fe0` | `ORWDX LOCK ORDER`, call `011e102a` | Piece parsing and local lock-list addition at `011e10bc` |
| ValidateOrderAction `011e12a0` | `ORWDXA VALID`, call `011e1319` | Constructed argument area; full argument roles and decision grammar unresolved |

Preserve the exact unusual lock-failure string `3^Error caling "ORWDX LOC"` rather than silently normalizing its spelling into a different RPC name.

## Vitals integration and access checks

`LoadVitalsDLL` `00ae6bd4` references `GMV_VitalsViewEnter.dll` at `00ae6c1e`, calls `rMisc.LoadDll` at `00ae6c23`, and caches a handle at `01237fc0`. `UnloadVitalsDLL` `00ae6c90` tests that global, calls the imported-library-release wrapper at `00ae6ca2` and zeroes the global at `00ae6ca9`. The load helper, exact dynamic export signature and plugin-side behavior remain unresolved.

`ViewPatientVitals` `00ae6cb0` loads that DLL, resolves a function dynamically, prepares patient/encounter-related strings and invokes an indirect function pointer. Multiple Delphi exception regions and x87 values are badly represented in its pseudocode; the raw listing is retained. Do not derive a DLL prototype from the generated C parameters or double-valued stack artifacts.

The two `uWriteAccess.WriteAccess` wrappers (`01011c80`, `01011ce4`) call two class-method overloads (`01011280`, `010112e4`). The class implementation consults system parameters and an error path. Complete access-mode values, rule precedence and permissions remain unresolved.

## Compiler continuation repairs

Five repairs are recorded in [function-boundary-changes.json](evidence/function-boundary-changes.json). Each missing normal continuation is identified by a pushed address before cleanup, an indirect jump, and an independently disassembled epilogue ending in RET. Literal pools are excluded from the repaired ranges. These repairs recover important return behavior; they do not justify extending every function to the next MAP public, which may contain data.
