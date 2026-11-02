# M18 plan: VA-network and session-guarded VistA foundations

Status: planned following the user's conditional authorization for real reading;
no M18 implementation or live connection has started. M17 is delivered, its
manual checklist is user-reported pass, and exact Windows artifact binding is
still tracked separately.

The next implementation priority is the [conditional read-only VistA plan](live-vista-plan.md).
Choose the available supported transport/authentication route; define and test
VA-network, active Windows session and authenticated VistA session guards; then
introduce source/site/user/session-owned provider capabilities. Use synthetic
responses in development and CI. Live deployment runs on the user's VA-network
workstation and must deny dispatch whenever any required gate is unknown or lost.

M18 establishes sign-in, connection ownership, revocation and a small reviewed
read-operation boundary. M19 pilots patient identity and Notes list/text for one
user-selected authorized patient. Further mock feature work takes lower priority
than this route to real reading. The plan specifies data handling, actual RPC
contract discovery and acceptance limits before enabling patient-content calls.

Current blockers are technical facts: supported integration/sign-in route and
trustworthy network/session signals. Do not guess credentials, endpoint addresses,
SSO reuse, server permissions or wire contracts. The planning question requests
only a method name/description; no patient data or secrets belong in chat.

Functionality acceptance stays at default/minimum **100% only**; keyboard/focus/
navigation and screen readers are excluded, other scales deferred. M18 evidence
must use a new isolated protocol/destination once its contract is implemented;
the current runnable validation remains M17F100.
