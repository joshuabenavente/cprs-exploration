//! Two synthetic panels shaped by recovered Cover Sheet controls, never RPC data.
use crate::{PatientId, PatientSummary, ProviderError};
use std::collections::HashSet;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PanelKind {
    ProblemList,
    Allergies,
}

impl PanelKind {
    pub fn title(self) -> &'static str {
        match self {
            Self::ProblemList => "Problem List",
            Self::Allergies => "Allergies",
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CoverItem {
    pub patient_id: PatientId,
    pub id: String,
    pub label: String,
    pub severity: String,
    pub symptoms: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CoverSheet {
    pub patient_id: PatientId,
    pub problems: Vec<CoverItem>,
    pub allergies: Vec<CoverItem>,
}

impl CoverSheet {
    pub fn items(&self, panel: PanelKind) -> &[CoverItem] {
        match panel {
            PanelKind::ProblemList => &self.problems,
            PanelKind::Allergies => &self.allergies,
        }
    }

    pub fn matches_patient(&self, patient: &PatientId) -> bool {
        &self.patient_id == patient
            && [PanelKind::ProblemList, PanelKind::Allergies]
                .into_iter()
                .all(|kind| {
                    let mut ids = HashSet::new();
                    self.items(kind).iter().all(|item| {
                        &item.patient_id == patient
                            && !item.id.is_empty()
                            && !item.label.is_empty()
                            && ids.insert(&item.id)
                    })
                })
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DetailRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub panel: PanelKind,
    pub item_id: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DetailSnapshot {
    pub patient_id: PatientId,
    pub panel: PanelKind,
    pub item_id: String,
    pub title: String,
    pub body: String,
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum DetailState {
    #[default]
    Closed,
    Loading(DetailRequest),
    Ready {
        request: DetailRequest,
        snapshot: DetailSnapshot,
    },
    Error {
        request: DetailRequest,
        message: String,
    },
}

impl DetailState {
    pub fn request(&self) -> Option<&DetailRequest> {
        match self {
            Self::Closed => None,
            Self::Loading(r) | Self::Ready { request: r, .. } | Self::Error { request: r, .. } => {
                Some(r)
            }
        }
    }
    pub fn is_open(&self) -> bool {
        !matches!(self, Self::Closed)
    }
}

pub(crate) fn mock_cover_sheet(patient: &PatientSummary) -> CoverSheet {
    let suffix = patient.id.as_str();
    let item = |id: &str, label: String, severity: &str, symptoms: &str| CoverItem {
        patient_id: patient.id.clone(),
        id: id.into(),
        label,
        severity: severity.into(),
        symptoms: symptoms.into(),
    };
    let problems = if suffix == "SYNTH-007" {
        vec![]
    } else {
        vec![
            item(
                "PROB-01",
                format!("Training problem Alpha · {suffix}"),
                "",
                "",
            ),
            item(
                "PROB-02",
                format!("Training problem Beta · {suffix}"),
                "",
                "",
            ),
        ]
    };
    let allergies = if suffix == "SYNTH-002" {
        vec![]
    } else {
        vec![
            item(
                "ALLERGY-01",
                format!("Training agent {}-A", &suffix[6..]),
                "Demo 1",
                "Invented symptom A",
            ),
            item(
                "ALLERGY-02",
                format!("Training agent {}-B", &suffix[6..]),
                "Demo 2",
                "Invented symptom B",
            ),
        ]
    };
    CoverSheet {
        patient_id: patient.id.clone(),
        problems,
        allergies,
    }
}

pub(crate) fn mock_detail(
    patient: &PatientSummary,
    request: &DetailRequest,
) -> Result<DetailSnapshot, ProviderError> {
    if patient.id != request.patient_id {
        return Err(ProviderError::NotFound);
    }
    let sheet = mock_cover_sheet(patient);
    let item = sheet
        .items(request.panel)
        .iter()
        .find(|i| i.id == request.item_id)
        .ok_or(ProviderError::NotFound)?;
    let title = format!("{} Item Detail: {}", request.panel.title(), item.label);
    let attributes = if request.panel == PanelKind::Allergies {
        format!(
            "\nSeverity: {}\nSigns/Symptoms: {}",
            item.severity, item.symptoms
        )
    } else {
        String::new()
    };
    let body = format!(
        "MOCK ONLY — INVENTED TRAINING RECORD\n\nPatient: {}\nSynthetic ID: {}\nPanel: {}\nItem ID: {}\n\n{}\n\nThis entry exists only to demonstrate selection, detail loading, and patient-switch clearing.\nIt does not describe a real condition or allergy. No clinical interpretation is available.",
        patient.name,
        patient.id,
        request.panel.title(),
        item.id,
        format_args!("{}{attributes}", item.label)
    );
    Ok(DetailSnapshot {
        patient_id: patient.id.clone(),
        panel: request.panel,
        item_id: item.id.clone(),
        title,
        body,
    })
}
