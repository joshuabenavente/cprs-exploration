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
fn list(s: &mut AppState, p: &MockProvider, query: &str) -> OrdersListRequest {
    let r = s
        .begin_orders_list(query.into(), OrderStatusFilter::All)
        .unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    r
}
fn detail(s: &mut AppState, index: usize) -> OrderRequest {
    s.select_order(index);
    s.begin_order_detail().unwrap()
}
fn ready(s: &AppState) -> &OrderDetail {
    let OrderDetailState::Ready(detail) = &s.orders.detail else {
        panic!("ready order expected")
    };
    detail
}

#[test]
fn ot01_duplicate_descriptions_select_exact_ids_and_expose_only_owned_text() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    assert_eq!(s.orders.rows.len(), 4);
    assert_eq!(s.orders.rows[0].description, s.orders.rows[1].description);
    assert_ne!(s.orders.rows[0].id, s.orders.rows[1].id);
    assert!(s.orders.rows.windows(2).all(|r| r[0].date >= r[1].date));
    for i in 0..2 {
        let r = detail(&mut s, i);
        assert!(matches!(s.orders.detail, OrderDetailState::Loading(_)));
        assert!(s.apply_order(&r, p.order_detail(&r)));
        assert_eq!(ready(&s).order_id, r.order_id);
        assert_eq!(ready(&s).patient_id, r.patient_id);
        assert!(ready(&s).text.contains(r.order_id.as_str()));
    }
}
#[test]
fn ot02_out_of_order_and_duplicate_order_replies_never_replace_current_selection() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let a = detail(&mut s, 0);
    let b = detail(&mut s, 1);
    assert!(!s.apply_order(&a, p.order_detail(&a)));
    assert!(s.apply_order(&b, p.order_detail(&b)));
    assert!(!s.apply_order(&b, p.order_detail(&b)));
    assert_eq!(ready(&s).order_id, b.order_id);
    assert!(!s.apply_order(&a, Err(ProviderError::Unavailable("old failure".into()))));
    assert_eq!(ready(&s).order_id, b.order_id);
}
#[test]
fn ot03_filter_clears_detail_and_rejects_old_list_and_old_document() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let old = list(&mut s, &p, "");
    let doc = detail(&mut s, 0);
    assert!(s.apply_order(&doc, p.order_detail(&doc)));
    let a = s
        .begin_orders_list("Alpha".into(), OrderStatusFilter::All)
        .unwrap();
    assert!(s.orders.rows.is_empty());
    assert!(s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    let b = s
        .begin_orders_list("ZOË 李".into(), OrderStatusFilter::All)
        .unwrap();
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    assert!(!s.apply_orders_list(&a, p.orders_list(&a)));
    assert!(s.apply_orders_list(&b, p.orders_list(&b)));
    assert_eq!(s.orders.rows.len(), 1);
    assert_eq!(s.orders.rows[0].id.as_str(), "ORDER-03");
    assert!(!s.apply_order(&doc, p.order_detail(&doc)));
}
#[test]
fn ot04_patient_change_rejects_same_order_id_from_previous_owner() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-003");
    list(&mut s, &p, "");
    let a = detail(&mut s, 0);
    open(&mut s, &p, "SYNTH-004");
    list(&mut s, &p, "");
    let b = detail(&mut s, 0);
    assert_eq!(a.order_id, b.order_id);
    assert_ne!(a.patient_id, b.patient_id);
    assert!(!s.apply_order(&a, p.order_detail(&a)));
    assert!(s.apply_order(&b, p.order_detail(&b)));
    assert!(ready(&s).text.contains("SYNTH-004"));
    assert!(!ready(&s).text.contains("SYNTH-003"));
}
#[test]
fn ot05_tab_and_selector_cancel_invalidate_requests_while_preserving_chart() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let a = list(&mut s, &p, "");
    let d = detail(&mut s, 0);
    s.set_tab(ChartTab::Notes);
    assert!(s.orders.rows.is_empty());
    assert!(!s.apply_order(&d, p.order_detail(&d)));
    s.set_tab(ChartTab::Orders);
    let b = s
        .begin_orders_list("".into(), OrderStatusFilter::All)
        .unwrap();
    assert!(!s.apply_orders_list(&a, p.orders_list(&a)));
    s.open_selection();
    s.cancel_selection();
    assert_eq!(s.tab, ChartTab::Orders);
    assert_eq!(s.active.as_ref().unwrap().patient.id.as_str(), "SYNTH-001");
    assert!(!s.apply_orders_list(&b, p.orders_list(&b)));
    assert_eq!(s.orders.list_status, OrdersListStatus::Idle);
    list(&mut s, &p, "");
    assert!(s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
}
#[test]
fn ot06_empty_list_no_match_and_empty_document_are_distinct_from_errors() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-002");
    list(&mut s, &p, "");
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    assert!(!s.select_order(0));
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "no such invented description");
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    list(&mut s, &p, "ORDER-04");
    let r = detail(&mut s, 0);
    assert!(s.apply_order(&r, p.order_detail(&r)));
    assert!(ready(&s).text.is_empty());
    assert!(s.message.contains("empty detail"));
}
#[test]
fn ot07_list_and_detail_failures_clear_text_and_support_explicit_retry() {
    let mut p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    let r = detail(&mut s, 0);
    s.apply_order(&r, p.order_detail(&r));
    p.simulation = Simulation::OrdersListUnavailable;
    list(&mut s, &p, "");
    assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    p.simulation = Simulation::OrderDetailUnavailable;
    list(&mut s, &p, "");
    let r = detail(&mut s, 1);
    s.apply_order(&r, p.order_detail(&r));
    assert!(matches!(s.orders.detail, OrderDetailState::Error(_)));
    let retry = s.retry_order().unwrap();
    assert_ne!(r.generation, retry.generation);
    p.simulation = Simulation::Normal;
    assert!(s.apply_order(&retry, p.order_detail(&retry)));
    assert_eq!(ready(&s).order_id, retry.order_id);
}
#[test]
fn ot08_malformed_lists_reject_owner_duplicates_descriptions_and_unicode_dates() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    for damage in 0..5 {
        let r = s
            .begin_orders_list("".into(), OrderStatusFilter::All)
            .unwrap();
        let mut data = p.orders_list(&r).unwrap();
        match damage {
            0 => data.patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            1 => data.rows[0].patient_id = PatientId::synthetic("SYNTH-004").unwrap(),
            2 => data.rows.push(data.rows[0].clone()),
            3 => data.rows[0].description = "  ".into(),
            _ => data.rows[0].date = "李李李李李 99:99".into(),
        }
        assert!(s.apply_orders_list(&r, Ok(data)));
        assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
        assert!(s.orders.rows.is_empty());
    }
}
#[test]
fn ot09_document_owner_or_id_mismatch_fails_closed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    for damage in 0..2 {
        let r = detail(&mut s, 0);
        let mut detail = p.order_detail(&r).unwrap();
        if damage == 0 {
            detail.patient_id = PatientId::synthetic("SYNTH-003").unwrap();
        } else {
            detail.order_id = OrderId::synthetic("ORDER-02").unwrap();
        }
        s.apply_order(&r, Ok(detail));
        assert!(matches!(s.orders.detail, OrderDetailState::Error(_)));
    }
}
#[test]
fn ot10_read_only_unicode_long_detail_and_selection_invalidation() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    assert!(
        s.begin_orders_list("".into(), OrderStatusFilter::All)
            .is_none()
    );
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "  zoë 李  ");
    let r = detail(&mut s, 0);
    s.apply_order(&r, p.order_detail(&r));
    let original = ready(&s).clone();
    assert!(original.text.len() > 10000);
    assert!(original.text.contains("ZÁRATE, ZOË 李"));
    assert!(original.text.ends_with("END OF INVENTED ORDER DETAIL\n"));
    assert!(!s.select_order(0));
    assert_eq!(ready(&s), &original);
    assert!(s.select_order(usize::MAX));
    assert!(s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
}
#[test]
fn ot11_order_is_deterministic_even_when_provider_rows_are_reversed() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let r = s
        .begin_orders_list("".into(), OrderStatusFilter::All)
        .unwrap();
    let mut data = p.orders_list(&r).unwrap();
    data.rows.reverse();
    for row in &mut data.rows {
        row.date = "2026-10-30 10:00".into();
    }
    s.apply_orders_list(&r, Ok(data));
    assert_eq!(
        s.orders
            .rows
            .iter()
            .map(|r| r.id.as_str())
            .collect::<Vec<_>>(),
        vec!["ORDER-01", "ORDER-02", "ORDER-03", "ORDER-04"]
    );
}
#[test]
fn ot12_denied_and_unavailable_patient_records_cannot_be_requested_from_mock_provider() {
    let p = MockProvider::default();
    for id in ["SYNTH-006", "SYNTH-007"] {
        let patient_id = PatientId::synthetic(id).unwrap();
        assert!(
            p.orders_list(&OrdersListRequest {
                generation: 1,
                patient_id: patient_id.clone(),
                query: "".into(),
                status_filter: OrderStatusFilter::All,
                filter: OrdersFilter::default(),
            })
            .is_err()
        );
        assert!(
            p.order_detail(&OrderRequest {
                generation: 1,
                patient_id,
                order_id: OrderId::synthetic("ORDER-01").unwrap()
            })
            .is_err()
        );
    }
}

