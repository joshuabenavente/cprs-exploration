//! Opt-in callback/timer journey. It uses the normal desktop adapter and mock provider.
//! Active scope: functional callbacks/timers at 100%; no keyboard, focus or speech tests.
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
        let condition = $condition;
        if !condition {
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
fn rejected_orders_list(s: &Shared, since: usize) -> bool {
    s.borrow().delivery_audit.as_ref().is_some_and(|audit| {
        audit[since..]
            .iter()
            .any(|d| d.operation == "orders-list" && d.owner == "SYNTH-001" && !d.applied)
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
            chart.cover_sheet.matches_patient(&chart.patient.id),
            "foreign Cover Sheet row"
        );
        require!(
            a.get_vital_rows().row_count() == chart.cover_sheet.vitals.len()
                && a.get_medication_rows().row_count() == chart.cover_sheet.medications.len()
                && a.get_appointment_rows().row_count() == chart.cover_sheet.appointments.len(),
            "Vitals binding row count mismatch"
        );
        if matches!(c.state.detail, DetailState::Ready { .. }) {
            require!(
                a.get_detail_body().contains(owner),
                "Cover Sheet detail lacks current owner"
            );
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
        require!(
            a.get_selected_problem() == -1
                && a.get_selected_allergy() == -1
                && a.get_selected_appointment() == -1
                && a.get_selected_vital() == -1
                && a.get_selected_medication() == -1
                && !a.get_detail_open()
                && a.get_detail_body().is_empty(),
            "selector retained Vitals selection/detail"
        );
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
        "search-page-invalid",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_simulation_changed(15);
            Ok(())
        },
        |a, _, _| !a.get_search_loading() && a.get_search_state() == 5,
        |a, _| {
            require!(
                a.get_patient_rows().row_count() == 0
                    && !a.get_has_preview()
                    && !a.get_can_confirm(),
                "malformed page exposed candidates"
            );
            require!(
                !a.get_can_next() && !a.get_can_previous(),
                "malformed page exposed cursors"
            );
            a.invoke_row_selected(0);
            a.invoke_confirm_selection();
            require!(
                a.get_selector_open() && a.get_active_id() == "SYNTH-004",
                "malformed page changed committed chart"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-recovery-race",
        |a, _| {
            a.invoke_simulation_changed(15);
            a.invoke_query_edited("M".into());
            a.invoke_simulation_changed(0);
            a.invoke_query_edited("".into());
            Ok(())
        },
        |a, s, i| {
            !a.get_search_loading()
                && a.get_patient_rows().row_count() == 4
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| d.operation == "search" && !d.applied)
                        .count()
                        >= 3
                })
        },
        |a, s| {
            require!(
                a.get_search_state() == 2 && a.get_can_next() && !a.get_can_previous(),
                "recovery page metadata wrong"
            );
            require!(
                s.borrow()
                    .state
                    .page
                    .as_ref()
                    .is_some_and(|p| p.start == 0 && p.total == 9),
                "first page bounds wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-next",
        |a, _| {
            a.invoke_next_page();
            Ok(())
        },
        |a, s, _| {
            !a.get_search_loading() && s.borrow().state.page.as_ref().is_some_and(|p| p.start == 4)
        },
        |a, s| {
            require!(
                a.get_patient_rows().row_count() == 4 && a.get_can_previous() && a.get_can_next(),
                "middle page navigation wrong"
            );
            require!(
                s.borrow().state.page.as_ref().unwrap().rows[0].id.as_str() == "SYNTH-005",
                "middle page identity wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-final",
        |a, _| {
            a.invoke_next_page();
            Ok(())
        },
        |a, s, _| {
            !a.get_search_loading() && s.borrow().state.page.as_ref().is_some_and(|p| p.start == 8)
        },
        |a, _| {
            require!(
                a.get_patient_rows().row_count() == 1 && a.get_can_previous() && !a.get_can_next(),
                "final page shape wrong"
            );
            a.invoke_row_selected(0);
            require!(
                a.get_preview_id() == "SYNTH-009",
                "final Unicode candidate wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-backward",
        |a, _| {
            a.invoke_previous_page();
            Ok(())
        },
        |a, s, _| {
            !a.get_search_loading() && s.borrow().state.page.as_ref().is_some_and(|p| p.start == 4)
        },
        |a, _| {
            require!(
                !a.get_has_preview() && a.get_patient_rows().row_count() == 4,
                "paging retained preview"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-first",
        |a, _| {
            a.invoke_previous_page();
            Ok(())
        },
        |a, s, _| {
            !a.get_search_loading() && s.borrow().state.page.as_ref().is_some_and(|p| p.start == 0)
        },
        |a, _| {
            require!(
                !a.get_can_previous() && a.get_can_next(),
                "backward first page cursors wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-demo-roster",
        |a, _| {
            a.invoke_mode_changed(1);
            Ok(())
        },
        |a, _, _| !a.get_search_loading() && a.get_patient_rows().row_count() == 4,
        |a, s| {
            require!(
                s.borrow()
                    .state
                    .page
                    .as_ref()
                    .unwrap()
                    .rows
                    .iter()
                    .map(|p| p.id.as_str())
                    .collect::<Vec<_>>()
                    == ["SYNTH-001", "SYNTH-003", "SYNTH-005", "SYNTH-006"],
                "demo roster mismatch"
            );
            require!(
                !a.get_can_next() && !a.get_can_previous(),
                "roster cursors wrong"
            );
            a.invoke_row_selected(3);
            a.invoke_confirm_selection();
            require!(
                a.get_active_id() == "SYNTH-004"
                    && a.get_selector_open()
                    && a.get_message().contains("denies"),
                "roster bypassed access rule"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-empty",
        |a, _| {
            a.invoke_mode_changed(0);
            a.invoke_query_edited("absent fixture".into());
            Ok(())
        },
        |a, _, _| !a.get_search_loading() && a.get_search_state() == 3,
        |a, _| {
            require!(
                a.get_patient_rows().row_count() == 0
                    && !a.get_can_confirm()
                    && !a.get_can_next()
                    && !a.get_can_previous(),
                "empty page confused with error or selection"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "search-page-cancel",
        |a, _| {
            a.invoke_cancel_selection();
            Ok(())
        },
        now,
        |a, s| {
            owned(a, s, "SYNTH-004", ChartTab::CoverSheet)?;
            empty_text(a, s)
        },
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
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "vitals-explicit-close-race",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_cover_selected(2, 0);
            require!(!a.get_detail_open(), "Vitals selection opened detail");
            a.invoke_cover_activated(2);
            a.invoke_close_detail();
            a.invoke_cover_selected(2, 2);
            a.invoke_cover_activated(2);
            Ok(())
        },
        |a, s, i| {
            !a.get_detail_loading()
                && seen(s, i, "cover-detail", "SYNTH-004", "VITAL-01", false)
                && seen(s, i, "cover-detail", "SYNTH-004", "VITAL-03", true)
        },
        |a, _| {
            require!(
                a.get_detail_body().contains("118/76 mmHg")
                    && a.get_detail_body().contains("Zoë 李"),
                "Vitals display strings changed"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "vitals-close-retains-row",
        |a, _| {
            a.invoke_close_detail();
            Ok(())
        },
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        |a, _| {
            require!(
                a.get_selected_vital() == 2 && a.get_detail_body().is_empty(),
                "Vitals close lost selection or retained text"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "vitals-error",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
            a.invoke_cover_activated(2);
            Ok(())
        },
        |a, _, _| a.get_detail_error(),
        |a, _| {
            require!(
                !a.get_detail_body().contains("118/76"),
                "Vitals error retained old value"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "vitals-retry-real-timer",
        |a, _| {
            a.invoke_retry_detail();
            Ok(())
        },
        |a, s, i| a.get_detail_error() && seen(s, i, "cover-detail", "SYNTH-004", "VITAL-03", true),
        noop,
    ));
    q.push_back(Step::new(
        "vitals-late-error-tab",
        |a, _| {
            a.invoke_retry_detail();
            a.invoke_tab_changed(1);
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "VITAL-03", false),
        |a, s| {
            require!(
                !a.get_detail_open() && a.get_detail_body().is_empty(),
                "late Vitals failure reopened detail"
            );
            owned(a, s, "SYNTH-004", ChartTab::Notes)
        },
    ));
    q.push_back(Step::new(
        "vitals-selector-cancel",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::Normal;
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(2, 0);
            a.invoke_cover_activated(2);
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "VITAL-01", false),
        |a, s| {
            require!(
                a.get_selected_problem() == -1
                    && a.get_selected_allergy() == -1
                    && a.get_selected_appointment() == -1
                    && a.get_selected_vital() == -1
                    && !a.get_detail_open()
                    && a.get_detail_body().is_empty(),
                "Vitals survived selector cancel"
            );
            owned(a, s, "SYNTH-004", ChartTab::CoverSheet)
        },
    ));
    q.push_back(Step::new(
        "medications-explicit-close-race",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_cover_selected(3, 0);
            require!(
                !a.get_detail_open(),
                "Active Medications selection opened detail"
            );
            a.invoke_cover_activated(3);
            a.invoke_close_detail();
            a.invoke_cover_selected(3, 2);
            a.invoke_cover_activated(3);
            Ok(())
        },
        |a, s, i| {
            !a.get_detail_loading()
                && seen(s, i, "cover-detail", "SYNTH-004", "MED-01", false)
                && seen(s, i, "cover-detail", "SYNTH-004", "MED-03", true)
        },
        |a, _| {
            require!(
                a.get_detail_body().contains("Demo active C")
                    && a.get_detail_body().contains("Zoë 李"),
                "Active Medications display strings changed"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "medications-close-retains-row",
        |a, _| {
            a.invoke_close_detail();
            Ok(())
        },
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        |a, _| {
            require!(
                a.get_selected_medication() == 2 && a.get_detail_body().is_empty(),
                "Active Medications close lost selection or retained text"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "medications-error",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
            a.invoke_cover_activated(3);
            Ok(())
        },
        |a, _, _| a.get_detail_error(),
        |a, _| {
            require!(
                !a.get_detail_body().contains("Demo active C"),
                "Active Medications error retained old value"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "medications-retry-real-timer",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::Normal;
            a.invoke_retry_detail();
            Ok(())
        },
        |a, s, i| {
            a.get_detail_open()
                && !a.get_detail_loading()
                && !a.get_detail_error()
                && seen(s, i, "cover-detail", "SYNTH-004", "MED-03", true)
        },
        noop,
    ));
    q.push_back(Step::new(
        "medications-late-error-tab",
        |a, s| {
            a.invoke_close_detail();
            s.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
            a.invoke_cover_activated(3);
            a.invoke_tab_changed(1);
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "MED-03", false),
        |a, s| {
            require!(
                !a.get_detail_open() && a.get_detail_body().is_empty(),
                "late Active Medications failure reopened detail"
            );
            owned(a, s, "SYNTH-004", ChartTab::Notes)
        },
    ));
    q.push_back(Step::new(
        "medications-selector-cancel",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::Normal;
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(3, 0);
            a.invoke_cover_activated(3);
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "MED-01", false),
        |a, s| {
            require!(
                a.get_selected_medication() == -1
                    && !a.get_detail_open()
                    && a.get_detail_body().is_empty(),
                "Active Medications survived selector cancel"
            );
            owned(a, s, "SYNTH-004", ChartTab::CoverSheet)
        },
    ));
    q.push_back(Step::new(
        "appointments-explicit-close-race",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_cover_selected(4, 0);
            require!(!a.get_detail_open(), "Appointments selection opened detail");
            a.invoke_cover_activated(4);
            a.invoke_close_detail();
            a.invoke_cover_selected(4, 2);
            a.invoke_cover_activated(4);
            Ok(())
        },
        |a, s, i| {
            !a.get_detail_loading()
                && seen(s, i, "cover-detail", "SYNTH-004", "APPT-01", false)
                && seen(s, i, "cover-detail", "SYNTH-004", "APPT-03", true)
        },
        |a, _| {
            require!(
                a.get_detail_body().contains("Demo action C")
                    && a.get_detail_body().contains("Zoë 李"),
                "Appointments display strings changed"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "appointments-close-retains-row",
        |a, _| {
            a.invoke_close_detail();
            Ok(())
        },
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        |a, _| {
            require!(
                a.get_selected_appointment() == 2 && a.get_detail_body().is_empty(),
                "Appointments close lost selection or retained text"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "appointments-error",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
            a.invoke_cover_activated(4);
            Ok(())
        },
        |a, _, _| a.get_detail_error(),
        |a, _| {
            require!(
                !a.get_detail_body().contains("Demo action C"),
                "Appointments error retained old value"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "appointments-retry-real-timer",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::Normal;
            a.invoke_retry_detail();
            Ok(())
        },
        |a, s, i| {
            a.get_detail_open()
                && !a.get_detail_loading()
                && !a.get_detail_error()
                && seen(s, i, "cover-detail", "SYNTH-004", "APPT-03", true)
        },
        noop,
    ));
    q.push_back(Step::new(
        "appointments-late-error-tab",
        |a, s| {
            a.invoke_close_detail();
            s.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
            a.invoke_cover_activated(4);
            a.invoke_tab_changed(1);
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "APPT-03", false),
        |a, s| {
            require!(
                !a.get_detail_open() && a.get_detail_body().is_empty(),
                "late Appointments failure reopened detail"
            );
            owned(a, s, "SYNTH-004", ChartTab::Notes)
        },
    ));
    q.push_back(Step::new(
        "appointments-selector-cancel",
        |a, s| {
            s.borrow_mut().provider.simulation = Simulation::Normal;
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(4, 0);
            a.invoke_cover_activated(4);
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |_, s, i| seen(s, i, "cover-detail", "SYNTH-004", "APPT-01", false),
        |a, s| {
            require!(
                a.get_selected_appointment() == -1
                    && !a.get_detail_open()
                    && a.get_detail_body().is_empty(),
                "Appointments survived selector cancel"
            );
            owned(a, s, "SYNTH-004", ChartTab::CoverSheet)
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
        "notes-filter-author-race",
        |a, _| {
            a.invoke_notes_author_changed(1);
            a.invoke_notes_author_changed(2);
            Ok(())
        },
        |a, s, i| {
            a.get_notes_rows().row_count() == 1
                && seen(s, i, "notes-list", "SYNTH-004", "", false)
                && seen(s, i, "notes-list", "SYNTH-004", "", true)
        },
        |a, s| {
            require!(
                a.get_notes_author_index() == 2
                    && a.get_selected_note() == -1
                    && a.get_note_body().is_empty(),
                "author filter leaked selection/text"
            );
            require!(
                s.borrow().state.notes.rows[0].id.as_str() == "NOTE-02",
                "equal-label author identities merged"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-invalid-date",
        |a, _| {
            a.invoke_note_selected(0);
            a.invoke_notes_dates_edited("2026-10-29".into(), "2026-10-29".into());
            a.invoke_notes_dates_edited("2026-02-30".into(), "".into());
            Ok(())
        },
        |_, s, i| {
            seen(s, i, "note-body", "SYNTH-004", "NOTE-02", false)
                && seen(s, i, "notes-list", "SYNTH-004", "", false)
        },
        |a, _| {
            require!(
                a.get_notes_invalid_filter()
                    && !a.get_notes_list_error()
                    && !a.get_notes_loading()
                    && a.get_notes_rows().row_count() == 0
                    && a.get_note_body().is_empty()
                    && a.get_notes_beginning() == "2026-02-30",
                "invalid dates did not invalidate pending work"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-date-recovery",
        |a, _| {
            a.invoke_notes_dates_edited("2026-10-29".into(), "2026-10-29".into());
            Ok(())
        },
        |a, _, _| !a.get_notes_loading() && a.get_notes_rows().row_count() == 1,
        |a, s| {
            require!(
                !a.get_notes_invalid_filter()
                    && s.borrow().state.notes.rows[0].id.as_str() == "NOTE-02",
                "inclusive filter recovery failed"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-combined-empty",
        |a, _| {
            a.invoke_notes_filter_edited("Zoë 李".into());
            Ok(())
        },
        |a, _, _| !a.get_notes_loading(),
        |a, s| {
            require!(
                a.get_notes_rows().row_count() == 0
                    && a.get_note_body().is_empty()
                    && s.borrow().state.notes.list_status == NotesListStatus::Empty,
                "combined filters are not empty success"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-reset-race",
        |a, _| {
            a.invoke_notes_filter_edited("progress".into());
            a.invoke_reset_notes_filters();
            Ok(())
        },
        |a, s, i| {
            a.get_notes_rows().row_count() == 4
                && seen(s, i, "notes-list", "SYNTH-004", "progress", false)
                && seen(s, i, "notes-list", "SYNTH-004", "", true)
        },
        |a, _| {
            require!(
                a.get_notes_author_index() == 0
                    && a.get_notes_query().is_empty()
                    && a.get_notes_beginning().is_empty()
                    && a.get_notes_ending().is_empty()
                    && a.get_selected_note() == -1
                    && a.get_note_body().is_empty(),
                "reset retained filter state"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-unicode-author",
        |a, _| {
            a.invoke_notes_author_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_notes_loading() && a.get_notes_rows().row_count() == 1,
        |a, s| {
            require!(
                s.borrow().state.notes.rows[0].id.as_str() == "NOTE-03"
                    && a.get_notes_authors().iter().any(|v| v.contains("Zoë 李")),
                "Unicode author selection failed"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-reading",
        |a, _| {
            a.invoke_note_selected(0);
            Ok(())
        },
        |a, _, _| a.get_note_body().contains("END OF INVENTED LONG NOTE"),
        |a, _| {
            require!(
                a.get_note_body().contains("NOTE-03"),
                "filtered note body mismatch"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "notes-filter-selector-reset",
        |a, _| {
            a.invoke_notes_dates_edited("bad".into(), "".into());
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, _, _| {
            !a.get_selector_open() && !a.get_notes_loading() && a.get_notes_rows().row_count() == 4
        },
        |a, s| {
            require!(
                a.get_notes_author_index() == 0
                    && a.get_notes_beginning().is_empty()
                    && a.get_notes_ending().is_empty()
                    && a.get_note_body().is_empty()
                    && !a.get_notes_invalid_filter(),
                "selector cancellation retained filters"
            );
            owned(a, s, "SYNTH-004", ChartTab::Notes)
        },
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
        "vitals-same-id-new-owner",
        |a, _| {
            require!(
                a.get_selected_problem() == -1
                    && a.get_selected_allergy() == -1
                    && a.get_selected_appointment() == -1
                    && a.get_selected_vital() == -1,
                "patient switch retained Vitals selection"
            );
            a.invoke_cover_selected(2, 0);
            a.invoke_cover_activated(2);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, _| {
            require!(
                a.get_detail_body().contains("SYNTH-003")
                    && a.get_detail_body().contains("VITAL-01")
                    && !a.get_detail_body().contains("SYNTH-004"),
                "same Vitals ID has old owner"
            );
            a.invoke_close_detail();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "medications-same-id-new-owner",
        |a, _| {
            require!(
                a.get_selected_medication() == -1,
                "patient switch retained Active Medications selection"
            );
            a.invoke_cover_selected(3, 0);
            a.invoke_cover_activated(3);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, _| {
            require!(
                a.get_detail_body().contains("SYNTH-003")
                    && a.get_detail_body().contains("MED-01")
                    && !a.get_detail_body().contains("SYNTH-004"),
                "same Active Medications ID has old owner"
            );
            a.invoke_close_detail();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "appointments-same-id-new-owner",
        |a, _| {
            require!(
                a.get_selected_appointment() == -1,
                "patient switch retained Appointments selection"
            );
            a.invoke_cover_selected(4, 0);
            a.invoke_cover_activated(4);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, _| {
            require!(
                a.get_detail_body().contains("SYNTH-003")
                    && a.get_detail_body().contains("APPT-01")
                    && !a.get_detail_body().contains("SYNTH-004"),
                "same Appointments ID has old owner"
            );
            a.invoke_close_detail();
            Ok(())
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
                && seen(
                    s,
                    i,
                    "results-list",
                    "SYNTH-003",
                    &format!(
                        "{:?}",
                        ResultsFilter {
                            query: "no invented match".into(),
                            ..ResultsFilter::default()
                        }
                    ),
                    true,
                )
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
                    &format!(
                        "{:?}",
                        ResultsFilter {
                            query: "no invented match".into(),
                            ..ResultsFilter::default()
                        }
                    ),
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
        "empty-vitals",
        |a, _| {
            a.invoke_cover_selected(2, 0);
            a.invoke_cover_activated(2);
            Ok(())
        },
        now,
        |a, _| {
            require!(
                a.get_vital_rows().row_count() == 0
                    && a.get_selected_problem() == -1
                    && a.get_selected_allergy() == -1
                    && a.get_selected_appointment() == -1
                    && a.get_selected_vital() == -1
                    && !a.get_detail_open()
                    && !a.get_detail_error(),
                "empty Vitals treated as failure or retained content"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "empty-medications",
        |a, _| {
            a.invoke_cover_selected(3, 0);
            a.invoke_cover_activated(3);
            Ok(())
        },
        now,
        |a, _| {
            require!(
                a.get_medication_rows().row_count() == 0
                    && a.get_selected_medication() == -1
                    && !a.get_detail_open()
                    && !a.get_detail_error(),
                "empty Active Medications treated as failure or retained content"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "empty-appointments",
        |a, _| {
            a.invoke_cover_selected(4, 0);
            a.invoke_cover_activated(4);
            Ok(())
        },
        now,
        |a, _| {
            require!(
                a.get_appointment_rows().row_count() == 0
                    && a.get_selected_appointment() == -1
                    && !a.get_detail_open()
                    && !a.get_detail_error(),
                "empty Appointments treated as failure or retained content"
            );
            Ok(())
        },
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
        "results-cancel",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, _, _| !a.get_results_loading() && a.get_results_rows().row_count() == 4,
        empty_text,
    ));
    q.push_back(Step::new(
        "results-filter-date-race",
        |a, _| {
            a.invoke_results_scenario_changed(3);
            a.invoke_results_dates_edited("2026-10-28".into(), "2026-10-29".into());
            a.invoke_results_dates_edited("2026-10-29".into(), "2026-10-29".into());
            require!(
                a.get_report_body().is_empty() && a.get_selected_report() == -1,
                "date edit retained detail"
            );
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| d.operation == "results-list" && !d.applied)
                        .count()
                        >= 2
                })
        },
        |a, s| {
            require!(
                a.get_results_rows().row_count() == 1
                    && s.borrow().state.results.rows[0].id.as_str() == "REPORT-02",
                "date race exposed wrong rows"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-invalid-date",
        |a, _| {
            a.invoke_report_selected(0);
            require!(
                !a.get_report_detail_open(),
                "filtered selection automatically opened report"
            );
            a.invoke_report_activated();
            a.invoke_results_dates_edited("2026-02-29".into(), "".into());
            require!(
                a.get_results_invalid_filter()
                    && !a.get_results_loading()
                    && !a.get_results_list_error(),
                "invalid date state not distinct"
            );
            Ok(())
        },
        |_, s, i| seen(s, i, "report-body", "SYNTH-001", "REPORT-02", false),
        |a, s| {
            require!(
                a.get_results_rows().row_count() == 0
                    && a.get_selected_report() == -1
                    && !a.get_report_detail_open(),
                "invalid date retained rows/detail"
            );
            require!(
                a.get_results_list_status().contains("SYNTH-001"),
                "invalid message lacks owner"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "results-filter-inclusive-recovery",
        |a, _| {
            a.invoke_results_scenario_changed(0);
            a.invoke_results_dates_edited("2026-10-28".into(), "2026-10-29".into());
            Ok(())
        },
        |a, _, _| !a.get_results_loading() && !a.get_results_invalid_filter(),
        |a, s| {
            require!(
                s.borrow()
                    .state
                    .results
                    .rows
                    .iter()
                    .map(|r| r.id.as_str())
                    .collect::<Vec<_>>()
                    == ["REPORT-02", "REPORT-03"],
                "inclusive boundaries wrong"
            );
            require!(!a.get_report_detail_open(), "recovery opened detail");
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-combined-empty",
        |a, _| {
            a.invoke_results_filter_edited("Empty".into());
            Ok(())
        },
        |a, _, _| !a.get_results_loading(),
        |a, s| {
            require!(
                s.borrow().state.results.list_status == ResultsListStatus::Empty
                    && !a.get_results_list_error()
                    && !a.get_results_invalid_filter(),
                "valid empty intersection shown as error"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "results-filter-reset-race",
        |a, _| {
            a.invoke_results_scenario_changed(3);
            a.invoke_results_filter_edited("Alpha".into());
            a.invoke_results_reset_filters();
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 4
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| d.operation == "results-list" && !d.applied)
                        .count()
                        >= 2
                })
        },
        |a, _| {
            require!(
                a.get_results_query().is_empty()
                    && a.get_results_beginning().is_empty()
                    && a.get_results_ending().is_empty()
                    && a.get_selected_report() == -1,
                "reset retained filter/selection"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-unicode-combined",
        |a, _| {
            a.invoke_results_scenario_changed(0);
            a.invoke_results_dates_edited("2026-10-28".into(), "2026-10-28".into());
            a.invoke_results_filter_edited("zoë 李".into());
            Ok(())
        },
        |a, _, _| !a.get_results_loading(),
        |a, s| {
            require!(
                a.get_results_rows().row_count() == 1
                    && s.borrow().state.results.rows[0].id.as_str() == "REPORT-03",
                "Unicode/date intersection wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-retry-keeps-dates",
        |a, _| {
            a.invoke_results_scenario_changed(1);
            Ok(())
        },
        |a, _, _| a.get_results_list_error(),
        |a, _| {
            a.invoke_retry_results_list();
            a.invoke_results_scenario_changed(0);
            require!(
                a.get_results_beginning() == "2026-10-28"
                    && a.get_results_ending() == "2026-10-28"
                    && a.get_results_query() == "zoë 李",
                "retry changed date tuple"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-reading",
        noop,
        |a, s, i| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 1
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .any(|d| d.operation == "results-list" && !d.applied)
                })
        },
        |a, _| {
            require!(
                !a.get_results_list_error(),
                "late retry failure replaced date-filter recovery"
            );
            a.invoke_report_selected(0);
            require!(
                !a.get_report_detail_open(),
                "filtered highlight opened detail"
            );
            a.invoke_report_activated();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "results-filter-selector-reset",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, s, i| {
            !a.get_results_loading()
                && a.get_results_rows().row_count() == 4
                && seen(s, i, "report-body", "SYNTH-001", "REPORT-03", false)
        },
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::Results)?;
            require!(
                a.get_results_query().is_empty()
                    && a.get_results_beginning().is_empty()
                    && a.get_results_ending().is_empty()
                    && !a.get_results_invalid_filter()
                    && a.get_selected_report() == -1,
                "cancel retained Results filters"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "orders-filter-open",
        |a, _| {
            a.invoke_tab_changed(2);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading() && a.get_orders_rows().row_count() == 4,
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::Orders)?;
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "orders-filter-date-race",
        |a, _| {
            a.invoke_orders_scenario_changed(3);
            a.invoke_orders_dates_edited("2026-10-28".into(), "2026-10-29".into());
            a.invoke_orders_dates_edited("2026-10-29".into(), "2026-10-29".into());
            require!(
                a.get_order_body().is_empty() && a.get_selected_order() == -1,
                "date edit retained detail"
            );
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading()
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| d.operation == "orders-list" && !d.applied)
                        .count()
                        >= 2
                })
        },
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 1
                    && s.borrow().state.orders.rows[0].id.as_str() == "ORDER-02",
                "date race exposed wrong rows"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-invalid-date",
        |a, _| {
            a.invoke_order_selected(0);
            require!(
                !a.get_order_detail_open(),
                "filtered selection automatically opened order"
            );
            a.invoke_order_activated();
            a.invoke_orders_dates_edited("2026-02-29".into(), "".into());
            require!(
                a.get_orders_invalid_filter()
                    && !a.get_orders_loading()
                    && !a.get_orders_list_error(),
                "invalid date state not distinct"
            );
            Ok(())
        },
        |_, s, i| seen(s, i, "order-body", "SYNTH-001", "ORDER-02", false),
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 0
                    && a.get_selected_order() == -1
                    && !a.get_order_detail_open(),
                "invalid date retained rows/detail"
            );
            require!(
                a.get_orders_list_status().contains("SYNTH-001"),
                "invalid message lacks owner"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "orders-filter-inclusive-recovery",
        |a, _| {
            a.invoke_orders_scenario_changed(0);
            a.invoke_orders_dates_edited("2026-10-28".into(), "2026-10-29".into());
            Ok(())
        },
        |a, _, _| {
            !a.get_orders_loading()
                && !a.get_orders_invalid_filter()
                && a.get_orders_status_filter() == 0
        },
        |a, s| {
            require!(
                s.borrow()
                    .state
                    .orders
                    .rows
                    .iter()
                    .map(|r| r.id.as_str())
                    .collect::<Vec<_>>()
                    == ["ORDER-02", "ORDER-03"],
                "inclusive boundaries wrong"
            );
            require!(!a.get_order_detail_open(), "recovery opened detail");
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-status-combined",
        |a, _| {
            a.invoke_orders_status_changed(1);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 1
                    && s.borrow().state.orders.rows[0].id.as_str() == "ORDER-03",
                "status/date intersection wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-combined-empty",
        |a, _| {
            a.invoke_orders_filter_edited("Empty".into());
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, s| {
            require!(
                s.borrow().state.orders.list_status == OrdersListStatus::Empty
                    && !a.get_orders_list_error()
                    && !a.get_orders_invalid_filter()
                    && a.get_orders_status_filter() == 1,
                "valid empty intersection shown as error"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "orders-filter-reset-race",
        |a, _| {
            a.invoke_orders_scenario_changed(3);
            a.invoke_orders_filter_edited("Alpha".into());
            a.invoke_orders_status_changed(2);
            a.invoke_orders_reset_filters();
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading()
                && a.get_orders_rows().row_count() == 4
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .filter(|d| d.operation == "orders-list" && !d.applied)
                        .count()
                        >= 2
                })
        },
        |a, _| {
            require!(
                a.get_orders_query().is_empty()
                    && a.get_orders_beginning().is_empty()
                    && a.get_orders_ending().is_empty()
                    && a.get_orders_status_filter() == 0
                    && a.get_selected_order() == -1,
                "reset retained filter/selection"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-unicode-combined",
        |a, _| {
            a.invoke_orders_scenario_changed(0);
            a.invoke_orders_dates_edited("2026-10-28".into(), "2026-10-28".into());
            a.invoke_orders_filter_edited("zoë 李".into());
            a.invoke_orders_status_changed(1);
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 1
                    && s.borrow().state.orders.rows[0].id.as_str() == "ORDER-03",
                "Unicode/date intersection wrong"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-retry-keeps-dates",
        |a, _| {
            a.invoke_orders_scenario_changed(1);
            Ok(())
        },
        |a, _, _| a.get_orders_list_error(),
        |a, _| {
            a.invoke_retry_orders_list();
            a.invoke_orders_scenario_changed(0);
            require!(
                a.get_orders_beginning() == "2026-10-28"
                    && a.get_orders_ending() == "2026-10-28"
                    && a.get_orders_query() == "zoë 李"
                    && a.get_orders_status_filter() == 1,
                "retry changed date tuple"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-reading",
        noop,
        |a, s, i| {
            !a.get_orders_loading()
                && a.get_orders_rows().row_count() == 1
                && s.borrow().delivery_audit.as_ref().is_some_and(|v| {
                    v[i..]
                        .iter()
                        .any(|d| d.operation == "orders-list" && !d.applied)
                })
        },
        |a, _| {
            require!(
                !a.get_orders_list_error(),
                "late retry failure replaced date-filter recovery"
            );
            a.invoke_order_selected(0);
            require!(
                !a.get_order_detail_open(),
                "filtered highlight opened detail"
            );
            a.invoke_order_activated();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-selector-reset",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading()
                && a.get_orders_rows().row_count() == 4
                && seen(s, i, "order-body", "SYNTH-001", "ORDER-03", false)
        },
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::Orders)?;
            require!(
                a.get_orders_query().is_empty()
                    && a.get_orders_beginning().is_empty()
                    && a.get_orders_ending().is_empty()
                    && !a.get_orders_invalid_filter()
                    && a.get_orders_status_filter() == 0
                    && a.get_selected_order() == -1,
                "cancel retained Orders filters"
            );
            empty_text(a, s)
        },
    ));
    q.push_back(Step::new(
        "orders-group-list-race",
        |a, _| {
            a.invoke_orders_scenario_changed(3);
            a.invoke_orders_grouping_changed(1);
            a.invoke_orders_grouping_changed(0);
            a.invoke_orders_grouping_changed(1);
            require!(
                a.get_selected_order() == -1 && a.get_order_body().is_empty(),
                "grouping retained selection/detail"
            );
            Ok(())
        },
        |a, s, i| !a.get_orders_loading() && rejected_orders_list(s, i),
        |a, s| {
            require!(
                a.get_orders_grouping() == 1 && a.get_orders_rows().row_count() == 7,
                "grouping table not bound"
            );
            let c = s.borrow();
            let rows = c.state.orders.display_rows();
            let ids: Vec<_> = rows
                .iter()
                .filter_map(|r| match r {
                    OrdersDisplayRow::Order(r) => Some(r.id.as_str()),
                    _ => None,
                })
                .collect();
            require!(
                ids == ["ORDER-01", "ORDER-03", "ORDER-02", "ORDER-04"],
                "group ordering/identity mismatch"
            );
            require!(
                a.get_orders_rows()
                    .row_data(0)
                    .unwrap()
                    .row_data(0)
                    .unwrap()
                    .text
                    == "Service: Training service A",
                "heading missing from UI"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-heading-inert",
        |a, _| {
            a.invoke_order_selected(0);
            a.invoke_order_released(0);
            a.invoke_order_released(0);
            a.invoke_order_activated();
            Ok(())
        },
        now,
        |a, _| {
            require!(
                a.get_selected_order() == -1 && !a.get_order_detail_open(),
                "heading selected/opened detail"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-exact-detail",
        |a, _| {
            a.invoke_order_selected(4);
            require!(
                !a.get_order_detail_open(),
                "grouped highlight opened detail"
            );
            a.invoke_order_activated();
            Ok(())
        },
        |a, _, _| a.get_order_body_ready(),
        |a, _| {
            require!(
                a.get_selected_order() == 4
                    && a.get_order_body().contains("ORDER-02")
                    && !a.get_order_body().contains("ORDER-01"),
                "display offset opened wrong duplicate-title order"
            );
            a.invoke_order_selected(3);
            a.invoke_order_released(3);
            a.invoke_order_released(3);
            require!(
                a.get_selected_order() == 4 && a.get_order_body().contains("ORDER-02"),
                "heading changed existing selection/detail"
            );
            a.invoke_close_order_detail();
            require!(
                a.get_selected_order() == 4 && a.get_order_body().is_empty(),
                "close lost projected selection"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-detail-race",
        |a, _| {
            a.invoke_order_selected(2);
            a.invoke_order_activated();
            a.invoke_orders_grouping_changed(0);
            require!(
                a.get_selected_order() == -1 && !a.get_order_detail_open(),
                "group toggle retained pending detail"
            );
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading() && seen(s, i, "order-body", "SYNTH-001", "ORDER-03", false)
        },
        |a, _| {
            require!(
                a.get_orders_rows().row_count() == 4 && a.get_order_body().is_empty(),
                "old grouped detail reappeared"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-filter-intersection",
        |a, _| {
            a.invoke_orders_scenario_changed(0);
            a.invoke_orders_grouping_changed(1);
            a.invoke_orders_dates_edited("2026-10-28".into(), "2026-10-29".into());
            a.invoke_orders_status_changed(1);
            a.invoke_orders_filter_edited("zoë 李".into());
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 2
                    && s.borrow().state.orders.rows[0].id.as_str() == "ORDER-03",
                "grouped combined filter mismatch"
            );
            a.invoke_order_released(1);
            a.invoke_order_released(1);
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-unicode-detail",
        noop,
        |a, _, _| a.get_order_body_ready(),
        |a, _| {
            require!(
                a.get_order_body().contains("END OF INVENTED ORDER DETAIL"),
                "grouped double-click missed Unicode long detail"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-empty",
        |a, _| {
            a.invoke_orders_filter_edited("Missing".into());
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, s| {
            require!(
                a.get_orders_rows().row_count() == 0
                    && s.borrow().state.orders.list_status == OrdersListStatus::Empty
                    && a.get_order_body().is_empty(),
                "empty groups manufactured headings/detail"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-invalid-and-reset",
        |a, _| {
            a.invoke_orders_dates_edited("bad".into(), "".into());
            a.invoke_orders_grouping_changed(0);
            a.invoke_orders_grouping_changed(1);
            require!(
                a.get_orders_invalid_filter()
                    && a.get_orders_beginning() == "bad"
                    && a.get_orders_rows().row_count() == 0,
                "grouping hid invalid filter"
            );
            a.invoke_orders_reset_filters();
            Ok(())
        },
        |a, _, _| !a.get_orders_loading(),
        |a, _| {
            require!(
                a.get_orders_grouping() == 0
                    && a.get_orders_rows().row_count() == 4
                    && a.get_orders_query().is_empty()
                    && a.get_orders_beginning().is_empty()
                    && a.get_orders_ending().is_empty()
                    && a.get_orders_status_filter() == 0,
                "reset did not restore flat/default filters"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-error-and-retry",
        |a, _| {
            a.invoke_orders_grouping_changed(1);
            a.invoke_orders_filter_edited("Alpha".into());
            a.invoke_orders_dates_edited("2026-10-29".into(), "2026-10-29".into());
            a.invoke_orders_scenario_changed(1);
            Ok(())
        },
        |a, _, _| a.get_orders_list_error(),
        |a, _| {
            require!(
                a.get_orders_rows().row_count() == 0 && a.get_orders_grouping() == 1,
                "error retained headings or lost grouping"
            );
            a.invoke_retry_orders_list();
            a.invoke_orders_scenario_changed(0);
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-retry-recovery",
        noop,
        |a, s, i| !a.get_orders_loading() && rejected_orders_list(s, i),
        |a, _| {
            require!(
                a.get_orders_grouping() == 1
                    && a.get_orders_rows().row_count() == 2
                    && a.get_orders_query() == "Alpha"
                    && a.get_orders_beginning() == "2026-10-29"
                    && a.get_orders_ending() == "2026-10-29"
                    && !a.get_orders_list_error(),
                "group retry tuple changed"
            );
            a.invoke_order_selected(1);
            a.invoke_order_activated();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-selector-reset",
        |a, _| {
            a.invoke_open_selection();
            a.invoke_cancel_selection();
            Ok(())
        },
        |a, s, i| {
            !a.get_orders_loading() && seen(s, i, "order-body", "SYNTH-001", "ORDER-02", false)
        },
        |a, _| {
            require!(
                a.get_orders_grouping() == 0
                    && a.get_orders_rows().row_count() == 4
                    && a.get_selected_order() == -1
                    && a.get_order_body().is_empty(),
                "selector retained group state"
            );
            a.invoke_orders_grouping_changed(1);
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-group-tab-reset",
        |a, _| {
            a.invoke_tab_changed(3);
            a.invoke_tab_changed(2);
            Ok(())
        },
        |a, s, i| !a.get_orders_loading() && rejected_orders_list(s, i),
        |a, _| {
            require!(
                a.get_orders_grouping() == 0
                    && a.get_orders_rows().row_count() == 4
                    && a.get_order_body().is_empty(),
                "tab retained group state"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "orders-filter-return-results",
        |a, _| {
            a.invoke_tab_changed(3);
            Ok(())
        },
        |a, _, _| !a.get_results_loading() && a.get_results_rows().row_count() == 4,
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::Results)?;
            empty_text(a, s)
        },
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
                a.get_report_body()
                    .contains("END OF INVENTED REPORT DETAIL"),
                "long report incomplete"
            );
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "review-vitals-detail",
        |a, _| {
            a.invoke_close_report_detail();
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(2, 2);
            a.invoke_cover_activated(2);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::CoverSheet)?;
            require!(
                a.get_detail_body().contains("VITAL-03"),
                "review Vitals detail missing"
            );
            a.invoke_close_detail();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "review-vitals-closed",
        noop,
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        noop,
    ));
    q.push_back(Step::new(
        "review-medications-detail",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(3, 2);
            a.invoke_cover_activated(3);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::CoverSheet)?;
            require!(
                a.get_detail_body().contains("MED-03"),
                "review Active Medications detail missing"
            );
            a.invoke_close_detail();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "review-medications-closed",
        noop,
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        noop,
    ));
    q.push_back(Step::new(
        "review-appointments-detail",
        |a, _| {
            a.invoke_close_detail();
            a.invoke_tab_changed(0);
            a.invoke_cover_selected(4, 2);
            a.invoke_cover_activated(4);
            Ok(())
        },
        |a, _, _| a.get_detail_open() && !a.get_detail_loading(),
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::CoverSheet)?;
            require!(
                a.get_detail_body().contains("APPT-03"),
                "review Appointments detail missing"
            );
            a.invoke_close_detail();
            Ok(())
        },
    ));
    q.push_back(Step::new(
        "review-appointments-closed",
        noop,
        |a, _, _| !a.get_detail_open() && a.get_detail_body().is_empty(),
        noop,
    ));
    // Restore the documented functional review state:
    // only the review checkpoint's VITAL-03, MED-03 and APPT-03 selections.
    q.push_back(Step::new(
        "review-final-state",
        |a, _| {
            for (panel, index) in [(0, -1), (1, -1), (2, 2), (3, 2), (4, 2)] {
                a.invoke_cover_selected(panel, index);
            }
            Ok(())
        },
        now,
        |a, s| {
            owned(a, s, "SYNTH-001", ChartTab::CoverSheet)?;
            // Pin every panel: native review starts from exactly this state.
            require!(
                a.get_selected_problem() == -1
                    && a.get_selected_allergy() == -1
                    && a.get_selected_vital() == 2
                    && a.get_selected_medication() == 2
                    && a.get_selected_appointment() == 2,
                "review selections not restored to VITAL-03/MED-03/APPT-03"
            );
            require!(
                !a.get_detail_open() && a.get_detail_body().is_empty(),
                "review detail not closed"
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
                "M17F100_DELIVERY {} {} {:?} generation={} applied={}",
                e.operation, e.owner, e.key, e.generation, e.applied
            );
        }
        println!(
            "M17F100_INTEGRATED_PASS cases={} deliveries={} rejected={} elapsed_ms={}",
            driver.completed,
            audit.len(),
            audit.iter().filter(|e| !e.applied).count(),
            driver.started.elapsed().as_millis()
        );
        if let Some(app) = driver.weak.upgrade() {
            let size = app.window().size();
            println!(
                "M17F100_WINDOW client_width_px={} client_height_px={} application_scale={}",
                size.width,
                size.height,
                app.window().scale_factor()
            );
        }
        drop(c);
        if driver.keep_open {
            if let Some(app) = driver.weak.upgrade() {
                app.invoke_open_selection();
            }
            println!(
                "M17F100_REVIEW_READY SYNTH-001 patient selector; wait for candidates, then review page integrity; close the mock to exit."
            );
        }
    } else if let Err(error) = &result {
        eprintln!("M17F100_INTEGRATED_FAIL {error}");
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
            "M17F100_CHECK {} PASS elapsed_ms={}",
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
