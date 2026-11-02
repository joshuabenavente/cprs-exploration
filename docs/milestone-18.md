# M18 plan: VA-network and session-guarded VistA foundations

Status: planned following the user's conditional authorization for real reading;
no M18 implementation or live connection has started. M17 is delivered, its
manual checklist is user-reported pass, and exact Windows artifact binding is
still tracked separately.

The next implementation priority is the [conditional read-only VistA plan](live-vista-plan.md).
Use the user-reported approved CPRS/RPC Broker sign-in path; define and test
VA-network, active Windows session and authenticated VistA session guards; then
introduce source/site/user/session-owned provider capabilities. Use synthetic
responses in development and CI. Live deployment runs on the user's VA-network
workstation and must deny dispatch whenever any required gate is unknown or lost.

M18 establishes sign-in, connection ownership, revocation and a small reviewed
read-operation boundary. M19 pilots patient identity and Notes list/text for one
user-selected authorized patient. Further mock feature work takes lower priority
than this route to real reading. The plan specifies data handling, actual RPC
contract discovery and acceptance limits before enabling patient-content calls.

The route family is now selected: approved CPRS/RPC Broker sign-in, as reported
by the user. Remaining technical facts are the documented integration interface,
authentication handoff and trustworthy network/session signals. Do not guess credentials, endpoint addresses,
SSO reuse, server permissions or wire contracts. No patient data, credentials or internal endpoint details are needed in chat
to document those contracts.

Functionality acceptance stays at default/minimum **100% only**; keyboard/focus/
navigation and screen readers are excluded, other scales deferred. M18 evidence
must use a new isolated protocol/destination once its contract is implemented;
the current runnable validation remains M17F100.
