//! Synthetic panels shaped by recovered Cover Sheet controls, never RPC data.
use crate::{PatientId, PatientSummary, ProviderError};
use std::collections::HashSet;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PanelKind {
    ProblemList,
    Allergies,
    Vitals,
    ActiveMedications,
    Appointments,
}

impl PanelKind {
    pub const ALL: [Self; 5] = [
        Self::ProblemList,
        Self::Allergies,
        Self::Vitals,
        Self::ActiveMedications,
        Self::Appointments,
    ];
    pub fn title(self) -> &'static str {
        match self {
            Self::ProblemList => "Problem List",
            Self::Allergies => "Allergies",
            Self::Vitals => "Vitals",
            Self::ActiveMedications => "Active Medications",
            Self::Appointments => "Appointments",
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
    pub vital: Option<VitalDisplay>,
    pub medication: Option<MedicationDisplay>,
    pub appointment: Option<AppointmentDisplay>,
}

/// Literal authored display strings, independent of visit context and scheduling.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct AppointmentDisplay {
    pub location: String,
    pub action_req: String,
}

/// Authored status text attached only to medication rows; independent of Orders.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct MedicationDisplay {
    pub status: String,
}

/// Authored display strings. Never parsed, converted, ranked or interpreted.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct VitalDisplay {
    pub value: String,
    pub taken: String,
    pub qualifiers: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct CoverSheet {
    pub patient_id: PatientId,
    pub problems: Vec<CoverItem>,
    pub allergies: Vec<CoverItem>,
    pub vitals: Vec<CoverItem>,
    pub medications: Vec<CoverItem>,
    pub appointments: Vec<CoverItem>,
}

impl CoverSheet {
    pub fn items(&self, panel: PanelKind) -> &[CoverItem] {
        match panel {
            PanelKind::ProblemList => &self.problems,
            PanelKind::Allergies => &self.allergies,
            PanelKind::Vitals => &self.vitals,
            PanelKind::ActiveMedications => &self.medications,
            PanelKind::Appointments => &self.appointments,
        }
    }

    pub fn matches_patient(&self, patient: &PatientId) -> bool {
        &self.patient_id == patient
            && PanelKind::ALL.into_iter().all(|kind| {
                let mut ids = HashSet::new();
                self.items(kind).iter().all(|item| {
                    &item.patient_id == patient
                        && !item.id.is_empty()
                        && !item.label.is_empty()
                        && (kind == PanelKind::Vitals) == item.vital.is_some()
                        && (kind == PanelKind::ActiveMedications) == item.medication.is_some()
                        && (kind == PanelKind::Appointments) == item.appointment.is_some()
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
        vital: None,
        medication: None,
        appointment: None,
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
    let vitals = if suffix == "SYNTH-002" {
        vec![]
    } else {
        [
            (
                "VITAL-01",
                "Temperature",
                "36.8 °C",
                "Oct 25, 2026@09:15",
                "Training oral",
            ),
            (
                "VITAL-02",
                "Pulse",
                "72 /min",
                "Oct 25, 2026@09:14",
                "Training seated",
            ),
            (
                "VITAL-03",
                "Blood pressure",
                "118/76 mmHg",
                "Oct 24, 2026@16:40",
                "Training left arm · Zoë 李",
            ),
        ]
        .into_iter()
        .map(|(id, label, value, taken, qualifiers)| {
            let mut row = item(id, label.into(), "", "");
            row.vital = Some(VitalDisplay {
                value: value.into(),
                taken: taken.into(),
                qualifiers: qualifiers.into(),
            });
            row
        })
        .collect()
    };
    let medications = if suffix == "SYNTH-002" {
        vec![]
    } else {
        [
            ("MED-01", "Training medication Alpha", "Demo active A"),
            ("MED-02", "Training medication Beta", "Demo active B"),
            ("MED-03", "Training medication Gamma — extended invented label for horizontal scrolling · Zoë 李", "Demo active C"),
        ].into_iter().map(|(id, label, status)| {
            let mut row = item(id, label.into(), "", "");
            row.medication = Some(MedicationDisplay { status: status.into() });
            row
        }).collect()
    };
    let appointments = if suffix == "SYNTH-002" {
        vec![]
    } else {
        [
            ("APPT-01", "Nov 02, 2026@09:00", "Training location Alpha", "Demo action A"),
            ("APPT-02", "Nov 03, 2026@14:30", "Training location Beta", "Demo action B"),
            ("APPT-03", "Nov 04, 2026@10:15", "Training location Gamma — extended invented label for horizontal scrolling · Zoë 李", "Demo action C"),
        ].into_iter().map(|(id, date_time, location, action_req)| {
            let mut row = item(id, date_time.into(), "", "");
            row.appointment = Some(AppointmentDisplay {
                location: location.into(), action_req: action_req.into(),
            });
            row
        }).collect()
    };
    CoverSheet {
        patient_id: patient.id.clone(),
        problems,
        allergies,
        vitals,
        medications,
        appointments,
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
    let attributes = if let Some(vital) = &item.vital {
        format!(
            "\nVital .......... {}\nDate/Time ...... {}\nValue .......... {}\nQualifiers ..... {}\n\nAuthored read-only display; conversion and original Vitals actions are omitted.",
            item.label, vital.taken, vital.value, vital.qualifiers
        )
    } else if let Some(medication) = &item.medication {
        format!(
            "\nMedication: {}\nStatus: {}\n\nAuthored read-only display. No medication instructions or dates are supplied by this fixture.",
            item.label, medication.status
        )
    } else if let Some(appointment) = &item.appointment {
        format!(
            "\nDate/Time: {}\nLocation: {}\nAction Req: {}\n\nAuthored read-only display. Action Req is invented text; no scheduling or encounter action is available.",
            item.label, appointment.location, appointment.action_req
        )
    } else if request.panel == PanelKind::Allergies {
        format!(
            "\nSeverity: {}\nSigns/Symptoms: {}",
            item.severity, item.symptoms
        )
    } else {
        String::new()
    };
    let body = format!(
        "MOCK ONLY — INVENTED TRAINING RECORD\n\nPatient: {}\nSynthetic ID: {}\nPanel: {}\nItem ID: {}\n\n{}\n\nThis entry exists only to demonstrate selection, detail loading, and patient-switch clearing.\nIt does not describe a real patient record. No clinical interpretation is available.",
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
