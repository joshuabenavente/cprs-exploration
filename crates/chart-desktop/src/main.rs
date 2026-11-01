#![deny(unsafe_code)]

use chart_core::*;
use slint::{ComponentHandle, Model, ModelRc, StandardListViewItem, VecModel};
use std::{
    cell::RefCell,
    error::Error,
    rc::Rc,
    time::{Duration, Instant},
};

// Only Slint-generated code may use unsafe; authored workflow/UI adapter code may not.
#[allow(unsafe_code)]
mod ui {
    slint::include_modules!();
}
use ui::AppWindow;
mod integrated_check;

struct Controller {
    state: AppState,
    provider: MockProvider,
    immediate: bool,
    delivery_audit: Option<Vec<integrated_check::Delivery>>,
    last_click: Option<(PatientId, Instant)>,
    last_cover_click: Option<(PatientId, PanelKind, String, Instant)>,
    last_order_click: Option<(PatientId, OrderId, Instant)>,
    last_report_click: Option<(PatientId, ReportId, Instant)>,
}

type Shared = Rc<RefCell<Controller>>;

fn mode(index: i32) -> ListMode {
    if index == 1 {
        ListMode::DemoRoster
    } else {
        ListMode::All
    }
}
fn simulation(index: i32) -> Simulation {
    match index {
        1 => Simulation::SearchUnavailable,
        2 => Simulation::MalformedResult,
        3 => Simulation::ChartUnavailable,
        4 => Simulation::SlowSearch,
        5 => Simulation::DetailUnavailable,
        6 => Simulation::NotesListUnavailable,
        7 => Simulation::NoteBodyUnavailable,
        8 => Simulation::SlowNotes,
        9 => Simulation::OrdersListUnavailable,
        10 => Simulation::OrderDetailUnavailable,
        11 => Simulation::SlowOrders,
        12 => Simulation::ResultsListUnavailable,
        13 => Simulation::ReportDetailUnavailable,
        14 => Simulation::SlowResults,
        15 => Simulation::InconsistentSearchPage,
        _ => Simulation::Normal,
    }
}
fn simulation_index(value: Simulation) -> i32 {
    match value {
        Simulation::Normal => 0,
        Simulation::SearchUnavailable => 1,
        Simulation::MalformedResult => 2,
        Simulation::ChartUnavailable => 3,
        Simulation::SlowSearch => 4,
        Simulation::DetailUnavailable => 5,
        Simulation::NotesListUnavailable => 6,
        Simulation::NoteBodyUnavailable => 7,
        Simulation::SlowNotes => 8,
        Simulation::OrdersListUnavailable => 9,
        Simulation::OrderDetailUnavailable => 10,
        Simulation::SlowOrders => 11,
        Simulation::ResultsListUnavailable => 12,
        Simulation::ReportDetailUnavailable => 13,
        Simulation::SlowResults => 14,
        Simulation::InconsistentSearchPage => 15,
    }
}
fn tab(index: i32) -> ChartTab {
    match index {
        1 => ChartTab::Notes,
        2 => ChartTab::Orders,
        3 => ChartTab::Results,
        _ => ChartTab::CoverSheet,
    }
}
fn order_filter(index: i32) -> OrderStatusFilter {
    match index {
        1 => OrderStatusFilter::Active,
        2 => OrderStatusFilter::Pending,
        3 => OrderStatusFilter::Complete,
        _ => OrderStatusFilter::All,
    }
}
fn order_filter_index(value: OrderStatusFilter) -> i32 {
    match value {
        OrderStatusFilter::All => 0,
        OrderStatusFilter::Active => 1,
        OrderStatusFilter::Pending => 2,
        OrderStatusFilter::Complete => 3,
    }
}

