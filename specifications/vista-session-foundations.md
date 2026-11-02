# M18: VistA connection and session contract

Status: proposed implementation contract. No transport or guard implementation
is added by this document. Authority is the user's conditional read-only scope
and user-reported approved CPRS/RPC Broker sign-in path, recorded in
[the connection plan](../docs/live-vista-plan.md). Those statements establish the
intended route, not a verified SDK, endpoint, authentication handoff or network
attestor. Original client RPC literals are not server contracts.

M18 supports sign-in/session lifecycle only. Its enabled **clinical-read allowlist
is empty**; patient lookup, patient banner and Notes list/text begin in M19 after
reviewing their exact site contracts. No clinical writes are authorized.
Authentication/context checks and normal server audit bookkeeping can have
server effects; read-only does not mean zero server-side bookkeeping.

## Scope and gates

Default launch remains Mock. Live requires an explicit mode choice and Connect.
A missing native adapter/configuration produces a clear unavailable state and
zero Broker calls. Synthetic tests cannot enable a real connection.

`BootstrapAllowed` requires all of:

- Explicit Live selection and current connection attempt.
- A supported local adapter/configuration for exactly one source/site.
- Trusted, current evidence of VA-network access under the chosen site boundary.
- The active, unlocked interactive Windows session and its owning user.

This gate applies before transport open/sign-in and each authentication/context
step. Successful VistA authentication cannot be a prerequisite to *starting*
authentication. `ClinicalReadAllowed` additionally requires a current verified
VistA identity, application context/permissions, session generation and enabled
typed read contract. The final condition is always false in M18.

Teardown is local-first and does not need read capability. A supported remote
logout can occur on deliberate Disconnect while bootstrap conditions still hold;
loss/uncertainty of those conditions causes local close/disposal without queuing
new remote cleanup calls. Cleanup failures cannot keep the session usable.

| ID | Required behavior | Acceptance evidence |
| --- | --- | --- |
| VS01 | Mock is default; Live requires explicit selection/Connect and a present supported adapter. No probe, automatic reconnect, endpoint discovery scan or fallback to Mock after live failure. | Native adapter call counters stay zero at startup and when absent/blocked. Mock/live switch callbacks and status assertions. |
| VS02 | Only supported VA-network evidence authorizes connection. Reachability, RFC1918 address, domain suffix, VPN presence or a user checkbox alone do not authorize it. Missing/expired/failed signal denies dispatch. | Trusted/denied/unknown/stale signal cases, including a reachable endpoint with a denied signal. Site facts identify the actual attestor/enforced access boundary. |
| VS03 | Bind to an active/unlocked Windows user/session and the separately authenticated VistA user/site/context. Do not extract/reuse a running CPRS session or assume desktop login authenticates VistA. Sign-in follows the available supported path, including its MFA/SSO requirements. | Cancelled/failed sign-in, wrong site/user/context, lock/logoff, expired VistA session and monitor failure cases. Local supported-path session exercise. |
| VS04 | Bootstrap authorization is distinct from clinical-read authorization. M18 permits only documented authentication/session control operations. No arbitrary RPC API, user-supplied RPC name, general patient-provider dispatch or clinical write route. | Zero clinical-operation calls in every M18 test, including after successful sign-in; unsupported operations rejected before transport. Auth controls documented from the actual integration interface. |
| VS05 | Root source epoch and connection/session epochs are monotonic for the process and never reused on mode changes or reconnect. Request tokens include operation, attempt/session owner and sequence. Bind replies to source/site, Windows owner and VistA owner as applicable. | Late/duplicate success/error, cancelled sign-in, same SDK handle after reconnect, user/site/context change and Mock→Live→Mock races reject obsolete replies. |
| VS06 | Validate current gate evidence at dispatch and immediately before publishing results. Expiry/unknown/monitor loss is denial. A connection-time check alone is insufficient; revocation and dispatch share one serialization/ownership boundary. | Invalidate between queue/dispatch, during authentication, before reply publication and during disconnect. Gate proofs from a previous epoch cannot authorize a new session. |
| VS07 | Revocation increments epochs and disables dispatch first, clears UI/application-held data next, then cancels/disposes transport without awaiting network cleanup. No ready state while teardown is incomplete; fresh Connect required after conditions recover. | Lock/logoff, network loss, suspend/resume, VistA expiry, adapter crash, monitor failure and app shutdown during pending operations. Late callbacks never restore state. |
| VS08 | Mode/source changes clear previous chart/selector/list/detail state and invalidate all callback families, including existing Mock timers. Resetting AppState counters alone is insufficient. No combined live/mock patient display or restored previous chart on reconnect. | Start pending mock search/chart/list/detail, switch modes, switch back and deliver old replies; no prior state applies even with repeated synthetic IDs/generations. |
| VS09 | Errors are typed and safe for display/logging. Raw SDK errors, auth arguments, native handles, user/session/site identifiers, endpoint addresses and server payloads are not formatted into shared logs/receipts. Credentials stay in the supported authentication mechanism. | Synthetic marker secrets/IDs in success/error/cancel/oversized responses never appear in captured app logs or receipts; missing config and permission failures stay distinct. |
| VS10 | App-held live material is transient and bounded. Native result parsing validates source/session identity and expected control response before ready state. Disconnect/revoke clears references and closes supported handles. No persistent patient/credential cache or clinical telemetry. | Malformed/oversized/truncated auth metadata, missing owner/context, worker disconnect and teardown cases. No raw transcript capture. Memory clearing is not secure-erasure proof. |
| VS11 | Live UI shows its source, connection state and a local identity confirmation; it offers Connect/Disconnect and clear retry reasons. M18 has no patient-content reader; chart actions are unavailable in Live. Mock readers retain their existing behavior. | Connection-panel callbacks at default/minimum 100%; source switches and errors do not expose a fake chart or a connected claim without verified identity. |
| VS12 | Receipts distinguish portable synthetic checks, hosted Windows compilation and local VA session exercise. Exact source/build/executable hashes bind each result. Preserve M17 and earlier files; no clinical or authentication identity content in public artifacts. | Isolated M18 writer/verifier tests, complete checkpoint sets, source/executable/log tamper rejection, old-writer freeze checks and pre/post historical hashes. |

