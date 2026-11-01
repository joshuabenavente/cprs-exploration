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
