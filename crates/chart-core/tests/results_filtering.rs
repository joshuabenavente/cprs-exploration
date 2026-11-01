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
fn filter(s: &mut AppState, p: &MockProvider, q: &str, a: &str, b: &str) -> ResultsListRequest {
    let r = s
        .begin_results_filter(q.into(), a.into(), b.into())
        .unwrap();
    assert!(s.apply_results_list(&r, p.results_list(&r)));
    r
}
fn ids(s: &AppState) -> Vec<&str> {
    s.results.rows.iter().map(|r| r.id.as_str()).collect()
}
fn failure() -> ProviderError {
    ProviderError::Unavailable("old failure".into())
}

#[test]
fn rf01_combines_inclusive_bounds_query_and_stable_newest_order() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "", "2026-10-28", "2026-10-29");
    assert_eq!(ids(&s), ["REPORT-02", "REPORT-03"]);
    filter(&mut s, &p, "ALPHA", "2026-10-28", "2026-10-29");
    assert_eq!(ids(&s), ["REPORT-02"]);
    filter(&mut s, &p, "zoë 李", "2026-10-28", "2026-10-28");
    assert_eq!(ids(&s), ["REPORT-03"]);
    assert!(s.results.selected.is_none());
    assert_eq!(s.results.detail, ReportDetailState::Closed);
}
#[test]
fn rf02_open_bounds_and_empty_intersections_are_success() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "", "2026-10-29", "");
    assert_eq!(ids(&s), ["REPORT-01", "REPORT-02"]);
    filter(&mut s, &p, "", "", "2026-10-28");
    assert_eq!(ids(&s), ["REPORT-03", "REPORT-04"]);
    filter(&mut s, &p, "Alpha", "2026-10-27", "2026-10-28");
    assert_eq!(s.results.list_status, ResultsListStatus::Empty);
    filter(&mut s, &p, "", "0001-01-01", "9999-12-31");
    assert_eq!(s.results.rows.len(), 4);
}
#[test]
fn rf03_calendar_policy_rejects_invalid_ascii_shape_and_reversed_ranges() {
    for value in ["0001-01-01", "9999-12-31", "2000-02-29", "2024-02-29"] {
        assert!(CalendarDay::parse(value).is_ok());
    }
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for value in [
        "0000-01-01",
        "1900-02-29",
        "2026-02-29",
        "2026-04-31",
        "2026-13-01",
        "2026-00-01",
        "2026-10-00",
        "2026-1-01",
        "2026-10-01 ",
        " 2026-10-01",
        "２０２６-10-01",
        "2026-10-01T00:00",
        "+026-10-01",
    ] {
        assert!(
            s.begin_results_filter("".into(), value.into(), "".into())
                .is_none(),
            "{value}"
        );
        assert!(matches!(
            s.results.list_status,
            ResultsListStatus::Invalid(_)
        ));
        assert!(s.message.contains("SYNTH-001"));
    }
    assert!(
        s.begin_results_filter("".into(), "2026-10-30".into(), "2026-10-29".into())
            .is_none()
    );
}
#[test]
fn rf04_invalid_edit_clears_detail_and_rejects_pending_success_and_failure() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = filter(&mut s, &p, "", "", "");
    s.select_report(0);
    let detail = s.begin_report_detail().unwrap();
    assert!(s.apply_report(&detail, p.report_detail(&detail)));
    s.close_report_detail();
    let late = s.begin_report_detail().unwrap();
    let list = s.begin_results_list("".into()).unwrap();
    assert!(
        s.begin_results_filter("".into(), "bad".into(), "".into())
            .is_none()
    );
    assert!(s.results.rows.is_empty());
    assert!(s.results.selected.is_none());
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    for r in [&old, &list] {
        assert!(!s.apply_results_list(r, p.results_list(r)));
        assert!(!s.apply_results_list(r, Err(failure())));
    }
    assert!(!s.apply_report(&late, p.report_detail(&late)));
    assert!(!s.apply_report(&late, Err(failure())));
    let valid = filter(&mut s, &p, "", "2026-10-29", "2026-10-29");
    assert_eq!(ids(&s), ["REPORT-02"]);
    assert!(!s.apply_results_list(&valid, Err(failure())));
}
#[test]
fn rf05_exact_filter_tuple_and_generation_are_required() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = s
        .begin_results_filter("".into(), "2026-10-28".into(), "".into())
        .unwrap();
    let new = s
        .begin_results_filter("".into(), "2026-10-29".into(), "".into())
        .unwrap();
    let mut forged = new.clone();
    forged.filter = old.filter.clone();
    assert!(!s.apply_results_list(&forged, p.results_list(&forged)));
    assert!(!s.apply_results_list(&old, Err(failure())));
    assert!(s.apply_results_list(&new, p.results_list(&new)));
    assert_eq!(ids(&s), ["REPORT-01", "REPORT-02"]);
    let repeat = s
        .begin_results_filter("".into(), "2026-10-29".into(), "".into())
        .unwrap();
    assert_ne!(new.generation, repeat.generation);
    assert!(!s.apply_results_list(&new, p.results_list(&new)));
}
#[test]
fn rf06_reset_invalidates_both_channels_and_restores_defaults() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "Alpha", "2026-10-29", "2026-10-29");
    s.select_report(0);
    let d = s.begin_report_detail().unwrap();
    let old = s.begin_results_list("Alpha".into()).unwrap();
    let reset = s.reset_results_filters().unwrap();
    assert_eq!(reset.filter, ResultsFilter::default());
    assert!(s.results.beginning_input.is_empty());
    assert!(s.results.ending_input.is_empty());
    assert!(!s.apply_report(&d, p.report_detail(&d)));
    assert!(!s.apply_report(&d, Err(failure())));
    assert!(!s.apply_results_list(&old, p.results_list(&old)));
    assert!(!s.apply_results_list(&old, Err(failure())));
    assert!(s.apply_results_list(&reset, p.results_list(&reset)));
    assert_eq!(s.results.rows.len(), 4);
    assert!(s.results.selected.is_none());
}
#[test]
fn rf07_response_rows_must_match_range_and_strict_timestamp() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let all = filter(&mut s, &p, "", "", "");
    let outside = p.results_list(&all).unwrap().rows[0].clone();
    let r = s
        .begin_results_filter("".into(), "2026-10-28".into(), "2026-10-29".into())
        .unwrap();
    let mut response = p.results_list(&r).unwrap();
    response.rows.push(outside);
    assert!(s.apply_results_list(&r, Ok(response)));
    assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
    assert!(s.results.rows.is_empty());
    for timestamp in [
        "2026-10-29 +1:30",
        "2026-10-29 01:+1",
        "2026-02-29 12:00",
        "2026-10-29 24:00",
        "2026-10-29 01:60",
    ] {
        let r = s
            .begin_results_filter("".into(), "".into(), "".into())
            .unwrap();
        let mut response = p.results_list(&r).unwrap();
        response.rows[0].date = timestamp.into();
        assert!(s.apply_results_list(&r, Ok(response)));
        assert!(
            matches!(s.results.list_status, ResultsListStatus::Error(_)),
            "{timestamp}"
        );
    }
}
#[test]
fn rf08_provider_rejects_inconsistent_or_reversed_typed_filter() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let mut r = s.begin_results_list("Alpha".into()).unwrap();
    r.filter.query = "different".into();
    assert!(matches!(
        p.results_list(&r),
        Err(ProviderError::Malformed(_))
    ));
    r.filter.query = r.query.clone();
    r.filter.beginning = Some(CalendarDay::parse("2026-10-30").unwrap());
    r.filter.ending = Some(CalendarDay::parse("2026-10-29").unwrap());
    assert!(matches!(
        p.results_list(&r),
        Err(ProviderError::Malformed(_))
    ));
}
#[test]
fn rf09_retry_preserves_bounds_and_empty_detail_stays_explicit() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    p.simulation = Simulation::ResultsListUnavailable;
    let old = filter(&mut s, &p, "Empty", "2026-10-27", "2026-10-27");
    assert!(matches!(s.results.list_status, ResultsListStatus::Error(_)));
    p.simulation = Simulation::Normal;
    let retry = s.begin_results_list(s.results.query.clone()).unwrap();
    assert_eq!(old.filter, retry.filter);
    assert!(s.apply_results_list(&retry, p.results_list(&retry)));
    s.select_report(0);
    assert_eq!(s.results.detail, ReportDetailState::Closed);
    let d = s.begin_report_detail().unwrap();
    assert!(s.apply_report(&d, p.report_detail(&d)));
    let ReportDetailState::Ready(body) = &s.results.detail else {
        panic!()
    };
    assert!(body.text.is_empty());
    s.close_report_detail();
    assert!(s.results.selected.is_some());
    assert!(!s.apply_report(&d, Err(failure())));
}
#[test]
fn rf10_tab_selector_cancel_and_patient_commit_clear_all_filters_and_late_owners() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = filter(&mut s, &p, "Alpha", "2026-10-29", "2026-10-29");
    s.select_report(0);
    let d = s.begin_report_detail().unwrap();
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(s.results.beginning_input.is_empty());
    assert!(s.results.ending_input.is_empty());
    assert!(s.results.query.is_empty());
    assert!(!s.apply_results_list(&old, p.results_list(&old)));
    assert!(!s.apply_report(&d, p.report_detail(&d)));
    filter(&mut s, &p, "", "2026-10-29", "");
    s.set_tab(ChartTab::Notes);
    s.set_tab(ChartTab::Results);
    assert!(s.results.beginning_input.is_empty());
    filter(&mut s, &p, "", "2026-10-29", "");
    open(&mut s, &p, "SYNTH-003");
    let new = filter(&mut s, &p, "", "", "");
    assert_ne!(old.patient_id, new.patient_id);
    assert!(!s.apply_report(&d, Err(failure())));
    assert!(s.results.selected.is_none());
}
