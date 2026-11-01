#![forbid(unsafe_code)]

//! Synthetic patient workflow. No broker, endpoint, credential, or file-import API.
use std::collections::HashSet;
use std::fmt;
mod calendar_day;
pub use calendar_day::*;
mod cover_sheet;
pub use cover_sheet::*;
mod notes;
pub use notes::*;
mod orders;
pub use orders::*;
mod results;
pub use results::*;

pub const FIXTURE_DATE: &str = "31 Oct 2026";
pub const PAGE_SIZE: usize = 4;

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct PatientId(String);

impl PatientId {
    pub fn synthetic(value: &str) -> Result<Self, ProviderError> {
        let suffix = value.strip_prefix("SYNTH-").unwrap_or_default();
        if suffix.len() != 3 || !suffix.bytes().all(|c| c.is_ascii_digit()) {
            return Err(ProviderError::Malformed(
                "Invalid synthetic identifier.".into(),
            ));
        }
        Ok(Self(value.into()))
    }

    pub fn as_str(&self) -> &str {
        &self.0
    }
}

impl fmt::Display for PatientId {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.0.fmt(f)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PatientSummary {
    pub id: PatientId,
    pub name: String,
    pub birth_date: String,
    pub demo_lookup: String,
    pub location: String,
    pub deceased_fixture: bool,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum ProviderError {
    Unavailable(String),
    Malformed(String),
    NotFound,
}

impl fmt::Display for ProviderError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Unavailable(message) | Self::Malformed(message) => message.fmt(f),
            Self::NotFound => f.write_str("Synthetic record not found."),
        }
    }
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum ListMode {
    #[default]
    All,
    DemoRoster,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Direction {
    Forward,
    Backward,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PageCursor {
    pub offset: usize,
    query: String,
    mode: ListMode,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SearchRequest {
    pub generation: u64,
    pub query: String,
    pub mode: ListMode,
    pub cursor: Option<PageCursor>,
    pub direction: Direction,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SearchPage {
    pub rows: Vec<PatientSummary>,
    pub previous: Option<PageCursor>,
    pub next: Option<PageCursor>,
    pub start: usize,
    pub total: usize,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum AccessDecision {
    Allow,
    Acknowledge(String),
    Deny(String),
    Unavailable(String),
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ChartRequest {
    pub generation: u64,
    pub patient_id: PatientId,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ChartSnapshot {
    pub patient: PatientSummary,
    pub visit: String,
    pub summary: String,
    pub cover_sheet: CoverSheet,
}

pub trait PatientProvider {
    fn search(&self, request: &SearchRequest) -> Result<SearchPage, ProviderError>;
    fn preview(&self, id: &PatientId) -> Result<PatientSummary, ProviderError>;
    fn access(&self, id: &PatientId) -> AccessDecision;
    fn chart(&self, id: &PatientId) -> Result<ChartSnapshot, ProviderError>;
    fn detail(&self, request: &DetailRequest) -> Result<DetailSnapshot, ProviderError>;
    fn notes_list(&self, request: &NotesListRequest) -> Result<NotesList, ProviderError>;
    fn note_body(&self, request: &NoteRequest) -> Result<NoteBody, ProviderError>;
    fn orders_list(&self, request: &OrdersListRequest) -> Result<OrdersList, ProviderError>;
    fn order_detail(&self, request: &OrderRequest) -> Result<OrderDetail, ProviderError>;
    fn results_list(&self, request: &ResultsListRequest) -> Result<ResultsList, ProviderError>;
    fn report_detail(&self, request: &ReportRequest) -> Result<ReportDetail, ProviderError>;
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum Simulation {
    #[default]
    Normal,
    SearchUnavailable,
    MalformedResult,
    ChartUnavailable,
    SlowSearch,
    DetailUnavailable,
    NotesListUnavailable,
    NoteBodyUnavailable,
    SlowNotes,
    OrdersListUnavailable,
    OrderDetailUnavailable,
    SlowOrders,
    ResultsListUnavailable,
    ReportDetailUnavailable,
    SlowResults,
}

#[derive(Clone, Debug, Default)]
pub struct MockProvider {
    pub simulation: Simulation,
}

#[derive(Clone, Debug)]
struct Fixture {
    patient: PatientSummary,
    access: AccessDecision,
}

fn valid_date(value: &str) -> bool {
    let bytes = value.as_bytes();
    if bytes.len() != 10
        || bytes[4] != b'-'
        || bytes[7] != b'-'
        || bytes
            .iter()
            .enumerate()
            .any(|(i, c)| i != 4 && i != 7 && !c.is_ascii_digit())
    {
        return false;
    }
    let (Ok(year), Ok(month), Ok(day)) = (
        value[..4].parse::<u32>(),
        value[5..7].parse::<u32>(),
        value[8..].parse::<u32>(),
    ) else {
        return false;
    };
    let leap = year.is_multiple_of(4) && (!year.is_multiple_of(100) || year.is_multiple_of(400));
    let days = match month {
        2 => {
            if leap {
                29
            } else {
                28
            }
        }
        4 | 6 | 9 | 11 => 30,
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        _ => 0,
    };
    (1900..=2026).contains(&year) && day > 0 && day <= days
}

// This pipe-delimited format belongs only to the invented fixtures; it is not a CPRS wire format.
fn parse_fixture(row: &str) -> Result<Fixture, ProviderError> {
    let pieces: Vec<_> = row.split('|').collect();
    if pieces.len() != 7
        || pieces
            .iter()
            .any(|p| p.is_empty() || p.chars().any(char::is_control))
    {
        return Err(ProviderError::Malformed(
            "Malformed synthetic result: expected seven fixture fields.".into(),
        ));
    }
    let id = PatientId::synthetic(pieces[0])?;
    if !valid_date(pieces[2])
        || pieces[3].len() != 5
        || !pieces[3].starts_with('x')
        || !pieces[3][1..].bytes().all(|b| b.is_ascii_digit())
    {
        return Err(ProviderError::Malformed(
            "Malformed synthetic demographics or lookup code.".into(),
        ));
    }
    let access = match pieces[5] {
        "allow" => AccessDecision::Allow,
        "ack" => AccessDecision::Acknowledge(
            "This fixture requires a mock access acknowledgment.".into(),
        ),
        "deny" => AccessDecision::Deny(
            "This fixture denies chart access. The current chart is unchanged.".into(),
        ),
        "unavailable" => AccessDecision::Unavailable(
            "The mock access decision is unavailable. Chart access is blocked.".into(),
        ),
        _ => {
            return Err(ProviderError::Malformed(
                "Unknown mock access decision.".into(),
            ));
        }
    };
    let deceased_fixture = match pieces[6] {
        "0" => false,
        "1" => true,
        _ => {
            return Err(ProviderError::Malformed(
                "Invalid synthetic record flag.".into(),
            ));
        }
    };
    Ok(Fixture {
        patient: PatientSummary {
            id,
            name: pieces[1].into(),
            birth_date: pieces[2].into(),
            demo_lookup: pieces[3].into(),
            location: pieces[4].into(),
            deceased_fixture,
        },
        access,
    })
}

fn fixtures() -> Result<Vec<Fixture>, ProviderError> {
    let records: Vec<_> = include_str!("fixtures/patients.txt")
        .lines()
        .map(parse_fixture)
        .collect::<Result<_, _>>()?;
    let mut ids = HashSet::new();
    if records.iter().any(|r| !ids.insert(r.patient.id.clone())) {
        return Err(ProviderError::Malformed(
            "Duplicate synthetic identifier.".into(),
        ));
    }
    Ok(records)
}

impl MockProvider {
    fn record(&self, id: &PatientId) -> Result<Fixture, ProviderError> {
        fixtures()?
            .into_iter()
            .find(|r| &r.patient.id == id)
            .ok_or(ProviderError::NotFound)
    }
}

impl PatientProvider for MockProvider {
    fn results_list(&self, request: &ResultsListRequest) -> Result<ResultsList, ProviderError> {
        if self.simulation == Simulation::ResultsListUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock report list unavailable. This is not an empty result.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        if request.query != request.filter.query {
            return Err(ProviderError::Malformed(
                "Report query/filter mismatch.".into(),
            ));
        }
        request.filter.validate()?;
        Ok(results::mock_results(
            &self.preview(&request.patient_id)?,
            request,
        ))
    }
    fn report_detail(&self, request: &ReportRequest) -> Result<ReportDetail, ProviderError> {
        if self.simulation == Simulation::ReportDetailUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock report detail unavailable. Previous detail text has been cleared.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        results::mock_report_detail(&self.preview(&request.patient_id)?, request)
    }
    fn orders_list(&self, request: &OrdersListRequest) -> Result<OrdersList, ProviderError> {
        if self.simulation == Simulation::OrdersListUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock order list unavailable. This is not an empty result.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        Ok(orders::mock_orders(
            &self.preview(&request.patient_id)?,
            request,
        ))
    }
    fn order_detail(&self, request: &OrderRequest) -> Result<OrderDetail, ProviderError> {
        if self.simulation == Simulation::OrderDetailUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock order detail unavailable. Previous detail text has been cleared.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        orders::mock_order_detail(&self.preview(&request.patient_id)?, request)
    }
    fn notes_list(&self, request: &NotesListRequest) -> Result<NotesList, ProviderError> {
        if self.simulation == Simulation::NotesListUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock note list unavailable. This is not an empty result.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        let patient = self.preview(&request.patient_id)?;
        if request.query != request.filter.query {
            return Err(ProviderError::Malformed(
                "Note query/filter mismatch.".into(),
            ));
        }
        notes::validate_filter(&patient, &request.filter)?;
        Ok(notes::mock_notes(&patient, &request.filter))
    }
    fn note_body(&self, request: &NoteRequest) -> Result<NoteBody, ProviderError> {
        if self.simulation == Simulation::NoteBodyUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock note text unavailable. Previous document text has been cleared.".into(),
            ));
        }
        if let AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(reason));
        }
        notes::mock_note_body(&self.preview(&request.patient_id)?, request)
    }
    fn search(&self, request: &SearchRequest) -> Result<SearchPage, ProviderError> {
        match self.simulation {
            Simulation::SearchUnavailable => {
                return Err(ProviderError::Unavailable(
                    "The mock search service is unavailable. Try another simulation.".into(),
                ));
            }
            Simulation::MalformedResult => {
                parse_fixture("SYNTH-001|broken row")?;
            }
            _ => (),
        }
        let query = request.query.trim().to_uppercase();
        let rows: Vec<_> = fixtures()?
            .into_iter()
            .map(|f| f.patient)
            .filter(|p| {
                (request.mode == ListMode::All
                    || matches!(
                        p.id.as_str(),
                        "SYNTH-001" | "SYNTH-003" | "SYNTH-005" | "SYNTH-006"
                    ))
                    && (query.is_empty()
                        || p.name.contains(&query)
                        || p.id.as_str() == query
                        || p.demo_lookup.to_uppercase() == query)
            })
            .collect();
        let start = match &request.cursor {
            Some(cursor) if cursor.query == query && cursor.mode == request.mode => cursor.offset,
            Some(_) => {
                return Err(ProviderError::Malformed(
                    "The mock page cursor belongs to another search.".into(),
                ));
            }
            None => 0,
        };
        if start > rows.len() || (start != 0 && start >= rows.len()) {
            return Err(ProviderError::Malformed(
                "The mock page cursor is outside the result set.".into(),
            ));
        }
        let end = (start + PAGE_SIZE).min(rows.len());
        let cursor = |offset| PageCursor {
            offset,
            query: query.clone(),
            mode: request.mode,
        };
        Ok(SearchPage {
            rows: rows[start..end].to_vec(),
            previous: (start > 0).then(|| cursor(start.saturating_sub(PAGE_SIZE))),
            next: (end < rows.len()).then(|| cursor(end)),
            start,
            total: rows.len(),
        })
    }

    fn preview(&self, id: &PatientId) -> Result<PatientSummary, ProviderError> {
        Ok(self.record(id)?.patient)
    }

    fn access(&self, id: &PatientId) -> AccessDecision {
        self.record(id)
            .map(|r| r.access)
            .unwrap_or_else(|e| AccessDecision::Unavailable(e.to_string()))
    }

    fn chart(&self, id: &PatientId) -> Result<ChartSnapshot, ProviderError> {
        if self.simulation == Simulation::ChartUnavailable {
            return Err(ProviderError::Unavailable(
                "The mock chart could not be loaded. The current chart is unchanged.".into(),
            ));
        }
        let patient = self.record(id)?.patient;
        let cover_sheet = cover_sheet::mock_cover_sheet(&patient);
        Ok(ChartSnapshot { patient, cover_sheet, visit: "20 Oct 2026 · Synthetic training visit".into(),
            summary: "Invented training record for patient-selection and chart-navigation demonstrations. No clinical interpretation or live data.".into() })
    }

    fn detail(&self, request: &DetailRequest) -> Result<DetailSnapshot, ProviderError> {
        if self.simulation == Simulation::DetailUnavailable {
            return Err(ProviderError::Unavailable(
                "Mock item details are unavailable. No previous detail content is displayed."
                    .into(),
            ));
        }
        if let AccessDecision::Deny(message) | AccessDecision::Unavailable(message) =
            self.access(&request.patient_id)
        {
            return Err(ProviderError::Unavailable(message));
        }
        cover_sheet::mock_detail(&self.preview(&request.patient_id)?, request)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum SearchStatus {
    Idle,
    Loading,
    Ready,
    Empty,
    Error(ProviderError),
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum ChartTab {
    #[default]
    CoverSheet,
    Notes,
    Orders,
    Results,
}

impl ChartTab {
    pub fn title(self) -> &'static str {
        match self {
            Self::CoverSheet => "Cover Sheet",
            Self::Notes => "Notes",
            Self::Orders => "Orders",
            Self::Results => "Results",
        }
    }
    pub fn placeholder(self) -> String {
        if self == Self::Notes {
            return "Mock-only read-only Notes browser.".into();
        }
        if self == Self::Orders {
            return "Mock-only read-only Orders browser.".into();
        }
        if self == Self::Results {
            return "Mock-only read-only laboratory Results browser.".into();
        }
        format!(
            "{} is not implemented in this mock prototype.",
            self.title()
        )
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Confirmation {
    pub patient_id: PatientId,
    pub message: String,
}

#[derive(Clone, Debug)]
pub struct AppState {
    pub selector_open: bool,
    pub query: String,
    pub mode: ListMode,
    pub page: Option<SearchPage>,
    pub search_status: SearchStatus,
    pub pending: Option<PatientSummary>,
    pub active: Option<ChartSnapshot>,
    pub confirmation: Option<Confirmation>,
    pub message: String,
    pub tab: ChartTab,
    pub selected_problem: Option<String>,
    pub selected_allergy: Option<String>,
    pub selected_vital: Option<String>,
    pub selected_medication: Option<String>,
    pub selected_appointment: Option<String>,
    pub detail: DetailState,
    pub notes: NotesWorkspace,
    pub orders: OrdersWorkspace,
    pub results: ResultsWorkspace,
    detail_generation: u64,
    search_generation: u64,
    chart_generation: u64,
    active_search: Option<SearchRequest>,
    pending_chart: Option<ChartRequest>,
}

impl Default for AppState {
    fn default() -> Self {
        Self {
            selector_open: true,
            query: String::new(),
            mode: ListMode::All,
            page: None,
            search_status: SearchStatus::Idle,
            pending: None,
            active: None,
            confirmation: None,
            message: "Choose an invented patient to preview demographics.".into(),
            tab: ChartTab::CoverSheet,
            selected_problem: None,
            selected_allergy: None,
            selected_vital: None,
            selected_medication: None,
            selected_appointment: None,
            detail: DetailState::Closed,
            notes: NotesWorkspace::default(),
            orders: OrdersWorkspace::default(),
            results: ResultsWorkspace::default(),
            detail_generation: 0,
            search_generation: 0,
            chart_generation: 0,
            active_search: None,
            pending_chart: None,
        }
    }
}

impl AppState {
    pub fn is_chart_loading(&self) -> bool {
        self.pending_chart.is_some()
    }

    pub fn open_selection(&mut self) -> SearchRequest {
        self.orders.clear();
        self.results.clear();
        self.notes.clear();
        self.clear_cover_transient();
        self.selector_open = true;
        self.begin_search(String::new(), self.mode)
    }

    pub fn begin_search(&mut self, query: String, mode: ListMode) -> SearchRequest {
        self.query = query;
        self.mode = mode;
        self.request_page(None, Direction::Forward)
    }

    fn request_page(&mut self, cursor: Option<PageCursor>, direction: Direction) -> SearchRequest {
        self.search_generation += 1;
        self.chart_generation += 1;
        self.pending_chart = None;
        self.pending = None;
        self.confirmation = None;
        self.page = None;
        self.search_status = SearchStatus::Loading;
        self.message = "Searching invented fixtures…".into();
        let request = SearchRequest {
            generation: self.search_generation,
            query: self.query.clone(),
            mode: self.mode,
            cursor,
            direction,
        };
        self.active_search = Some(request.clone());
        request
    }

    pub fn page_request(&mut self, direction: Direction) -> Option<SearchRequest> {
        let page = self.page.as_ref()?;
        let cursor = match direction {
            Direction::Forward => page.next.clone(),
            Direction::Backward => page.previous.clone(),
        }?;
        Some(self.request_page(Some(cursor), direction))
    }

    pub fn apply_search(
        &mut self,
        request: &SearchRequest,
        result: Result<SearchPage, ProviderError>,
    ) -> bool {
        if !self.selector_open || self.active_search.as_ref() != Some(request) {
            return false;
        }
        self.active_search = None;
        match result {
            Ok(page) => {
                self.search_status = if page.rows.is_empty() {
                    SearchStatus::Empty
                } else {
                    SearchStatus::Ready
                };
                self.message = if page.rows.is_empty() {
                    "No invented patients match this search.".into()
                } else {
                    "Select a row to preview. OK or double-click opens its mock chart.".into()
                };
                self.page = Some(page);
            }
            Err(error) => {
                self.message = error.to_string();
                self.search_status = SearchStatus::Error(error);
            }
        }
        true
    }

    pub fn choose_row(&mut self, index: usize, provider: &impl PatientProvider) {
        if !self.selector_open || self.is_chart_loading() || self.confirmation.is_some() {
            return;
        }
        self.pending = None;
        self.confirmation = None;
        let Some(row) = self.page.as_ref().and_then(|p| p.rows.get(index)) else {
            return;
        };
        match provider.preview(&row.id) {
            Ok(patient) if patient.id == row.id => {
                self.pending = Some(patient);
                self.message = "Review the exact synthetic ID, then choose OK.".into();
            }
            Ok(_) => {
                self.message = "Preview identity mismatch. Selection was blocked.".into();
            }
            Err(e) => {
                self.message = e.to_string();
            }
        }
    }

    pub fn confirm(
        &mut self,
        provider: &impl PatientProvider,
        acknowledged: bool,
    ) -> Option<ChartRequest> {
        if !self.selector_open || self.is_chart_loading() {
            return None;
        }
        let Some(patient) = self.pending.as_ref() else {
            self.message = "No patient selected. Choose a row first.".into();
            return None;
        };
        if !self
            .page
            .as_ref()
            .is_some_and(|p| p.rows.iter().any(|r| r.id == patient.id))
        {
            return None;
        }
        let mut reasons = Vec::new();
        match provider.access(&patient.id) {
            AccessDecision::Allow => (),
            AccessDecision::Acknowledge(reason) => reasons.push(reason),
            AccessDecision::Deny(reason) | AccessDecision::Unavailable(reason) => {
                self.confirmation = None;
                self.message = reason;
                return None;
            }
        }
        if patient.deceased_fixture {
            reasons.push(
                "This invented record has a deceased-record flag. Continue to its mock chart?"
                    .into(),
            );
        }
        if !reasons.is_empty() && !acknowledged {
            self.confirmation = Some(Confirmation {
                patient_id: patient.id.clone(),
                message: reasons.join("\n\n"),
            });
            self.message = "An explicit mock acknowledgment is required.".into();
            return None;
        }
        if acknowledged
            && !self
                .confirmation
                .as_ref()
                .is_some_and(|c| c.patient_id == patient.id)
        {
            return None;
        }
        self.confirmation = None;
        self.chart_generation += 1;
        let request = ChartRequest {
            generation: self.chart_generation,
            patient_id: patient.id.clone(),
        };
        self.pending_chart = Some(request.clone());
        self.message = "Loading this patient's synthetic chart…".into();
        Some(request)
    }

    pub fn decline_confirmation(&mut self) {
        self.confirmation = None;
        self.message = "Acknowledgment declined. The current chart is unchanged.".into();
    }

    pub fn apply_chart(
        &mut self,
        request: &ChartRequest,
        result: Result<ChartSnapshot, ProviderError>,
    ) -> bool {
        if !self.selector_open
            || self.pending_chart.as_ref() != Some(request)
            || !self
                .pending
                .as_ref()
                .is_some_and(|p| p.id == request.patient_id)
        {
            return false;
        }
        self.pending_chart = None;
        match result {
            Ok(chart)
                if chart.patient.id == request.patient_id
                    && chart.cover_sheet.matches_patient(&request.patient_id) =>
            {
                self.clear_cover_transient();
                self.notes.clear();
                self.orders.clear();
                self.results.clear();
                self.active = Some(chart);
                self.selector_open = false;
                self.pending = None;
                self.confirmation = None;
                self.active_search = None;
                self.tab = ChartTab::CoverSheet;
                self.message = "Synthetic chart loaded. All information is invented.".into();
            }
            Ok(_) => {
                self.message = "Chart identity mismatch. The current chart is unchanged.".into()
            }
            Err(error) => self.message = error.to_string(),
        }
        true
    }

    pub fn cancel_selection(&mut self) {
        self.search_generation += 1;
        self.chart_generation += 1;
        self.active_search = None;
        self.pending_chart = None;
        self.pending = None;
        self.confirmation = None;
        self.page = None;
        self.selector_open = false;
        self.search_status = SearchStatus::Idle;
        self.message = "Patient selection canceled. The current chart is unchanged.".into();
    }

    pub fn set_tab(&mut self, tab: ChartTab) {
        if self.active.is_some() && !self.selector_open {
            if tab != self.tab {
                self.close_detail();
                self.notes.clear();
                self.orders.clear();
                self.results.clear();
            }
            self.tab = tab;
        }
    }

    fn clear_cover_transient(&mut self) {
        self.detail_generation += 1;
        self.selected_problem = None;
        self.selected_allergy = None;
        self.selected_vital = None;
        self.selected_medication = None;
        self.selected_appointment = None;
        self.detail = DetailState::Closed;
    }

    pub fn selected_cover_index(&self, panel: PanelKind) -> Option<usize> {
        let selected = match panel {
            PanelKind::ProblemList => self.selected_problem.as_ref(),
            PanelKind::Allergies => self.selected_allergy.as_ref(),
            PanelKind::Vitals => self.selected_vital.as_ref(),
            PanelKind::ActiveMedications => self.selected_medication.as_ref(),
            PanelKind::Appointments => self.selected_appointment.as_ref(),
        }?;
        self.active
            .as_ref()?
            .cover_sheet
            .items(panel)
            .iter()
            .position(|i| &i.id == selected)
    }

    pub fn select_cover_item(&mut self, panel: PanelKind, index: usize) {
        if self.selector_open || self.tab != ChartTab::CoverSheet || self.detail.is_open() {
            return;
        }
        let id = self
            .active
            .as_ref()
            .and_then(|c| c.cover_sheet.items(panel).get(index))
            .map(|i| i.id.clone());
        match panel {
            PanelKind::ProblemList => self.selected_problem = id,
            PanelKind::Allergies => self.selected_allergy = id,
            PanelKind::Vitals => self.selected_vital = id,
            PanelKind::ActiveMedications => self.selected_medication = id,
            PanelKind::Appointments => self.selected_appointment = id,
        }
    }

    pub fn begin_detail(&mut self, panel: PanelKind) -> Option<DetailRequest> {
        if self.selector_open
            || self.tab != ChartTab::CoverSheet
            || matches!(
                self.detail,
                DetailState::Loading(_) | DetailState::Ready { .. }
            )
        {
            return None;
        }
        let chart = self.active.as_ref()?;
        let index = self.selected_cover_index(panel)?;
        self.detail_generation += 1;
        let request = DetailRequest {
            generation: self.detail_generation,
            patient_id: chart.patient.id.clone(),
            panel,
            item_id: chart.cover_sheet.items(panel)[index].id.clone(),
        };
        self.detail = DetailState::Loading(request.clone());
        self.message = "Loading synthetic item details…".into();
        Some(request)
    }

    pub fn apply_detail(
        &mut self,
        request: &DetailRequest,
        result: Result<DetailSnapshot, ProviderError>,
    ) -> bool {
        if self.selector_open
            || self.tab != ChartTab::CoverSheet
            || !matches!(&self.detail, DetailState::Loading(r) if r == request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
        {
            return false;
        }
        self.detail = match result {
            Ok(snapshot)
                if snapshot.patient_id == request.patient_id
                    && snapshot.panel == request.panel
                    && snapshot.item_id == request.item_id =>
            {
                self.message = "Synthetic item detail loaded. Read-only.".into();
                DetailState::Ready {
                    request: request.clone(),
                    snapshot,
                }
            }
            Ok(_) => DetailState::Error {
                request: request.clone(),
                message: "Detail identity mismatch. Nothing was displayed.".into(),
            },
            Err(error) => DetailState::Error {
                request: request.clone(),
                message: error.to_string(),
            },
        };
        if let DetailState::Error { message, .. } = &self.detail {
            self.message = message.clone();
        }
        true
    }

    pub fn close_detail(&mut self) -> Option<PanelKind> {
        let panel = self.detail.request().map(|r| r.panel);
        self.detail_generation += 1;
        self.detail = DetailState::Closed;
        if panel.is_some() {
            self.message = "Synthetic item detail closed.".into();
        }
        panel
    }
}
