use chart_core::*;

fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    s.open_selection();
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
    s.set_tab(ChartTab::Notes);
}
fn list(s: &mut AppState, p: &MockProvider, query: &str) -> NotesListRequest {
    let r = s.begin_notes_list(query.into()).unwrap();
    assert!(s.apply_notes_list(&r, p.notes_list(&r)));
    r
}
fn ready(s: &AppState) -> &NoteBody {
    let NoteBodyState::Ready(body) = &s.notes.body else {
        panic!("ready note expected")
    };
    body
}

#[test]
fn nt01_duplicate_titles_select_exact_ids_and_expose_only_owned_text() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    assert_eq!(s.notes.rows.len(), 4);
    assert_eq!(s.notes.rows[0].title, s.notes.rows[1].title);
    assert_ne!(s.notes.rows[0].id, s.notes.rows[1].id);
    assert!(s.notes.rows.windows(2).all(|r| r[0].date >= r[1].date));
    for i in 0..2 {
        let r = s.select_note(i).unwrap();
        assert!(matches!(s.notes.body, NoteBodyState::Loading(_)));
        assert!(s.apply_note(&r, p.note_body(&r)));
        assert_eq!(ready(&s).note_id, r.note_id);
        assert_eq!(ready(&s).patient_id, r.patient_id);
        assert!(ready(&s).text.contains(r.note_id.as_str()));
    }
}
#[test]
fn nt02_out_of_order_and_duplicate_note_replies_never_replace_current_selection() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let a = s.select_note(0).unwrap();
    let b = s.select_note(1).unwrap();
    assert!(!s.apply_note(&a, p.note_body(&a)));
    assert!(s.apply_note(&b, p.note_body(&b)));
    assert!(!s.apply_note(&b, p.note_body(&b)));
    assert_eq!(ready(&s).note_id, b.note_id);
    assert!(!s.apply_note(&a, Err(ProviderError::Unavailable("old failure".into()))));
    assert_eq!(ready(&s).note_id, b.note_id);
}
#[test]
fn nt03_filter_clears_body_and_rejects_old_list_and_old_document() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = list(&mut s, &p, "");
    let doc = s.select_note(0).unwrap();
    assert!(s.apply_note(&doc, p.note_body(&doc)));
    let a = s.begin_notes_list("Alpha".into()).unwrap();
    assert!(s.notes.rows.is_empty());
    assert!(s.notes.selected.is_none());
    assert_eq!(s.notes.body, NoteBodyState::Unselected);
    let b = s.begin_notes_list("ZOË 李".into()).unwrap();
    assert!(!s.apply_notes_list(&old, p.notes_list(&old)));
    assert!(!s.apply_notes_list(&a, p.notes_list(&a)));
    assert!(s.apply_notes_list(&b, p.notes_list(&b)));
    assert_eq!(s.notes.rows.len(), 1);
    assert_eq!(s.notes.rows[0].id.as_str(), "NOTE-03");
    assert!(!s.apply_note(&doc, p.note_body(&doc)));
}
#[test]
fn nt04_patient_change_rejects_same_note_id_from_previous_owner() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-003");
    list(&mut s, &p, "");
    let a = s.select_note(0).unwrap();
    open(&mut s, &p, "SYNTH-004");
    list(&mut s, &p, "");
    let b = s.select_note(0).unwrap();
    assert_eq!(a.note_id, b.note_id);
    assert_ne!(a.patient_id, b.patient_id);
    assert!(!s.apply_note(&a, p.note_body(&a)));
    assert!(s.apply_note(&b, p.note_body(&b)));
    assert!(ready(&s).text.contains("SYNTH-004"));
    assert!(!ready(&s).text.contains("SYNTH-003"));
}
#[test]
fn nt05_tab_and_selector_cancel_invalidate_requests_while_preserving_chart() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let a = list(&mut s, &p, "");
    let d = s.select_note(0).unwrap();
    s.set_tab(ChartTab::Orders);
    assert!(s.notes.rows.is_empty());
    assert!(!s.apply_note(&d, p.note_body(&d)));
    s.set_tab(ChartTab::Notes);
    let b = s.begin_notes_list("".into()).unwrap();
    assert!(!s.apply_notes_list(&a, p.notes_list(&a)));
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.tab, ChartTab::Notes);
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(!s.apply_notes_list(&b, p.notes_list(&b)));
    assert_eq!(s.notes.list_status, NotesListStatus::Idle);
    list(&mut s, &p, "");
    assert!(s.notes.selected.is_none());
    assert_eq!(s.notes.body, NoteBodyState::Unselected);
}
#[test]
fn nt06_empty_list_no_match_and_empty_document_are_distinct_from_errors() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    list(&mut s, &p, "");
    assert_eq!(s.notes.list_status, NotesListStatus::Empty);
    assert!(s.select_note(0).is_none());
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "no such invented title");
    assert_eq!(s.notes.list_status, NotesListStatus::Empty);
    list(&mut s, &p, "NOTE-04");
    let r = s.select_note(0).unwrap();
    assert!(s.apply_note(&r, p.note_body(&r)));
    assert!(ready(&s).text.is_empty());
    assert!(s.message.contains("empty body"));
}
#[test]
fn nt07_list_and_body_failures_clear_text_and_support_explicit_retry() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let r = s.select_note(0).unwrap();
    s.apply_note(&r, p.note_body(&r));
    p.simulation = Simulation::NotesListUnavailable;
    list(&mut s, &p, "");
    assert!(matches!(s.notes.list_status, NotesListStatus::Error(_)));
    assert_eq!(s.notes.body, NoteBodyState::Unselected);
    p.simulation = Simulation::NoteBodyUnavailable;
    list(&mut s, &p, "");
    let r = s.select_note(1).unwrap();
    s.apply_note(&r, p.note_body(&r));
    assert!(matches!(s.notes.body, NoteBodyState::Error(_)));
    let retry = s.retry_note().unwrap();
    assert_ne!(r.generation, retry.generation);
    p.simulation = Simulation::Normal;
    assert!(s.apply_note(&retry, p.note_body(&retry)));
    assert_eq!(ready(&s).note_id, retry.note_id);
}
#[test]
fn nt08_malformed_lists_reject_owner_duplicates_titles_and_unicode_dates() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for damage in 0..5 {
        let r = s.begin_notes_list("".into()).unwrap();
        let mut data = p.notes_list(&r).unwrap();
        match damage {
            0 => data.patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            1 => data.rows[0].patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            2 => data.rows.push(data.rows[0].clone()),
            3 => data.rows[0].title = "  ".into(),
            _ => data.rows[0].date = "李李李李李 99:99".into(),
        }
        assert!(s.apply_notes_list(&r, Ok(data)));
        assert!(matches!(s.notes.list_status, NotesListStatus::Error(_)));
        assert!(s.notes.rows.is_empty());
    }
}
#[test]
fn nt09_document_owner_or_id_mismatch_fails_closed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    for damage in 0..2 {
        let r = s.select_note(0).unwrap();
        let mut body = p.note_body(&r).unwrap();
        if damage == 0 {
            body.patient_id = PatientId::synthetic("SYNTH-003").unwrap();
        } else {
            body.note_id = NoteId::synthetic("NOTE-02").unwrap();
        }
        s.apply_note(&r, Ok(body));
        assert!(matches!(s.notes.body, NoteBodyState::Error(_)));
    }
}
#[test]
fn nt10_read_only_unicode_long_body_and_selection_invalidation() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    assert!(s.begin_notes_list("".into()).is_none());
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "  zoë 李  ");
    let r = s.select_note(0).unwrap();
    s.apply_note(&r, p.note_body(&r));
    let original = ready(&s).clone();
    assert!(original.text.len() > 10000);
    assert!(original.text.contains("ZÁRATE, ZOË 李"));
    assert!(original.text.ends_with("END OF INVENTED LONG NOTE\n"));
    assert!(s.select_note(0).is_none());
    assert_eq!(ready(&s), &original);
    assert!(s.select_note(usize::MAX).is_none());
    assert!(s.notes.selected.is_none());
    assert_eq!(s.notes.body, NoteBodyState::Unselected);
}
#[test]
fn nt11_order_is_deterministic_even_when_provider_rows_are_reversed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let r = s.begin_notes_list("".into()).unwrap();
    let mut data = p.notes_list(&r).unwrap();
    data.rows.reverse();
    for row in &mut data.rows {
        row.date = "2026-10-30 10:00".into();
    }
    s.apply_notes_list(&r, Ok(data));
    assert_eq!(
        s.notes
            .rows
            .iter()
            .map(|r| r.id.as_str())
            .collect::<Vec<_>>(),
        vec!["NOTE-01", "NOTE-02", "NOTE-03", "NOTE-04"]
    );
}
#[test]
fn nt12_denied_and_unavailable_patient_records_cannot_be_requested_from_mock_provider() {
    let p = MockProvider::default();
    for id in ["SYNTH-006", "SYNTH-007"] {
        let patient_id = PatientId::synthetic(id).unwrap();
        assert!(
            p.notes_list(&NotesListRequest {
                generation: 1,
                patient_id: patient_id.clone(),
                query: "".into(),
                filter: NotesFilter::default(),
            })
            .is_err()
        );
        assert!(
            p.note_body(&NoteRequest {
                generation: 1,
                patient_id,
                note_id: NoteId::synthetic("NOTE-01").unwrap()
            })
            .is_err()
        );
    }
}
