# M18 foundation functional checklist — 100% only

Status: not run on the user's Windows workstation for this build.
The production native Broker adapter is **unavailable**. This checklist covers
the offline foundation/UI, not real authentication or connectivity.

```powershell
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap
python scripts/verify_integrated.py
.\scripts\Review-Functional.ps1 -Size default
```

Close and repeat with `-Size minimum`. Both are 100%; no automated journey runs
in the background during manual review. Keyboard navigation/focus and screen
readers are excluded, additional scales deferred.

- [ ] Default source is Mock patients; normal invented patient lookup/paging,
      Cover Sheet, Notes, Orders grouping/filtering and Results readers still work.
- [ ] With a mock chart/detail open or replies pending, select Live session.
      All mock chart identity, selection, rows and text disappear. No real patient
      lookup or chart is offered.
- [ ] Live says the supported Broker integration is not built, with Connect and
      Disconnect disabled. No network/sign-in success or authenticated identity
      is claimed, even on the VA network with an ordinary CPRS session open.
- [ ] Return to Mock: fresh candidates, no previous chart/selection/text restored.
      Repeated mode changes do not let late mock replies restore old data.
- [ ] `Review-VistaSession.ps1 -Size default` and `-Size minimum` open the same
      unavailable session view. No credential prompt or patient content appears.

Report default-100/minimum-100 results with the new M18F100 source/executable
receipt binding. No M17 pass is inherited. Keep native session testing not-run;
it cannot be performed with the unavailable adapter. See
[the morning handoff](../../../docs/m18-morning-handoff.md).
