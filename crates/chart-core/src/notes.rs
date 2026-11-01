//! Invented note records and patient-scoped read-only browsing. No TIU wire types.
use crate::{AppState, ChartTab, PatientId, PatientSummary, ProviderError};
use std::collections::HashSet;

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct NoteAuthorId(String);
impl NoteAuthorId {
    pub fn synthetic(value: &str) -> Result<Self, ProviderError> {
        if !matches!(value, "AUTHOR-01" | "AUTHOR-02" | "AUTHOR-03" | "AUTHOR-04") {
            return Err(ProviderError::Malformed(
                "Unknown synthetic note author.".into(),
            ));
        }
        Ok(Self(value.into()))
    }
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NoteAuthor {
    pub id: NoteAuthorId,
    pub label: String,
}

/// Shared authored calendar-day parser; Notes date semantics are unchanged.
pub type NoteDate = crate::CalendarDay;

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct NotesFilter {
    pub query: String,
    pub author: Option<NoteAuthorId>,
    pub beginning: Option<NoteDate>,
    pub ending: Option<NoteDate>,
}
impl NotesFilter {
    pub fn matches(&self, row: &NoteSummary) -> bool {
        let Some(day) = row.date.get(..10) else {
            return false;
        };
        self.author.as_ref().is_none_or(|id| id == &row.author_id)
            && self.beginning.as_ref().is_none_or(|d| day >= d.as_str())
            && self.ending.as_ref().is_none_or(|d| day <= d.as_str())
            && format!(
                "{} {} {} {} {}",
                row.id.as_str(),
                row.title,
                row.subject,
                row.author,
                row.location
            )
            .to_lowercase()
            .contains(&self.query.trim().to_lowercase())
    }
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct NoteId(String);
impl NoteId {
    pub fn synthetic(value: &str) -> Result<Self, ProviderError> {
        let suffix = value.strip_prefix("NOTE-").unwrap_or_default();
        if suffix.len() != 2 || !suffix.bytes().all(|b| b.is_ascii_digit()) {
            return Err(ProviderError::Malformed(
                "Invalid synthetic note ID.".into(),
            ));
        }
        Ok(Self(value.into()))
    }
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NoteSummary {
    pub patient_id: PatientId,
    pub id: NoteId,
    pub date: String,
    pub title: String,
    pub subject: String,
    pub author: String,
    pub author_id: NoteAuthorId,
    pub location: String,
    pub status: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NotesListRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub query: String,
    pub filter: NotesFilter,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NotesList {
    pub patient_id: PatientId,
    pub rows: Vec<NoteSummary>,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NoteRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub note_id: NoteId,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NoteBody {
    pub patient_id: PatientId,
    pub note_id: NoteId,
    pub text: String,
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum NotesListStatus {
    #[default]
    Idle,
    Loading,
    Ready,
    Empty,
    Error(String),
    Invalid(String),
}
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum NoteBodyState {
    #[default]
    Unselected,
    Loading(NoteRequest),
    Ready(NoteBody),
    Error(String),
}

#[derive(Clone, Debug, Default)]
pub struct NotesWorkspace {
    pub patient_id: Option<PatientId>,
    pub query: String,
    pub author: Option<NoteAuthorId>,
    pub beginning_input: String,
    pub ending_input: String,
    pub rows: Vec<NoteSummary>,
    pub list_status: NotesListStatus,
    pub selected: Option<NoteSummary>,
    pub body: NoteBodyState,
    list_generation: u64,
    body_generation: u64,
    pending_list: Option<NotesListRequest>,
    pending_body: Option<NoteRequest>,
}

impl NotesWorkspace {
    pub fn clear(&mut self) {
        self.list_generation += 1;
        self.body_generation += 1;
        self.patient_id = None;
        self.query.clear();
        self.author = None;
        self.beginning_input.clear();
        self.ending_input.clear();
        self.rows.clear();
        self.list_status = NotesListStatus::Idle;
        self.selected = None;
        self.body = NoteBodyState::Unselected;
        self.pending_list = None;
        self.pending_body = None;
    }
    fn clear_body(&mut self) {
        self.body_generation += 1;
        self.selected = None;
        self.body = NoteBodyState::Unselected;
        self.pending_body = None;
    }
    pub fn selected_index(&self) -> Option<usize> {
        let selected = self.selected.as_ref()?;
        self.rows
            .iter()
            .position(|r| r.id == selected.id && r.patient_id == selected.patient_id)
    }
}

fn valid_note_date(value: &str) -> bool {
    value.is_ascii()
        && value.len() == 16
        && NoteDate::parse(&value[..10]).is_ok()
        && &value[10..11] == " "
        && &value[13..14] == ":"
        && value[11..13].bytes().all(|b| b.is_ascii_digit())
        && value[14..].bytes().all(|b| b.is_ascii_digit())
        && value[11..13].parse::<u8>().is_ok_and(|v| v < 24)
        && value[14..].parse::<u8>().is_ok_and(|v| v < 60)
}

impl AppState {
    fn notes_allowed(&self) -> bool {
        !self.selector_open
            && !self.detail.is_open()
            && self.tab == ChartTab::Notes
            && self.active.is_some()
    }
    pub fn note_authors(&self) -> Vec<NoteAuthor> {
        self.active
            .as_ref()
            .filter(|_| !self.selector_open)
            .map_or_else(Vec::new, |chart| mock_note_authors(&chart.patient))
    }
    pub fn begin_notes_list(&mut self, query: String) -> Option<NotesListRequest> {
        self.begin_notes_filter(
            query,
            self.notes.author.clone(),
            self.notes.beginning_input.clone(),
            self.notes.ending_input.clone(),
        )
    }
    pub fn reset_notes_filters(&mut self) -> Option<NotesListRequest> {
        self.begin_notes_filter(String::new(), None, String::new(), String::new())
    }
    pub fn begin_notes_filter(
        &mut self,
        query: String,
        author: Option<NoteAuthorId>,
        beginning_input: String,
        ending_input: String,
    ) -> Option<NotesListRequest> {
        if !self.notes_allowed() {
            return None;
        }
        let patient = self.active.as_ref()?.patient.clone();
        let n = &mut self.notes;
        n.clear_body();
        n.list_generation += 1;
        n.patient_id = Some(patient.id.clone());
        n.query = query.clone();
        n.author = author.clone();
        n.beginning_input = beginning_input.clone();
        n.ending_input = ending_input.clone();
        n.rows.clear();
        n.pending_list = None;
        let parse_bound = |value: &str| {
            if value.is_empty() {
                Ok(None)
            } else {
                NoteDate::parse(value).map(Some)
            }
        };
        let filter = parse_bound(&beginning_input)
            .and_then(|beginning| {
                parse_bound(&ending_input).map(|ending| NotesFilter {
                    query: query.clone(),
                    author,
                    beginning,
                    ending,
                })
            })
            .and_then(|filter| {
                validate_filter(&patient, &filter)?;
                Ok(filter)
            });
        let filter = match filter {
            Ok(filter) => filter,
            Err(error) => {
                self.message = format!("Invalid Notes filter for {}: {error}", patient.id);
                n.list_status = NotesListStatus::Invalid(self.message.clone());
                return None;
            }
        };
        n.list_status = NotesListStatus::Loading;
        let request = NotesListRequest {
            generation: n.list_generation,
            patient_id: patient.id,
            query,
            filter,
        };
        n.pending_list = Some(request.clone());
        self.message = "Loading invented notes…".into();
        Some(request)
    }
    pub fn apply_notes_list(
        &mut self,
        request: &NotesListRequest,
        result: Result<NotesList, ProviderError>,
    ) -> bool {
        if !self.notes_allowed()
            || self.notes.pending_list.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
        {
            return false;
        }
        self.notes.pending_list = None;
        let mut ids = HashSet::new();
        let result = result.and_then(|list| {
            if list.patient_id != request.patient_id
                || !list.rows.iter().all(|row| {
                    row.patient_id == request.patient_id
                        && !row.title.trim().is_empty()
                        && valid_note_date(&row.date)
                        && request.filter.matches(row)
                        && mock_note_authors(&self.active.as_ref().expect("owned chart").patient)
                            .iter()
                            .any(|a| a.id == row.author_id && a.label == row.author)
                        && ids.insert(row.id.clone())
                })
            {
                Err(ProviderError::Malformed(
                    "Mock note-list identity or metadata mismatch. No notes displayed.".into(),
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
                self.notes.rows = list.rows;
                self.notes.list_status = if self.notes.rows.is_empty() {
                    NotesListStatus::Empty
                } else {
                    NotesListStatus::Ready
                };
                self.message = if self.notes.rows.is_empty() {
                    "No invented notes match this view."
                } else {
                    "Select an invented note to read it. No editing or signing is available."
                }
                .into();
            }
            Err(error) => {
                self.message = error.to_string();
                self.notes.list_status = NotesListStatus::Error(self.message.clone());
            }
        }
        true
    }
    pub fn select_note(&mut self, index: usize) -> Option<NoteRequest> {
        if !self.notes_allowed() || self.notes.list_status != NotesListStatus::Ready {
            return None;
        }
        let selected = self.notes.rows.get(index).cloned();
        if selected.is_some()
            && self.notes.selected == selected
            && !matches!(self.notes.body, NoteBodyState::Error(_))
        {
            return None;
        }
        self.notes.clear_body();
        let selected = selected?;
        if !self
            .active
            .as_ref()
            .is_some_and(|c| c.patient.id == selected.patient_id)
        {
            return None;
        }
        let request = NoteRequest {
            generation: self.notes.body_generation,
            patient_id: selected.patient_id.clone(),
            note_id: selected.id.clone(),
        };
        self.notes.selected = Some(selected);
        self.notes.pending_body = Some(request.clone());
        self.notes.body = NoteBodyState::Loading(request.clone());
        self.message = "Retrieving selected synthetic note…".into();
        Some(request)
    }
    pub fn retry_note(&mut self) -> Option<NoteRequest> {
        if !matches!(self.notes.body, NoteBodyState::Error(_)) {
            return None;
        }
        let index = self.notes.selected_index()?;
        self.select_note(index)
    }
    pub fn apply_note(
        &mut self,
        request: &NoteRequest,
        result: Result<NoteBody, ProviderError>,
    ) -> bool {
        if !self.notes_allowed()
            || self.notes.pending_body.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
            || !self
                .notes
                .selected
                .as_ref()
                .is_some_and(|s| s.patient_id == request.patient_id && s.id == request.note_id)
        {
            return false;
        }
        self.notes.pending_body = None;
        self.notes.body = match result {
            Ok(body)
                if body.patient_id == request.patient_id && body.note_id == request.note_id =>
            {
                self.message = if body.text.is_empty() {
                    "The selected invented note has an empty body."
                } else {
                    "Synthetic note loaded. Read-only."
                }
                .into();
                NoteBodyState::Ready(body)
            }
            Ok(_) => {
                self.message = "Note identity mismatch. No document text displayed.".into();
                NoteBodyState::Error(self.message.clone())
            }
            Err(error) => {
                self.message = error.to_string();
                NoteBodyState::Error(self.message.clone())
            }
        };
        true
    }
}

pub fn mock_note_authors(patient: &PatientSummary) -> Vec<NoteAuthor> {
    if patient.id.as_str() == "SYNTH-002" {
        return vec![];
    }
    [
        "Demo clinician A",
        "Demo clinician A",
        "Demo clinician Zoë 李 — invented long author label",
        "Demo clinician D",
    ]
    .into_iter()
    .enumerate()
    .map(|(i, label)| NoteAuthor {
        id: NoteAuthorId::synthetic(&format!("AUTHOR-{:02}", i + 1)).expect("compiled author key"),
        label: label.into(),
    })
    .collect()
}

pub(crate) fn validate_filter(
    patient: &PatientSummary,
    filter: &NotesFilter,
) -> Result<(), ProviderError> {
    if filter
        .beginning
        .as_ref()
        .zip(filter.ending.as_ref())
        .is_some_and(|(a, b)| a > b)
    {
        return Err(ProviderError::Malformed(
            "Beginning date must be on or before ending date.".into(),
        ));
    }
    if filter
        .author
        .as_ref()
        .is_some_and(|id| !mock_note_authors(patient).iter().any(|a| &a.id == id))
    {
        return Err(ProviderError::Malformed(
            "Author is not in this patient's invented Notes.".into(),
        ));
    }
    Ok(())
}

pub(crate) fn mock_notes(patient: &PatientSummary, filter: &NotesFilter) -> NotesList {
    let titles = [
        "Training progress note",
        "Training progress note",
        "Unicode training record — ZÁRATE, ZOË 李",
        "Empty body demonstration",
    ];
    let dates = [
        "2026-10-30 09:00",
        "2026-10-29 14:30",
        "2026-10-28 10:15",
        "2026-10-27 08:00",
    ];
    let subjects = [
        "Invented review Alpha",
        "Invented follow-up Beta",
        "Long-text fixture",
        "Empty-text fixture",
    ];
    let authors = mock_note_authors(patient);
    let rows = if patient.id.as_str() == "SYNTH-002" {
        vec![]
    } else {
        (0..4)
            .map(|i| NoteSummary {
                patient_id: patient.id.clone(),
                id: NoteId::synthetic(&format!("NOTE-{:02}", i + 1))
                    .expect("compiled synthetic ID"),
                date: dates[i].into(),
                title: titles[i].into(),
                subject: subjects[i].into(),
                author: authors[i].label.clone(),
                author_id: authors[i].id.clone(),
                location: patient.location.clone(),
                status: ["Mock final", "Mock draft", "Mock addendum", "Mock final"][i].into(),
            })
            .filter(|r| filter.matches(r))
            .collect()
    };
    NotesList {
        patient_id: patient.id.clone(),
        rows,
    }
}

pub(crate) fn mock_note_body(
    patient: &PatientSummary,
    request: &NoteRequest,
) -> Result<NoteBody, ProviderError> {
    let list = mock_notes(patient, &NotesFilter::default());
    let row = list
        .rows
        .iter()
        .find(|r| r.id == request.note_id)
        .ok_or(ProviderError::NotFound)?;
    let mut text = if row.id.as_str() == "NOTE-04" {
        String::new()
    } else {
        format!(
            "MOCK ONLY — INVENTED NOTE\n\nPatient: {}\nSynthetic ID: {}\nNote ID: {}\nTitle: {}\nSubject: {}\nAuthor: {}\nDate: {}\nLocation: {}\nStatus: {}\n\nThis is invented training content. It describes no real encounter, diagnosis, treatment, or clinical finding.\n",
            patient.name,
            patient.id,
            row.id.as_str(),
            row.title,
            row.subject,
            row.author,
            row.date,
            row.location,
            row.status
        )
    };
    if row.id.as_str() == "NOTE-03" {
        for section in 1..=80 {
            text.push_str(&format!("\nTraining section {section:02} — ZÁRATE, ZOË 李\nPatient {} / {}. This paragraph is synthetic text for scrolling, Unicode, and selection checks. All details are invented.\n",patient.id,row.id.as_str()));
        }
        text.push_str("\nEND OF INVENTED LONG NOTE\n");
    }
    Ok(NoteBody {
        patient_id: patient.id.clone(),
        note_id: row.id.clone(),
        text,
    })
}
