//! Opt-in callback/timer journey. It uses the normal desktop adapter and mock provider.
//! This checks Slint bindings, not physical keyboard input or spoken output.
use super::*;
use std::collections::VecDeque;

pub(super) struct Delivery {
    operation: &'static str,
    owner: String,
    key: String,
    generation: u64,
    applied: bool,
}

pub(super) fn record(
    shared: &Shared,
    operation: &'static str,
    owner: &str,
    key: &str,
    generation: u64,
    applied: bool,
) {
    if let Some(audit) = &mut shared.borrow_mut().delivery_audit {
        audit.push(Delivery {
            operation,
            owner: owner.into(),
            key: key.into(),
            generation,
            applied,
        });
    }
}

type Action = Box<dyn Fn(&AppWindow, &Shared) -> Result<(), String>>;
type Ready = Box<dyn Fn(&AppWindow, &Shared, usize) -> bool>;
struct Step {
    name: &'static str,
    action: Action,
    ready: Ready,
    verify: Action,
}
impl Step {
    fn new(
        name: &'static str,
        action: impl Fn(&AppWindow, &Shared) -> Result<(), String> + 'static,
        ready: impl Fn(&AppWindow, &Shared, usize) -> bool + 'static,
        verify: impl Fn(&AppWindow, &Shared) -> Result<(), String> + 'static,
    ) -> Self {
        Self {
            name,
            action: Box::new(action),
            ready: Box::new(ready),
            verify: Box::new(verify),
        }
    }
}
macro_rules! require {
    ($condition:expr, $message:literal) => {
        if !$condition {
            return Err($message.into());
        }
    };
}
fn noop(_: &AppWindow, _: &Shared) -> Result<(), String> {
    Ok(())
}
fn now(_: &AppWindow, _: &Shared, _: usize) -> bool {
    true
}
fn seen(s: &Shared, since: usize, operation: &str, owner: &str, key: &str, applied: bool) -> bool {
    s.borrow().delivery_audit.as_ref().is_some_and(|a| {
        a[since..].iter().any(|d| {
            d.operation == operation && d.owner == owner && d.key == key && d.applied == applied
        })
    })
}
fn owned(a: &AppWindow, s: &Shared, id: &str, tab: ChartTab) -> Result<(), String> {
    require!(a.get_active_id() == id, "visible header owner mismatch");
    require!(s.borrow().state.tab == tab, "active tab mismatch");
    require!(!a.get_selector_open(), "selector unexpectedly open");
    Ok(())
}
fn empty_text(a: &AppWindow, _: &Shared) -> Result<(), String> {
    require!(
        a.get_note_body().is_empty()
            && a.get_order_body().is_empty()
            && a.get_report_body().is_empty(),
        "old browser text remains exposed"
    );
    Ok(())
}
fn visible_owners(a: &AppWindow, s: &Shared) -> Result<(), String> {
    let c = s.borrow();
    if let Some(chart) = &c.state.active {
        let owner = chart.patient.id.as_str();
        require!(
            a.get_active_id() == owner,
            "header differs from committed patient"
        );
        for text in [a.get_note_body(), a.get_order_body(), a.get_report_body()] {
            if !text.is_empty() {
                require!(text.contains(owner), "browser text lacks current owner");
                for n in 1..=9 {
                    let foreign = format!("SYNTH-{n:03}");
                    require!(
                        foreign == owner || !text.contains(&foreign),
                        "foreign patient text exposed"
                    );
                }
            }
        }
        require!(
            c.state
                .notes
                .rows
                .iter()
                .all(|r| r.patient_id.as_str() == owner),
            "foreign Notes row"
        );
        require!(
            c.state
                .orders
                .rows
                .iter()
                .all(|r| r.patient_id.as_str() == owner),
            "foreign Orders row"
        );
        require!(
            c.state
                .results
                .rows
                .iter()
                .all(|r| r.patient_id.as_str() == owner),
            "foreign Results row"
        );
    } else {
        empty_text(a, s)?;
    }
    if c.state.tab != ChartTab::Notes {
        require!(
            a.get_notes_rows().row_count() == 0 && a.get_note_body().is_empty(),
            "inactive Notes bindings restored"
        );
    }
    if c.state.tab != ChartTab::Orders {
        require!(
            a.get_orders_rows().row_count() == 0 && a.get_order_body().is_empty(),
            "inactive Orders bindings restored"
        );
    }
    if c.state.tab != ChartTab::Results {
        require!(
            a.get_results_rows().row_count() == 0 && a.get_report_body().is_empty(),
            "inactive Results bindings restored"
        );
    }
    if a.get_selector_open() {
        empty_text(a, s)?;
    }
    Ok(())
}

