use chart_core::*;

fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    s.open_selection();
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
    s.set_tab(ChartTab::Results);
}
fn list(s: &mut AppState, p: &MockProvider, query: &str) -> ResultsListRequest {
    let r = s.begin_results_list(query.into()).unwrap();
    assert!(s.apply_results_list(&r, p.results_list(&r)));
    r
}
fn detail(s: &mut AppState, index: usize) -> ReportRequest {
    s.select_report(index);
    s.begin_report_detail().unwrap()
}
fn ready(s: &AppState) -> &ReportDetail {
    let ReportDetailState::Ready(detail) = &s.results.detail else {
        panic!("ready report expected")
    };
    detail
}

#[test]
fn rt01_duplicate_descriptions_select_exact_ids_and_expose_only_owned_text() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    assert_eq!(s.results.rows.len(), 4);
    assert_eq!(s.results.rows[0].description, s.results.rows[1].description);
    assert_ne!(s.results.rows[0].id, s.results.rows[1].id);
    assert!(s.results.rows.windows(2).all(|r| r[0].date >= r[1].date));
    for i in 0..2 {
        let r = detail(&mut s, i);
        assert!(matches!(s.results.detail, ReportDetailState::Loading(_)));
        assert!(s.apply_report(&r, p.report_detail(&r)));
        assert_eq!(ready(&s).report_id, r.report_id);
        assert_eq!(ready(&s).patient_id, r.patient_id);
        assert!(ready(&s).text.contains(r.report_id.as_str()));
    }
}
#[test]
fn rt02_out_of_order_and_duplicate_report_replies_never_replace_current_selection() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let a = detail(&mut s, 0);
    let b = detail(&mut s, 1);
    assert!(!s.apply_report(&a, p.report_detail(&a)));
    assert!(s.apply_report(&b, p.report_detail(&b)));
    assert!(!s.apply_report(&b, p.report_detail(&b)));
    assert_eq!(ready(&s).report_id, b.report_id);
    assert!(!s.apply_report(&a, Err(ProviderError::Unavailable("old failure".into()))));
    assert_eq!(ready(&s).report_id, b.report_id);
}
#[test]
fn rt03_filter_clears_detail_and_rejects_old_list_and_old_document() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = list(&mut s, &p, "");
    let doc = detail(&mut s, 0);
    assert!(s.apply_report(&doc, p.report_detail(&doc)));
    let a = s.begin_results_list("Alpha".into()).unwrap();
    assert!(s.results.rows.is_empty());
    assert!(s.results.selected.is_none());
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    let b = s.begin_results_list("ZOË 李".into()).unwrap();
    assert!(!s.apply_results_list(&old, p.results_list(&old)));
    assert!(!s.apply_results_list(&a, p.results_list(&a)));
    assert!(s.apply_results_list(&b, p.results_list(&b)));
    assert_eq!(s.results.rows.len(), 1);
    assert_eq!(s.results.rows[0].id.as_str(), "REPORT-03");
    assert!(!s.apply_report(&doc, p.report_detail(&doc)));
}
#[test]
fn rt04_patient_change_rejects_same_report_id_from_previous_owner() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-003");
    list(&mut s, &p, "");
    let a = detail(&mut s, 0);
    open(&mut s, &p, "SYNTH-004");
    list(&mut s, &p, "");
    let b = detail(&mut s, 0);
    assert_eq!(a.report_id, b.report_id);
    assert_ne!(a.patient_id, b.patient_id);
    assert!(!s.apply_report(&a, p.report_detail(&a)));
    assert!(s.apply_report(&b, p.report_detail(&b)));
    assert!(ready(&s).text.contains("SYNTH-004"));
    assert!(!ready(&s).text.contains("SYNTH-003"));
}
#[test]
fn rt05_tab_and_selector_cancel_invalidate_requests_while_preserving_chart() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let a = list(&mut s, &p, "");
    let d = detail(&mut s, 0);
    s.set_tab(ChartTab::Notes);
    assert!(s.results.rows.is_empty());
    assert!(!s.apply_report(&d, p.report_detail(&d)));
    s.set_tab(ChartTab::Results);
    let b = s.begin_results_list("".into()).unwrap();
    assert!(!s.apply_results_list(&a, p.results_list(&a)));
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.tab, ChartTab::Results);
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(!s.apply_results_list(&b, p.results_list(&b)));
    assert_eq!(s.results.list_status, ResultsListStatus::Idle);
    list(&mut s, &p, "");
    assert!(s.results.selected.is_none());
    assert_eq!(s.results.detail, ReportDetailState::Closed);
}
#[test]
fn rt06_empty_list_no_match_and_empty_document_are_distinct_from_errors() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    list(&mut s, &p, "");
    assert_eq!(s.results.list_status, ResultsListStatus::Empty);
    assert!(!s.select_report(0));
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "no such invented description");
    assert_eq!(s.results.list_status, ResultsListStatus::Empty);
    list(&mut s, &p, "REPORT-04");
    let r = detail(&mut s, 0);
    assert!(s.apply_report(&r, p.report_detail(&r)));
    assert!(ready(&s).text.is_empty());
    assert!(s.message.contains("empty detail"));
}
#[test]
fn rt07_list_and_detail_failures_clear_text_and_support_explicit_retry() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let r = detail(&mut s, 0);
    s.apply_report(&r, p.report_detail(&r));
    p.simulation = Simulation::ResultsListUnavailable;
    list(&mut s, &p, "");
    assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    p.simulation = Simulation::ReportDetailUnavailable;
    list(&mut s, &p, "");
    let r = detail(&mut s, 1);
    s.apply_report(&r, p.report_detail(&r));
    assert!(matches!(s.results.detail, ReportDetailState::Error(_)));
    let retry = s.retry_report().unwrap();
    assert_ne!(r.generation, retry.generation);
    p.simulation = Simulation::Normal;
    assert!(s.apply_report(&retry, p.report_detail(&retry)));
    assert_eq!(ready(&s).report_id, retry.report_id);
}
#[test]
fn rt08_malformed_lists_reject_owner_duplicates_descriptions_and_unicode_dates() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for damage in 0..5 {
        let r = s.begin_results_list("".into()).unwrap();
        let mut data = p.results_list(&r).unwrap();
        match damage {
            0 => data.patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            1 => data.rows[0].patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            2 => data.rows.push(data.rows[0].clone()),
            3 => data.rows[0].description = "  ".into(),
            _ => data.rows[0].date = "李李李李李 99:99".into(),
        }
        assert!(s.apply_results_list(&r, Ok(data)));
        assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
        assert!(s.results.rows.is_empty());
    }
}
#[test]
fn rt09_document_owner_or_id_mismatch_fails_closed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    for damage in 0..2 {
        let r = detail(&mut s, 0);
        let mut detail = p.report_detail(&r).unwrap();
        if damage == 0 {
            detail.patient_id = PatientId::synthetic("SYNTH-003").unwrap();
        } else {
            detail.report_id = ReportId::synthetic("REPORT-02").unwrap();
        }
        s.apply_report(&r, Ok(detail));
        assert!(matches!(s.results.detail, ReportDetailState::Error(_)));
    }
}
#[test]
fn rt10_read_only_unicode_long_detail_and_selection_invalidation() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    assert!(s.begin_results_list("".into()).is_none());
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "  zoë 李  ");
    let r = detail(&mut s, 0);
    s.apply_report(&r, p.report_detail(&r));
    let original = ready(&s).clone();
    assert!(original.text.len() > 10000);
    assert!(original.text.contains("ZÁRATE, ZOË 李"));
    assert!(original.text.ends_with("END OF INVENTED REPORT DETAIL\n"));
    assert!(!s.select_report(0));
    assert_eq!(ready(&s), &original);
    assert!(s.select_report(usize::MAX));
    assert!(s.results.selected.is_none());
    assert_eq!(s.results.detail, ReportDetailState::Closed);
}
#[test]
fn rt11_sort_order_is_deterministic_even_when_provider_rows_are_reversed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let r = s.begin_results_list("".into()).unwrap();
    let mut data = p.results_list(&r).unwrap();
    data.rows.reverse();
    for row in &mut data.rows {
        row.date = "2026-10-30 10:00".into();
    }
    s.apply_results_list(&r, Ok(data));
    assert_eq!(
        s.results
            .rows
            .iter()
            .map(|r| r.id.as_str())
            .collect::<Vec<_>>(),
        vec!["REPORT-01", "REPORT-02", "REPORT-03", "REPORT-04"]
    );
}
#[test]
fn rt12_denied_and_unavailable_patient_records_cannot_be_requested_from_mock_provider() {
    let p = MockProvider::default();
    for id in ["SYNTH-006", "SYNTH-007"] {
        let patient_id = PatientId::synthetic(id).unwrap();
        assert!(
            p.results_list(&ResultsListRequest {
                generation: 1,
                patient_id: patient_id.clone(),
                query: "".into(),
                filter: ResultsFilter::default(),
            })
            .is_err()
        );
        assert!(
            p.report_detail(&ReportRequest {
                generation: 1,
                patient_id,
                report_id: ReportId::synthetic("REPORT-01").unwrap()
            })
            .is_err()
        );
    }
}

