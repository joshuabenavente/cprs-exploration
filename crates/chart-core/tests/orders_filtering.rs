use chart_core::*;

fn open(s: &mut AppState, p: &MockProvider, id: &str) {
    s.open_selection();
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, p);
    let r = s.confirm(p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
    s.set_tab(ChartTab::Orders);
}
fn filter(s: &mut AppState, p: &MockProvider, q: &str, a: &str, b: &str) -> OrdersListRequest {
    let r = s
        .begin_orders_filter(q.into(), OrderStatusFilter::All, a.into(), b.into())
        .unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    r
}
fn ids(s: &AppState) -> Vec<&str> {
    s.orders.rows.iter().map(|r| r.id.as_str()).collect()
}
fn failure() -> ProviderError {
    ProviderError::Unavailable("old failure".into())
}

#[test]
fn of01_combines_inclusive_bounds_query_and_stable_newest_order() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "", "2026-10-28", "2026-10-29");
    assert_eq!(ids(&s), ["ORDER-02", "ORDER-03"]);
    filter(&mut s, &p, "ALPHA", "2026-10-28", "2026-10-29");
    assert_eq!(ids(&s), ["ORDER-02"]);
    filter(&mut s, &p, "zoë 李", "2026-10-28", "2026-10-28");
    assert_eq!(ids(&s), ["ORDER-03"]);
    assert!(s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
}
#[test]
fn of02_open_bounds_and_empty_intersections_are_success() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "", "2026-10-29", "");
    assert_eq!(ids(&s), ["ORDER-01", "ORDER-02"]);
    filter(&mut s, &p, "", "", "2026-10-28");
    assert_eq!(ids(&s), ["ORDER-03", "ORDER-04"]);
    filter(&mut s, &p, "Alpha", "2026-10-27", "2026-10-28");
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    filter(&mut s, &p, "", "0001-01-01", "9999-12-31");
    assert_eq!(s.orders.rows.len(), 4);
}
#[test]
fn of03_calendar_policy_rejects_invalid_ascii_shape_and_reversed_ranges() {
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
            s.begin_orders_filter("".into(), OrderStatusFilter::All, value.into(), "".into())
                .is_none(),
            "{value}"
        );
        assert!(matches!(s.orders.list_status, OrdersListStatus::Invalid(_)));
        assert!(s.message.contains("SYNTH-001"));
    }
    assert!(
        s.begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-30".into(),
            "2026-10-29".into()
        )
        .is_none()
    );
}
#[test]
fn of04_invalid_edit_clears_detail_and_rejects_pending_success_and_failure() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = filter(&mut s, &p, "", "", "");
    s.select_order(0);
    let detail = s.begin_order_detail().unwrap();
    assert!(s.apply_order(&detail, p.order_detail(&detail)));
    s.close_order_detail();
    let late = s.begin_order_detail().unwrap();
    let list = s
        .begin_orders_list("".into(), OrderStatusFilter::All)
        .unwrap();
    assert!(
        s.begin_orders_filter("".into(), OrderStatusFilter::All, "bad".into(), "".into())
            .is_none()
    );
    assert!(s.orders.rows.is_empty());
    assert!(s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    for r in [&old, &list] {
        assert!(!s.apply_orders_list(r, p.orders_list(r)));
        assert!(!s.apply_orders_list(r, Err(failure())));
    }
    assert!(!s.apply_order(&late, p.order_detail(&late)));
    assert!(!s.apply_order(&late, Err(failure())));
    let valid = filter(&mut s, &p, "", "2026-10-29", "2026-10-29");
    assert_eq!(ids(&s), ["ORDER-02"]);
    assert!(!s.apply_orders_list(&valid, Err(failure())));
}
#[test]
fn of05_exact_filter_tuple_and_generation_are_required() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = s
        .begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-28".into(),
            "".into(),
        )
        .unwrap();
    let new = s
        .begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-29".into(),
            "".into(),
        )
        .unwrap();
    let mut forged = new.clone();
    forged.filter = old.filter.clone();
    assert!(!s.apply_orders_list(&forged, p.orders_list(&forged)));
    assert!(!s.apply_orders_list(&old, Err(failure())));
    assert!(s.apply_orders_list(&new, p.orders_list(&new)));
    assert_eq!(ids(&s), ["ORDER-01", "ORDER-02"]);
    let repeat = s
        .begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-29".into(),
            "".into(),
        )
        .unwrap();
    assert_ne!(new.generation, repeat.generation);
    assert!(!s.apply_orders_list(&new, p.orders_list(&new)));
}
#[test]
fn of06_reset_invalidates_both_channels_and_restores_defaults() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "Alpha", "2026-10-29", "2026-10-29");
    s.select_order(0);
    let d = s.begin_order_detail().unwrap();
    let old = s
        .begin_orders_list("Alpha".into(), OrderStatusFilter::All)
        .unwrap();
    let reset = s.reset_orders_filters().unwrap();
    assert_eq!(reset.filter, OrdersFilter::default());
    assert!(s.orders.beginning_input.is_empty());
    assert!(s.orders.ending_input.is_empty());
    assert!(!s.apply_order(&d, p.order_detail(&d)));
    assert!(!s.apply_order(&d, Err(failure())));
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    assert!(!s.apply_orders_list(&old, Err(failure())));
    assert!(s.apply_orders_list(&reset, p.orders_list(&reset)));
    assert_eq!(s.orders.rows.len(), 4);
    assert!(s.orders.selected.is_none());
}
#[test]
fn of07_response_rows_must_match_range_and_strict_timestamp() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let all = filter(&mut s, &p, "", "", "");
    let outside = p.orders_list(&all).unwrap().rows[0].clone();
    let r = s
        .begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-28".into(),
            "2026-10-29".into(),
        )
        .unwrap();
    let mut response = p.orders_list(&r).unwrap();
    response.rows.push(outside);
    assert!(s.apply_orders_list(&r, Ok(response)));
    assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
    assert!(s.orders.rows.is_empty());
    for timestamp in [
        "2026-10-29 +1:30",
        "2026-10-29 01:+1",
        "2026-02-29 12:00",
        "2026-10-29 24:00",
        "2026-10-29 01:60",
    ] {
        let r = s
            .begin_orders_filter("".into(), OrderStatusFilter::All, "".into(), "".into())
            .unwrap();
        let mut response = p.orders_list(&r).unwrap();
        response.rows[0].date = timestamp.into();
        assert!(s.apply_orders_list(&r, Ok(response)));
        assert!(
            matches!(s.orders.list_status, OrdersListStatus::Error(_)),
            "{timestamp}"
        );
    }
}
#[test]
fn of08_provider_rejects_inconsistent_or_reversed_typed_filter() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let mut r = s
        .begin_orders_list("Alpha".into(), OrderStatusFilter::All)
        .unwrap();
    r.filter.query = "different".into();
    assert!(matches!(
        p.orders_list(&r),
        Err(ProviderError::Malformed(_))
    ));
    r.filter.query = r.query.clone();
    r.filter.beginning = Some(CalendarDay::parse("2026-10-30").unwrap());
    r.filter.ending = Some(CalendarDay::parse("2026-10-29").unwrap());
    assert!(matches!(
        p.orders_list(&r),
        Err(ProviderError::Malformed(_))
    ));
}
#[test]
fn of09_retry_preserves_bounds_and_empty_detail_stays_explicit() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    p.simulation = Simulation::OrdersListUnavailable;
    let old = filter(&mut s, &p, "Empty", "2026-10-27", "2026-10-27");
    assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
    p.simulation = Simulation::Normal;
    let retry = s
        .begin_orders_list(s.orders.query.clone(), OrderStatusFilter::All)
        .unwrap();
    assert_eq!(old.filter, retry.filter);
    assert!(s.apply_orders_list(&retry, p.orders_list(&retry)));
    s.select_order(0);
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    let d = s.begin_order_detail().unwrap();
    assert!(s.apply_order(&d, p.order_detail(&d)));
    let OrderDetailState::Ready(body) = &s.orders.detail else {
        panic!()
    };
    assert!(body.text.is_empty());
    s.close_order_detail();
    assert!(s.orders.selected.is_some());
    assert!(!s.apply_order(&d, Err(failure())));
}
#[test]
fn of10_tab_selector_cancel_and_patient_commit_clear_all_filters_and_late_owners() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = filter(&mut s, &p, "Alpha", "2026-10-29", "2026-10-29");
    s.select_order(0);
    let d = s.begin_order_detail().unwrap();
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(s.orders.beginning_input.is_empty());
    assert!(s.orders.ending_input.is_empty());
    assert!(s.orders.query.is_empty());
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    assert!(!s.apply_order(&d, p.order_detail(&d)));
    filter(&mut s, &p, "", "2026-10-29", "");
    s.set_tab(ChartTab::Notes);
    s.set_tab(ChartTab::Orders);
    assert!(s.orders.beginning_input.is_empty());
    filter(&mut s, &p, "", "2026-10-29", "");
    open(&mut s, &p, "SYNTH-003");
    let new = filter(&mut s, &p, "", "", "");
    assert_ne!(old.patient_id, new.patient_id);
    assert!(!s.apply_order(&d, Err(failure())));
    assert!(s.orders.selected.is_none());
}

