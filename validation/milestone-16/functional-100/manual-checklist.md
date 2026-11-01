# Current manual functional checklist — 100% only

Status: current functional-only Windows build is not yet verified in this
workspace. Earlier full-scale/keyboard/listening reports remain historical.

In Windows PowerShell, preserve old Windows receipts/logs outside the repository
before running the new tools. Update to the delivered functional-policy source,
then run:

```powershell
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap
python scripts/verify_integrated.py
python scripts/test_m16_functional_protocol.py
```

The matrix contains default-100 and minimum-100 only. It does not run keyboard,
focus/navigation, layout/reveal probes or screen-reader checks. Receipt protocol
is M16F100; output is `validation/milestone-16/functional-100/windows/`.

After automation passes, open the normal app for manual functional checks:

```powershell
.\scripts\Review-Functional.ps1 -Size default
```

Close the app and repeat with `-Size minimum`. Both use 100%. This launcher does
not run an automatic journey in the background. Use mouse controls for this phase.

- [ ] Search nine invented patients by name/ID/demo lookup. Duplicate names and
      Unicode remain distinguishable; Next/Previous page correctly and clear preview.
- [ ] Select and open the exact patient. Acknowledgment, denial, deceased-record
      and cancel cases preserve the correct committed chart.
- [ ] Invalid search page, malformed result, unavailable and empty search remain
      distinct. Recover using Normal; stale replies do not replace current results.
- [ ] All five Cover Sheet panels open the correct read-only detail; empty/error/
      retry and patient changes never expose old-patient text.
- [ ] Notes text/author/date combinations, invalid dates, Reset and automatic
      reading work, including Unicode/long and empty notes.
- [ ] Orders text/status/date and Results text/date combinations work. Invalid
      edits and Reset clear old selection/detail. Selecting alone does not open
      detail; View and Close buttons work. Long/empty details remain distinct.
- [ ] Delayed/error/retry, tab changes and patient selection/cancellation retain
      current ownership and reject late/duplicate replies.

Record functional Pass/Fail for default-100 and minimum-100, with tested EXE SHA256
and source/matrix receipt. Keyboard navigation/focus and screen readers are
excluded; other scales are deferred. Do not repeat the historical ten-scale or
Narrator checklist during this phase.
