# M18: guarded CPRS/RPC Broker session foundations

Status: portable/session UI foundation implemented; native Broker adapter and
VA workstation connection verification remain unavailable/pending. No live
connection has been attempted. Planning baseline is main
`323383e3877600c0dab391f6038180691d6c1289`. The user has conditionally authorized
read-only VistA use on the VA network while logged in and reports an approved
CPRS/RPC Broker sign-in path. Standing delivery approval covers sanitized
source/plans and synthetic evidence.

## Outcome and scope

Deliver a Windows session-only Live connection surface backed by a guarded
supported Broker adapter. Live may open/sign in only with VA-network and active,
unlocked Windows-user evidence; verified VistA identity/site/context is required
for Connected. The enabled clinical-read allowlist is **empty in M18**. M19 adds
the first patient identity and Notes list/text pilot after exact read contracts.

[VS01–VS12](../specifications/vista-session-foundations.md) is the implementation
contract; [the connection plan](live-vista-plan.md) records scope and data rules.
Mock remains the default. Its nine invented patients/readers remain available.
No clinical writes, generic RPC console, patient search/import, raw Broker
protocol recreation, original CPRS execution or arbitrary original DLL loading
is part of M18. Real responses and credentials remain on the VA workstation.

## Implementation sequence

| Step | Concrete work | Exit condition |
| --- | --- | --- |
| 18.1 — supported-interface facts | Resolve the selected Broker package/interface, sign-in/context/status operations, native threading/bitness, network attestor/access boundary and Windows lifecycle signals. Record safe references and unresolved facts without endpoints, identities or credentials. | A native adapter can be specified from supported interfaces. Any unresolved required gate keeps native dispatch disabled; portable work can proceed. |
| 18.2 — portable coordinator | Add pure Rust session states, BootstrapAllowed versus clinical-read gate, typed safe failures, monotonic source/connection/session epochs and injected clock/attestors for tests. Design revocation-first transitions and no auto reconnect. | VS01–VS07 and VS09–VS10 synthetic positive/negative/interleaving cases pass; zero clinical calls, including after sign-in. |
| 18.3 — desktop source boundary | Add explicit Mock/Live selection and connection panel. Keep MockProvider in Mock only; wrap all existing delayed callbacks with the root source epoch. Live has Connect/Disconnect/status and no patient chart. Clear all old context on mode changes. | VS08/VS11 pass, including Mock→Live→Mock late chart/detail races; M17 functional behaviors retained. |
| 18.4 — Windows adapter | Implement only documented Broker authentication/session control and network/active-session monitors, with supported local configuration and constrained safe result messages. Bind owner/site/context and enforce dispatch/reply gates. | Adapter matches the resolved facts; absent/unknown guards result in zero transport calls. Required native dependencies and any isolated FFI boundary are reviewable. |
| 18.5 — evidence migration and synthetic regression | Introduce M18F100 runner/verifier/protocol checks and extend the real-timer journey; freeze supported M17 writer entry points before new runtime validation. Point active wrappers/CI to isolated M18 paths only. | Required checkpoint sets, source/executable/log bindings and preserved historical bytes verified. Default/minimum samples run at 100% only. |
| 18.6 — local VA session exercise | On the user's VA workstation, test the supported sign-in/cancel/disconnect and network/lock/expiry/reconnect lifecycle. Record sanitized case codes and build identity only, with no patient reads. | Native route and guard/revocation outcomes are recorded for the exact build. Unsupported/missing cases remain explicit, not inferred from CI. |
| 18.7 — delivery and M19 handoff | Review final diff, run appropriate portable/Windows hosted checks, publish draft PR, verify exact-head CI, merge/prune under standing approval. Keep local session results separate from hosted builds. | Delivery receipt distinguishes source delivery, synthetic pass and native session acceptance; M19 knows which session capability it may use. |

Proposed implementation branch: `m18-vista-session-foundations`, created from
current main when coding starts. Steps
18.2/18.3 can proceed with fake adapters while 18.1 facts are resolved; they
cannot be labeled a completed native connection milestone by themselves.

## Architecture decisions to preserve

- **Two gates:** local network/Windows guards allow starting authentication;
  authenticated VistA ownership and a reviewed operation contract additionally
  govern reads. Do not create a circular sign-in requirement.
- **Epochs beyond AppState:** a root source epoch survives state resets and is
  checked by every queued callback. Returning to Mock must not let an old Mock
  request apply because synthetic IDs or request numbers repeat.
- **Revocation before teardown:** disable dispatch and invalidate ownership before
  cancellation/transport disposal; a late success cannot restore Connected.
- **Owned native boundary:** blocking/native work respects the documented Broker
  threading model and returns safe messages to the coordinator. Credentials and
  raw SDK errors never pass through ordinary UI/debug logging.
- **No clinical calls yet:** a successful M18 connection enables the session
  foundation, not the existing mock patient-provider API. Live identifiers and
  real patient/Notes contracts belong to M19.

Detailed proposed file locations, states, gate freshness rules and unknown-native
fact decisions are in the [contract](../specifications/vista-session-foundations.md).

## Validation and evidence

Acceptance stays functional at **100% application scale**, default/minimum sizes.
Keyboard/focus/navigation and screen-reader checks are excluded; other scales
remain deferred. Lock/logoff/network-expiry cases exercise the requested session
boundary, not a keyboard-navigation test. No real credentials or VA connectivity
are used in cloud development or hosted CI.

