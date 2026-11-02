# Conditional read-only VistA plan

The user changed the project boundary with this instruction:

> i'd like to lift the rule on vista connection - provided that it only happens on the VA network when i am logged in. i am interested in getting some real reading going. factor that into the plan

This replaces the blanket prohibition on live VistA connectivity for future
read-only development. It does not change the implemented M17 runtime: today it
still uses nine compiled invented patients and has no transport/authentication.
Historical mock contracts and receipts retain their original scope.

Selected route: the user reports **an approved CPRS/RPC Broker sign-in path**
is available. M18 targets that supported path. The exact integration library,
authentication handoff, session signals and endpoint configuration are still
local technical facts to establish; this report does not by itself verify them.

The next priority is a guarded local connection followed by a small real-reading
pilot. Further mock UI features move behind this work. M17's user-reported manual
pass and pending exact Windows build binding remain a separate evidence item.

## Connection boundary

Live mode runs on the user's VA-network Windows workstation, with the user
actively logged in and an authenticated VistA session under that user's identity.
A Windows login alone does not establish VistA authorization. The planned
interpretation also requires the workstation session to be unlocked and active.
The mock remains available independently and is the default launch mode.

| Rule | Planned behavior and required evidence |
| --- | --- |
| VA network only | Use a locally configured, site-supported endpoint and a trustworthy site network-access signal or equivalent enforced VA-only access boundary. A reachable host, private IP, DNS suffix, checked box, or working VPN alone does not prove the gate. Document the actual supported signal before choosing its implementation. Unknown/unavailable gate denies live operations. |
| User/session only | Use the available supported authentication method, including required MFA/SSO when applicable; check the authenticated user and VistA application context/permissions. Do not assume an existing CPRS login can be reused or extract credentials/tokens from another process. Unknown/expired authorization denies reads. |
| Enforce every request | A live capability is scoped to source/site, user and session generation. Check it before dispatch and before applying a reply. Refresh/validate the network/session evidence rather than trusting a launch-time check forever; document validity and revocation behavior. |
| Revoke on loss | On workstation lock/logoff, VistA expiration/logoff, loss of the VA network signal, or uncertain guard state: block new reads, cancel pending work, discard late replies, close transport and clear visible patient data and application-held caches. Require valid gates to reconnect. Cancellation alone is insufficient. |
| Read-only clinical scope | Expose a small typed operation set backed by reviewed read contracts, not an arbitrary RPC entry point. No note/order creation, edit, save, signature, cosignature, prescribing, scheduling changes or other clinical mutations. Authentication and normal server security/audit bookkeeping may still have server effects. |
| Data stays local | Keep real responses in application memory on that workstation; no durable clinical cache, response dumps, telemetry, debug patient IDs, screenshots, clipboard export, repository fixtures, CI artifacts or uploads into this cloud/chat. Bound memory and response sizes; clear application-held data on patient/source/session changes. Memory clearing is not a claim of secure erasure or control over OS-managed storage. |
| Clear identity | Show live/mock source, site and current patient identity. Separate live identifiers from SYNTH-/NOTE-/ORDER- fixture IDs. Never silently fall back to mock data after a live error or mix data across patients, sites, users or sources. |

Live endpoint and authentication configuration stays in the local deployment
environment; passwords/tokens are never committed. Logs/receipts contain only
nonclinical status, build identity and approved operation labels, with no request
parameters, patient identifiers or response bodies. Keep credentials in the
supported session mechanism, not a new home-grown credential store.

This cloud workspace is for source, synthetic tests and sanitized documentation.
It is not the execution location for real patient reads. The user’s VA-network
condition is not established by this workspace’s ordinary internet access.

## M18: connection and session foundations

1. Use the user-reported approved CPRS/RPC Broker sign-in path. Identify its
   supported local integration interface and documentation rather than inventing
   a raw protocol or assuming automatic CPRS session reuse. Determine how VA-network membership, Windows
   session state, authenticated VistA identity, context and session expiry can
   actually be verified. Do not request secrets, internal endpoints or patient
   examples through this chat.
2. Specify the connection gate, lifecycle and operation allowlist, including
   negative cases. Choose one source/site per live session. If reliable network
   or session signals are unavailable, document that technical gap and keep live
   dispatch disabled rather than replacing the condition with a user checkbox.