fn sync(app: &AppWindow, controller: &Controller) {
    let state = &controller.state;
    app.set_selector_open(state.selector_open);
    app.set_has_active(state.active.is_some());
    app.set_fixture_date(FIXTURE_DATE.into());
    if let Some(chart) = &state.active {
        app.set_active_name(chart.patient.name.clone().into());
        app.set_active_id(chart.patient.id.to_string().into());
        app.set_active_detail(
            format!(
                "Fixture DOB: {}   ·   {}   ·   Invented record",
                chart.patient.birth_date, chart.patient.location
            )
            .into(),
        );
        app.set_active_location(chart.patient.location.clone().into());
        app.set_active_visit(chart.visit.clone().into());
        app.set_chart_summary(chart.summary.clone().into());
    } else {
        app.set_active_name("No patient selected".into());
        app.set_active_id("".into());
        app.set_active_detail("Select an invented patient to open a mock chart.".into());
        app.set_active_location("".into());
        app.set_active_visit("".into());
        app.set_chart_summary("".into());
    }
    app.set_query_text(state.query.clone().into());
    app.set_mode_index(i32::from(state.mode == ListMode::DemoRoster));
    app.set_simulation_index(simulation_index(controller.provider.simulation));
    let rows: Vec<Vec<String>> = state
        .page
        .as_ref()
        .map(|page| {
            page.rows
                .iter()
                .map(|patient| {
                    vec![
                        patient.name.clone(),
                        patient.id.to_string(),
                        patient.birth_date.clone(),
                        patient.demo_lookup.clone(),
                    ]
                })
                .collect()
        })
        .unwrap_or_default();
    // Preserve table objects and keyboard focus when only selection or preview changes.
    let current = app.get_patient_rows();
    let unchanged = current.row_count() == rows.len()
        && rows.iter().enumerate().all(|(i, values)| {
            current.row_data(i).is_some_and(|row| {
                row.row_count() == values.len()
                    && values.iter().enumerate().all(|(j, text)| {
                        row.row_data(j)
                            .is_some_and(|cell| cell.text.as_str() == text)
                    })
            })
        });
    if !unchanged {
        let model: Vec<ModelRc<StandardListViewItem>> = rows
            .into_iter()
            .map(|row| {
                ModelRc::new(VecModel::from(
                    row.into_iter()
                        .map(|text| StandardListViewItem::from(text.as_str()))
                        .collect::<Vec<_>>(),
                ))
            })
            .collect();
        app.set_patient_rows(ModelRc::new(VecModel::from(model)));
    }
    let selected = state
        .pending
        .as_ref()
        .and_then(|patient| {
            state
                .page
                .as_ref()
                .and_then(|page| page.rows.iter().position(|row| row.id == patient.id))
        })
        .map_or(-1, |i| i as i32);
    app.set_selected_row(selected);
    app.set_search_loading(matches!(state.search_status, SearchStatus::Loading));
    app.set_chart_loading(state.is_chart_loading());
    app.set_search_state(match &state.search_status {
        SearchStatus::Idle => 0,
        SearchStatus::Loading => 1,
        SearchStatus::Ready => 2,
        SearchStatus::Empty => 3,
        SearchStatus::Error(ProviderError::Malformed(_)) => 5,
        SearchStatus::Error(_) => 4,
    });
    app.set_can_confirm(state.pending.is_some() && !state.is_chart_loading());
    app.set_can_previous(state.page.as_ref().is_some_and(|p| p.previous.is_some()));
    app.set_can_next(state.page.as_ref().is_some_and(|p| p.next.is_some()));
    app.set_page_label(
        state
            .page
            .as_ref()
            .map_or_else(
                || "No results loaded".into(),
                |page| {
                    if page.total == 0 {
                        "0 matches".into()
                    } else {
                        format!(
                            "{}–{} of {} fixtures",
                            page.start + 1,
                            page.start + page.rows.len(),
                            page.total
                        )
                    }
                },
            )
            .into(),
    );
    app.set_has_preview(state.pending.is_some());
    if let Some(patient) = &state.pending {
        app.set_preview_name(patient.name.clone().into());
        app.set_preview_id(patient.id.to_string().into());
        app.set_preview_dob(patient.birth_date.clone().into());
        app.set_preview_lookup(patient.demo_lookup.clone().into());
        app.set_preview_location(patient.location.clone().into());
        app.set_preview_access(
            match controller.provider.access(&patient.id) {
                AccessDecision::Allow => "Mock access: allowed",
                AccessDecision::Acknowledge(_) => "Mock access: acknowledgment required",
                AccessDecision::Deny(_) => "Mock access: denied for this fixture",
                AccessDecision::Unavailable(_) => "Mock access: decision unavailable",
            }
            .into(),
        );
        app.set_preview_flag(
            if patient.deceased_fixture {
                "Synthetic deceased-record flag"
            } else {
                ""
            }
            .into(),
        );
    } else {
        app.set_preview_name("".into());
        app.set_preview_id("".into());
        app.set_preview_dob("".into());
        app.set_preview_lookup("".into());
        app.set_preview_location("".into());
        app.set_preview_access("".into());
        app.set_preview_flag("".into());
    }
    app.set_show_acknowledgment(state.confirmation.is_some());
    app.set_acknowledgment(
        state
            .confirmation
            .as_ref()
            .map_or_else(String::new, |c| c.message.clone())
            .into(),
    );
    app.set_message(state.message.clone().into());
    app.set_tab_index(match state.tab {
        ChartTab::CoverSheet => 0,
        ChartTab::Notes => 1,
        ChartTab::Orders => 2,
        ChartTab::Results => 3,
    });
    app.set_placeholder(state.tab.placeholder().into());
    let o = &state.orders;
    app.set_orders_query(o.query.clone().into());
    app.set_orders_beginning(o.beginning_input.clone().into());
    app.set_orders_ending(o.ending_input.clone().into());
    app.set_orders_invalid_filter(matches!(o.list_status, OrdersListStatus::Invalid(_)));
    app.set_orders_status_filter(order_filter_index(o.status_filter));
    app.set_orders_grouping(if o.grouping == OrdersGrouping::Service {
        1
    } else {
        0
    });
    let rows = o
        .display_rows()
        .into_iter()
        .map(|row| match row {
            OrdersDisplayRow::ServiceHeading(service) => vec![
                format!("Service: {service}"),
                "Group heading".into(),
                "".into(),
                "".into(),
                "".into(),
                "".into(),
            ],
            OrdersDisplayRow::Order(r) => vec![
                r.service.clone(),
                r.description.clone(),
                r.start_stop.clone(),
                r.provider.clone(),
                r.status.label().into(),
                r.location.clone(),
            ],
        })
        .collect();
    if let Some(model) = changed_rows(&app.get_orders_rows(), rows) {
        app.set_orders_rows(model);
    }
    app.set_selected_order(o.selected_display_index().map_or(-1, |i| i as i32));
    app.set_orders_scenario(match controller.provider.simulation {
        Simulation::OrdersListUnavailable => 1,
        Simulation::OrderDetailUnavailable => 2,
        Simulation::SlowOrders => 3,
        _ => 0,
    });
    app.set_orders_loading(matches!(o.list_status, OrdersListStatus::Loading));
    app.set_orders_list_error(matches!(o.list_status, OrdersListStatus::Error(_)));
    app.set_orders_list_status(match &o.list_status {
        OrdersListStatus::Idle => "Open Orders to load invented records.".into(),
        OrdersListStatus::Loading => "Loading invented order list…".into(),
        OrdersListStatus::Ready => format!(
            "{} invented orders · {} · Select an order, then open detail",
            o.rows.len(),
            if o.grouping == OrdersGrouping::Service {
                "Grouped by service; newest first within service"
            } else {
                "Newest first"
            }
        )
        .into(),
        OrdersListStatus::Empty => {
            "No invented orders match this view. This is not a clinical finding.".into()
        }
        OrdersListStatus::Error(message) | OrdersListStatus::Invalid(message) => {
            message.clone().into()
        }
    });
    app.set_order_identity(
        o.selected
            .as_ref()
            .map_or_else(
                || "No invented order selected".into(),
                |s| {
                    format!(
                        "{} · {} · {} · {}",
                        s.patient_id,
                        s.id.as_str(),
                        s.status.label(),
                        s.description
                    )
                },
            )
            .into(),
    );
    app.set_order_detail_open(!matches!(o.detail, OrderDetailState::Closed));
    app.set_order_body_error(matches!(o.detail, OrderDetailState::Error(_)));
    app.set_order_body_ready(matches!(o.detail, OrderDetailState::Ready(_)));
    app.set_order_body_status(match &o.detail {
        OrderDetailState::Closed => if o.selected.is_some() {
            "Press Enter or View order detail to read this invented order."
        } else {
            "Select an invented order above."
        }
        .into(),
        OrderDetailState::Loading(_) => "Retrieving selected synthetic order detail…".into(),
        OrderDetailState::Ready(detail) if detail.text.is_empty() => {
            "This invented order has an empty detail response.".into()
        }
        OrderDetailState::Ready(_) => "MOCK ONLY · Invented order detail · Read-only".into(),
        OrderDetailState::Error(message) => message.clone().into(),
    });
    app.set_order_body(match &o.detail {
        OrderDetailState::Ready(detail) => detail.text.clone().into(),
        _ => "".into(),
    });
    let o = &state.results;
    app.set_results_query(o.query.clone().into());
    app.set_results_beginning(o.beginning_input.clone().into());
    app.set_results_ending(o.ending_input.clone().into());
    app.set_results_invalid_filter(matches!(o.list_status, ResultsListStatus::Invalid(_)));
    let rows = o
        .rows
        .iter()
        .map(|r| {
            vec![
                r.date.clone(),
                r.description.clone(),
                r.specimen.clone(),
                r.location.clone(),
            ]
        })
        .collect();
    if let Some(model) = changed_rows(&app.get_results_rows(), rows) {
        app.set_results_rows(model);
    }
    app.set_selected_report(o.selected_index().map_or(-1, |i| i as i32));
    app.set_results_scenario(match controller.provider.simulation {
        Simulation::ResultsListUnavailable => 1,
        Simulation::ReportDetailUnavailable => 2,
        Simulation::SlowResults => 3,
        _ => 0,
    });
    app.set_results_loading(matches!(o.list_status, ResultsListStatus::Loading));
    app.set_results_list_error(matches!(o.list_status, ResultsListStatus::Error(_)));
    app.set_results_list_status(match &o.list_status {
        ResultsListStatus::Idle => "Open Results to load invented records.".into(),
        ResultsListStatus::Loading => "Loading invented report list…".into(),
        ResultsListStatus::Ready => format!(
            "{} invented reports · Newest first · Select a row, then open detail",
            o.rows.len()
        )
        .into(),
        ResultsListStatus::Empty => {
            "No invented reports match this view. This is not a clinical finding.".into()
        }
        ResultsListStatus::Error(message) | ResultsListStatus::Invalid(message) => {
            message.clone().into()
        }
    });
    app.set_report_identity(
        o.selected
            .as_ref()
            .map_or_else(
                || "No invented report selected".into(),
                |s| format!("{} · {} · {}", s.patient_id, s.id.as_str(), s.description),
            )
            .into(),
    );
    app.set_report_detail_open(!matches!(o.detail, ReportDetailState::Closed));
    app.set_report_body_error(matches!(o.detail, ReportDetailState::Error(_)));
    app.set_report_body_ready(matches!(o.detail, ReportDetailState::Ready(_)));
    app.set_report_body_status(match &o.detail {
        ReportDetailState::Closed => if o.selected.is_some() {
            "Press Enter or View report detail to read this invented report."
        } else {
            "Select an invented report above."
        }
        .into(),
        ReportDetailState::Loading(_) => "Retrieving selected synthetic report detail…".into(),
        ReportDetailState::Ready(detail) if detail.text.is_empty() => {
            "This invented report has an empty detail response.".into()
        }
        ReportDetailState::Ready(_) => "MOCK ONLY · Invented report detail · Read-only".into(),
        ReportDetailState::Error(message) => message.clone().into(),
    });
    app.set_report_body(match &o.detail {
        ReportDetailState::Ready(detail) => detail.text.clone().into(),
        _ => "".into(),
    });
    let n = &state.notes;
    app.set_notes_query(n.query.clone().into());
    app.set_notes_beginning(n.beginning_input.clone().into());
    app.set_notes_ending(n.ending_input.clone().into());
    app.set_notes_invalid_filter(matches!(n.list_status, NotesListStatus::Invalid(_)));
    let authors = state.note_authors();
    let labels: Vec<slint::SharedString> = std::iter::once("All invented authors".into())
        .chain(
            authors
                .iter()
                .map(|a| format!("{} · {}", a.id.as_str(), a.label).into()),
        )
        .collect();
    if app.get_notes_authors().iter().collect::<Vec<_>>() != labels {
        app.set_notes_authors(ModelRc::from(Rc::new(VecModel::from(labels))));
    }
    app.set_notes_author_index(
        n.author
            .as_ref()
            .and_then(|id| authors.iter().position(|a| &a.id == id))
            .map_or(0, |i| i as i32 + 1),
    );

    let rows = n
        .rows
        .iter()
        .map(|r| {
            vec![
                r.date.clone(),
                r.title.clone(),
                r.subject.clone(),
                format!("{} · {}", r.author_id.as_str(), r.author),
                r.location.clone(),
            ]
        })
        .collect();
    if let Some(model) = changed_rows(&app.get_notes_rows(), rows) {
        app.set_notes_rows(model);
    }
    app.set_selected_note(n.selected_index().map_or(-1, |i| i as i32));
    app.set_notes_scenario(match controller.provider.simulation {
        Simulation::NotesListUnavailable => 1,
        Simulation::NoteBodyUnavailable => 2,
        Simulation::SlowNotes => 3,
        _ => 0,
    });
    app.set_notes_loading(matches!(n.list_status, NotesListStatus::Loading));
    app.set_notes_list_error(matches!(n.list_status, NotesListStatus::Error(_)));
    app.set_notes_list_status(match &n.list_status {
        NotesListStatus::Idle => "Open Notes to load invented records.".into(),
        NotesListStatus::Loading => "Loading invented note list…".into(),
        NotesListStatus::Ready => format!(
            "{} invented notes · Newest first · Select a row to load its text",
            n.rows.len()
        )
        .into(),
        NotesListStatus::Empty => {
            "No invented notes match this view. This is not a clinical finding.".into()
        }
        NotesListStatus::Error(message) | NotesListStatus::Invalid(message) => {
            message.clone().into()
        }
    });
    app.set_note_identity(
        n.selected
            .as_ref()
            .map_or_else(
                || "No invented note selected".into(),
                |s| {
                    format!(
                        "{} · {} · {} · {}",
                        s.patient_id,
                        s.id.as_str(),
                        s.status,
                        s.title
                    )
                },
            )
            .into(),
    );
    app.set_note_body_error(matches!(n.body, NoteBodyState::Error(_)));
    app.set_note_body_ready(matches!(n.body, NoteBodyState::Ready(_)));
    app.set_note_body_status(match &n.body {
        NoteBodyState::Unselected => {
            "Select an invented note above. Its text will appear here.".into()
        }
        NoteBodyState::Loading(_) => "Retrieving selected synthetic note…".into(),
        NoteBodyState::Ready(body) if body.text.is_empty() => {
            "This invented note has an empty body.".into()
        }
        NoteBodyState::Ready(_) => "MOCK ONLY · Invented document text · Read-only".into(),
        NoteBodyState::Error(message) => message.clone().into(),
    });
    app.set_note_body(match &n.body {
        NoteBodyState::Ready(body) => body.text.clone().into(),
        _ => "".into(),
    });
    for panel in PanelKind::ALL {
        let rows = state
            .active
            .as_ref()
            .map(|chart| {
                chart
                    .cover_sheet
                    .items(panel)
                    .iter()
                    .map(|item| {
                        if let Some(vital) = &item.vital {
                            vec![
                                item.label.clone(),
                                vital.value.clone(),
                                vital.taken.clone(),
                                vital.qualifiers.clone(),
                            ]
                        } else if let Some(medication) = &item.medication {
                            vec![item.label.clone(), medication.status.clone()]
                        } else if let Some(appointment) = &item.appointment {
                            vec![
                                item.label.clone(),
                                appointment.location.clone(),
                                appointment.action_req.clone(),
                            ]
                        } else if panel == PanelKind::Allergies {
                            vec![
                                item.label.clone(),
                                item.severity.clone(),
                                item.symptoms.clone(),
                            ]
                        } else {
                            vec![item.label.clone()]
                        }
                    })
                    .collect::<Vec<_>>()
            })
            .unwrap_or_default();
        let current = match panel {
            PanelKind::ProblemList => app.get_problem_rows(),
            PanelKind::Allergies => app.get_allergy_rows(),
            PanelKind::Vitals => app.get_vital_rows(),
            PanelKind::ActiveMedications => app.get_medication_rows(),
            PanelKind::Appointments => app.get_appointment_rows(),
        };
        if let Some(model) = changed_rows(&current, rows) {
            match panel {
                PanelKind::ProblemList => app.set_problem_rows(model),
                PanelKind::Allergies => app.set_allergy_rows(model),
                PanelKind::Vitals => app.set_vital_rows(model),
                PanelKind::ActiveMedications => app.set_medication_rows(model),
                PanelKind::Appointments => app.set_appointment_rows(model),
            }
        }
        let index = state.selected_cover_index(panel).map_or(-1, |i| i as i32);
        match panel {
            PanelKind::ProblemList => app.set_selected_problem(index),
            PanelKind::Allergies => app.set_selected_allergy(index),
            PanelKind::Vitals => app.set_selected_vital(index),
            PanelKind::ActiveMedications => app.set_selected_medication(index),
            PanelKind::Appointments => app.set_selected_appointment(index),
        }
    }
    app.set_detail_open(state.detail.is_open());
    app.set_detail_loading(matches!(state.detail, DetailState::Loading(_)));
    app.set_detail_error(matches!(state.detail, DetailState::Error { .. }));
    let (title, body) = match &state.detail {
        DetailState::Closed => (String::new(), String::new()),
        DetailState::Loading(request) => (
            format!("{} Item Detail", request.panel.title()),
            "Loading synthetic item details…".into(),
        ),
        DetailState::Ready { snapshot, .. } => (snapshot.title.clone(), snapshot.body.clone()),
        DetailState::Error { message, request } => (
            format!("{} Item Detail — unavailable", request.panel.title()),
            message.clone(),
        ),
    };
    app.set_detail_title(title.into());
    app.set_detail_body(body.into());
    app.set_detail_identity(
        state
            .detail
            .request()
            .map(|r| format!("{} · {} · {}", r.patient_id, r.panel.title(), r.item_id))
            .unwrap_or_default()
            .into(),
    );
}

