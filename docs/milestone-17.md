# M17: read-only Orders grouping by service

The user approved the recommended next milestone after M16F100 acceptance.
Implementation starts from main `18f3f532d380159524430dbb69ca700be119aee7` on
`m17-orders-service-grouping`. Standing commit/push/merge/prune approval applies.

[OG01–OG08](../specifications/orders-grouping.md) defines the authored grouping
policy and separates it from the observed original form affordance. Orders now
have Flat list / Group by service views; groups preserve exact patient/order
identity and compose with text/status/date filters. Reset view restores flat and
all default filters. Grouping changes invalidate pending list/detail work.

No new clinical workflow, multiselect, live access or original program execution
is introduced. The fixture uses A/B/A/C service labels with unchanged order IDs
and counts. Nonempty groups alone create headings. The core projects validated
records, while the desktop resolves a displayed row through its stable identity;
headings cannot become an order request.

Current acceptance stays functional at 100% only. Use the
[M17 checklist](../validation/milestone-17/functional-100/manual-checklist.md).
M17F100 evidence is isolated from accepted M16F100 evidence, whose writer entry
points now exit before writing. Windows native functional acceptance must be
reported for the new build; M16's earlier manual passes are not inherited.

Local verification passed 157 Rust tests (nine new grouping cases), 21 receipt/
isolation tests, formatting, warning-denied workspace Clippy, desktop build and
callback smoke. Three 100% journeys each passed 121 checkpoints with 185
replies / 86 stale replies rejected. Default/minimum samples passed; all 2,597
startup evidence files remain byte-identical. See
[acceptance](../validation/milestone-17/functional-100/acceptance.json) and
[technical review](../validation/milestone-17/functional-100/technical-review.json).
Final-head CI and publication are next. Windows manual functionality is not run
for M17; keyboard/screen-reader checks remain excluded and other scales deferred.