3. Introduce a provider boundary with explicit source/site/user/session identity,
   cancellation and generations. The current `PatientProvider` and identifiers
   encode synthetic assumptions; do not point `MockProvider` at a server or parse
   real identifiers through synthetic constructors. Review how live response
   ownership and completeness will be established before translating into UI data.
4. Prove gates and revocation using synthetic transports, replies and identities:
   denied/unknown network, locked/logged-off workstation, no VistA login, expiry,
   denial, disconnect, source/user/site changes, malformed/oversized responses,
   and late/duplicate replies. Assert no clinical dispatch when a gate is closed
   and no display of data after revocation. Verify clinical write operations are
   absent from the capability.
5. On the VA workstation, exercise supported sign-in and session lifecycle before
   any patient-content pilot. Record sanitized build/protocol/gate outcomes only.
   A logged-in desktop screenshot or public CI pass is not proof of these gates.

M18's deliverable is the tested guarded provider/authentication foundation and an
explicitly documented available transport route, not a broad chart reader. The
first planning work can proceed here without access to a VA endpoint. No live
connection is performed by this plan update.

## M19: first live reading pilot

Start with one deliberately selected patient the logged-in user may access:
verify the patient banner/identity and access response, list a bounded page of
Notes, and explicitly open one note's read-only text. Establish a supported lookup
route or patient selection handoff; do not import a roster or scrape a running
CPRS process. Enforce the user's existing access restrictions and any supported
sensitive-record acknowledgment; do not emulate the mock's invented permission
rules. Unsupported permissions or acknowledgment requirements stop that read.

For each candidate operation, verify the site's registered context, exact
arguments, response fields/encoding, patient binding, server effects, pagination,
limits and errors. `TIU DOCUMENTS BY CONTEXT`, `ORWTIU GET LISTBOX ITEM` and
`TIU GET RECORD TEXT` in [Notes evidence](../specifications/notes.md) are discovery
clues, not a ready-to-enable allowlist. Unknown effects stay disabled. Do not
reuse original UI paths that can save a current note.

Use real server identities, dates, statuses and pagination semantics. The mock's
four-row totals, complete-fixture assumptions, strict fixture timestamps and
invented author/status labels are not live contracts. Clearly distinguish empty,
restricted, partial/truncated, unavailable and fully loaded responses. Keep long
text bounded and show when more content is required; do not silently present a
partial note as complete. Do not claim clinical equivalence or completeness from
matching the synthetic UI.

Acceptance on the VA workstation covers correct source/site/patient identity,
Notes list/text, denied access, disconnect/expiry/reconnect and lock/network-loss
revocation with no old data reappearing. Compare what the user reads against the
supported source locally, without publishing patient data as proof. Keep exact
build and sanitized operation/outcome evidence separate from mock acceptance.

## Later slices and reverse-engineering priorities

After the Notes pilot, add one bounded read family at a time: Results, then the
required Cover Sheet panels and Orders viewing. Review each operation separately;
a whole original chart-open/update handler may have extra side effects. Keep
entry/edit/signing, original DLL loading and server changes out of these slices.

The former decision to defer all transport/login targets is partially superseded.
If the chosen integration needs binary clarification, prioritize static review
of `ORNet.SetParams` (009ad030), `Wsockc.NetStart` (009916c8) and
`RpcSLogin.StartProgSLogin` (00996390), using existing pinned evidence. Names and
client literals alone establish neither wire contracts nor read-only behavior.
`fNotes.SaveEditedNote` (00e19034) and `rMisc.LoadDll` (01192018) remain deferred.
A supported documented gateway may make this extra recovery unnecessary.

## Testing and next decision

Keep functionality testing at **100% application scale**, default/minimum window
sizes. Keyboard navigation/focus and screen-reader checks remain excluded; other
scales remain deferred. Network/authentication tests verify this newly requested
boundary; they do not expand the visual/assistive-technology matrix. Continue
synthetic tests and hosted builds without any live VA connectivity or real data.
Use a new evidence protocol/path for the future connected milestone, preserving
all M17 and earlier receipts; do not rebrand mock passes as live acceptance.

Immediate next step: draft M18's concrete guard/provider contract around the
selected CPRS/RPC Broker sign-in path, establishing its documented integration
interface and reliable network/session signals. This is a
technical discovery dependency, not a new blanket request for permission to
perform the conditionally authorized read-only work.
