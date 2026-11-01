use chart_core::*;

fn first(q: &str, mode: ListMode) -> (AppState, SearchRequest, SearchPage) {
    let mut s = AppState::default();
    let r = s.begin_search(q.into(), mode);
    let page = MockProvider::default().search(&r).unwrap();
    (s, r, page)
}
fn rejected(s: &mut AppState, r: &SearchRequest, page: SearchPage) {
    assert!(s.apply_search(r, Ok(page)));
    assert!(matches!(
        s.search_status,
        SearchStatus::Error(ProviderError::Malformed(_))
    ));
    assert!(s.page.is_none() && s.pending.is_none() && s.confirmation.is_none());
    assert!(s.page_request(Direction::Forward).is_none());
    assert!(s.page_request(Direction::Backward).is_none());
    assert!(s.confirm(&MockProvider::default(), true).is_none());
}
fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
}
#[test]
fn sp01_valid_first_middle_last_and_backward_pages_preserve_fixture_order() {
    let p = MockProvider::default();
    let (mut s, r, page) = first("", ListMode::All);
    assert_eq!((page.start, page.total, page.rows.len()), (0, 9, 4));
    assert!(s.apply_search(&r, Ok(page)));
    let r = s.page_request(Direction::Forward).unwrap();
    let page = p.search(&r).unwrap();
    assert_eq!((page.start, page.rows.len()), (4, 4));
    assert!(s.apply_search(&r, Ok(page)));
    let r = s.page_request(Direction::Forward).unwrap();
    let page = p.search(&r).unwrap();
    assert_eq!((page.start, page.rows.len()), (8, 1));
    assert!(page.next.is_none());
    assert_eq!(page.rows[0].id.as_str(), "SYNTH-009");
    assert!(s.apply_search(&r, Ok(page)));
    for start in [4, 0] {
        let r = s.page_request(Direction::Backward).unwrap();
        let page = p.search(&r).unwrap();
        assert_eq!(page.start, start);
        assert!(s.apply_search(&r, Ok(page)));
    }
    assert!(s.page_request(Direction::Backward).is_none());
}
#[test]
fn sp02_duplicate_ids_reject_the_whole_page() {
    let (mut s, r, mut page) = first("", ListMode::All);
    page.rows[1] = page.rows[0].clone();
    rejected(&mut s, &r, page);
}
#[test]
fn sp03_required_metadata_calendar_lookup_and_control_characters_are_validated() {
    for field in 0..9 {
        let (mut s, r, mut page) = first("", ListMode::All);
        let row = &mut page.rows[0];
        match field {
            0 => row.name = "  ".into(),
            1 => row.location.clear(),
            2 => row.name = "DEMO\nNAME".into(),
            3 => row.location = "Demo\tlocation".into(),
            4 => row.birth_date = "1900-02-29".into(),
            5 => row.birth_date = "0000-01-01".into(),
            6 => row.demo_lookup = "x１２".into(),
            7 => row.demo_lookup = "X1001".into(),
            _ => row.demo_lookup = "x123".into(),
        }
        rejected(&mut s, &r, page);
    }
}
#[test]
fn sp04_rows_must_match_query_and_roster_mode() {
    let p = MockProvider::default();
    let (mut s, r, mut page) = first("MORGAN", ListMode::All);
    page.rows[0] = p
        .preview(&PatientId::synthetic("SYNTH-001").unwrap())
        .unwrap();
    rejected(&mut s, &r, page);
    let (mut s, r, mut page) = first("", ListMode::DemoRoster);
    page.rows[0] = p
        .preview(&PatientId::synthetic("SYNTH-004").unwrap())
        .unwrap();
    rejected(&mut s, &r, page);
}
#[test]
fn sp05_trimmed_unicode_name_and_exact_lookup_or_id_queries_remain_valid() {
    for (q, id) in [
        (" zoë 李 ", "SYNTH-009"),
        (" x2002 ", "SYNTH-004"),
        ("synth-004", "SYNTH-004"),
    ] {
        let (mut s, r, page) = first(q, ListMode::All);
        assert_eq!(page.rows.len(), 1);
        assert_eq!(page.rows[0].id.as_str(), id);
        assert!(s.apply_search(&r, Ok(page)));
        assert_eq!(s.search_status, SearchStatus::Ready);
    }
}
#[test]
fn sp06_missing_extra_and_oversized_rows_are_rejected() {
    for change in 0..3 {
        let (mut s, r, mut page) = first("", ListMode::All);
        match change {
            0 => {
                page.rows.pop();
            }
            1 => page.rows.push(page.rows[0].clone()),
            _ => page.rows.clear(),
        }
        rejected(&mut s, &r, page);
    }
}
#[test]
fn sp07_start_total_and_empty_metadata_must_be_consistent() {
    for change in 0..4 {
        let (mut s, r, mut page) = first("", ListMode::All);
        match change {
            0 => page.start = 1,
            1 => page.start = 4,
            2 => page.total = 3,
            _ => page.total = 0,
        }
        rejected(&mut s, &r, page);
    }
    let (mut s, r, mut page) = first("absent fixture", ListMode::All);
    page.total = 1;
    rejected(&mut s, &r, page);
}
#[test]
fn sp08_missing_extra_self_loop_or_skipped_cursors_are_rejected() {
    for change in 0..4 {
        let (mut s, r, mut page) = first("", ListMode::All);
        match change {
            0 => page.next = None,
            1 => page.next.as_mut().unwrap().offset = 0,
            2 => page.next.as_mut().unwrap().offset = 8,
            _ => page.previous = page.next.clone(),
        }
        rejected(&mut s, &r, page);
    }
    let p = MockProvider::default();
    let (mut s, r, page) = first("", ListMode::All);
    assert!(s.apply_search(&r, Ok(page)));
    let next = s.page_request(Direction::Forward).unwrap();
    let mut page = p.search(&next).unwrap();
    page.previous = None;
    rejected(&mut s, &next, page);
}
#[test]
fn sp09_cursor_query_scope_and_final_cursor_shape_are_checked() {
    let p = MockProvider::default();
    let (_, _, foreign) = first("A", ListMode::All);
    let (mut s, r, mut page) = first("", ListMode::All);
    page.next = foreign.next;
    assert!(page.next.is_some());
    rejected(&mut s, &r, page);
    let (mut s, r, mut page) = first("MORGAN", ListMode::All);
    page.next = first("", ListMode::All).2.next;
    rejected(&mut s, &r, page);
    let (mut s, r, page) = first("", ListMode::All);
    assert!(s.apply_search(&r, Ok(page)));
    let r = s.page_request(Direction::Forward).unwrap();
    assert!(s.apply_search(&r, p.search(&r)));
    let r = s.page_request(Direction::Forward).unwrap();
    let mut page = p.search(&r).unwrap();
    page.previous.as_mut().unwrap().offset = 0;
    rejected(&mut s, &r, page);
}
#[test]
fn sp10_exact_active_request_tuple_is_required() {
    let (mut s, r, page) = first("", ListMode::All);
    for change in 0..4 {
        let mut forged = r.clone();
        match change {
            0 => forged.generation += 1,
            1 => forged.query = "MORGAN".into(),
            2 => forged.mode = ListMode::DemoRoster,
            _ => forged.direction = Direction::Backward,
        }
        assert!(!s.apply_search(&forged, Ok(page.clone())));
    }
    assert!(s.apply_search(&r, Ok(page.clone())));
    assert!(!s.apply_search(&r, Ok(page)));
}
#[test]
fn sp11_stale_malformed_pages_and_failures_cannot_replace_recovery() {
    let p = MockProvider::default();
    let (mut s, old, mut bad) = first("", ListMode::All);
    bad.start = 1;
    let r = s.begin_search("MORGAN".into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    assert!(!s.apply_search(&old, Ok(bad)));
    assert!(!s.apply_search(&old, Err(ProviderError::Unavailable("old".into()))));
    assert_eq!(s.page.as_ref().unwrap().rows.len(), 2);
    assert_eq!(s.search_status, SearchStatus::Ready);
}
#[test]
fn sp12_invalid_page_clears_preview_acknowledgment_and_pending_chart_not_active_chart() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    s.open_selection();
    let r = s.begin_search("PATEL".into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, &p);
    assert!(s.confirm(&p, false).is_none());
    assert!(s.confirmation.is_some());
    let old = s.confirm(&p, true).unwrap();
    let r = s.begin_search("".into(), ListMode::All);
    let mut bad = p.search(&r).unwrap();
    bad.start = 1;
    rejected(&mut s, &r, bad);
    assert!(!s.apply_chart(&old, p.chart(&old.patient_id)));
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
}
#[test]
fn sp13_overflow_and_extreme_offsets_are_errors_without_panics() {
    let p = MockProvider::default();
    let (_, r, mut page) = first("", ListMode::All);
    page.start = usize::MAX;
    assert!(page.validate(&r).is_err());
    let mut r = r;
    r.cursor = page.next.clone();
    r.cursor.as_mut().unwrap().offset = usize::MAX - 3;
    page.start = usize::MAX - 3;
    page.total = usize::MAX;
    assert!(page.validate(&r).is_err());
    assert!(p.search(&r).is_err());
}
#[test]
fn sp14_provider_rejects_unaligned_foreign_or_outside_cursor_and_initial_backward() {
    let p = MockProvider::default();
    let (_, r, page) = first("", ListMode::All);
    for change in 0..4 {
        let mut r = r.clone();
        r.cursor = page.next.clone();
        match change {
            0 => r.cursor.as_mut().unwrap().offset = 1,
            1 => r.mode = ListMode::DemoRoster,
            2 => r.query = "CARTER".into(),
            _ => r.cursor.as_mut().unwrap().offset = 12,
        }
        assert!(matches!(p.search(&r), Err(ProviderError::Malformed(_))));
    }
    let mut r = r;
    r.direction = Direction::Backward;
    assert!(matches!(p.search(&r), Err(ProviderError::Malformed(_))));
}
#[test]
fn sp15_typed_invalid_page_simulation_empty_and_unavailable_are_distinct() {
    let mut s = AppState::default();
    let r = s.begin_search("MORGAN".into(), ListMode::All);
    let p = MockProvider {
        simulation: Simulation::InconsistentSearchPage,
    };
    let page = p.search(&r).unwrap();
    rejected(&mut s, &r, page);
    let r = s.begin_search("absent fixture".into(), ListMode::All);
    assert!(s.apply_search(&r, MockProvider::default().search(&r)));
    assert_eq!(s.search_status, SearchStatus::Empty);
    let r = s.begin_search("".into(), ListMode::All);
    assert!(
        s.apply_search(
            &r,
            MockProvider {
                simulation: Simulation::SearchUnavailable
            }
            .search(&r)
        )
    );
    assert!(matches!(
        s.search_status,
        SearchStatus::Error(ProviderError::Unavailable(_))
    ));
}
#[test]
fn sp16_validation_is_structural_not_an_authoritative_roster_lookup() {
    let (_, r, mut page) = first("", ListMode::All);
    page.total = usize::MAX; // Total remains structurally consistent with this first page.
    page.rows[0].name = "Invented mixed Case".into();
    assert!(page.validate(&r).is_ok());
    let (mut s, r, mut page) = first("MORGAN", ListMode::All);
    page.rows[0].name = "Morgan, Alex".into();
    assert!(s.apply_search(&r, Ok(page)));
}
