use chart_core::*;

fn open(state: &mut AppState, provider: &MockProvider, id: &str) {
    let search = state.open_selection();
    state.apply_search(&search, provider.search(&search));
    let search = state.begin_search(id.into(), ListMode::All);
    state.apply_search(&search, provider.search(&search));
    state.choose_row(0, provider);
    let request = state.confirm(provider, false).unwrap();
    state.apply_chart(&request, provider.chart(&request.patient_id));
}

fn detail(state: &mut AppState, panel: PanelKind, index: usize) -> DetailRequest {
    state.select_cover_item(panel, index);
    state.begin_detail(panel).unwrap()
}

#[test]
fn cs01_two_panels_and_details_belong_to_the_committed_patient() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let chart = s.active.as_ref().unwrap();
    assert!(chart.cover_sheet.matches_patient(&chart.patient.id));
    assert_eq!(chart.cover_sheet.problems.len(), 2);
    assert_eq!(chart.cover_sheet.allergies.len(), 2);
    for panel in [PanelKind::ProblemList, PanelKind::Allergies] {
        let request = detail(&mut s, panel, 1);
        assert!(s.apply_detail(&request, p.detail(&request)));
        let DetailState::Ready { snapshot, .. } = &s.detail else {
            panic!("ready detail")
        };
        assert_eq!(snapshot.patient_id.as_str(), "SYNTH-001");
        assert_eq!(snapshot.panel, panel);
        assert!(snapshot.item_id.ends_with("02"));
        assert!(snapshot.body.contains("MOCK ONLY"));
        s.close_detail();
    }
}

#[test]
fn cs02_closing_and_reopening_same_item_rejects_old_and_duplicate_delivery() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = detail(&mut s, PanelKind::ProblemList, 0);
    s.close_detail();
    assert!(!s.apply_detail(&old, p.detail(&old)));
    let current = s.begin_detail(PanelKind::ProblemList).unwrap();
    assert_ne!(current.generation, old.generation);
    assert!(!s.apply_detail(&old, p.detail(&old)));
    assert!(s.apply_detail(&current, p.detail(&current)));
    assert!(!s.apply_detail(&current, p.detail(&current)));
}

#[test]
fn cs03_same_item_id_on_a_new_patient_does_not_accept_previous_details() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-003");
    let old = detail(&mut s, PanelKind::Allergies, 0);
    open(&mut s, &p, "SYNTH-004");
    assert!(!s.detail.is_open());
    assert!(s.selected_allergy.is_none());
    assert!(s.selected_problem.is_none());
    let current = detail(&mut s, PanelKind::Allergies, 0);
    assert_eq!(old.item_id, current.item_id);
    assert_ne!(old.patient_id, current.patient_id);
    assert!(!s.apply_detail(&old, p.detail(&old)));
    assert!(matches!(&s.detail, DetailState::Loading(r) if r == &current));
    assert!(s.apply_detail(&current, p.detail(&current)));
    let DetailState::Ready { snapshot, .. } = &s.detail else {
        panic!("ready detail")
    };
    assert!(snapshot.body.contains("SYNTH-004"));
    assert!(!snapshot.body.contains("SYNTH-003"));
}

#[test]
fn cs04_wrong_patient_panel_or_item_in_detail_response_fails_closed() {
    let p = MockProvider::default();
    for mismatch in 0..3 {
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        let request = detail(&mut s, PanelKind::ProblemList, 0);
        let mut response = p.detail(&request).unwrap();
        match mismatch {
            0 => response.patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            1 => response.panel = PanelKind::Allergies,
            _ => response.item_id = "PROB-02".into(),
        }
        s.apply_detail(&request, Ok(response));
        assert!(
            matches!(&s.detail, DetailState::Error { message, .. } if message.contains("identity mismatch"))
        );
    }
}

#[test]
fn cs05_chart_commit_rejects_foreign_panel_owner_foreign_row_and_duplicate_ids() {
    let p = MockProvider::default();
    for mismatch in 0..3 {
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        let search = s.open_selection();
        s.apply_search(&search, p.search(&search));
        let search = s.begin_search("SYNTH-004".into(), ListMode::All);
        s.apply_search(&search, p.search(&search));
        s.choose_row(0, &p);
        let request = s.confirm(&p, false).unwrap();
        let mut chart = p.chart(&request.patient_id).unwrap();
        let foreign = PatientId::synthetic("SYNTH-001").unwrap();
        match mismatch {
            0 => chart.cover_sheet.patient_id = foreign,
            1 => chart.cover_sheet.allergies[0].patient_id = foreign,
            _ => chart
                .cover_sheet
                .problems
                .push(chart.cover_sheet.problems[0].clone()),
        }
        s.apply_chart(&request, Ok(chart));
        assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
        assert!(s.selector_open);
        assert!(s.message.contains("identity mismatch"));
    }
}

#[test]
fn cs06_empty_panel_is_distinct_from_unavailable_detail_and_retry_is_explicit() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    assert!(s.active.as_ref().unwrap().cover_sheet.allergies.is_empty());
    s.select_cover_item(PanelKind::Allergies, 0);
    assert!(s.begin_detail(PanelKind::Allergies).is_none());
    p.simulation = Simulation::DetailUnavailable;
    let request = detail(&mut s, PanelKind::ProblemList, 0);
    s.apply_detail(&request, p.detail(&request));
    assert!(matches!(s.detail, DetailState::Error { .. }));
    assert!(s.message.contains("unavailable"));
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-002");
    p.simulation = Simulation::Normal;
    let retry = s.begin_detail(PanelKind::ProblemList).unwrap();
    assert_ne!(request.generation, retry.generation);
    assert!(!s.apply_detail(&request, p.detail(&request)));
    assert!(s.apply_detail(&retry, p.detail(&retry)));
    s.close_detail();
    assert_eq!(s.message, "Synthetic item detail closed.");
}

#[test]
fn cs07_opening_selector_clears_selection_and_details_cancel_preserves_chart() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let request = detail(&mut s, PanelKind::ProblemList, 0);
    s.apply_detail(&request, p.detail(&request));
    let original = s.active.clone();
    s.open_selection();
    assert!(s.selected_problem.is_none());
    assert!(s.selected_allergy.is_none());
    assert_eq!(s.detail, DetailState::Closed);
    assert!(!s.apply_detail(&request, p.detail(&request)));
    s.cancel_selection();
    assert_eq!(s.active, original);
}

#[test]
fn cs08_detail_activation_requires_a_valid_selection_and_cover_sheet() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
    open(&mut s, &p, "SYNTH-001");
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
    s.select_cover_item(PanelKind::ProblemList, usize::MAX);
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
    s.select_cover_item(PanelKind::ProblemList, 0);
    s.set_tab(ChartTab::Notes);
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
    s.set_tab(ChartTab::CoverSheet);
    let request = s.begin_detail(PanelKind::ProblemList).unwrap();
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
    s.apply_detail(&request, p.detail(&request));
    assert!(s.begin_detail(PanelKind::ProblemList).is_none());
}

#[test]
fn cs09_unicode_case_mapping_and_cjk_queries_preserve_fixture_identity() {
    let p = MockProvider::default();
    for query in ["zárate", "zoë", "李", "SYNTH-009"] {
        let mut s = AppState::default();
        let request = s.begin_search(query.into(), ListMode::All);
        s.apply_search(&request, p.search(&request));
        let rows = &s.page.as_ref().unwrap().rows;
        assert_eq!(rows.len(), 1);
        assert_eq!(rows[0].id.as_str(), "SYNTH-009");
        assert_eq!(rows[0].name, "ZÁRATE, ZOË 李");
    }
}
