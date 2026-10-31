use chart_core::*;

fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    s.open_selection();
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
}
fn request(s: &mut AppState, index: usize) -> DetailRequest {
    s.select_cover_item(PanelKind::Vitals, index);
    s.begin_detail(PanelKind::Vitals).unwrap()
}

#[test]
fn vitals_display_strings_and_details_preserve_identity_units_date_and_unicode() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-009");
    let rows = s.active.as_ref().unwrap().cover_sheet.vitals.clone();
    assert_eq!(rows.len(), 3);
    for (index, row) in rows.iter().enumerate() {
        let r = request(&mut s, index);
        let d = p.detail(&r).unwrap();
        let v = row.vital.as_ref().unwrap();
        assert_eq!(d.patient_id.as_str(), "SYNTH-009");
        assert_eq!(d.item_id, row.id);
        for text in ["ZÁRATE, ZOË 李", &v.value, &v.taken, &v.qualifiers] {
            assert!(d.body.contains(text));
        }
        assert!(s.apply_detail(&r, Ok(d)));
        assert_eq!(s.close_detail(), Some(PanelKind::Vitals));
    }
}

#[test]
fn vitals_chart_rejects_foreign_duplicate_blank_and_missing_display_data() {
    let p = MockProvider::default();
    for mismatch in 0..6 {
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        s.open_selection();
        let search = s.begin_search("SYNTH-004".into(), ListMode::All);
        s.apply_search(&search, p.search(&search));
        s.choose_row(0, &p);
        let r = s.confirm(&p, false).unwrap();
        let mut c = p.chart(&r.patient_id).unwrap();
        match mismatch {
            0 => c.cover_sheet.vitals[0].patient_id = PatientId::synthetic("SYNTH-001").unwrap(),
            1 => c.cover_sheet.vitals.push(c.cover_sheet.vitals[0].clone()),
            2 => c.cover_sheet.vitals[0].id.clear(),
            3 => c.cover_sheet.vitals[0].label.clear(),
            4 => c.cover_sheet.vitals[0].vital = None,
            _ => c.cover_sheet.problems[0].vital = c.cover_sheet.vitals[0].vital.clone(),
        }
        s.apply_chart(&r, Ok(c));
        assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
        assert!(s.selector_open);
        assert!(s.message.contains("identity mismatch"));
    }
}

#[test]
fn vitals_wrong_patient_panel_or_item_response_fails_closed() {
    let p = MockProvider::default();
    for mismatch in 0..3 {
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        let r = request(&mut s, 0);
        let mut d = p.detail(&r).unwrap();
        match mismatch {
            0 => d.patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            1 => d.panel = PanelKind::ProblemList,
            _ => d.item_id = "VITAL-02".into(),
        }
        assert!(s.apply_detail(&r, Ok(d)));
        assert!(matches!(s.detail, DetailState::Error { .. }));
        assert!(!s.apply_detail(&r, p.detail(&r)));
    }
}

#[test]
fn vitals_close_reopen_rejects_stale_and_duplicate_success_and_failure() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = request(&mut s, 0);
    s.close_detail();
    let current = request(&mut s, 0);
    assert_ne!(old.generation, current.generation);
    assert!(!s.apply_detail(&old, p.detail(&old)));
    assert!(!s.apply_detail(&old, Err(ProviderError::NotFound)));
    assert!(s.apply_detail(&current, p.detail(&current)));
    assert!(!s.apply_detail(&current, p.detail(&current)));
    assert!(!s.apply_detail(&current, Err(ProviderError::NotFound)));
    assert!(matches!(s.detail, DetailState::Ready { .. }));
}

#[test]
fn vitals_patient_switch_same_item_id_rejects_previous_owner() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-003");
    let old = request(&mut s, 0);
    open(&mut s, &p, "SYNTH-004");
    assert!(s.selected_vital.is_none());
    assert!(!s.detail.is_open());
    let current = request(&mut s, 0);
    assert_eq!(old.item_id, current.item_id);
    assert!(!s.apply_detail(&old, p.detail(&old)));
    assert!(!s.apply_detail(&old, Err(ProviderError::NotFound)));
    assert!(s.apply_detail(&current, p.detail(&current)));
    let DetailState::Ready { snapshot, .. } = &s.detail else {
        panic!("ready")
    };
    assert!(snapshot.body.contains("SYNTH-004"));
    assert!(!snapshot.body.contains("SYNTH-003"));
}

#[test]
fn vitals_selector_cancel_and_tab_changes_invalidate_pending_work() {
    let p = MockProvider::default();
    for selector in [false, true] {
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        let old = request(&mut s, 0);
        let chart = s.active.clone();
        if selector {
            s.open_selection();
            assert!(s.selected_vital.is_none());
            s.cancel_selection();
        } else {
            s.set_tab(ChartTab::Notes);
        }
        assert!(!s.apply_detail(&old, p.detail(&old)));
        assert!(!s.apply_detail(&old, Err(ProviderError::NotFound)));
        assert_eq!(s.active, chart);
        assert!(!s.detail.is_open());
    }
}

#[test]
fn vitals_empty_list_and_error_retry_remain_distinct() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    assert!(s.active.as_ref().unwrap().cover_sheet.vitals.is_empty());
    s.select_cover_item(PanelKind::Vitals, 0);
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
    open(&mut s, &p, "SYNTH-001");
    p.simulation = Simulation::DetailUnavailable;
    let old = request(&mut s, 0);
    assert!(s.apply_detail(&old, p.detail(&old)));
    assert!(matches!(s.detail, DetailState::Error { .. }));
    assert!(!s.apply_detail(&old, p.detail(&old)));
    p.simulation = Simulation::Normal;
    let retry = s.begin_detail(PanelKind::Vitals).unwrap();
    assert!(!s.apply_detail(&old, p.detail(&old)));
    assert!(s.apply_detail(&retry, p.detail(&retry)));
    assert!(matches!(s.detail, DetailState::Ready { .. }));
}

#[test]
fn vitals_activation_requires_current_cover_selection() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
    open(&mut s, &p, "SYNTH-001");
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
    s.select_cover_item(PanelKind::Vitals, usize::MAX);
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
    request(&mut s, 1);
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
    s.set_tab(ChartTab::Results);
    assert!(s.begin_detail(PanelKind::Vitals).is_none());
}
