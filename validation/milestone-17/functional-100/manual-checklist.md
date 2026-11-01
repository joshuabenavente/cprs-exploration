# M17 manual functional checklist — 100% only

Status: not run for the new Windows build. Keep M16 receipts as historical.
In Windows PowerShell, update to the delivered M17 source and close the mock:

```powershell
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap
python scripts/verify_integrated.py
python scripts/test_m17_functional_protocol.py
.\scripts\Review-Functional.ps1 -Size default
```

Automation must finish before manual interaction. Close the normal app and
repeat the launcher with `-Size minimum`. Both samples are 100% only.

- [ ] Open a nonempty invented patient's Orders. Flat has four rows newest-first.
      Select Group by service: services A, B, C appear, with orders 01/03 in A,
      02 in B and 04 in C. Each order remains identifiable in the detail.
- [ ] Click/repeatedly click headings: no order/detail opens. An existing real
      selection/detail remains selected. Select duplicate-title ORDER-02 in B:
      selection alone does not open it; View opens ORDER-02, Close retains it.
- [ ] Combine text, status and inclusive dates while grouped. Unicode query
      “zoë 李”, Mock active, and 2026-10-28 through 2026-10-29 show only ORDER-03
      in A. View its long detail; no old order/patient content appears.
- [ ] Missing text produces no rows/headings. Invalid date stays invalid when
      toggling grouping. Reset view clears filters and returns to four flat rows.
- [ ] Grouped List unavailable/retry/recovery preserve current filters/grouping.
      Slow replies followed by grouping changes never restore old selection/text.
- [ ] Switching tabs, opening/cancelling patient selection, and committing another
      patient restore flat/default filters and clear old detail. SYNTH-002 remains
      empty with no headings in both modes.
- [ ] Existing search/paging, Cover Sheet, Notes and Results read-only workflows,
      empty/error/retry and patient ownership still work.

Report default-100 and minimum-100 functional Pass/Fail, bound to the new M17F100
receipt/source and executable SHA256. Keyboard navigation/focus and screen-reader
checks are excluded. Additional scales are deferred until functional work ends.
Normal typing into filter fields is permitted.