## State and ownership design

Proposed coordinator states are `Mock`, `LiveUnavailable`, `LiveDisconnected`,
`CheckingGuards`, `Authenticating`, `Connected`, and `Revoking`. Denial/error
carries a typed reason; it never becomes `Connected`. `Connected` means the
session binding is verified, not that patient-reading contracts are enabled.
Entering Live replaces the Mock chart with the connection surface. Returning to
Mock starts clean; the old patient's chart is not restored automatically.

Connect creates a new connection epoch after checking local guards. Authentication
completion must still match that epoch and fresh bootstrap guards before the
coordinator accepts the reported site/user/context. Disconnect, revocation, mode
changes and identity/context changes invalidate pending operations. A refused
request never reaches the adapter. Cancellation is an optimization, not the
correctness boundary: every callback must be rejected independently if obsolete.

Serialize coordinator transitions, dispatch decisions and application of replies
on the owning event-loop/coordinator context. Blocking Broker/authentication work
runs through the adapter's supported threading model and returns an owned result
message; it never retains UI pointers or mutates AppState. Avoid a check-then-send
gap that lets queued work send after the owner has been revoked.

A revocation event takes precedence over accepting data. Keep a monotonic
`SourceEpoch` outside any replaceable AppState, and attach it to **all** pending
Mock and Live callbacks. Do not recreate AppState and thereby reuse an old
request generation without that outer epoch check.

Guard observations have distinct `Allowed`, `Denied` and `Unknown` results plus
issuer/binding, observation generation and monotonic validity information. Plain
booleans or a command-line flag cannot mint trusted network/session capability.
Construct production observations only through the platform adapter; fixture
observation injection is restricted to test harnesses.

Expiry uses a monotonic clock. Subscribe to available platform lifecycle signals
and revalidate before dispatch/publication; a watchdog detects lost monitors and
stale observations. The native adapter facts must specify detection/validity
bounds and supported revocation guarantees before live deployment. Do not invent
a universal polling interval or promise instantaneous physical network-loss
detection. If the implementation cannot establish the user's network/session
condition for an operation, that operation remains blocked. After suspend/resume,
old evidence is invalid until freshly established.

