# Current validation policy: functionality at 100%

The user's instruction is:

> from now on i only want to test 100% scale for functionality. also drop any keyboard navigation tests and any screen reader tests. after we finish we can go back and test different scales

Active checks exercise functional workflows at 100% application scale, using
default and minimum window sizes. Keyboard/focus/navigation and screen-reader/
Narrator checks are excluded from current acceptance. Other scale factors are
deferred until functional work is finished. These items are not pending blockers
for this phase. Application keyboard/scaling capabilities remain intact.

The active protocol is `M16F100`. `Test-MockChart.ps1` and `verify_integrated.py`
now use the functional runner/verifier. New receipts live under
`validation/milestone-16/functional-100/{linux,windows}/`. Historical full-scale
M16 writers and review entry points fail before writing; old receipts, including
the interrupted Windows 200% focus failure, retain their original status.

The interrupted run does not demonstrate application focus stealing: the user
reported interacting or switching windows. The new functional journey does not
assert keyboard focus or dispatch Tab/Shift+Tab events. It retains identity,
search/paging/filtering, selection, read-only detail, failure/empty/retry and
stale/duplicate reply checks. No claim of a product focus fix is made.

Follow the [functional checklist](../validation/milestone-16/functional-100/manual-checklist.md).
The manual launcher starts the normal app after verifying current bindings;
it does not drive an automated journey while the user is reviewing functionality.

Local verification passed: 148 Rust tests, 20 protocol/isolation tests and three
100% functional journeys, each 109 checkpoints / 158 deliveries / 70 rejections.
Both window sizes passed; all 2,554 prior evidence files remain unchanged. See
[the current acceptance record](../validation/milestone-16/functional-100/acceptance.json).
The later supplied Windows receipt and manual pass report are recorded in
[current acceptance](../validation/milestone-16/functional-100/windows/user-acceptance.json).

Delivery: [PR #12](https://github.com/joshuabenavente/cprs-exploration/pull/12)
merged after final-head portable/Windows code-build CI passed; topic branches
were pruned. See [delivery receipt](../validation/milestone-16/functional-100/merge-checkpoint.json).
Normal typing into functional fields is allowed; keyboard navigation/focus is not
an acceptance test. Use M16F100 only for current functional results.

Windows acceptance update: nine automated steps and three 109-checkpoint 100%
journeys verified from supplied receipts; both manual functional samples are
user-reported pass. Exact artifact binding uses the Windows receipt SHA256; the
assistant did not independently hash or execute that Windows binary. Excluded
keyboard/screen-reader checks and deferred scales are not acceptance blockers.
