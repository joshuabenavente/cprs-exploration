# Mock-only read-only Notes

Scope: CPRS Chart only, pinned executable 1.33.214.5 / OR*3.0*639. The Rust runtime uses compiled invented records. There is no TIU transport, clinical-data import, editor, signature, addendum creation, printing, or persistence.

## Static evidence

Twenty MAP-named functions have focused Ghidra instruction listings, decompilations, call tables, and separate literal/address annotations under `analysis/notes/`. Automatic whole-program analysis is disabled. The pinned inputs are recorded in `provenance/chart.lock.json`; generated evidence hashes are recorded in `validation/milestone-4/static.json`. These are static findings, not original-client runtime observations or recovered Pascal source.

| Observation | Evidence | Limit |
| --- | --- | --- |
| Notes has a tree, a flat list, and separate reading and editing controls. | `resources/TFRMNOTES.dfm.json`: `tvNotes`, `lvNotes`, `lstNotes`, `memNote`, `memNewNote` | Stored visibility does not establish which view a site opens. Inherited defaults remain unresolved. |
| The flat list has Date, Title, Subject, Author, Location, and hidden fmdate/TIUDA columns. | `lvNotes.Columns`; `ReadOnly=true`, `RowSelect=true`, `Visible=false` | The prototype adopts the five visible headers. It does not use FileMan dates or TIU identifiers. |
| Document text is a read-only, plain, nonwrapping rich-text view with both scrollbars and Courier New. | `memNote`: `ReadOnly=true`, `PlainText=true`, `WordWrap=false`, `ScrollBars=ssBoth` | This describes the stored read control, not every runtime property. `memNewNote` is a separate write control and is excluded. |
| Page display and view context are distinct from list retrieval. | `DisplayPage` at `00e146cc` calls the MAP address for `rTIU.GetCurrentTIUContext` and `SetViewContext`; `LoadNotes` at `00e21f14` calls `rTIU.ListNotesForTree` and `ClearTVNotes`. | Full context values, defaults, status permissions, and tree-building rules are not reconstructed. `SetViewContext` also references `SaveCurrentNote`; this implementation never invokes that path. |
| Both list and tree selection lead toward reading the selected document. | `lvNotesSelectItem` at `00e202f8` checks selection/item availability, extracts a stored field, updates the hidden list, then calls `lstNotesClick`; `tvNotesChange` at `00e1e870` calls `DoSelect` at `00e2307c`, which calls `lstNotesClick`. | Register ABI, positional field meaning, indirect dispatch, and exception paths remain uncertain. Do not translate decompiler parameters directly into Rust contracts. |
| The selection handler retrieves document text and carries a loading message. | `lstNotesClick` at `00e19480`, literal `Retrieving selected progress note...`; instruction `00e196f8 CALL 00a0b870` resolves to `rTIU.LoadDocumentText`. | Notifications and PCE display also occur in the original handler. They are excluded. |
| Tree/list “SHOW MORE” is a separate action. | `tvNotesKeyDown` at `00e1f8e8`, `lvNotesKeyDown` at `00e20234`, `lvNotesDblClick` at `00e20188`: Enter/double-click checks a `SHOW MORE` marker before the MAP call `GetMoreDocuments` at `00e23618`. | These exports do not establish a general Enter-to-edit or Enter-to-read gesture. The mock's Enter-to-focus-text gesture is authored. No pagination sentinel is implemented. |
| Patient clearing has an explicit Notes path. | `ClearPtData` at `00e14524` calls MAP-resolved `ClearEditControls` and `ClearTVNotes`; the latter at `00e14ec4` clears the tree while temporarily detaching its change handler. | The prototype clears its own list/selection/text and invalidates requests; no inherited client lifecycle is claimed. |
| Signed-note author/date selection dialogs exist. | Fully consumed `TFRMNOTESBYAUTHOR` and `TFRMNOTESBYDATE` resources: signed-note captions, author/date inputs, sort-order groups, OK/Cancel handlers. | Dialog runtime behavior is not recovered or implemented. The mock's single substring filter is an authored convenience. |

The `rTIU` wrappers retain literals `TIU DOCUMENTS BY CONTEXT`, `ORWTIU GET LISTBOX ITEM`, `TIU GET RECORD TEXT`, and `TIU DETAILED DISPLAY`. The latter is a distinct detailed-display clue; the mock body follows the ordinary document-text reading slice, with no detailed-display dialog. These strings establish neither server registration nor argument/response contracts, permissions, live compatibility, or site behavior.

`ReadToFront` at `00e1c0f8` makes three calls to MAP-resolved `Vcl.Controls.TControl.BringToFront`; naming and instruction evidence support separate view layering. They do not prove the prototype's layout matches the original.

## Authored behavior

The prototype uses one flat list, newest invented timestamp first with note-ID tie breaking. Filtering matches title, subject, author, location, or mock note ID with Unicode lowercase matching; accent folding is not provided. Title is not an identifier. Status labels such as “Mock draft” are invented metadata, not recovered TIU statuses or access rules.

Selecting a row loads its document automatically while leaving focus in the table. Enter or “Read selected note” focuses the read-only text; Escape returns to the list. Ctrl+F focuses the Notes filter; Ctrl+O opens patient selection. Text supports selection and independent horizontal/vertical scrolling. No edit, save, sign, print, or clinical action is offered.

List and document requests have independent monotonically increasing generations. List identity includes patient ID and filter; document identity includes patient ID and note ID. Repeated IDs and duplicate titles across fixtures deliberately exercise identity checks. A delivery must match its pending request, the current active patient, Notes tab, selection, and response owner/ID; duplicate and stale successes and failures are discarded.

Changing the filter clears rows, selection, and body immediately. Selecting another row clears the old body before loading. Leaving Notes, opening patient selection, or committing a chart clears all Notes transient state and invalidates requests. Canceling patient selection preserves the committed patient and tab, then loads a fresh list without restoring old text or selection. Errors retain no previous document. List loading, successful empty results, no filter matches, list failure, document loading, document failure/retry, and a successful empty document are distinct states.

`SYNTH-002` has an empty invented Notes list. Other accessible fixtures have duplicate-title notes, a long Unicode note, and an empty-body note. “List unavailable”, “Text unavailable”, and “Slow note replies” are deterministic in-memory simulations. Slow replies delay NOTE-01 longer than NOTE-02 to exercise selection races. All generated content is invented training text and describes no real encounter or clinical finding.

## Acceptance evidence

Core cases NT01–NT12 cover exact identity, duplicate titles, ordering, list/document races, duplicate delivery, patient/tab/selector invalidation, Unicode filtering, empty states, error/retry, malformed records, long text, and denied/unavailable fixtures. Native UI, clipboard/manual input, and assistive-technology observations are recorded separately under `validation/milestone-4/`; passing core/callback checks does not establish those results.