#[test]
fn ot13_status_filter_is_scoped_and_invalidates_old_detail_and_list() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let all = list(&mut s, &p, "");
    let old = detail(&mut s, 0);
    s.apply_order(&old, p.order_detail(&old));
    for (filter, count) in [
        (OrderStatusFilter::Active, 2),
        (OrderStatusFilter::Pending, 1),
        (OrderStatusFilter::Complete, 1),
        (OrderStatusFilter::All, 4),
    ] {
        let r = s.begin_orders_list("".into(), filter).unwrap();
        assert!(s.orders.rows.is_empty());
        assert!(s.orders.selected.is_none());
        assert_eq!(s.orders.detail, OrderDetailState::Closed);
        assert!(!s.apply_orders_list(&all, p.orders_list(&all)));
        assert!(!s.apply_order(&old, p.order_detail(&old)));
        assert!(s.apply_orders_list(&r, p.orders_list(&r)));
        assert_eq!(s.orders.rows.len(), count);
        assert!(s.orders.rows.iter().all(|row| filter.matches(row.status)));
    }
    let r = s
        .begin_orders_list("李".into(), OrderStatusFilter::Complete)
        .unwrap();
    s.apply_orders_list(&r, p.orders_list(&r));
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
}

#[test]
fn ot14_selection_does_not_open_detail_and_close_retains_selection_but_invalidates_reply() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    list(&mut s, &p, "");
    assert!(s.begin_order_detail().is_none());
    assert!(s.select_order(0));
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    let old = s.begin_order_detail().unwrap();
    s.close_order_detail();
    assert_eq!(s.orders.selected_index(), Some(0));
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    assert!(!s.apply_order(&old, p.order_detail(&old)));
    let fresh = s.begin_order_detail().unwrap();
    assert_ne!(old.generation, fresh.generation);
    assert!(s.apply_order(&fresh, p.order_detail(&fresh)));
    assert!(s.begin_order_detail().is_none());
    s.close_order_detail();
    assert!(!s.apply_order(&fresh, Err(ProviderError::Unavailable("late error".into()))));
}

#[test]
fn ot15_response_rows_must_match_requested_status_and_text_filter() {
    let p = MockProvider::default();
    let mut s = AppState::default();
    open(&mut s, &p, "SYNTH-001");
    let all = p
        .orders_list(&OrdersListRequest {
            generation: 0,
            patient_id: s.active.as_ref().unwrap().patient.id.clone(),
            query: String::new(),
            status_filter: OrderStatusFilter::All,
            filter: OrdersFilter::default(),
        })
        .unwrap();
    for (query, filter) in [
        ("", OrderStatusFilter::Active),
        ("李", OrderStatusFilter::All),
    ] {
        let r = s.begin_orders_list(query.into(), filter).unwrap();
        assert!(s.apply_orders_list(&r, Ok(all.clone())));
        assert!(matches!(s.orders.list_status, OrdersListStatus::Error(_)));
        assert!(s.orders.rows.is_empty());
    }
}
