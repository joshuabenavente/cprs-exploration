use chart_core::*;

fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    let r = s.open_selection();
    s.apply_search(&r, p.search(&r));
    let r = s.begin_search(id.into(), ListMode::All);
    s.apply_search(&r, p.search(&r));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    s.apply_chart(&r, p.chart(&r.patient_id));
    s.set_tab(ChartTab::Notes);
}
fn author(n: usize) -> Option<NoteAuthorId> {
    Some(NoteAuthorId::synthetic(&format!("AUTHOR-{n:02}")).unwrap())
}
fn filter(
    s: &mut AppState,
    p: &MockProvider,
    query: &str,
    a: Option<NoteAuthorId>,
    begin: &str,
    end: &str,
) -> NotesListRequest {
    let r = s
        .begin_notes_filter(query.into(), a, begin.into(), end.into())
        .unwrap();
    assert!(s.apply_notes_list(&r, p.notes_list(&r)));
    r
}
fn ids(s: &AppState) -> Vec<&str> {
    s.notes.rows.iter().map(|r| r.id.as_str()).collect()
}

#[test]
fn nf01_equal_author_labels_keep_distinct_keys_and_combined_predicates() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let options = s.note_authors();
    assert_eq!(options[0].label, options[1].label);
    assert_ne!(options[0].id, options[1].id);
    filter(
        &mut s,
        &p,
        "progress",
        author(2),
        "2026-10-29",
        "2026-10-29",
    );
    assert_eq!(ids(&s), vec!["NOTE-02"]);
    assert_eq!(s.notes.rows[0].status, "Mock draft");
    filter(
        &mut s,
        &p,
        "progress",
        author(1),
        "2026-10-29",
        "2026-10-29",
    );
    assert_eq!(s.notes.list_status, NotesListStatus::Empty);
}

#[test]
fn nf02_strict_calendar_dates_include_leap_and_century_rules() {
    for d in ["0001-01-01", "9999-12-31", "2000-02-29", "2024-02-29"] {
        assert!(NoteDate::parse(d).is_ok(), "{d}");
    }
    for d in [
        "0000-01-01",
        "1900-02-29",
        "2026-02-29",
        "2026-04-31",
        "2026-00-01",
        "2026-13-01",
        "2026-01-00",
        "2026-1-01",
        " 2026-01-01",
        "2026-01-01 ",
        "２０２６-01-01",
        "2026-01-01 00:00",
    ] {
        assert!(NoteDate::parse(d).is_err(), "{d}");
    }
}

#[test]
fn nf03_inclusive_and_open_bounds_keep_newest_first() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for (begin, end, expected) in [
        ("2026-10-28", "2026-10-29", vec!["NOTE-02", "NOTE-03"]),
        ("2026-10-29", "", vec!["NOTE-01", "NOTE-02"]),
        ("", "2026-10-27", vec!["NOTE-04"]),
        ("2026-10-31", "", vec![]),
        (
            "0001-01-01",
            "9999-12-31",
            vec!["NOTE-01", "NOTE-02", "NOTE-03", "NOTE-04"],
        ),
    ] {
        filter(&mut s, &p, "", None, begin, end);
        assert_eq!(ids(&s), expected);
    }
}

#[test]
fn nf04_invalid_edits_reject_pending_list_body_and_failure_then_recover() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old_list = filter(&mut s, &p, "", None, "", "");
    let body = s.select_note(0).unwrap();
    assert!(
        s.begin_notes_filter("".into(), None, "2026-10-30".into(), "2026-10-29".into())
            .is_none()
    );
    assert!(matches!(s.notes.list_status, NotesListStatus::Invalid(_)));
    assert!(s.notes.rows.is_empty());
    assert!(s.notes.selected.is_none());
    assert_eq!(s.notes.body, NoteBodyState::Unselected);
    assert!(!s.apply_note(&body, p.note_body(&body)));
    assert!(!s.apply_notes_list(
        &old_list,
        Err(ProviderError::Unavailable("old failure".into()))
    ));
    assert_eq!(s.notes.beginning_input, "2026-10-30");
    filter(&mut s, &p, "", None, "2026-10-28", "2026-10-29");
    assert_eq!(ids(&s), vec!["NOTE-02", "NOTE-03"]);
}