#[test]
fn of11_status_combines_with_dates_query_and_reset_restores_all() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    filter(&mut s, &p, "", "2026-10-28", "2026-10-29");
    for (status, expected) in [
        (OrderStatusFilter::Active, vec!["ORDER-03"]),
        (OrderStatusFilter::Pending, vec!["ORDER-02"]),
        (OrderStatusFilter::Complete, vec![]),
    ] {
        let r = s.begin_orders_list("".into(), status).unwrap();
        assert!(s.apply_orders_list(&r, p.orders_list(&r)));
        assert_eq!(ids(&s), expected);
    }
    filter(&mut s, &p, "zoë 李", "2026-10-28", "2026-10-29");
    let r = s
        .begin_orders_list(s.orders.query.clone(), OrderStatusFilter::Pending)
        .unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    let r = s.reset_orders_filters().unwrap();
    assert_eq!(r.filter, OrdersFilter::default());
    assert_eq!(s.orders.status_filter, OrderStatusFilter::All);
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    assert_eq!(s.orders.rows.len(), 4);
}
#[test]
fn of12_provider_and_pending_request_require_exact_status_tuple() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let r = s
        .begin_orders_list("".into(), OrderStatusFilter::Active)
        .unwrap();
    let mut forged = r.clone();
    forged.filter.status = OrderStatusFilter::Pending;
    assert!(matches!(
        p.orders_list(&forged),
        Err(ProviderError::Malformed(_))
    ));
    assert!(!s.apply_orders_list(&forged, Err(failure())));
    forged.status_filter = OrderStatusFilter::Pending;
    assert!(!s.apply_orders_list(&forged, p.orders_list(&forged)));
    let mut response = p.orders_list(&r).unwrap();
    response.rows[0].status = OrderStatus::Pending;
    assert!(s.apply_orders_list(&r, Ok(response)));
    assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
}
#[test]
fn of13_filter_uses_order_timestamp_not_start_stop_display() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let r = s
        .begin_orders_filter(
            "".into(),
            OrderStatusFilter::All,
            "2026-10-29".into(),
            "2026-10-29".into(),
        )
        .unwrap();
    let mut response = p.orders_list(&r).unwrap();
    response.rows[0].start_stop = "1900-01-01 / 9999-12-31 (invented display)".into();
    assert!(s.apply_orders_list(&r, Ok(response)));
    assert_eq!(ids(&s), ["ORDER-02"]);
}
#[test]
fn of14_scenario_and_retry_preserve_invalid_inputs_without_provider_request() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    assert!(
        s.begin_orders_filter(
            "Alpha".into(),
            OrderStatusFilter::Pending,
            "bad".into(),
            "".into()
        )
        .is_none()
    );
    for scenario in [
        Simulation::OrdersListUnavailable,
        Simulation::SlowOrders,
        Simulation::Normal,
    ] {
        p.simulation = scenario;
        assert!(
            s.begin_orders_list(s.orders.query.clone(), s.orders.status_filter)
                .is_none()
        );
        assert_eq!(s.orders.beginning_input, "bad");
        assert_eq!(s.orders.query, "Alpha");
        assert_eq!(s.orders.status_filter, OrderStatusFilter::Pending);
        assert!(matches!(s.orders.list_status, OrdersListStatus::Invalid(_)));
    }
    let r = s.reset_orders_filters().unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    assert_eq!(s.orders.rows.len(), 4);
}
#[test]
fn of15_empty_fixture_and_required_metadata_remain_distinct() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    filter(&mut s, &p, "", "2026-10-28", "2026-10-29");
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    open(&mut s, &p, "SYNTH-001");
    for field in 0..3 {
        let r = s.reset_orders_filters().unwrap();
        let mut response = p.orders_list(&r).unwrap();
        match field {
            0 => response.rows[0].provider.clear(),
            1 => response.rows[0].location.clear(),
            _ => response.rows[0].start_stop.clear(),
        }
        assert!(s.apply_orders_list(&r, Ok(response)));
        assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
        assert!(s.orders.rows.is_empty());
    }
}

