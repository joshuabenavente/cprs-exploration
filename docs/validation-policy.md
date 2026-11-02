# Current validation policy: functionality at 100%

The user's instruction is:

> from now on i only want to test 100% scale for functionality. also drop any keyboard navigation tests and any screen reader tests. after we finish we can go back and test different scales

Active checks exercise functional workflows at 100% application scale, using
default and minimum window sizes. Keyboard/focus/navigation and screen-reader/
Narrator checks are excluded from current acceptance. Other scale factors are
deferred until functional work is finished. These items are not pending blockers
for this phase. Application keyboard/scaling capabilities remain intact.

The active protocol is `M17F100`. `Test-MockChart.ps1` and `verify_integrated.py`
use the M17 functional runner/verifier. New receipts live under
`validation/milestone-17/functional-100/{linux,windows}/`. The prior M16F100 and
full-scale writers fail before writing; original receipts retain their status.

M16F100 acceptance is complete at supplied Windows automation plus user-reported
manual level, with exact binding recorded in
[the historical acceptance](../validation/milestone-16/functional-100/windows/user-acceptance.json).
M17 must establish its own source/executable/log and manual bindings; no old
acceptance is automatically inherited by a new binary.

Follow the [M17 functional checklist](../validation/milestone-17/functional-100/manual-checklist.md).
The manual launcher starts the normal app after verifying current bindings;
it does not drive an automated journey while the user reviews functionality.
The active journey uses callbacks and real timers without asserting keyboard
focus or dispatching Tab/Shift+Tab events. Normal typing into functional filter
fields remains allowed. App keyboard/scaling functionality remains available.

M17 update: the user reports **“all passes”** for the scoped manual checklist.
The [M17 report](../validation/milestone-17/functional-100/windows/user-acceptance.json)
records both 100% sizes as user-reported pass; exact Windows source/executable
and receipt binding is pending. No manual rerun is requested to collect those
read-only bindings.

The [conditional VistA plan](live-vista-plan.md) adds future network/session and
read-operation acceptance on the user's VA workstation. It retains the 100%
functional-only scope. Development/CI use synthetic data; connected milestones
need distinct sanitized receipts and cannot inherit live acceptance from M17.
