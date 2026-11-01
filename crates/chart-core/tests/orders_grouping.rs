use chart_core::*;

fn setup(id: &str) -> (AppState, MockProvider) {
    let p = MockProvider::default();
    let mut s = AppState::default();
    s.open_selection();
    let r = s.begin_search(id.into(), ListMode::All);
    assert!(s.apply_search(&r, p.search(&r)));
    s.choose_row(0, &p);
    let r = s.confirm(&p, false).unwrap();
    assert!(s.apply_chart(&r, p.chart(&r.patient_id)));
    s.set_tab(ChartTab::Orders);
    let r = s
        .begin_orders_list("".into(), OrderStatusFilter::All)
        .unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
    (s, p)
}
fn group(s: &mut AppState, p: &MockProvider) {
    let r = s.set_orders_grouping(OrdersGrouping::Service).unwrap();
    assert!(s.apply_orders_list(&r, p.orders_list(&r)));
}
fn display(s: &AppState) -> Vec<String> {
    s.orders
        .display_rows()
        .iter()
        .map(|r| match r {
            OrdersDisplayRow::ServiceHeading(label) => format!("H:{label}"),
            OrdersDisplayRow::Order(row) => row.id.as_str().to_owned(),
        })
        .collect()
}
#[test]
fn grouping_orders_services_then_dates_without_changing_identity_or_flat_order() {
    let (mut s, p) = setup("SYNTH-001");
    let flat = s.orders.rows.clone();
    group(&mut s, &p);
    assert_eq!(
        display(&s),
        [
            "H:Training service A",
            "ORDER-01",
            "ORDER-03",
            "H:Training service B",
            "ORDER-02",
            "H:Training service C",
            "ORDER-04"
        ]
    );
    assert_eq!(s.orders.rows, flat);
    let r = s.set_orders_grouping(OrdersGrouping::Flat).unwrap();
    s.apply_orders_list(&r, p.orders_list(&r));
    assert_eq!(
        display(&s),
        ["ORDER-01", "ORDER-02", "ORDER-03", "ORDER-04"]
    );
}
#[test]
fn projected_indices_resolve_exact_duplicate_title_order_and_headings_cannot_select() {
    let (mut s, p) = setup("SYNTH-001");
    group(&mut s, &p);
    assert!(!s.select_display_order(0));
    assert!(s.begin_order_detail().is_none());
    assert!(s.select_display_order(4));
    assert_eq!(s.orders.selected_display_index(), Some(4));
    assert_eq!(s.orders.selected_index(), Some(1));
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    let r = s.begin_order_detail().unwrap();
    assert_eq!(r.order_id.as_str(), "ORDER-02");
    s.apply_order(&r, p.order_detail(&r));
    let previous = s.orders.selected.clone();
    let detail = s.orders.detail.clone();
    for index in [0, 3, 5, 7, usize::MAX] {
        assert!(!s.select_display_order(index));
        assert_eq!(s.orders.selected, previous);
        assert_eq!(s.orders.detail, detail);
    }
}
#[test]
fn grouping_change_invalidates_old_list_detail_duplicate_and_error_replies() {
    let (mut s, p) = setup("SYNTH-001");
    s.select_order(0);
    let detail = s.begin_order_detail().unwrap();
    let old = s
        .begin_orders_list("Alpha".into(), OrderStatusFilter::All)
        .unwrap();
    let new = s.set_orders_grouping(OrdersGrouping::Service).unwrap();
    assert!(s.orders.rows.is_empty() && s.orders.selected.is_none());
    assert_eq!(s.orders.detail, OrderDetailState::Closed);
    assert!(!s.apply_order(&detail, p.order_detail(&detail)));
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    assert!(!s.apply_orders_list(&old, Err(ProviderError::Unavailable("old".into()))));
    assert!(s.apply_orders_list(&new, p.orders_list(&new)));
    assert!(!s.apply_orders_list(&new, p.orders_list(&new)));
    let old = new;
    let flat = s.set_orders_grouping(OrdersGrouping::Flat).unwrap();
    let latest = s.set_orders_grouping(OrdersGrouping::Service).unwrap();
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    assert!(!s.apply_orders_list(&flat, p.orders_list(&flat)));
    assert!(s.apply_orders_list(&latest, p.orders_list(&latest)));
}
#[test]
fn grouped_filters_intersect_before_heading_generation_and_errors_retry_same_tuple() {
    let (mut s, p) = setup("SYNTH-001");
    group(&mut s, &p);
    let r = s
        .begin_orders_filter(
            "zoë 李".into(),
            OrderStatusFilter::Active,
            "2026-10-28".into(),
            "2026-10-29".into(),
        )
        .unwrap();
    s.apply_orders_list(&r, Err(ProviderError::Unavailable("test".into())));
    assert!(s.orders.display_rows().is_empty());
    let retry = s
        .begin_orders_list(s.orders.query.clone(), s.orders.status_filter)
        .unwrap();
    assert_eq!(r.filter, retry.filter);
    s.apply_orders_list(&retry, p.orders_list(&retry));
    assert_eq!(display(&s), ["H:Training service A", "ORDER-03"]);
    let empty = s
        .begin_orders_list("Missing".into(), OrderStatusFilter::All)
        .unwrap();
    s.apply_orders_list(&empty, p.orders_list(&empty));
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    assert!(s.orders.display_rows().is_empty());
    assert_eq!(s.orders.grouping, OrdersGrouping::Service);
}
#[test]
fn invalid_date_preserved_by_grouping_change_reset_restores_flat_and_defaults() {
    let (mut s, p) = setup("SYNTH-001");
    assert!(
        s.begin_orders_filter(
            "Alpha".into(),
            OrderStatusFilter::Pending,
            "bad".into(),
            "".into()
        )
        .is_none()
    );
    assert!(s.set_orders_grouping(OrdersGrouping::Service).is_none());
    assert_eq!(s.orders.grouping, OrdersGrouping::Service);
    assert!(matches!(s.orders.list_status, OrdersListStatus::Invalid(_)));
    assert_eq!(s.orders.beginning_input, "bad");
    assert!(s.orders.display_rows().is_empty());
    let reset = s.reset_orders_filters().unwrap();
    s.apply_orders_list(&reset, p.orders_list(&reset));
    assert_eq!(s.orders.grouping, OrdersGrouping::Flat);
    assert_eq!(reset.filter, OrdersFilter::default());
    assert_eq!(display(&s).len(), 4);
}
#[test]
fn selector_cancel_tab_and_new_patient_restore_flat_and_reject_old_grouped_replies() {
    let (mut s, p) = setup("SYNTH-001");
    group(&mut s, &p);
    let old = s
        .begin_orders_list("".into(), OrderStatusFilter::All)
        .unwrap();
    s.open_selection();
    assert_eq!(s.orders.grouping, OrdersGrouping::Flat);
    assert!(s.set_orders_grouping(OrdersGrouping::Service).is_none());
    s.cancel_selection();
    assert!(!s.apply_orders_list(&old, p.orders_list(&old)));
    group(&mut s, &p);
    s.set_tab(ChartTab::Results);
    assert_eq!(s.orders.grouping, OrdersGrouping::Flat);
    assert!(s.set_orders_grouping(OrdersGrouping::Service).is_none());
    s.set_tab(ChartTab::Orders);
    group(&mut s, &p);
    s.open_selection();
    let r = s.begin_search("SYNTH-003".into(), ListMode::All);
    s.apply_search(&r, p.search(&r));
    s.choose_row(0, &p);
    let r = s.confirm(&p, false).unwrap();
    s.apply_chart(&r, p.chart(&r.patient_id));
    assert_eq!(s.orders.grouping, OrdersGrouping::Flat);
    assert!(s.orders.selected.is_none());
}
#[test]
fn empty_patient_has_no_headings_and_grouping_does_not_manufacture_orders() {
    let (mut s, p) = setup("SYNTH-002");
    group(&mut s, &p);
    assert_eq!(s.orders.list_status, OrdersListStatus::Empty);
    assert!(s.orders.display_rows().is_empty());
}
#[test]
fn grouping_uses_exact_labels_and_deterministic_id_ties() {
    let (mut s, p) = setup("SYNTH-001");
    let r = s.set_orders_grouping(OrdersGrouping::Service).unwrap();
    let mut list = p.orders_list(&r).unwrap();
    list.rows[0].service = "Z group".into();
    list.rows[1].service = "A group".into();
    list.rows[2].service = "A group".into();
    list.rows[3].service = "a group".into();
    list.rows[2].date = list.rows[1].date.clone();
    list.rows.reverse();
    s.apply_orders_list(&r, Ok(list));
    assert_eq!(
        display(&s),
        [
            "H:A group",
            "ORDER-02",
            "ORDER-03",
            "H:Z group",
            "ORDER-01",
            "H:a group",
            "ORDER-04"
        ]
    );
}

#[test]
fn choosing_same_view_preserves_current_selection_and_inflight_detail() {
    let (mut s, p) = setup("SYNTH-001");
    group(&mut s, &p);
    s.select_display_order(6);
    let detail = s.begin_order_detail().unwrap();
    assert_eq!(detail.order_id.as_str(), "ORDER-04");
    assert!(s.set_orders_grouping(OrdersGrouping::Service).is_none());
    assert_eq!(s.orders.selected_display_index(), Some(6));
    assert!(s.apply_order(&detail, p.order_detail(&detail)));
    assert!(matches!(&s.orders.detail,OrderDetailState::Ready(d) if d.text.is_empty()));
}