| Evidence | Required coverage | What it establishes |
| --- | --- | --- |
| Portable policy/adapter-fake tests | Trusted/denied/unknown/stale gates, pre-auth rules, wrong owner/context, cancellation, every revocation interleaving, duplicate/late replies, no clinical dispatch and sanitized errors. | Authored state/ownership/dispatch behavior against synthetic inputs. |
| Desktop callbacks and real timers | Connect/cancel/error/disconnect, missing adapter, source switching, stale Mock and session callbacks, safe visible status and retained mock regressions. | UI/adapter coordination at default/minimum 100% in a synthetic journey. |
| Receipt/isolation tests | Complete required step/checkpoint sets; source/executable/log tamper rejection; frozen M17 writers; historic-file preservation; no production adapter launch by test flags. | Fresh build/evidence binding and prevention of history overwrite or accidental live CI use. |
| Hosted portable/Windows code checks | Formatting, warning-denied Clippy, relevant Rust/protocol tests, supported-target build. Native package availability must be stated; compiling an unavailable stub is not a native integration build pass. | Exact-head source/code/build results, with adapter-build coverage explicit. |
| Local VA Windows session review | Supported auth/cancel/denial, correct local user/site/context, lock/logoff, network loss, expiry, monitor loss, source changes, disconnect/reconnect and rejected old callbacks. Test at default/minimum 100%. | Actual supported Broker session and observed guard/revocation behavior for that build. No clinical-read validation. |

Reserve `M18F100` for implemented synthetic functional evidence under
`validation/milestone-18/functional-100/{linux,windows}/`. Reserve
`validation/milestone-18/session-local/` for a **sanitized** local outcome record
with build identity, case ID, pass/fail/not-run and coverage limits. Site/user IDs,
endpoint configuration, auth transcripts, patient content and screenshots are
excluded from publishable receipts. Use documented guard detection/validity
bounds rather than claiming instantaneous detection from polling.

M18F100 writers now produce isolated synthetic evidence; active wrappers use
M18. M17 writer entry points are frozen before writing. Before migration, pin historical bytes and freeze M17 writers; preserve its
user-reported pass and pending exact Windows binding. Do not use a M17 result as
proof of live sign-in, gate enforcement or M18 acceptance.

## Completion and open facts

M18 is functionally complete only when the guarded supported adapter and its
local VA session exercise are demonstrated for an exact build, alongside the
synthetic/hosted checks above. Code can be delivered with the native adapter
explicitly unavailable if a required local fact/package is missing; record that
as partial M18 delivery, not completed connectivity. No new permission prompt is
needed merely because the existing conditional authorization is being applied.

The route family is known. Remaining facts are the supported interface/package
and architecture, authentication handoff/context/status operations, VA-network
attestation/access boundary, Windows session monitor behavior and transport peer
verification. These are implementation inputs; do not guess them or ask for
secrets/internal configuration in chat. Use the contract's fact table to record
safe documentation references and leave unsupported gates denied.

M17 manual functionality is already user-reported pass; its exact Windows
artifact binding remains tracked independently and does not block planning.
The portable coordinator, source boundary and synthetic checks are implemented.
Next integration step: resolve the native fact table and implement the supported
Broker adapter; use [the morning handoff](m18-morning-handoff.md). M19 then implements
patient identity and bounded Notes reading through the accepted session boundary.

## Implementation checkpoint

The implementation branch `m18-vista-session-foundations` starts from
`91efbcce7c3acadbc4957abe41db455273cc7e1a`. It adds a pure Rust coordinator,
redacted bounded identities, typed safe errors, bootstrap/read separation,
request ownership, source/connection/session generations, freshness/revocation
rules and source guards on all nine delayed Mock callback families. The desktop
has explicit Mock/Live selection and a session-only view; unsupported native
integration is visible and Connect is disabled. `--live-session` opens this
unavailable view and cannot be combined with automated integration/smoke flags.

`chart-vista-bridge` is an explicitly unavailable adapter on all targets. It
contains no network/authentication/credential implementation and makes no
production trust claims. Step 18.4 and 18.6 are not complete. Portable/Windows
build success verifies the foundation and unavailable adapter only. Real session
acceptance and M18 milestone completion remain pending; M19 cannot inherit a
working native capability from this partial delivery.

Local validation passed 178 Rust tests (20 new coordinator cases and one native
unavailability test), 24 receipt/isolation tests, format, warning-denied workspace
Clippy, build and callback smoke. Three 100% journeys each passed 132 checkpoints
with 212 deliveries / 105 rejected replies. Both sizes passed. All 2,614 startup
evidence files remain unchanged; the runner also preserves the new not-run
session-status record. See [acceptance](../validation/milestone-18/functional-100/acceptance.json)
and [technical review](../validation/milestone-18/functional-100/technical-review.json).
[PR #14](https://github.com/joshuabenavente/cprs-exploration/pull/14) is merged
after exact-head portable/Windows code-build CI passed; the topic branch is
pruned locally/remotely. See the [delivery record](../validation/milestone-18/functional-100/merge-checkpoint.json).
Three additional Linux CLI cases reject live/automation combinations and unsupported
overrides before backend startup, bound to the same executable. Native integration
and actual VA session acceptance remain pending, so M18 is not complete.