fn journey() -> VecDeque<Step> {
    let mut q = VecDeque::new();
    q.push_back(Step::new(
        "search-out-of-order",
        |a, _| {
            a.invoke_simulation_changed(4);
            a.invoke_query_edited("M".into());
            a.invoke_query_edited("MORGAN".into());
            Ok(())
        },
        |_, s, i| seen(s, i, "search", "", "M", false) && seen(s, i, "search", "", "MORGAN", true),
        |a, _| {
            require!(
                a.get_patient_rows().row_count() == 2,
                "duplicate-name search lost a row"
            );
            require!(!a.get_has_active(), "search committed a patient");
            a.invoke_row_selected(0);
            require!(a.get_preview_id() == "SYNTH-003", "first MORGAN ID wrong");
            a.invoke_row_selected(1);
            require!(a.get_preview_id() == "SYNTH-004", "second MORGAN ID wrong");
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "commit-exact-duplicate",
        |a, _| {
            a.invoke_confirm_selection();
            Ok(())
        },
        |a, _, _| a.get_active_id() == "SYNTH-004" && !a.get_selector_open(),
        |a, s| owned(a, s, "SYNTH-004", ChartTab::CoverSheet),
    ));
    q.push_back(Step::new(
        "cover-close-rejects-late-detail",
        |a, _| {
            a.invoke_cover_selected(0, 0);
            a.invoke_cover_activated(0);
            a.invoke_close_detail();
            a.invoke_cover_selected(1, 0);
            a.invoke_cover_activated(1);
            Ok(())
        },
        |a, s, i| {
            a.get_detail_open()
                && !a.get_detail_loading()
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .any(|d| d.operation == "cover-detail" && !d.applied)
                        && v[i..]
                            .iter()
                            .any(|d| d.operation == "cover-detail" && d.applied)
                })
        },
        |a, _| {
            require!(
                a.get_detail_body().contains("SYNTH-004"),
                "cover detail owner wrong"
            );
            require!(
                a.get_keyboard_focus() == "cover-detail",
                "cover detail did not focus reading pane"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-list-real-delay",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_tab_changed(1);
            a.invoke_notes_scenario_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_notes_loading() && a.get_notes_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "notes-out-of-order",
        |a, _| {
            a.invoke_note_selected(0);
            a.invoke_note_selected(1);
            Ok(())
        },
        |_, s, i| {
            seen(s, i, "note-body", "SYNTH-004", "NOTE-01", false)
                && seen(s, i, "note-body", "SYNTH-004", "NOTE-02", true)
        },
        |a, _| {
            require!(
                a.get_note_body().contains("NOTE-02"),
                "late note replaced current note"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-reading-focus",
        |a, _| {
            a.invoke_focus_notes_body();
            Ok(())
        },
        |a, _, _| a.get_keyboard_focus() == "notes-body",
        noop,
    ));
    q.push_back(Step::new(
        "pending-note-open-selector",
        |a, _| {
            a.invoke_note_selected(0);
            a.invoke_open_selection();
            a.invoke_query_edited("MORGAN".into());
            Ok(())
        },
        |a, _, _| a.get_selector_open() && a.get_patient_rows().row_count() == 2,
        |a, s| {
            require!(
                a.get_active_id() == "SYNTH-004",
                "preview changed committed header"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "patient-commit-before-old-note",
        |a, _| {
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            Ok(())
        },
        |a, s, i| {
            a.get_active_id() == "SYNTH-003"
                && !a.get_selector_open()
                && seen(s, i, "note-body", "SYNTH-004", "NOTE-01", false)
        },
        |a, s| {
            owned(a, s, "SYNTH-003", ChartTab::CoverSheet)?;
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "new-patient-notes-list",
        |a, _| {
            a.invoke_tab_changed(1);
            a.invoke_notes_scenario_changed(0);
            Ok(())
        },
        |a, _, _| !a.get_notes_loading() && a.get_notes_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "same-note-id-new-owner",
        |a, _| {
            a.invoke_note_selected(0);
            Ok(())
        },
        |a, _, _| a.get_note_body_ready(),
        |a, _| {
            require!(
                a.get_note_body().contains("SYNTH-003") && a.get_note_body().contains("NOTE-01"),
                "new patient note mismatch"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "late-orders-list-after-tab-change",
        |a, _| {
            a.invoke_tab_changed(2);
            a.invoke_orders_scenario_changed(3);
            a.invoke_tab_changed(3);
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 4
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| {
                            d.operation == "orders-list" && d.owner == "SYNTH-003" && !d.applied
                        })
                        .count()
                        >= 2
                })
        },
        |a, s| {
            owned(a, s, "SYNTH-003", ChartTab::Results)?;
            require!(
                a.get_orders_rows().row_count() == 0,
                "hidden Orders list restored"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "results-list-real-delay",
        |a, _| {
            a.invoke_results_scenario_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_results_loading() && a.get_results_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "reports-explicit-and-out-of-order",
        |a, _| {
            a.invoke_report_selected(0);
            require!(!a.get_report_detail_open(), "selection opened report");
            a.invoke_report_activated();
            a.invoke_report_selected(1);
            a.invoke_report_activated();
            a.invoke_focus_results_filter();
            Ok(())
        },
        |_, s, i| {
            seen(s, i, "report-body", "SYNTH-003", "REPORT-01", false)
                && seen(s, i, "report-body", "SYNTH-003", "REPORT-02", true)
        },
        |a, _| {
            require!(
                a.get_report_body().contains("REPORT-02"),
                "late report replaced selection"
            );
            require!(
                a.get_keyboard_focus() == "results-filter",
                "report delivery stole filter focus"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "report-close-invalidates-inflight",
        |a, _| {
            a.invoke_report_selected(3);
            a.invoke_report_activated();
            a.invoke_close_report_detail();
            Ok(())
        },
        |_, s, i| seen(s, i, "report-body", "SYNTH-003", "REPORT-04", false),
        |a, _| {
            require!(
                a.get_selected_report() == 3
                    && !a.get_report_detail_open()
                    && a.get_report_body().is_empty(),
                "close failed to retain row and clear text"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "empty-report-is-success",
        |a, _| {
            a.invoke_report_activated();
            Ok(())
        },
        |a, _, _| a.get_report_body_ready(),
        |a, _| {
            require!(
                a.get_report_body().is_empty() && a.get_report_body_status().contains("empty"),
                "empty report treated as failure"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "filter-invalidates-pending-report",
        |a, _| {
            a.invoke_report_selected(0);
            a.invoke_report_activated();
            a.invoke_results_filter_edited("no invented match".into());
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading() && seen(s, i, "report-body", "SYNTH-003", "REPORT-01", false)
        },
        |a, _| {
            require!(
                a.get_results_rows().row_count() == 0
                    && a.get_report_body().is_empty()
                    && !a.get_results_list_error(),
                "filtered empty view is wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-list-error",
        |a, _| {
            a.invoke_results_scenario_changed(1);
            Ok(())
        },
        |a, _, _| a.get_results_list_error(),
        empty_text,
    ));
    q.push_back(Step::new(
        "results-list-retry-real-timer",
        |a, _| {
            a.invoke_retry_results_list();
            Ok(())
        },
        |a, s, i| {
            a.get_results_list_error()
                && seen(s, i, "results-list", "SYNTH-003", "no invented match", true)
        },
        empty_text,
    ));
    q.push_back(Step::new(
        "late-list-error-after-recovery",
        |a, _| {
            a.invoke_retry_results_list();
            a.invoke_results_scenario_changed(0);
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && seen(
                    s,
                    i,
                    "results-list",
                    "SYNTH-003",
                    "no invented match",
                    false,
                )
        },
        |a, s| {
            require!(
                !a.get_results_list_error() && a.get_results_rows().row_count() == 0,
                "late list error replaced recovery"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "recover-then-orders-error",
        |a, _| {
            a.invoke_results_scenario_changed(0);
            a.invoke_tab_changed(2);
            a.invoke_orders_scenario_changed(2);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading() && a.get_orders_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "order-selection-is-explicit",
        |a, _| {
            a.invoke_order_selected(0);
            require!(!a.get_order_detail_open(), "selection opened order");
            a.invoke_order_activated();
            Ok(())
        },
        |a, _, _| a.get_order_body_error(),
        empty_text,
    ));
    q.push_back(Step::new(
        "order-detail-retry-real-timer",
        |a, _| {
            a.invoke_retry_order();
            Ok(())
        },
        |a, s, i| {
            a.get_order_body_error() && seen(s, i, "order-body", "SYNTH-003", "ORDER-01", true)
        },
        empty_text,
    ));
    q.push_back(Step::new(
        "late-order-error-after-tab-change",
        |a, _| {
            a.invoke_retry_order();
            a.invoke_tab_changed(3);
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 4
                && seen(s, i, "order-body", "SYNTH-003", "ORDER-01", false)
        },
        |a, s| {
            owned(a, s, "SYNTH-003", ChartTab::Results)?;
            require!(
                !a.get_results_list_error()
                    && !a.get_report_body_error()
                    && !a.get_message().contains("unavailable"),
                "late order error replaced Results status"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "order-recovery-and-slow-list",
        |a, _| {
            a.invoke_tab_changed(2);
            a.invoke_orders_scenario_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading() && a.get_orders_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "pending-order-cancel-selector",
        |a, _| {
            a.invoke_order_selected(0);
            a.invoke_order_activated();
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading()
                && a.get_orders_rows().row_count() == 4
                && seen(s, i, "order-body", "SYNTH-003", "ORDER-01", false)
        },
        |a, s| {
            owned(a, s, "SYNTH-003", ChartTab::Orders)?;
            empty_text(a, s)?;
            require!(
                a.get_selected_order() == -1,
                "cancel restored prior order selection"
            );
            require!(
                a.get_keyboard_focus() == "orders-filter",
                "cancel did not restore local filter focus"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "acknowledgment-search",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_query_edited("PATEL".into());
            Ok(())
        },
        |a, _, _| a.get_patient_rows().row_count() == 1 && !a.get_search_loading(),
        noop,
    ));
    q.push_back(Step::new(
        "acknowledgment-required",
        |a, _| {
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            Ok(())
        },
        |a, _, _| a.get_show_acknowledgment(),
        |a, _| {
            require!(
                a.get_active_id() == "SYNTH-003",
                "acknowledgment committed early"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "acknowledgment-decline",
        |a, _| {
            a.invoke_decline_acknowledgment();
            Ok(())
        },
        now,
        |a, _| {
            require!(
                !a.get_show_acknowledgment()
                    && a.get_selector_open()
                    && a.get_active_id() == "SYNTH-003",
                "decline lost committed identity"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "acknowledgment-accept",
        |a, _| {
            a.invoke_confirm_selection();
            a.invoke_accept_acknowledgment();
            Ok(())
        },
        |a, _, _| a.get_active_id() == "SYNTH-005" && !a.get_selector_open(),
        |a, s| owned(a, s, "SYNTH-005", ChartTab::CoverSheet),
    ));
    q.push_back(Step::new(
        "denied-patient-search",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_query_edited("RIVERA".into());
            Ok(())
        },
        |a, _, _| a.get_patient_rows().row_count() == 1 && !a.get_search_loading(),
        noop,
    ));
    q.push_back(Step::new(
        "denied-patient-keeps-chart",
        |a, _| {
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            Ok(())
        },
        now,
        |a, _| {
            require!(
                a.get_selector_open()
                    && a.get_active_id() == "SYNTH-005"
                    && a.get_message().contains("denies"),
                "denied patient changed chart"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "empty-patient-search",
        |a, _| {
            a.invoke_query_edited("SYNTH-002".into());
            Ok(())
        },
        |a, _, _| a.get_patient_rows().row_count() == 1 && !a.get_search_loading(),
        noop,
    ));
    q.push_back(Step::new(
        "empty-patient-commit",
        |a, _| {
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            Ok(())
        },
        |a, _, _| a.get_active_id() == "SYNTH-002" && !a.get_selector_open(),
        |a, s| owned(a, s, "SYNTH-002", ChartTab::CoverSheet),
    ));
    q.push_back(Step::new(
        "empty-notes",
        |a, _| {
            a.invoke_tab_changed(1);
            a.invoke_notes_scenario_changed(0);
            Ok(())
        },
        |a, _, _| !a.get_notes_loading(),
        |a, _| {
            require!(
                a.get_notes_rows().row_count() == 0 && !a.get_notes_list_error(),
                "empty Notes incorrect"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "empty-results",
        |a, _| {
            a.invoke_tab_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_results_loading(),
        |a, s| {
            require!(
                a.get_results_rows().row_count() == 0 && !a.get_results_list_error(),
                "empty Results incorrect"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "empty-orders",
        |a, _| {
            a.invoke_tab_changed(2);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, _| {
            require!(
                a.get_orders_rows().row_count() == 0 && !a.get_orders_list_error(),
                "empty Orders incorrect"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "review-patient-search",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_query_edited("SYNTH-001".into());
            Ok(())
        },
        |a, _, _| a.get_patient_rows().row_count() == 1 && !a.get_search_loading(),
        noop,
    ));
    q.push_back(Step::new(
        "review-patient-commit",
        |a, _| {
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            Ok(())
        },
        |a, _, _| a.get_active_id() == "SYNTH-001" && !a.get_selector_open(),
        noop,
    ));
    q.push_back(Step::new(
        "review-results-list",
        |a, _| {
            a.invoke_tab_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_results_loading() && a.get_results_rows().row_count() == 4,
        noop,
    ));
    q.push_back(Step::new(
        "results-cancel-focus",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, _, _| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 4
                && a.get_keyboard_focus() == "results-filter"
        },
        empty_text,
    ));
    q.push_back(Step::new(
        "review-long-unicode-report",
        |a, _| {
            a.invoke_report_selected(2);
            a.invoke_report_activated();
            Ok(())
        },
        |a, _, _| a.get_report_body_ready(),
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::Results)?;
            require!(
                a.get_keyboard_focus() == "results-body",
                "report activation did not focus reading pane"
            );
            require!(
                a.get_report_body()
                    .contains("END OF INVENTED REPORT DETAIL"),
                "long report incomplete"
            );
            Ok(())
        },
    ));
    q
}

struct Running {
    step: Step,
    since: usize,
    deadline: Instant,
}
struct Driver {
    weak: slint::Weak<AppWindow>,
    shared: Shared,
    queue: VecDeque<Step>,
    current: Option<Running>,
    result: Rc<RefCell<Option<Result<(), String>>>>,
    started: Instant,
    completed: usize,
    keep_open: bool,
}
fn finish(d: &Rc<RefCell<Driver>>, result: Result<(), String>) {
    let driver = d.borrow();
    if driver.result.borrow().is_some() {
        return;
    }
    if result.is_ok() {
        let c = driver.shared.borrow();
        let audit = c.delivery_audit.as_ref().expect("opt-in delivery audit");
        for e in audit {
            println!(
                "M7_DELIVERY {} {} {:?} generation={} applied={}",
                e.operation, e.owner, e.key, e.generation, e.applied
            );
        }
        println!(
            "M7_INTEGRATED_PASS cases={} deliveries={} rejected={} elapsed_ms={}",
            driver.completed,
            audit.len(),
            audit.iter().filter(|e| !e.applied).count(),
            driver.started.elapsed().as_millis()
        );
        if let Some(app) = driver.weak.upgrade() {
            let size = app.window().size();
            println!(
                "M7_WINDOW client_width_px={} client_height_px={} application_scale={}",
                size.width,
                size.height,
                app.window().scale_factor()
            );
        }
        if driver.keep_open {
            println!("M7_REVIEW_READY SYNTH-001 Results REPORT-03; close the mock to exit.");
        }
    } else if let Err(error) = &result {
        eprintln!("M7_INTEGRATED_FAIL {error}");
    }
    let quit = result.is_err() || !driver.keep_open;
    *driver.result.borrow_mut() = Some(result);
    if quit {
        let _ = slint::quit_event_loop();
    }
}
fn tick(d: Rc<RefCell<Driver>>) {
    let (weak, shared) = {
        let v = d.borrow();
        (v.weak.clone(), v.shared.clone())
    };
    let Some(app) = weak.upgrade() else {
        finish(&d, Err("mock window unavailable".into()));
        return;
    };
    if let Err(error) = visible_owners(&app, &shared) {
        finish(&d, Err(error));
        return;
    }
    let current = d.borrow_mut().current.take();
    let running = if let Some(current) = current {
        current
    } else {
        let next = d.borrow_mut().queue.pop_front();
        let Some(step) = next else {
            finish(&d, Ok(()));
            return;
        };
        let since = shared.borrow().delivery_audit.as_ref().map_or(0, Vec::len);
        if let Err(error) = (step.action)(&app, &shared) {
            finish(&d, Err(format!("{}: {error}", step.name)));
            return;
        }
        Running {
            step,
            since,
            deadline: Instant::now() + Duration::from_secs(5),
        }
    };
    if let Err(error) = visible_owners(&app, &shared) {
        finish(&d, Err(error));
        return;
    }
    if (running.step.ready)(&app, &shared, running.since) {
        if let Err(error) = (running.step.verify)(&app, &shared) {
            finish(&d, Err(format!("{}: {error}", running.step.name)));
            return;
        }
        println!(
            "M7_CHECK {} PASS elapsed_ms={}",
            running.step.name,
            d.borrow().started.elapsed().as_millis()
        );
        d.borrow_mut().completed += 1;
    } else if Instant::now() >= running.deadline {
        finish(
            &d,
            Err(format!(
                "{}: timeout waiting for real deliveries/UI bindings",
                running.step.name
            )),
        );
        return;
    } else {
        d.borrow_mut().current = Some(running);
    }
    slint::Timer::single_shot(Duration::from_millis(25), move || tick(d));
}
pub(super) fn run(app: &AppWindow, shared: &Shared, keep_open: bool) -> Result<(), Box<dyn Error>> {
    if shared.borrow().immediate {
        return Err("Integrated check must use real timers".into());
    }
    let result = Rc::new(RefCell::new(None));
    let driver = Rc::new(RefCell::new(Driver {
        weak: app.as_weak(),
        shared: shared.clone(),
        queue: journey(),
        current: None,
        result: result.clone(),
        started: Instant::now(),
        completed: 0,
        keep_open,
    }));
    let watchdog = driver.clone();
    slint::Timer::single_shot(Duration::from_secs(90), move || {
        finish(&watchdog, Err("global journey timeout".into()))
    });
    slint::Timer::single_shot(Duration::ZERO, move || tick(driver));
    app.run()?;
    let outcome = result
        .borrow_mut()
        .take()
        .unwrap_or_else(|| Err("window closed before the integrated journey finished".into()));
    outcome.map_err(Into::into)
}
