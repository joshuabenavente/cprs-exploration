//! One invented interim-style laboratory report browser. No broker wire types.
use crate::{AppState, ChartTab, PatientId, PatientSummary, ProviderError, valid_date};
use std::collections::HashSet;

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct ReportId(String);
impl ReportId {
    pub fn synthetic(value: &str) -> Result<Self, ProviderError> {
        let suffix = value.strip_prefix("REPORT-").unwrap_or_default();
        if suffix.len() != 2 || !suffix.bytes().all(|b| b.is_ascii_digit()) {
            return Err(ProviderError::Malformed(
                "Invalid synthetic report ID.".into(),
            ));
        }
        Ok(Self(value.into()))
    }
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ReportSummary {
    pub patient_id: PatientId,
    pub id: ReportId,
    pub date: String,
    pub description: String,
    pub report_type: String,
    pub specimen: String,
    pub location: String,
}
impl ReportSummary {
    fn matches_query(&self, query: &str) -> bool {
        format!(
            "{} {} {} {} {}",
            self.id.as_str(),
            self.description,
            self.report_type,
            self.specimen,
            self.location
        )
        .to_lowercase()
        .contains(&query.trim().to_lowercase())
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ResultsListRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub query: String,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ResultsList {
    pub patient_id: PatientId,
    pub rows: Vec<ReportSummary>,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ReportRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub report_id: ReportId,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ReportDetail {
    pub patient_id: PatientId,
    pub report_id: ReportId,
    pub text: String,
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum ResultsListStatus {
    #[default]
    Idle,
    Loading,
    Ready,
    Empty,
    Error(String),
}
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum ReportDetailState {
    #[default]
    Closed,
    Loading(ReportRequest),
    Ready(ReportDetail),
    Error(String),
}

#[derive(Clone, Debug, Default)]
pub struct ResultsWorkspace {
    pub patient_id: Option<PatientId>,
    pub query: String,

    pub rows: Vec<ReportSummary>,
    pub list_status: ResultsListStatus,
    pub selected: Option<ReportSummary>,
    pub detail: ReportDetailState,
    list_generation: u64,
    detail_generation: u64,
    pending_list: Option<ResultsListRequest>,
    pending_detail: Option<ReportRequest>,
}

impl ResultsWorkspace {
    pub fn clear(&mut self) {
        self.list_generation += 1;
        self.detail_generation += 1;
        self.patient_id = None;
        self.query.clear();

        self.rows.clear();
        self.list_status = ResultsListStatus::Idle;
        self.selected = None;
        self.detail = ReportDetailState::Closed;
        self.pending_list = None;
        self.pending_detail = None;
    }
    fn clear_detail(&mut self) {
        self.detail_generation += 1;
        self.detail = ReportDetailState::Closed;
        self.pending_detail = None;
    }
    pub fn selected_index(&self) -> Option<usize> {
        let selected = self.selected.as_ref()?;
        self.rows
            .iter()
            .position(|r| r.id == selected.id && r.patient_id == selected.patient_id)
    }
}

fn valid_report_date(value: &str) -> bool {
    value.is_ascii()
        && value.len() == 16
        && valid_date(&value[..10])
        && &value[10..11] == " "
        && &value[13..14] == ":"
        && value[11..13].parse::<u8>().is_ok_and(|v| v < 24)
        && value[14..].parse::<u8>().is_ok_and(|v| v < 60)
}

impl AppState {
    fn results_allowed(&self) -> bool {
        !self.selector_open
            && !self.detail.is_open()
            && self.tab == ChartTab::Results
            && self.active.is_some()
    }
    pub fn begin_results_list(&mut self, query: String) -> Option<ResultsListRequest> {
        if !self.results_allowed() {
            return None;
        }
        let patient_id = self.active.as_ref()?.patient.id.clone();
        let n = &mut self.results;
        n.clear_detail();
        n.list_generation += 1;
        n.patient_id = Some(patient_id.clone());
        n.query = query.clone();

        n.selected = None;
        n.rows.clear();
        n.list_status = ResultsListStatus::Loading;
        let request = ResultsListRequest {
            generation: n.list_generation,
            patient_id,
            query,
        };
        n.pending_list = Some(request.clone());
        self.message = "Loading invented reports…".into();
        Some(request)
    }
    pub fn apply_results_list(
        &mut self,
        request: &ResultsListRequest,
        result: Result<ResultsList, ProviderError>,
    ) -> bool {
        if !self.results_allowed()
            || self.results.pending_list.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
        {
            return false;
        }
        self.results.pending_list = None;
        let mut ids = HashSet::new();
        let result = result.and_then(|list| {
            if list.patient_id != request.patient_id
                || !list.rows.iter().all(|row| {
                    row.patient_id == request.patient_id
                        && !row.description.trim().is_empty()
                        && valid_report_date(&row.date)
                        && row.report_type == "Invented interim-style text"
                        && !row.specimen.trim().is_empty()
                        && !row.location.trim().is_empty()
                        && row.matches_query(&request.query)
                        && ids.insert(row.id.clone())
                })
            {
                Err(ProviderError::Malformed(
                    "Mock report-list identity or metadata mismatch. No results displayed.".into(),
                ))
            } else {
                Ok(list)
            }
        });
        match result {
            Ok(mut list) => {
                list.rows.sort_by(|a, b| {
                    b.date
                        .cmp(&a.date)
                        .then_with(|| a.id.as_str().cmp(b.id.as_str()))
                });
                self.results.rows = list.rows;
                self.results.list_status = if self.results.rows.is_empty() {
                    ResultsListStatus::Empty
                } else {
                    ResultsListStatus::Ready
                };
                self.message = if self.results.rows.is_empty() {
                    "No invented reports match this view."
                } else {
                    "Select an invented report, then open its read-only detail."
                }
                .into();
            }
            Err(error) => {
                self.message = error.to_string();
                self.results.list_status = ResultsListStatus::Error(self.message.clone());
            }
        }
        true
    }
    pub fn select_report(&mut self, index: usize) -> bool {
        if !self.results_allowed() || self.results.list_status != ResultsListStatus::Ready {
            return false;
        }
        let selected = self.results.rows.get(index).cloned();
        if self.results.selected == selected {
            return false;
        }
        self.results.clear_detail();
        self.results.selected = selected;
        self.message =
            "Choose View report detail or press Enter to read the selected invented report.".into();
        true
    }
    pub fn begin_report_detail(&mut self) -> Option<ReportRequest> {
        if !self.results_allowed() || self.results.list_status != ResultsListStatus::Ready {
            return None;
        }
        let selected = self.results.selected.clone()?;
        if !self
            .active
            .as_ref()
            .is_some_and(|c| c.patient.id == selected.patient_id)
        {
            return None;
        }
        if matches!(
            self.results.detail,
            ReportDetailState::Loading(_) | ReportDetailState::Ready(_)
        ) {
            return None;
        }
        self.results.clear_detail();
        let request = ReportRequest {
            generation: self.results.detail_generation,
            patient_id: selected.patient_id,
            report_id: selected.id,
        };
        self.results.pending_detail = Some(request.clone());
        self.results.detail = ReportDetailState::Loading(request.clone());
        self.message = "Retrieving selected synthetic report detail…".into();
        Some(request)
    }
    pub fn retry_report(&mut self) -> Option<ReportRequest> {
        if !matches!(self.results.detail, ReportDetailState::Error(_)) {
            return None;
        }
        self.begin_report_detail()
    }
    pub fn close_report_detail(&mut self) {
        let was_open = !matches!(self.results.detail, ReportDetailState::Closed);
        self.results.clear_detail();
        if was_open {
            self.message = "Synthetic report detail closed. Selection retained.".into();
        }
    }
    pub fn apply_report(
        &mut self,
        request: &ReportRequest,
        result: Result<ReportDetail, ProviderError>,
    ) -> bool {
        if !self.results_allowed()
            || self.results.pending_detail.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
            || !self
                .results
                .selected
                .as_ref()
                .is_some_and(|s| s.patient_id == request.patient_id && s.id == request.report_id)
        {
            return false;
        }
        self.results.pending_detail = None;
        self.results.detail = match result {
            Ok(detail)
                if detail.patient_id == request.patient_id
                    && detail.report_id == request.report_id =>
            {
                self.message = if detail.text.is_empty() {
                    "The selected invented report has an empty detail."
                } else {
                    "Synthetic report loaded. Read-only."
                }
                .into();
                ReportDetailState::Ready(detail)
            }
            Ok(_) => {
                self.message = "Report identity mismatch. No document text displayed.".into();
                ReportDetailState::Error(self.message.clone())
            }
            Err(error) => {
                self.message = error.to_string();
                ReportDetailState::Error(self.message.clone())
            }
        };
        true
    }
}

pub(crate) fn mock_results(patient: &PatientSummary, request: &ResultsListRequest) -> ResultsList {
    let descriptions = [
        "Interim-style training report Alpha",
        "Interim-style training report Alpha",
        "Unicode interim-style training report — ZÁRATE, ZOË 李",
        "Empty detail demonstration",
    ];
    let dates = [
        "2026-10-30 09:00",
        "2026-10-29 14:30",
        "2026-10-28 10:15",
        "2026-10-27 08:00",
    ];
    let rows = if patient.id.as_str() == "SYNTH-002" {
        vec![]
    } else {
        (0..4)
            .map(|i| ReportSummary {
                patient_id: patient.id.clone(),
                id: ReportId::synthetic(&format!("REPORT-{:02}", i + 1))
                    .expect("compiled mock report ID"),
                date: dates[i].into(),
                description: descriptions[i].into(),
                report_type: "Invented interim-style text".into(),
                specimen: format!("Training specimen {}", ['A', 'B', 'C', 'D'][i]),
                location: patient.location.clone(),
            })
            .filter(|r| r.matches_query(&request.query))
            .collect()
    };
    ResultsList {
        patient_id: patient.id.clone(),
        rows,
    }
}

pub(crate) fn mock_report_detail(
    patient: &PatientSummary,
    request: &ReportRequest,
) -> Result<ReportDetail, ProviderError> {
    let list = mock_results(
        patient,
        &ResultsListRequest {
            generation: 0,
            patient_id: patient.id.clone(),
            query: String::new(),
        },
    );
    let row = list
        .rows
        .iter()
        .find(|r| r.id == request.report_id)
        .ok_or(ProviderError::NotFound)?;
    let mut text = if row.id.as_str() == "REPORT-04" {
        String::new()
    } else {
        format!(
            "MOCK ONLY — INVENTED REPORT DETAIL\n\nPatient: {}\nSynthetic ID: {}\nReport ID: {}\nReport type: {}\nReport: {}\nDate: {}\nSpecimen: {}\nLocation: {}\n\nThis is invented training content. It has no clinical interpretation or real laboratory values.
Training observation: DEMO-ALPHA (invented text token).\n",
            patient.name,
            patient.id,
            row.id.as_str(),
            row.report_type,
            row.description,
            row.date,
            row.specimen,
            row.location
        )
    };
    if row.id.as_str() == "REPORT-03" {
        for section in 1..=80 {
            text.push_str(&format!("\nTraining section {section:02} — ZÁRATE, ZOË 李\nPatient {} / {}. This synthetic paragraph exercises scrolling, selection, and Unicode rendering. Every detail is invented.\n",patient.id,row.id.as_str()));
        }
        text.push_str("\nEND OF INVENTED REPORT DETAIL\n");
    }
    Ok(ReportDetail {
        patient_id: patient.id.clone(),
        report_id: row.id.clone(),
        text,
    })
}
