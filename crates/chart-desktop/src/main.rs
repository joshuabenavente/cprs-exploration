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

struct Controller {
    state: AppState,
    provider: MockProvider,
    immediate: bool,
    last_click: Option<(PatientId, Instant)>,
    last_cover_click: Option<(PatientId, PanelKind, String, Instant)>,
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
    let n = &state.notes;
    app.set_notes_query(n.query.clone().into());
    let rows = n
        .rows
        .iter()
        .map(|r| {
            vec![
                r.date.clone(),
                r.title.clone(),
                r.subject.clone(),
                r.author.clone(),
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
        NotesListStatus::Error(message) => message.clone().into(),
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
    for panel in [PanelKind::ProblemList, PanelKind::Allergies] {
        let rows = state
            .active
            .as_ref()
            .map(|chart| {
                chart
                    .cover_sheet
                    .items(panel)
                    .iter()
                    .map(|item| {
                        if panel == PanelKind::Allergies {
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
        let current = if panel == PanelKind::ProblemList {
            app.get_problem_rows()
        } else {
            app.get_allergy_rows()
        };
        if let Some(model) = changed_rows(&current, rows) {
            if panel == PanelKind::ProblemList {
                app.set_problem_rows(model);
            } else {
                app.set_allergy_rows(model);
            }
        }
        let index = state.selected_cover_index(panel).map_or(-1, |i| i as i32);
        if panel == PanelKind::ProblemList {
            app.set_selected_problem(index);
        } else {
            app.set_selected_allergy(index);
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
    if index == 1 {
        PanelKind::Allergies
    } else {
        PanelKind::ProblemList
    }
}
fn panel_index(panel: PanelKind) -> i32 {
    i32::from(panel == PanelKind::Allergies)
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
        if shared.borrow_mut().state.apply_detail(&request, result) {
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
        if shared.borrow_mut().state.apply_notes_list(&request, result) {
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
        if shared.borrow_mut().state.apply_note(&request, result) {
            paint(&weak, &shared);
        }
    };
    if immediate {
        finish();
    } else {
        slint::Timer::single_shot(Duration::from_millis(delay), finish);
    }
}

fn wire(app: &AppWindow, shared: &Shared) {
    let (weak, data) = (app.as_weak(), shared.clone());
    app.on_notes_filter_edited(move |query| {
        load_notes(weak.clone(), data.clone(), query.to_string())
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
        if let Some(app) = weak.upgrade() {
            app.invoke_focus_chart();
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
    app.invoke_query_edited("NGUYEN".into());
    app.invoke_simulation_changed(5);
    app.invoke_row_selected(0);
    app.invoke_confirm_selection();
    assert_eq!(app.get_active_id().as_str(), "SYNTH-002");
    assert_eq!(app.get_allergy_rows().row_count(), 0);
    app.invoke_tab_changed(1);
    assert_eq!(app.get_notes_rows().row_count(), 0);
    assert!(app.get_notes_list_status().contains("No invented notes"));
    assert!(app.get_note_body().is_empty());
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
    assert!(shared.borrow().immediate);
    println!(
        "Mock UI callback smoke passed: patient selection, two Cover Sheet panels/details, Notes list/text/filter/error/retry, clearing, and Unicode fixture identity."
    );
}

fn main() -> Result<(), Box<dyn Error>> {
    let args: Vec<_> = std::env::args().skip(1).collect();
    let smoke = args.as_slice() == ["--smoke-check"];
    let minimum_size = args.as_slice() == ["--minimum-size"];
    if !args.is_empty() && !smoke && !minimum_size {
        return Err("Usage: cprs-chart-mock [--smoke-check | --minimum-size]".into());
    }
    slint::BackendSelector::new()
        .backend_name("winit".into())
        .renderer_name("software".into())
        .select()?;
    let app = AppWindow::new()?;
    if minimum_size {
        app.window().set_size(slint::LogicalSize::new(980.0, 680.0));
        app.window()
            .set_position(slint::PhysicalPosition::new(0, 0));
    }
    let shared = Rc::new(RefCell::new(Controller {
        state: AppState::default(),
        provider: MockProvider::default(),
        immediate: smoke,
        last_click: None,
        last_cover_click: None,
    }));
    wire(&app, &shared);
    let request = shared.borrow_mut().state.open_selection();
    search_request(app.as_weak(), shared.clone(), request);
    if smoke {
        callback_smoke(&app, &shared);
    } else {
        app.run()?;
    }
    Ok(())
}
