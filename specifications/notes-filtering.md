# M13: authored read-only Notes filtering contract

Approved scope: NF01–NF08 in [M13](../docs/milestone-13.md). All filtering rules
here are prototype policy. Recovered author/date controls establish a UI
precedent; original signed-note eligibility, FileMan dates, provider lookup,
timezones and dialog-return behavior remain unresolved.

- Filter tuple: Unicode substring query, optional stable `AUTHOR-01`–`AUTHOR-04`
  key from the current patient's invented notes, optional beginning/ending dates.
  Author labels are display text; equal labels do not merge distinct keys.
- Bounds use strict ASCII `YYYY-MM-DD`, years 0001–9999, Gregorian calendar
  validity and inclusive days. Blank bounds are open. No whitespace/date-time
  shorthand is accepted. Beginning after ending is invalid. Date comparison
  uses only the invented timestamp's calendar date; no timezone conversion.
- Every edit immediately clears list selection and body, invalidates pending
  list/body work and preserves the committed patient. Invalid/unknown-author
  input stays visible with a distinct validation message and no provider request.
  A valid edit requests a fresh list keyed by the complete typed tuple and owner.
- Provider and response validation apply every predicate. Wrong-owner, duplicate,
  invalid metadata, unknown author and out-of-filter rows reject the whole list.
  Sort remains newest invented timestamp first, then stable note ID.
- Reset clears all fields and loads a fresh unselected list for the same owner.
  Patient commit, tab changes and opening/canceling patient selection use fresh
  default filters; cancellation retains the committed chart and focuses search.
- Error retry preserves the entire valid filter tuple. Loading, empty match,
  invalid input, provider error and successful empty body are distinct states.
  Stale/duplicate success and failure never restore text, selection or old rows.
- Selecting a note still automatically loads its owned read-only body. Ctrl+F,
  Enter, Escape and Ctrl+O retain their established meanings. Controls and errors
  identify the synthetic patient. Every new field/reset action is keyboard
  reachable and reveals its own row when focused.
- All nine patients remain invented. Compiled Notes use distinct author keys,
  including equal display labels and Unicode text. Mock draft/addendum labels
  are not TIU access rules. No editing, persistence, signing, clinical writes,
  live transport, original process or DLL action is added.

Acceptance requires focused identity/date/filter/race/reset/error tests, callback
and real-timer UI checks, new source/build/log-bound M13 receipts and the affected
native keyboard/layout/listening matrix. Automated geometry is synthetic;
Windows native and Narrator results must be recorded separately on the new build.
Historical M2–M12 receipts and all reverse-engineering evidence stay unchanged.
