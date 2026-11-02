# Current project validation phase

The user requested functionality testing at **100% application scale only**.
Use default and minimum window sizes at 100%. Keyboard navigation/focus checks
and screen-reader/Narrator checks are excluded from active acceptance. Other
scale factors are deferred until the functional work is finished.

Keep the application's keyboard and scaling functionality intact; this changes
the testing scope. Preserve historical receipts and failed attempts. Write new
functional-only evidence under `validation/milestone-17/functional-100/` and use
the active `Test-MockChart.ps1` / `verify_integrated.py` entry points.

Standing commit/push/merge/prune approval is recorded in
`docs/delivery-workflow.md`. Do not ask for routine delivery approval again within
the established synthetic offline project scope.

# Conditional live VistA scope

The user has lifted the blanket live-connection prohibition for planned
read-only VistA access **only on the VA network while the user is logged in**.
Follow `docs/live-vista-plan.md` and `docs/milestone-18.md`. The planned gate means
an active/unlocked VA workstation session plus an authenticated, authorized
VistA session under the user's identity; unknown or lost gates deny reads and
invalidate pending/displayed patient data. No clinical writes are authorized.
Real reads run locally on that VA workstation, not in cloud development or CI.
Do not place patient data, credentials, internal endpoint details or raw live
responses in this repository, chat, fixtures, screenshots or validation artifacts.
The implemented M17 runtime remains synthetic/offline until a guarded live
provider is built and validated. Historical milestone exclusions retain their
capture-time meaning; this user instruction supersedes the blanket future ban.
Current 100% functional-only test policy remains in force.