fn changed_rows(
    current: &ModelRc<ModelRc<StandardListViewItem>>,
    rows: Vec<Vec<String>>,
) -> Option<ModelRc<ModelRc<StandardListViewItem>>> {
    if current.row_count() == rows.len()
        && rows.iter().enumerate().all(|(i, values)| {
            current.row_data(i).is_some_and(|row| {
                row.row_count() == values.len()
                    && values.iter().enumerate().all(|(j, text)| {
                        row.row_data(j)
                            .is_some_and(|cell| cell.text.as_str() == text)
                    })
            })
        })
    {
        return None;
    }
    Some(ModelRc::new(VecModel::from(
        rows.into_iter()
            .map(|row| {
                ModelRc::new(VecModel::from(
                    row.into_iter()
                        .map(|text| StandardListViewItem::from(text.as_str()))
                        .collect::<Vec<_>>(),
                ))
            })
            .collect::<Vec<_>>(),
    )))
}

fn panel(index: i32) -> PanelKind {
    match index {
        1 => PanelKind::Allergies,
        2 => PanelKind::Vitals,
        3 => PanelKind::ActiveMedications,
        4 => PanelKind::Appointments,
        _ => PanelKind::ProblemList,
    }
}
fn panel_index(panel: PanelKind) -> i32 {
    match panel {
        PanelKind::ProblemList => 0,
        PanelKind::Allergies => 1,
        PanelKind::Vitals => 2,
        PanelKind::ActiveMedications => 3,
        PanelKind::Appointments => 4,
    }
}

fn open_detail(weak: slint::Weak<AppWindow>, shared: Shared, panel: PanelKind) {
    let request = shared.borrow_mut().state.begin_detail(panel);
    let Some(request) = request else {
        return;
    };
    paint(&weak, &shared);
    if let Some(app) = weak.upgrade() {
        app.invoke_focus_detail();
    }
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let finish = move || {
        let result = provider.detail(&request);
        let applied = shared.borrow_mut().state.apply_detail(&request, result);
        integrated_check::record(
            &shared,
            "cover-detail",
            request.patient_id.as_str(),
            request.item_id.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(350), finish);
    }
}