## Proposed implementation seams

| Location | Planned responsibility |
| --- | --- |
| `crates/chart-core/src/live_session.rs` (new) | Pure Rust coordinator, epochs, typed guards/errors, safe status model and operation policy. No endpoint, credential, SDK or raw patient-response ownership. |
| `crates/chart-core/tests/live_session.rs` (new) | Fake clock, attestors and transport counters; meaningful gate/revocation/ownership interleavings. |
| `crates/chart-vista-bridge/` (proposed new Windows adapter crate) | Supported Broker sign-in/session integration and native network/Windows monitors; owned handles, cancellation and constrained safe messages. Select concrete dependencies/architecture only from documented interface facts. |
| `crates/chart-desktop/src/main.rs` | Root source epoch and coordinator ownership; marshal safe adapter results to the UI owner, keep MockProvider scoped to Mock, guard every existing delayed callback at source boundary. |
| `crates/chart-desktop/ui/connection-view.slint` (new) and `app.slint` | Source selection and Live session-only surface, conditional title/banner, Connect/Disconnect and safe status. No patient view in M18 Live. |
| `crates/chart-desktop/src/integrated_check.rs` | Extend the synthetic real-timer journey with connection/source cases; retain M17 functional coverage at 100%. No real adapter/sign-in during CI or automated journeys. |
| `scripts/validate_m18_functional.py`, `verify_m18_functional.py`, `test_m18_functional_protocol.py` (new) | Isolated M18F100 receipts and protocol tests; supported wrapper migration and frozen M17 writers once implementation begins. |

The existing `PatientProvider`, `PatientId`, `PageCursor`, statuses and readers
encode synthetic policies. Leave them as Mock domain in M18; do not solve the
entire clinical model now or cast a real identifier into `PatientId::synthetic`.
M19 will add source/site-bound live identifiers and reviewed patient/Notes
contracts without inheriting mock counts, dates, statuses or access decisions.

`chart-core` currently forbids unsafe code; the workspace denies it. Retain these
protections. Prefer a safe supported integration wrapper. If the actual native
interface needs FFI or a bitness-specific helper, specify that small isolated
boundary, ABI/threading/lifetime rules and any narrowly scoped lint exception
before implementing it; do not relax the whole workspace or execute the original
CPRS/DLL loading path as a shortcut.

## Local integration facts needed for the native adapter

The route family is already selected; no new blanket permission is requested.
Resolve the following from the supported installation/documentation on the VA
workstation. Public planning records may contain method names, version/bitness
and documentation references; internal configuration and user identities stay
local. Do not ask for secrets, patient records or internal endpoints in chat.

| Fact | Needed decision |
| --- | --- |
| Supported interface/package, version, bitness, deployment constraints and thread ownership | In-process adapter versus a supported local helper; exact dependency/ABI. |
| Documented sign-in, MFA/SSO handoff, context verification, cancellation and session expiry/status API | Authentication/control operations and handle ownership; do not assume CPRS single sign-on reuse. |
| VA-network attestation or an equivalent enforced VA-only session access boundary, freshness and revocation signals | Production network gate and measurable detection/validity limits. |
| Interactive Windows session ownership, lock/logoff/switch/suspend/resume notifications and monitor health | Active-session gate and invalidation events. Remote desktop/session switches must not inherit the previous owner's capability. |
| Approved endpoint/server identity verification, transport protection and local configuration source | Source/site binding and authenticated peer expectations without hardcoding or publishing endpoints. Never disable required peer validation. |
| Site context/permission verification and auth/control error semantics | Distinct unauthenticated, unauthorized, unavailable, expired and malformed outcomes. |

Unknown native facts block that adapter/deployment step. They do not block the
portable coordinator, synthetic tests, UI state design or receipt isolation.
Do not implement a checkbox attestor, placeholder authentication or a synthetic
Connected result in the normal app to make an incomplete adapter appear usable.