#[test]
fn rt13_selection_does_not_open_detail_and_close_retains_selection_but_invalidates_reply() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    assert!(s.begin_report_detail().is_none());
    assert!(s.select_report(0));
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    let old = s.begin_report_detail().unwrap();
    s.close_report_detail();
    assert_eq!(s.results.selected_index(), Some(0));
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    assert!(!s.apply_report(&old, p.report_detail(&old)));
    let fresh = s.begin_report_detail().unwrap();
    assert_ne!(old.generation, fresh.generation);
    assert!(s.apply_report(&fresh, p.report_detail(&fresh)));
    assert!(s.begin_report_detail().is_none());
    s.close_report_detail();
    assert!(!s.apply_report(&fresh, Err(ProviderError::Unavailable("late error".into()))));
}

#[test]
fn rt14_response_rows_must_match_requested_text_filter() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let all = list(&mut s, &p, "");
    let data = p.results_list(&all).unwrap();
    let filtered = s.begin_results_list("李".into()).unwrap();
    assert!(s.apply_results_list(&filtered, Ok(data)));
    assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
    assert!(s.results.rows.is_empty());
}
#[test]
fn rt15_ids_and_single_report_metadata_are_bounded() {
    for bad in ["123", "REPORT-李", "REPORT-001", "ORDER-01", "REPORT-0A"] {
        assert!(ReportId::synthetic(bad).is_err());
    }
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for damage in 0..6 {
        let r = s.begin_results_list("".into()).unwrap();
        let mut data = p.results_list(&r).unwrap();
        match damage {
            0 => data.rows[0].report_type = "Unimplemented report type".into(),
            1 => data.rows[0].specimen.clear(),
            2 => data.rows[0].location.clear(),
            3 => data.rows[0].date = "2026-02-30 10:00".into(),
            4 => data.rows[0].date = "2026-10-31 24:00".into(),
            _ => data.rows[0].date = "2026-10-31 10:60".into(),
        }
        assert!(s.apply_results_list(&r, Ok(data)));
        assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
        assert!(s.results.rows.is_empty());
    }
    assert!(
        p.report_detail(&ReportRequest {
            generation: 1,
            patient_id: PatientId::synthetic("SYNTH-001").unwrap(),
            report_id: ReportId::synthetic("REPORT-99").unwrap(),
        })
        .is_err()
    );
}