fn paint(weak: &slint::Weak<AppWindow>, shared: &Shared) {
    if let Some(app) = weak.upgrade() {
        sync(&app, &shared.borrow());
    }
}

fn search_request(weak: slint::Weak<AppWindow>, shared: Shared, request: SearchRequest) {
    paint(&weak, &shared);
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowSearch
        && !request.query.len().is_multiple_of(2)
    {
        850
    } else {
        180
    };
    let finish = move || {
        let result = provider.search(&request);
        let applied = shared.borrow_mut().state.apply_search(&request, result);
        integrated_check::record(
            &shared,
            "search",
            "",
            request.query.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}

fn confirm(weak: slint::Weak<AppWindow>, shared: Shared, acknowledged: bool) {
    let request = {
        let mut c = shared.borrow_mut();
        let provider = c.provider.clone();
        c.state.confirm(&provider, acknowledged)
    };
    paint(&weak, &shared);
    let Some(request) = request else {
        if shared.borrow().state.confirmation.is_some()
            && let Some(app) = weak.upgrade()
        {
            app.invoke_focus_acknowledgment();
        }
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let finish = move || {
        let result = provider.chart(&request.patient_id);
        let applied = shared.borrow_mut().state.apply_chart(&request, result);
        integrated_check::record(
            &shared,
            "chart",
            request.patient_id.as_str(),
            request.patient_id.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
            if !shared.borrow().state.selector_open
                && let Some(app) = weak.upgrade()
            {
                app.invoke_focus_chart();
            }
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(260), finish);
    }
}

fn load_notes(weak: slint::Weak<AppWindow>, shared: Shared, query: String) {
    let request = shared.borrow_mut().state.begin_notes_list(query);
    dispatch_notes_list(weak, shared, request);
}

fn dispatch_notes_list(
    weak: slint::Weak<AppWindow>,
    shared: Shared,
    request: Option<NotesListRequest>,
) {
    paint(&weak, &shared);
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowNotes {
        900
    } else {
        180
    };
    let finish = move || {
        let result = provider.notes_list(&request);
        let applied = shared.borrow_mut().state.apply_notes_list(&request, result);
        integrated_check::record(
            &shared,
            "notes-list",
            request.patient_id.as_str(),
            request.query.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}

fn deliver_note(weak: slint::Weak<AppWindow>, shared: Shared, request: Option<NoteRequest>) {
    paint(&weak, &shared);
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay =
        if provider.simulation == Simulation::SlowNotes && request.note_id.as_str() == "NOTE-01" {
            1100
        } else {
            300
        };
    let finish = move || {
        let result = provider.note_body(&request);
        let applied = shared.borrow_mut().state.apply_note(&request, result);
        integrated_check::record(
            &shared,
            "note-body",
            request.patient_id.as_str(),
            request.note_id.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}

fn load_orders(
    weak: slint::Weak<AppWindow>,
    shared: Shared,
    query: String,
    filter: OrderStatusFilter,
) {
    let request = {
        let mut c = shared.borrow_mut();
        c.last_order_click = None;
        c.state.begin_orders_list(query, filter)
    };
    deliver_orders_list(weak, shared, request);
}
fn deliver_orders_list(
    weak: slint::Weak<AppWindow>,
    shared: Shared,
    request: Option<OrdersListRequest>,
) {
    paint(&weak, &shared);
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowOrders {
        900
    } else {
        180
    };
    let finish = move || {
        let result = provider.orders_list(&request);
        let applied = shared
            .borrow_mut()
            .state
            .apply_orders_list(&request, result);
        integrated_check::record(
            &shared,
            "orders-list",
            request.patient_id.as_str(),
            &format!("{:?}", request.filter),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}
fn deliver_order(weak: slint::Weak<AppWindow>, shared: Shared, request: Option<OrderRequest>) {
    paint(&weak, &shared);
    if shared.borrow().state.tab == ChartTab::Orders
        && !shared.borrow().state.selector_open
        && let Some(app) = weak.upgrade()
    {
        app.invoke_focus_order_body();
    }
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowOrders
        && request.order_id.as_str() == "ORDER-01"
    {
        1100
    } else {
        300
    };
    let finish = move || {
        let result = provider.order_detail(&request);
        let applied = shared.borrow_mut().state.apply_order(&request, result);
        integrated_check::record(
            &shared,
            "order-body",
            request.patient_id.as_str(),
            request.order_id.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}
fn open_order(weak: slint::Weak<AppWindow>, shared: Shared) {
    let request = shared.borrow_mut().state.begin_order_detail();
    deliver_order(weak, shared, request);
}

fn load_results(weak: slint::Weak<AppWindow>, shared: Shared, query: String) {
    let request = {
        let mut c = shared.borrow_mut();
        c.last_report_click = None;
        c.state.begin_results_list(query)
    };
    deliver_results_list(weak, shared, request);
}
fn deliver_results_list(
    weak: slint::Weak<AppWindow>,
    shared: Shared,
    request: Option<ResultsListRequest>,
) {
    paint(&weak, &shared);
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowResults {
        900
    } else {
        180
    };
    let finish = move || {
        let result = provider.results_list(&request);
        let applied = shared
            .borrow_mut()
            .state
            .apply_results_list(&request, result);
        integrated_check::record(
            &shared,
            "results-list",
            request.patient_id.as_str(),
            &format!("{:?}", request.filter),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}
fn deliver_report(weak: slint::Weak<AppWindow>, shared: Shared, request: Option<ReportRequest>) {
    paint(&weak, &shared);
    if shared.borrow().state.tab == ChartTab::Results
        && !shared.borrow().state.selector_open
        && let Some(app) = weak.upgrade()
    {
        app.invoke_focus_report_body();
    }
    let Some(request) = request else {
        return;
    };
    let (provider, immediate) = {
        let c = shared.borrow();
        (c.provider.clone(), c.immediate)
    };
    let delay = if provider.simulation == Simulation::SlowResults
        && request.report_id.as_str() == "REPORT-01"
    {
        1100
    } else {
        300
    };
    let finish = move || {
        let result = provider.report_detail(&request);
        let applied = shared.borrow_mut().state.apply_report(&request, result);
        integrated_check::record(
            &shared,
            "report-body",
            request.patient_id.as_str(),
            request.report_id.as_str(),
            request.generation,
            applied,
        );
        if applied {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}
fn open_report(weak: slint::Weak<AppWindow>, shared: Shared) {
    let request = shared.borrow_mut().state.begin_report_detail();
    deliver_report(weak, shared, request);
}

fn wire(app: &AppWindow, shared: &Shared) {
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_results_filter_edited(move |query| {
        load_results(weak.clone(), data.clone(), query.to_string());
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_results_dates_edited(move |beginning, ending| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_report_click = None;
            let query = c.state.results.query.clone();
            c.state
                .begin_results_filter(query, beginning.to_string(), ending.to_string())
        };
        deliver_results_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_results_reset_filters(move || {
        let request = {
            let mut c = data.borrow_mut();
            c.last_report_click = None;
            c.state.reset_results_filters()
        };
        deliver_results_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_results_scenario_changed(move |index| {
        data.borrow_mut().provider.simulation = match index {
            1 => Simulation::ResultsListUnavailable,
            2 => Simulation::ReportDetailUnavailable,
            3 => Simulation::SlowResults,
            _ => Simulation::Normal,
        };
        let query = data.borrow().state.results.query.clone();
        load_results(weak.clone(), data.clone(), query);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_results_list(move || {
        let query = data.borrow().state.results.query.clone();
        load_results(weak.clone(), data.clone(), query);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_report_selected(move |index| {
        let index = usize::try_from(index).unwrap_or(usize::MAX);
        let mut c = data.borrow_mut();
        if c.state.results.selected_index() != Some(index) {
            c.last_report_click = None;
        }
        c.state.select_report(index);
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_report_released(move |index| {
        let Ok(index) = usize::try_from(index) else {
            return;
        };
        let activate = {
            let mut c = data.borrow_mut();
            if c.state.selector_open || c.state.tab != ChartTab::Results {
                return;
            }
            let Some(row) = c.state.results.rows.get(index) else {
                return;
            };
            let (patient, id) = (row.patient_id.clone(), row.id.clone());
            let now = Instant::now();
            let activate = c.last_report_click.as_ref().is_some_and(|(p, i, t)| {
                *p == patient && *i == id && now.duration_since(*t) <= Duration::from_millis(450)
            });
            c.last_report_click = if activate {
                None
            } else {
                Some((patient, id, now))
            };
            c.state.select_report(index);
            activate
        };
        if activate {
            open_report(weak.clone(), data.clone());
        } else {
            paint(&weak, &data);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_report_activated(move || open_report(weak.clone(), data.clone()));
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_close_report_detail(move || {
        let mut c = data.borrow_mut();
        c.last_report_click = None;
        c.state.close_report_detail();
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_report(move || {
        let request = data.borrow_mut().state.retry_report();
        deliver_report(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_filter_edited(move |query| {
        let filter = data.borrow().state.orders.status_filter;
        load_orders(weak.clone(), data.clone(), query.to_string(), filter);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_dates_edited(move |beginning, ending| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_order_click = None;
            let query = c.state.orders.query.clone();
            let status = c.state.orders.status_filter;
            c.state
                .begin_orders_filter(query, status, beginning.to_string(), ending.to_string())
        };
        deliver_orders_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_reset_filters(move || {
        let request = {
            let mut c = data.borrow_mut();
            c.last_order_click = None;
            c.state.reset_orders_filters()
        };
        deliver_orders_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_status_changed(move |index| {
        let query = data.borrow().state.orders.query.clone();
        load_orders(weak.clone(), data.clone(), query, order_filter(index));
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_grouping_changed(move |index| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_order_click = None;
            c.state.set_orders_grouping(if index == 1 {
                OrdersGrouping::Service
            } else {
                OrdersGrouping::Flat
            })
        };
        deliver_orders_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_orders_scenario_changed(move |index| {
        data.borrow_mut().provider.simulation = match index {
            1 => Simulation::OrdersListUnavailable,
            2 => Simulation::OrderDetailUnavailable,
            3 => Simulation::SlowOrders,
            _ => Simulation::Normal,
        };
        let (query, filter) = {
            let c = data.borrow();
            (c.state.orders.query.clone(), c.state.orders.status_filter)
        };
        load_orders(weak.clone(), data.clone(), query, filter);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_orders_list(move || {
        let (query, filter) = {
            let c = data.borrow();
            (c.state.orders.query.clone(), c.state.orders.status_filter)
        };
        load_orders(weak.clone(), data.clone(), query, filter);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_order_selected(move |index| {
        let index = usize::try_from(index).unwrap_or(usize::MAX);
        let mut c = data.borrow_mut();
        if c.state.orders.selected_display_index() != Some(index) {
            c.last_order_click = None;
        }
        c.state.select_display_order(index);
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_order_released(move |index| {
        let Ok(index) = usize::try_from(index) else {
            return;
        };
        let activate = {
            let mut c = data.borrow_mut();
            if c.state.selector_open || c.state.tab != ChartTab::Orders {
                return;
            }
            let Some(row) = c.state.orders.display_order(index) else {
                c.last_order_click = None;
                drop(c);
                paint(&weak, &data);
                return;
            };
            let (patient, id) = (row.patient_id.clone(), row.id.clone());
            let now = Instant::now();
            let activate = c.last_order_click.as_ref().is_some_and(|(p, i, t)| {
                *p == patient && *i == id && now.duration_since(*t) <= Duration::from_millis(450)
            });
            c.last_order_click = if activate {
                None
            } else {
                Some((patient, id, now))
            };
            c.state.select_display_order(index);
            activate
        };
        if activate {
            open_order(weak.clone(), data.clone());
        } else {
            paint(&weak, &data);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_order_activated(move || open_order(weak.clone(), data.clone()));
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_close_order_detail(move || {
        let mut c = data.borrow_mut();
        c.last_order_click = None;
        c.state.close_order_detail();
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_order(move || {
        let request = data.borrow_mut().state.retry_order();
        deliver_order(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_notes_filter_edited(move |query| {
        load_notes(weak.clone(), data.clone(), query.to_string())
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_notes_author_changed(move |index| {
        let c = data.borrow();
        let author = if index == 0 {
            None
        } else {
            let Some(author) = usize::try_from(index - 1)
                .ok()
                .and_then(|i| c.state.note_authors().get(i).cloned())
            else {
                return;
            };
            Some(author.id)
        };
        let (query, beginning, ending) = (
            c.state.notes.query.clone(),
            c.state.notes.beginning_input.clone(),
            c.state.notes.ending_input.clone(),
        );
        drop(c);
        let request = data
            .borrow_mut()
            .state
            .begin_notes_filter(query, author, beginning, ending);
        dispatch_notes_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_notes_dates_edited(move |beginning, ending| {
        let (query, author) = {
            let c = data.borrow();
            (c.state.notes.query.clone(), c.state.notes.author.clone())
        };
        let request = data.borrow_mut().state.begin_notes_filter(
            query,
            author,
            beginning.to_string(),
            ending.to_string(),
        );
        dispatch_notes_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_reset_notes_filters(move || {
        let request = data.borrow_mut().state.reset_notes_filters();
        dispatch_notes_list(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_notes_list(move || {
        let query = data.borrow().state.notes.query.clone();
        load_notes(weak.clone(), data.clone(), query);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_notes_scenario_changed(move |index| {
        data.borrow_mut().provider.simulation = match index {
            1 => Simulation::NotesListUnavailable,
            2 => Simulation::NoteBodyUnavailable,
            3 => Simulation::SlowNotes,
            _ => Simulation::Normal,
        };
        let query = data.borrow().state.notes.query.clone();
        load_notes(weak.clone(), data.clone(), query);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_note_selected(move |index| {
        let request = data
            .borrow_mut()
            .state
            .select_note(usize::try_from(index).unwrap_or(usize::MAX));
        deliver_note(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_note(move || {
        let request = data.borrow_mut().state.retry_note();
        deliver_note(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_cover_selected(move |kind, index| {
        let mut c = data.borrow_mut();
        let kind = panel(kind);
        let index = usize::try_from(index).unwrap_or(usize::MAX);
        if c.state.selected_cover_index(kind) != Some(index) {
            c.last_cover_click = None;
        }
        c.state.select_cover_item(kind, index);
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_cover_released(move |kind, index| {
        let kind = panel(kind);
        let Ok(index) = usize::try_from(index) else {
            return;
        };
        let activate = {
            let mut c = data.borrow_mut();
            if c.state.selector_open || c.state.detail.is_open() {
                return;
            }
            let Some((patient, item)) = c.state.active.as_ref().and_then(|chart| {
                chart
                    .cover_sheet
                    .items(kind)
                    .get(index)
                    .map(|item| (chart.patient.id.clone(), item.id.clone()))
            }) else {
                return;
            };
            let now = Instant::now();
            let activate = c.last_cover_click.as_ref().is_some_and(|(p, k, i, t)| {
                *p == patient
                    && *k == kind
                    && *i == item
                    && now.duration_since(*t) <= Duration::from_millis(450)
            });
            c.last_cover_click = if activate {
                None
            } else {
                Some((patient, kind, item, now))
            };
            c.state.select_cover_item(kind, index);
            activate
        };
        if activate {
            open_detail(weak.clone(), data.clone(), kind);
        } else {
            paint(&weak, &data);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_cover_activated(move |kind| open_detail(weak.clone(), data.clone(), panel(kind)));
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_close_detail(move || {
        let panel = {
            let mut c = data.borrow_mut();
            c.last_cover_click = None;
            c.state.close_detail()
        };
        paint(&weak, &data);
        if let Some(panel) = panel
            && let Some(app) = weak.upgrade()
        {
            app.invoke_focus_cover(panel_index(panel));
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_retry_detail(move || {
        let panel = data.borrow().state.detail.request().map(|r| r.panel);
        if let Some(panel) = panel {
            open_detail(weak.clone(), data.clone(), panel);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_open_selection(move || {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            c.last_cover_click = None;
            c.state.open_selection()
        };
        search_request(weak.clone(), data.clone(), request);
        if let Some(app) = weak.upgrade() {
            app.invoke_focus_search();
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_query_edited(move |query| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            let mode = c.state.mode;
            c.state.begin_search(query.to_string(), mode)
        };
        search_request(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_mode_changed(move |index| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            let query = c.state.query.clone();
            c.state.begin_search(query, mode(index))
        };
        search_request(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_simulation_changed(move |index| {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            c.provider.simulation = simulation(index);
            let (query, mode) = (c.state.query.clone(), c.state.mode);
            c.state.begin_search(query, mode)
        };
        search_request(weak.clone(), data.clone(), request);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_row_selected(move |index| {
        let index = usize::try_from(index).unwrap_or(usize::MAX);
        let mut c = data.borrow_mut();
        let provider = c.provider.clone();
        c.state.choose_row(index, &provider);
        drop(c);
        paint(&weak, &data);
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_row_released(move |index| {
        let Ok(index) = usize::try_from(index) else {
            return;
        };
        let activate = {
            let mut c = data.borrow_mut();
            let Some(id) = c
                .state
                .page
                .as_ref()
                .and_then(|p| p.rows.get(index))
                .map(|r| r.id.clone())
            else {
                return;
            };
            let now = Instant::now();
            let activate = c.last_click.as_ref().is_some_and(|(last, time)| {
                last == &id && now.duration_since(*time) <= Duration::from_millis(450)
            });
            c.last_click = if activate { None } else { Some((id, now)) };
            let provider = c.provider.clone();
            c.state.choose_row(index, &provider);
            activate
        };
        if activate {
            confirm(weak.clone(), data.clone(), false);
        } else {
            paint(&weak, &data);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_confirm_selection(move || confirm(weak.clone(), data.clone(), false));
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_accept_acknowledgment(move || confirm(weak.clone(), data.clone(), true));
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_decline_acknowledgment(move || {
        data.borrow_mut().state.decline_confirmation();
        paint(&weak, &data);
        if let Some(app) = weak.upgrade() {
            app.invoke_focus_search();
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_cancel_selection(move || {
        {
            let mut c = data.borrow_mut();
            c.last_click = None;
            c.state.cancel_selection();
        }
        paint(&weak, &data);
        if data.borrow().state.tab == ChartTab::Notes && !data.borrow().state.selector_open {
            load_notes(weak.clone(), data.clone(), String::new());
        }
        if data.borrow().state.tab == ChartTab::Orders && !data.borrow().state.selector_open {
            load_orders(
                weak.clone(),
                data.clone(),
                String::new(),
                OrderStatusFilter::All,
            );
        }
        if data.borrow().state.tab == ChartTab::Results && !data.borrow().state.selector_open {
            load_results(weak.clone(), data.clone(), String::new());
        }
        if let Some(app) = weak.upgrade() {
            match data.borrow().state.tab {
                ChartTab::Notes => app.invoke_focus_notes_filter(),
                ChartTab::Orders => app.invoke_focus_orders_filter(),
                ChartTab::Results => app.invoke_focus_results_filter(),
                ChartTab::CoverSheet => app.invoke_focus_chart(),
            }
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_previous_page(move || {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            c.state.page_request(Direction::Backward)
        };
        if let Some(request) = request {
            search_request(weak.clone(), data.clone(), request);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_next_page(move || {
        let request = {
            let mut c = data.borrow_mut();
            c.last_click = None;
            c.state.page_request(Direction::Forward)
        };
        if let Some(request) = request {
            search_request(weak.clone(), data.clone(), request);
        }
    });
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_tab_changed(move |index| {
        data.borrow_mut().last_order_click = None;
        data.borrow_mut().last_report_click = None;
        data.borrow_mut().state.set_tab(tab(index));
        paint(&weak, &data);
        if data.borrow().state.tab == ChartTab::Notes
            && matches!(data.borrow().state.notes.list_status, NotesListStatus::Idle)
        {
            load_notes(weak.clone(), data.clone(), String::new());
        }
        if index == 1
            && data.borrow().state.tab == ChartTab::Notes
            && !data.borrow().state.selector_open
            && let Some(app) = weak.upgrade()
        {
            app.invoke_focus_notes_filter();
        }
        if data.borrow().state.tab == ChartTab::Orders
            && matches!(
                data.borrow().state.orders.list_status,
                OrdersListStatus::Idle
            )
        {
            load_orders(
                weak.clone(),
                data.clone(),
                String::new(),
                OrderStatusFilter::All,
            );
        }
        if index == 2
            && data.borrow().state.tab == ChartTab::Orders
            && !data.borrow().state.selector_open
            && let Some(app) = weak.upgrade()
        {
            app.invoke_focus_orders_filter();
        }
        if data.borrow().state.tab == ChartTab::Results
            && matches!(
                data.borrow().state.results.list_status,
                ResultsListStatus::Idle
            )
        {
            load_results(weak.clone(), data.clone(), String::new());
        }
        if index == 3
            && data.borrow().state.tab == ChartTab::Results
            && !data.borrow().state.selector_open
            && let Some(app) = weak.upgrade()
        {
            app.invoke_focus_results_filter();
        }
    });
}

fn callback_smoke(app: &AppWindow, shared: &Shared) {
    app.invoke_query_edited("MORGAN".into());
    assert_eq!(app.get_patient_rows().row_count(), 2);
    assert!(!app.get_can_confirm());
    app.invoke_row_selected(1);
    assert_eq!(app.get_preview_id().as_str(), "SYNTH-004");
    app.invoke_row_selected(-1);
    assert!(!app.get_can_confirm());
    app.invoke_row_selected(1);
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-004");
    assert!(!app.get_selector_open());
    app.invoke_tab_changed(3);
    assert_eq!(app.get_results_rows().row_count(), 4);
    app.invoke_report_selected(1);
    assert!(!app.get_report_detail_open());
    assert!(app.get_report_body().is_empty());
    app.invoke_report_activated();
    assert!(app.get_report_body_ready());
    assert!(app.get_report_body().contains("SYNTH-004"));
    assert!(app.get_report_body().contains("REPORT-02"));
    app.invoke_close_report_detail();
    assert_eq!(app.get_selected_report(), 1);
    assert!(app.get_report_body().is_empty());
    app.invoke_results_filter_edited("李".into());
    assert_eq!(app.get_selected_report(), -1);
    assert_eq!(app.get_results_rows().row_count(), 1);
    app.invoke_report_released(0);
    assert!(!app.get_report_detail_open());
    app.invoke_report_released(0);
    assert!(
        app.get_report_body()
            .contains("END OF INVENTED REPORT DETAIL")
    );
    app.invoke_results_filter_edited("".into());
    app.invoke_results_scenario_changed(2);
    app.invoke_report_selected(0);
    app.invoke_report_activated();
    assert!(app.get_report_body_error());
    app.invoke_retry_report();
    assert!(app.get_report_body_error());
    app.invoke_results_scenario_changed(1);
    assert!(app.get_results_list_error());
    assert!(app.get_report_body().is_empty());
    app.invoke_retry_results_list();
    assert!(app.get_results_list_error());
    app.invoke_results_scenario_changed(0);
    app.invoke_tab_changed(2);
    assert_eq!(app.get_orders_rows().row_count(), 4);
    app.invoke_order_selected(1);
    assert!(!app.get_order_detail_open());
    assert!(app.get_order_body().is_empty());
    app.invoke_order_activated();
    assert!(app.get_order_body_ready());
    assert!(app.get_order_body().contains("SYNTH-004"));
    assert!(app.get_order_body().contains("ORDER-02"));
    app.invoke_close_order_detail();
    assert_eq!(app.get_selected_order(), 1);
    assert!(app.get_order_body().is_empty());
    app.invoke_orders_grouping_changed(1);
    assert_eq!(app.get_orders_rows().row_count(), 7);
    assert_eq!(app.get_selected_order(), -1);
    app.invoke_order_released(0);
    app.invoke_order_released(0);
    assert!(!app.get_order_detail_open());
    app.invoke_order_released(4);
    app.invoke_order_released(4);
    assert!(app.get_order_body().contains("ORDER-02"));
    app.invoke_orders_reset_filters();
    assert_eq!(app.get_orders_grouping(), 0);
    assert_eq!(app.get_orders_rows().row_count(), 4);
    app.invoke_orders_filter_edited("李".into());
    assert_eq!(app.get_selected_order(), -1);
    assert_eq!(app.get_orders_rows().row_count(), 1);
    app.invoke_order_released(0);
    assert!(!app.get_order_detail_open());
    app.invoke_order_released(0);
    assert!(
        app.get_order_body()
            .contains("END OF INVENTED ORDER DETAIL")
    );
    app.invoke_orders_status_changed(2);
    assert_eq!(app.get_orders_rows().row_count(), 0);
    assert!(app.get_order_body().is_empty());
    app.invoke_orders_status_changed(0);
    app.invoke_orders_dates_edited("2026-10-29".into(), "2026-10-29".into());
    assert_eq!(app.get_orders_rows().row_count(), 0);
    assert!(!app.get_orders_list_error());
    app.invoke_orders_reset_filters();
    assert_eq!(app.get_orders_rows().row_count(), 4);
    app.invoke_orders_dates_edited("2026-10-28".into(), "2026-10-29".into());
    assert_eq!(app.get_orders_rows().row_count(), 2);
    app.invoke_orders_status_changed(1);
    assert_eq!(app.get_orders_rows().row_count(), 1);
    app.invoke_orders_dates_edited("bad".into(), "".into());
    assert!(app.get_orders_invalid_filter());
    assert!(!app.get_orders_list_error() && !app.get_orders_loading());
    assert_eq!(app.get_orders_rows().row_count(), 0);
    app.invoke_orders_scenario_changed(1);
    assert!(app.get_orders_invalid_filter() && !app.get_orders_list_error());
    app.invoke_orders_reset_filters();
    assert!(app.get_orders_list_error());
    app.invoke_orders_scenario_changed(0);
    assert_eq!(app.get_orders_rows().row_count(), 4);
    assert_eq!(app.get_orders_status_filter(), 0);
    app.invoke_orders_filter_edited("李".into());
    app.invoke_orders_scenario_changed(2);
    app.invoke_order_selected(0);
    app.invoke_order_activated();
    assert!(app.get_order_body_error());
    app.invoke_retry_order();
    assert!(app.get_order_body_error());
    app.invoke_orders_scenario_changed(1);
    assert!(app.get_orders_list_error());
    assert!(app.get_order_body().is_empty());
    app.invoke_retry_orders_list();
    assert!(app.get_orders_list_error());
    app.invoke_orders_scenario_changed(0);
    app.invoke_tab_changed(1);
    assert_eq!(app.get_notes_rows().row_count(), 4);
    app.invoke_note_selected(0);
    assert!(app.get_note_body().contains("SYNTH-004"));
    app.invoke_note_selected(1);
    assert!(app.get_note_body().contains("NOTE-02"));
    app.invoke_notes_filter_edited("ZOË 李".into());
    assert_eq!(app.get_notes_rows().row_count(), 1);
    assert!(app.get_note_body().is_empty());
    app.invoke_note_selected(0);
    assert!(app.get_note_body().contains("END OF INVENTED LONG NOTE"));
    app.invoke_notes_scenario_changed(1);
    assert!(app.get_notes_list_error());
    assert!(app.get_note_body().is_empty());
    app.invoke_retry_notes_list();
    assert!(app.get_notes_list_error());
    app.invoke_notes_scenario_changed(2);
    app.invoke_note_selected(0);
    assert!(app.get_note_body_error());
    app.invoke_retry_note();
    assert!(app.get_note_body_error());
    app.invoke_notes_scenario_changed(0);
    app.invoke_note_selected(0);
    assert!(app.get_note_body_ready());
    app.invoke_open_selection();
    app.invoke_query_edited("PATEL".into());
    app.invoke_row_released(0);
    app.invoke_row_released(0);
    assert!(app.get_show_acknowledgment());
    assert_eq!(app.get_active_id().as_str(), "SYNTH-004");
    app.invoke_decline_acknowledgment();
    assert!(!app.get_show_acknowledgment());
    app.invoke_confirm_selection();
    app.invoke_accept_acknowledgment();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-005");
    app.invoke_open_selection();
    app.invoke_query_edited("RIVERA".into());
    app.invoke_row_selected(0);
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-005");
    assert!(app.get_message().contains("denies"));
    app.invoke_cancel_selection();
    app.invoke_open_selection();
    app.invoke_query_edited("CARTER".into());
    app.invoke_row_released(0);
    app.invoke_row_released(0);
    assert_eq!(app.get_active_id().as_str(), "SYNTH-001");
    app.invoke_open_selection();
    app.invoke_query_edited("NGUYEN".into());
    app.invoke_row_selected(0);
    app.invoke_simulation_changed(3);
    app.invoke_row_selected(0);
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-001");
    assert!(app.get_selector_open());
    app.invoke_simulation_changed(15);
    assert_eq!(app.get_search_state(), 5);
    assert_eq!(app.get_patient_rows().row_count(), 0);
    assert!(!app.get_has_preview() && !app.get_can_confirm());
    assert!(!app.get_can_next() && !app.get_can_previous());
    assert_eq!(app.get_active_id().as_str(), "SYNTH-001");
    app.invoke_simulation_changed(2);
    assert_eq!(app.get_search_state(), 5);
    assert!(!app.get_can_confirm());
    app.invoke_simulation_changed(1);
    assert_eq!(app.get_search_state(), 4);
    app.invoke_simulation_changed(0);
    app.invoke_query_edited("NOT A FIXTURE".into());
    assert_eq!(app.get_search_state(), 3);
    app.invoke_query_edited("CARTER".into());
    app.invoke_row_selected(0);
    app.invoke_confirm_selection();
    assert_eq!(app.get_tab_index(), 0);
    assert_eq!(app.get_problem_rows().row_count(), 2);
    assert_eq!(app.get_allergy_rows().row_count(), 2);
    assert_eq!(app.get_vital_rows().row_count(), 3);
    assert_eq!(app.get_medication_rows().row_count(), 3);
    assert_eq!(app.get_appointment_rows().row_count(), 3);
    app.invoke_cover_selected(4, 2);
    assert!(!app.get_detail_open());
    app.invoke_cover_activated(4);
    assert!(app.get_detail_body().contains("SYNTH-001"));
    assert!(app.get_detail_body().contains("APPT-03"));
    assert!(app.get_detail_body().contains("Nov 04, 2026@10:15"));
    assert!(app.get_detail_body().contains("Demo action C"));
    assert!(app.get_detail_body().contains("Zoë 李"));
    app.invoke_close_detail();
    assert_eq!(app.get_selected_appointment(), 2);
    app.invoke_cover_released(4, 0);
    app.invoke_cover_released(4, 0);
    assert!(app.get_detail_body().contains("APPT-01"));
    app.invoke_close_detail();
    app.invoke_cover_selected(3, 2);
    assert!(!app.get_detail_open());
    app.invoke_cover_activated(3);
    assert!(app.get_detail_body().contains("SYNTH-001"));
    assert!(app.get_detail_body().contains("MED-03"));
    assert!(app.get_detail_body().contains("Demo active C"));
    assert!(app.get_detail_body().contains("Zoë 李"));
    app.invoke_close_detail();
    assert_eq!(app.get_selected_medication(), 2);
    app.invoke_cover_released(3, 0);
    app.invoke_cover_released(3, 0);
    assert!(app.get_detail_body().contains("MED-01"));
    app.invoke_close_detail();
    app.invoke_cover_selected(2, 2);
    assert!(!app.get_detail_open());
    app.invoke_cover_activated(2);
    assert!(app.get_detail_body().contains("SYNTH-001"));
    assert!(app.get_detail_body().contains("VITAL-03"));
    assert!(app.get_detail_body().contains("118/76 mmHg"));
    assert!(app.get_detail_body().contains("Zoë 李"));
    app.invoke_close_detail();
    app.invoke_cover_released(2, 0);
    app.invoke_cover_released(2, 0);
    assert!(app.get_detail_body().contains("36.8 °C"));
    app.invoke_close_detail();
    app.invoke_cover_selected(0, 1);
    app.invoke_cover_activated(0);
    assert!(app.get_detail_open());
    assert!(app.get_detail_title().contains("Beta"));
    assert!(app.get_detail_body().contains("SYNTH-001"));
    app.invoke_close_detail();
    assert!(!app.get_detail_open());
    assert!(app.get_detail_body().is_empty());
    app.invoke_cover_released(1, 0);
    app.invoke_cover_released(1, 0);
    assert!(app.get_detail_open());
    assert!(app.get_detail_title().contains("Allergies Item Detail"));
    app.invoke_close_detail();
    app.invoke_open_selection();
    assert_eq!(app.get_selected_problem(), -1);
    assert_eq!(app.get_selected_allergy(), -1);
    assert_eq!(app.get_selected_vital(), -1);
    assert_eq!(app.get_selected_medication(), -1);
    app.invoke_query_edited("NGUYEN".into());
    app.invoke_simulation_changed(5);
    app.invoke_row_selected(0);
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-002");
    assert_eq!(app.get_allergy_rows().row_count(), 0);
    assert_eq!(app.get_vital_rows().row_count(), 0);
    assert_eq!(app.get_medication_rows().row_count(), 0);
    assert_eq!(app.get_selected_appointment(), -1);
    assert_eq!(app.get_appointment_rows().row_count(), 0);
    app.invoke_cover_selected(4, 0);
    app.invoke_cover_activated(4);
    assert!(!app.get_detail_open());
    app.invoke_cover_selected(3, 0);
    app.invoke_cover_activated(3);
    assert!(!app.get_detail_open());
    app.invoke_cover_selected(2, 0);
    app.invoke_cover_activated(2);
    assert!(!app.get_detail_open());
    app.invoke_tab_changed(1);
    assert_eq!(app.get_notes_rows().row_count(), 0);
    assert!(app.get_notes_list_status().contains("No invented notes"));
    assert!(app.get_note_body().is_empty());
    app.invoke_tab_changed(2);
    assert_eq!(app.get_orders_rows().row_count(), 0);
    assert!(app.get_orders_list_status().contains("No invented orders"));
    app.invoke_tab_changed(3);
    assert_eq!(app.get_results_rows().row_count(), 0);
    assert!(
        app.get_results_list_status()
            .contains("No invented reports")
    );
    assert!(app.get_report_body().is_empty());
    assert!(app.get_order_body().is_empty());
    app.invoke_tab_changed(0);
    app.invoke_cover_selected(0, 0);
    app.invoke_cover_activated(0);
    assert!(app.get_detail_error());
    assert!(app.get_message().contains("unavailable"));
    assert!(!app.get_detail_body().contains("SYNTH-001"));
    app.invoke_retry_detail();
    assert!(app.get_detail_error());
    app.invoke_close_detail();
    app.invoke_open_selection();
    app.invoke_simulation_changed(0);
    app.invoke_query_edited("zárate".into());
    assert_eq!(app.get_patient_rows().row_count(), 1);
    app.invoke_row_selected(0);
    assert_eq!(app.get_preview_name().as_str(), "ZÁRATE, ZOË 李");
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-009");
    app.invoke_cover_selected(4, 0);
    app.invoke_cover_activated(4);
    assert!(app.get_detail_body().contains("ZÁRATE, ZOË 李"));
    assert!(app.get_detail_body().contains("Training location Alpha"));
    app.invoke_close_detail();
    app.invoke_cover_selected(3, 0);
    app.invoke_cover_activated(3);
    assert!(app.get_detail_body().contains("ZÁRATE, ZOË 李"));
    assert!(app.get_detail_body().contains("Demo active A"));
    app.invoke_close_detail();
    app.invoke_cover_selected(2, 0);
    app.invoke_cover_activated(2);
    assert!(app.get_detail_body().contains("ZÁRATE, ZOË 李"));
    app.invoke_close_detail();
    app.invoke_open_selection();
    app.invoke_simulation_changed(5);
    app.invoke_cancel_selection();
    app.invoke_cover_selected(2, 0);
    app.invoke_cover_activated(2);
    assert!(app.get_detail_error());
    app.invoke_retry_detail();
    assert!(app.get_detail_error());
    assert!(!app.get_detail_body().contains("36.8 °C"));
    app.invoke_close_detail();
    app.invoke_cover_selected(3, 0);
    app.invoke_cover_activated(3);
    assert!(app.get_detail_error());
    assert!(!app.get_detail_body().contains("Demo active A"));
    shared.borrow_mut().provider.simulation = Simulation::Normal;
    app.invoke_retry_detail();
    assert!(!app.get_detail_error());
    assert!(app.get_detail_body().contains("MED-01"));
    app.invoke_close_detail();
    shared.borrow_mut().provider.simulation = Simulation::DetailUnavailable;
    app.invoke_cover_selected(4, 0);
    app.invoke_cover_activated(4);
    assert!(app.get_detail_error());
    assert!(!app.get_detail_body().contains("Demo action A"));
    shared.borrow_mut().provider.simulation = Simulation::Normal;
    app.invoke_retry_detail();
    assert!(app.get_detail_body().contains("APPT-01"));
    app.invoke_open_selection();
    assert_eq!(app.get_selected_medication(), -1);
    assert_eq!(app.get_selected_appointment(), -1);
    assert!(app.get_detail_body().is_empty());
    app.invoke_cancel_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-009");
    assert!(shared.borrow().immediate);
    println!(
        "Mock UI callback smoke passed: patient selection, Cover Sheet including Appointments and Active Medications, Notes, Results reports and Orders selection/detail/double-click/filter/status/close/error/retry, patient clearing, and Unicode fixture identity."
    );
}

fn main() -> Result<(), Box<dyn Error>> {
    let args: Vec<_> = std::env::args().skip(1).collect();
    let smoke = args.as_slice() == ["--smoke-check"];
    let integrated = args.iter().any(|a| a == "--integration-check");
    let keep_open = args.iter().any(|a| a == "--keep-open");
    let minimum_size = args.iter().any(|a| a == "--minimum-size");
    if args.iter().any(|a| {
        ![
            "--smoke-check",
            "--minimum-size",
            "--integration-check",
            "--keep-open",
        ]
        .contains(&a.as_str())
    }) || (args.iter().any(|a| a == "--smoke-check") && !smoke)
        || (keep_open && !integrated)
    {
        return Err("Usage: cprs-chart-mock [--minimum-size] [--integration-check [--keep-open]] | --smoke-check".into());
    }
    slint::BackendSelector::new()
        .backend_name("winit".into())
        .renderer_name("software".into())
        .select()?;
    let app = AppWindow::new()?;
    if minimum_size {
        app.window().set_size(slint::LogicalSize::new(980.0, 680.0));
    } else if std::env::var("SLINT_SCALE_FACTOR")
        .ok()
        .and_then(|value| value.parse::<f32>().ok())
        .unwrap_or_else(|| app.window().scale_factor())
        >= 2.0
    {
        // Authored compact default at the largest supported application scale:
        // 800 logical pixels would exceed the reviewed 1440-pixel desktop.
        app.window()
            .set_size(slint::LogicalSize::new(1180.0, 700.0));
    }
    // Keep scale-override and reproducible review launches out of OS cascade offsets.
    if minimum_size || integrated || std::env::var_os("SLINT_SCALE_FACTOR").is_some() {
        app.window()
            .set_position(slint::PhysicalPosition::new(0, 0));
    }
    let shared = Rc::new(RefCell::new(Controller {
        state: AppState::default(),
        provider: MockProvider::default(),
        immediate: smoke,
        delivery_audit: integrated.then(Vec::new),
        last_click: None,
        last_cover_click: None,
        last_order_click: None,
        last_report_click: None,
    }));
    wire(&app, &shared);
    let request = shared.borrow_mut().state.open_selection();
    search_request(app.as_weak(), shared.clone(), request);
    if smoke {
        callback_smoke(&app, &shared);
    } else if integrated {
        integrated_check::run(&app, &shared, keep_open)?;
    } else {
        app.run()?;
    }
    Ok(())
}