#[test]
fn of16_reset_clears_ready_detail_and_provider_error_for_same_patient() {
    for unavailable in [false, true] {
        let mut p = MockProvider::default();
        let mut s = AppState::default();
        open(&mut s, &p, "SYNTH-001");
        if unavailable {
            p.simulation = Simulation::OrdersListUnavailable;
        }
        let old = filter(&mut s, &p, "Alpha", "2026-10-29", "2026-10-29");
        let detail = if unavailable {
            assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
            None
        } else {
            assert!(s.select_order(0));
            let r = s.begin_order_detail().unwrap();
            assert!(s.apply_order(&r, p.order_detail(&r)));
            assert!(matches!(s.orders.detail, OrderDetailState::Ready(_)));
            Some(r)
        };
        let reset = s.reset_orders_filters().unwrap();
        assert_eq!(reset.filter, OrdersFilter::default());
        assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
        assert!(s.orders.rows.is_empty() && s.orders.selected.is_none());
        assert_eq!(s.orders.detail, OrderDetailState::Closed);
        assert!(!s.apply_orders_list(&old, Err(failure())));
        if let Some(r) = detail {
            assert!(!s.apply_order(&r, Err(failure())));
        }
        p.simulation = Simulation::Normal;
        assert!(s.apply_orders_list(&reset, p.orders_list(&reset)));
        assert_eq!(s.orders.rows.len(), 4);
    }
}