#[test]
fn nf05_response_rows_must_match_text_author_date_and_author_metadata() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for damage in 0..4 {
        let r = s
            .begin_notes_filter(
                "progress".into(),
                author(1),
                "2026-10-30".into(),
                "2026-10-30".into(),
            )
            .unwrap();
        let mut data = p.notes_list(&r).unwrap();
        match damage {
            0 => data.rows[0].title = "not matching".into(),
            1 => data.rows[0].author_id = author(2).unwrap(),
            2 => data.rows[0].date = "2026-10-29 09:00".into(),
            _ => data.rows[0].author = "spoofed label".into(),
        }
        s.apply_notes_list(&r, Ok(data));
        assert!(matches!(s.notes.list_status, NotesListStatus::Error(_)));
        assert!(s.notes.rows.is_empty());
    }
}

#[test]
fn nf06_request_identity_includes_complete_filter_tuple() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = s
        .begin_notes_filter("".into(), author(1), "".into(), "".into())
        .unwrap();
    let new = s
        .begin_notes_filter("".into(), author(2), "2026-10-29".into(), "".into())
        .unwrap();
    let mut forged = new.clone();
    forged.filter.ending = Some(NoteDate::parse("2026-10-30").unwrap());
    assert!(!s.apply_notes_list(&forged, p.notes_list(&forged)));
    assert!(!s.apply_notes_list(&old, p.notes_list(&old)));
    assert!(s.apply_notes_list(&new, p.notes_list(&new)));
    assert_eq!(ids(&s), vec!["NOTE-02"]);
    assert!(!s.apply_notes_list(
        &new,
        Err(ProviderError::Unavailable("duplicate error".into()))
    ));
}

#[test]
fn nf07_reset_clears_tuple_and_invalidates_same_patient_work() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(
        &mut s,
        &p,
        "progress",
        author(1),
        "2026-10-30",
        "2026-10-30",
    );
    let body = s.select_note(0).unwrap();
    let old = s.begin_notes_list("progress".into()).unwrap();
    let reset = s.reset_notes_filters().unwrap();
    assert_eq!(reset.filter, NotesFilter::default());
    assert!(s.notes.beginning_input.is_empty());
    assert!(s.notes.ending_input.is_empty());
    assert!(!s.apply_note(&body, p.note_body(&body)));
    assert!(!s.apply_notes_list(&old, p.notes_list(&old)));
    s.apply_notes_list(&reset, p.notes_list(&reset));
    assert_eq!(s.notes.rows.len(), 4);
    assert!(s.notes.selected.is_none());
}

#[test]
fn nf08_tab_selector_cancel_and_patient_commit_reset_invalid_input() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "progress", author(1), "", "");
    let body = s.select_note(0).unwrap();
    s.begin_notes_filter("x".into(), author(2), "invalid".into(), "".into());
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(s.notes.query.is_empty());
    assert!(s.notes.author.is_none());
    assert!(s.notes.beginning_input.is_empty());
    s.set_tab(ChartTab::Orders);
    s.set_tab(ChartTab::Notes);
    assert!(s.notes.ending_input.is_empty());
    open(&mut s, &p, "SYNTH-003");
    filter(&mut s, &p, "", None, "", "");
    assert!(!s.apply_note(&body, p.note_body(&body)));
}

#[test]
fn nf09_retry_preserves_tuple_and_empty_body_is_success() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    p.simulation = Simulation::NotesListUnavailable;
    let r = filter(&mut s, &p, "empty", author(4), "2026-10-27", "2026-10-27");
    assert!(matches!(s.notes.list_status, NotesListStatus::Error(_)));
    p.simulation = Simulation::Normal;
    let retry = s.begin_notes_list(s.notes.query.clone()).unwrap();
    assert_eq!(r.filter, retry.filter);
    s.apply_notes_list(&retry, p.notes_list(&retry));
    let body = s.select_note(0).unwrap();
    s.apply_note(&body, p.note_body(&body));
    assert!(matches!(&s.notes.body,NoteBodyState::Ready(b) if b.text.is_empty()));
}

#[test]
fn nf10_unknown_and_unowned_authors_cannot_request_notes() {
    assert!(NoteAuthorId::synthetic("AUTHOR-99").is_err());
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    assert!(s.note_authors().is_empty());
    assert!(
        s.begin_notes_filter("".into(), author(1), "".into(), "".into())
            .is_none()
    );
    assert!(matches!(s.notes.list_status, NotesListStatus::Invalid(_)));
    let r = NotesListRequest {
        generation: 1,
        patient_id: PatientId::synthetic("SYNTH-006").unwrap(),
        query: String::new(),
        filter: NotesFilter::default(),
    };
    assert!(p.notes_list(&r).is_err());
}
