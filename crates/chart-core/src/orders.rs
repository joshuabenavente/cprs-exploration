//! Invented order records and patient-scoped read-only browsing. No broker wire types.
use crate::{AppState, CalendarDay, ChartTab, PatientId, PatientSummary, ProviderError};
use std::collections::HashSet;

/// Authored demo statuses, not VistA status codes or clinical state semantics.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum OrderStatus {
    Active,
    Pending,
    Complete,
}
impl OrderStatus {
    pub fn label(self) -> &'static str {
        match self {
            Self::Active => "Mock active",
            Self::Pending => "Mock pending",
            Self::Complete => "Mock complete",
        }
    }
}
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum OrderStatusFilter {
    #[default]
    All,
    Active,
    Pending,
    Complete,
}
impl OrderStatusFilter {
    pub fn matches(self, status: OrderStatus) -> bool {
        match self {
            Self::All => true,
            Self::Active => status == OrderStatus::Active,
            Self::Pending => status == OrderStatus::Pending,
            Self::Complete => status == OrderStatus::Complete,
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct OrderId(String);
impl OrderId {
    pub fn synthetic(value: &str) -> Result<Self, ProviderError> {
        let suffix = value.strip_prefix("ORDER-").unwrap_or_default();
        if suffix.len() != 2 || !suffix.bytes().all(|b| b.is_ascii_digit()) {
            return Err(ProviderError::Malformed(
                "Invalid synthetic order ID.".into(),
            ));
        }
        Ok(Self(value.into()))
    }
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct OrderSummary {
    pub patient_id: PatientId,
    pub id: OrderId,
    pub date: String,
    pub description: String,
    pub service: String,
    pub provider: String,
    pub location: String,
    pub status: OrderStatus,
    pub start_stop: String,
}
impl OrderSummary {
    fn matches_query(&self, query: &str) -> bool {
        format!(
            "{} {} {} {} {} {}",
            self.id.as_str(),
            self.description,
            self.service,
            self.provider,
            self.status.label(),
            self.location
        )
        .to_lowercase()
        .contains(&query.trim().to_lowercase())
    }
}

/// Authored inclusive calendar bounds, independent of FileMan/timezones.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct OrdersFilter {
    pub query: String,
    pub status: OrderStatusFilter,
    pub beginning: Option<CalendarDay>,
    pub ending: Option<CalendarDay>,
}
impl OrdersFilter {
    pub fn validate(&self) -> Result<(), ProviderError> {
        if self
            .beginning
            .as_ref()
            .zip(self.ending.as_ref())
            .is_some_and(|(a, b)| a > b)
        {
            return Err(ProviderError::Malformed(
                "Beginning Orders date must be on or before ending date.".into(),
            ));
        }
        Ok(())
    }
    pub fn matches(&self, row: &OrderSummary) -> bool {
        let Some(day) = row.date.get(..10) else {
            return false;
        };
        self.beginning.as_ref().is_none_or(|d| day >= d.as_str())
            && self.ending.as_ref().is_none_or(|d| day <= d.as_str())
            && self.status.matches(row.status)
            && row.matches_query(&self.query)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct OrdersListRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub query: String,
    pub status_filter: OrderStatusFilter,
    pub filter: OrdersFilter,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct OrdersList {
    pub patient_id: PatientId,
    pub rows: Vec<OrderSummary>,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct OrderRequest {
    pub generation: u64,
    pub patient_id: PatientId,
    pub order_id: OrderId,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct OrderDetail {
    pub patient_id: PatientId,
    pub order_id: OrderId,
    pub text: String,
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum OrdersListStatus {
    #[default]
    Idle,
    Loading,
    Ready,
    Empty,
    Error(String),
    Invalid(String),
}
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub enum OrderDetailState {
    #[default]
    Closed,
    Loading(OrderRequest),
    Ready(OrderDetail),
    Error(String),
}

#[derive(Clone, Debug, Default)]
pub struct OrdersWorkspace {
    pub patient_id: Option<PatientId>,
    pub query: String,
    pub status_filter: OrderStatusFilter,
    pub beginning_input: String,
    pub ending_input: String,
    pub rows: Vec<OrderSummary>,
    pub list_status: OrdersListStatus,
    pub selected: Option<OrderSummary>,
    pub detail: OrderDetailState,
    list_generation: u64,
    detail_generation: u64,
    pending_list: Option<OrdersListRequest>,
    pending_detail: Option<OrderRequest>,
}

impl OrdersWorkspace {
    pub fn clear(&mut self) {
        self.list_generation += 1;
        self.detail_generation += 1;
        self.patient_id = None;
        self.query.clear();
        self.beginning_input.clear();
        self.ending_input.clear();
        self.status_filter = OrderStatusFilter::All;
        self.rows.clear();
        self.list_status = OrdersListStatus::Idle;
        self.selected = None;
        self.detail = OrderDetailState::Closed;
        self.pending_list = None;
        self.pending_detail = None;
    }
    fn clear_detail(&mut self) {
        self.detail_generation += 1;
        self.detail = OrderDetailState::Closed;
        self.pending_detail = None;
    }
    pub fn selected_index(&self) -> Option<usize> {
        let selected = self.selected.as_ref()?;
        self.rows
            .iter()
            .position(|r| r.id == selected.id && r.patient_id == selected.patient_id)
    }
}

fn valid_order_date(value: &str) -> bool {
    value.is_ascii()
        && value.len() == 16
        && CalendarDay::parse(&value[..10]).is_ok()
        && &value[10..11] == " "
        && &value[13..14] == ":"
        && value[11..13].bytes().all(|b| b.is_ascii_digit())
        && value[14..].bytes().all(|b| b.is_ascii_digit())
        && value[11..13].parse::<u8>().is_ok_and(|v| v < 24)
        && value[14..].parse::<u8>().is_ok_and(|v| v < 60)
}

impl AppState {
    fn orders_allowed(&self) -> bool {
        !self.selector_open
            && !self.detail.is_open()
            && self.tab == ChartTab::Orders
            && self.active.is_some()
    }
    pub fn begin_orders_list(
        &mut self,
        query: String,
        status_filter: OrderStatusFilter,
    ) -> Option<OrdersListRequest> {
        self.begin_orders_filter(
            query,
            status_filter,
            self.orders.beginning_input.clone(),
            self.orders.ending_input.clone(),
        )
    }
    pub fn reset_orders_filters(&mut self) -> Option<OrdersListRequest> {
        self.begin_orders_filter(
            String::new(),
            OrderStatusFilter::All,
            String::new(),
            String::new(),
        )
    }
    pub fn begin_orders_filter(
        &mut self,
        query: String,
        status_filter: OrderStatusFilter,
        beginning_input: String,
        ending_input: String,
    ) -> Option<OrdersListRequest> {
        if !self.orders_allowed() {
            return None;
        }
        let patient_id = self.active.as_ref()?.patient.id.clone();
        let n = &mut self.orders;
        n.clear_detail();
        n.list_generation += 1;
        n.patient_id = Some(patient_id.clone());
        n.query = query.clone();
        n.status_filter = status_filter;
        n.beginning_input = beginning_input.clone();
        n.ending_input = ending_input.clone();
        n.selected = None;
        n.rows.clear();
        n.pending_list = None;
        let parse_bound = |value: &str| {
            if value.is_empty() {
                Ok(None)
            } else {
                CalendarDay::parse(value).map(Some)
            }
        };
        let filter = parse_bound(&beginning_input)
            .and_then(|beginning| {
                parse_bound(&ending_input).map(|ending| OrdersFilter {
                    query: query.clone(),
                    status: status_filter,
                    beginning,
                    ending,
                })
            })
            .and_then(|filter| {
                filter.validate()?;
                Ok(filter)
            });
        let filter = match filter {
            Ok(filter) => filter,
            Err(error) => {
                self.message = format!("Invalid Orders filter for {patient_id}: {error}");
                n.list_status = OrdersListStatus::Invalid(self.message.clone());
                return None;
            }
        };
        n.list_status = OrdersListStatus::Loading;
        let request = OrdersListRequest {
            generation: n.list_generation,
            patient_id,
            query,
            status_filter,
            filter,
        };
        n.pending_list = Some(request.clone());
        self.message = "Loading invented orders…".into();
        Some(request)
    }
    pub fn apply_orders_list(
        &mut self,
        request: &OrdersListRequest,
        result: Result<OrdersList, ProviderError>,
    ) -> bool {
        if !self.orders_allowed()
            || self.orders.pending_list.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
        {
            return false;
        }
        self.orders.pending_list = None;
        let mut ids = HashSet::new();
        let result = result.and_then(|list| {
            if list.patient_id != request.patient_id
                || !list.rows.iter().all(|row| {
                    row.patient_id == request.patient_id
                        && !row.description.trim().is_empty()
                        && valid_order_date(&row.date)
                        && !row.service.trim().is_empty()
                        && !row.provider.trim().is_empty()
                        && !row.location.trim().is_empty()
                        && !row.start_stop.trim().is_empty()
                        && request.filter.matches(row)
                        && ids.insert(row.id.clone())
                })
            {
                Err(ProviderError::Malformed(
                    "Mock order-list identity or metadata mismatch. No orders displayed.".into(),
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
                self.orders.rows = list.rows;
                self.orders.list_status = if self.orders.rows.is_empty() {
                    OrdersListStatus::Empty
                } else {
                    OrdersListStatus::Ready
                };
                self.message = if self.orders.rows.is_empty() {
                    "No invented orders match this view."
                } else {
                    "Select an invented order, then open its read-only detail."
                }
                .into();
            }
            Err(error) => {
                self.message = error.to_string();
                self.orders.list_status = OrdersListStatus::Error(self.message.clone());
            }
        }
        true
    }
    pub fn select_order(&mut self, index: usize) -> bool {
        if !self.orders_allowed() || self.orders.list_status != OrdersListStatus::Ready {
            return false;
        }
        let selected = self.orders.rows.get(index).cloned();
        if self.orders.selected == selected {
            return false;
        }
        self.orders.clear_detail();
        self.orders.selected = selected;
        self.message =
            "Choose View order detail or press Enter to read the selected invented order.".into();
        true
    }
    pub fn begin_order_detail(&mut self) -> Option<OrderRequest> {
        if !self.orders_allowed() || self.orders.list_status != OrdersListStatus::Ready {
            return None;
        }
        let selected = self.orders.selected.clone()?;
        if !self
            .active
            .as_ref()
            .is_some_and(|c| c.patient.id == selected.patient_id)
        {
            return None;
        }
        if matches!(
            self.orders.detail,
            OrderDetailState::Loading(_) | OrderDetailState::Ready(_)
        ) {
            return None;
        }
        self.orders.clear_detail();
        let request = OrderRequest {
            generation: self.orders.detail_generation,
            patient_id: selected.patient_id,
            order_id: selected.id,
        };
        self.orders.pending_detail = Some(request.clone());
        self.orders.detail = OrderDetailState::Loading(request.clone());
        self.message = "Retrieving selected synthetic order detail…".into();
        Some(request)
    }
    pub fn retry_order(&mut self) -> Option<OrderRequest> {
        if !matches!(self.orders.detail, OrderDetailState::Error(_)) {
            return None;
        }
        self.begin_order_detail()
    }
    pub fn close_order_detail(&mut self) {
        let was_open = !matches!(self.orders.detail, OrderDetailState::Closed);
        self.orders.clear_detail();
        if was_open {
            self.message = "Synthetic order detail closed. Selection retained.".into();
        }
    }
    pub fn apply_order(
        &mut self,
        request: &OrderRequest,
        result: Result<OrderDetail, ProviderError>,
    ) -> bool {
        if !self.orders_allowed()
            || self.orders.pending_detail.as_ref() != Some(request)
            || !self
                .active
                .as_ref()
                .is_some_and(|c| c.patient.id == request.patient_id)
            || !self
                .orders
                .selected
                .as_ref()
                .is_some_and(|s| s.patient_id == request.patient_id && s.id == request.order_id)
        {
            return false;
        }
        self.orders.pending_detail = None;
        self.orders.detail = match result {
            Ok(detail)
                if detail.patient_id == request.patient_id
                    && detail.order_id == request.order_id =>
            {
                self.message = if detail.text.is_empty() {
                    "The selected invented order has an empty detail."
                } else {
                    "Synthetic order loaded. Read-only."
                }
                .into();
                OrderDetailState::Ready(detail)
            }
            Ok(_) => {
                self.message = "Order identity mismatch. No document text displayed.".into();
                OrderDetailState::Error(self.message.clone())
            }
            Err(error) => {
                self.message = error.to_string();
                OrderDetailState::Error(self.message.clone())
            }
        };
        true
    }
}

pub(crate) fn mock_orders(patient: &PatientSummary, request: &OrdersListRequest) -> OrdersList {
    let descriptions = [
        "Training request Alpha",
        "Training request Alpha",
        "Unicode training request — ZÁRATE, ZOË 李",
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
            .map(|i| OrderSummary {
                patient_id: patient.id.clone(),
                id: OrderId::synthetic(&format!("ORDER-{:02}", i + 1))
                    .expect("compiled mock order ID"),
                date: dates[i].into(),
                description: descriptions[i].into(),
                service: format!("Training service {}", ['A', 'B', 'C', 'D'][i]),
                provider: format!("Demo provider {}", ['A', 'B', 'C', 'D'][i]),
                location: patient.location.clone(),
                status: [
                    OrderStatus::Active,
                    OrderStatus::Pending,
                    OrderStatus::Active,
                    OrderStatus::Complete,
                ][i],
                start_stop: format!(
                    "{} / {}",
                    dates[i],
                    if i == 3 {
                        "2026-10-27 10:00"
                    } else {
                        "Not set (mock)"
                    }
                ),
            })
            .filter(|r| request.filter.matches(r))
            .collect()
    };
    OrdersList {
        patient_id: patient.id.clone(),
        rows,
    }
}

pub(crate) fn mock_order_detail(
    patient: &PatientSummary,
    request: &OrderRequest,
) -> Result<OrderDetail, ProviderError> {
    let list = mock_orders(
        patient,
        &OrdersListRequest {
            generation: 0,
            patient_id: patient.id.clone(),
            query: String::new(),
            status_filter: OrderStatusFilter::All,
            filter: OrdersFilter::default(),
        },
    );
    let row = list
        .rows
        .iter()
        .find(|r| r.id == request.order_id)
        .ok_or(ProviderError::NotFound)?;
    let mut text = if row.id.as_str() == "ORDER-04" {
        String::new()
    } else {
        format!(
            "MOCK ONLY — INVENTED ORDER DETAIL\n\nPatient: {}\nSynthetic ID: {}\nOrder ID: {}\nService: {}\nOrder: {}\nStart / Stop: {}\nProvider: {}\nStatus: {}\nLocation: {}\n\nThis is invented training content. It is not a clinical instruction or an order for any real person.\n",
            patient.name,
            patient.id,
            row.id.as_str(),
            row.service,
            row.description,
            row.start_stop,
            row.provider,
            row.status.label(),
            row.location
        )
    };
    if row.id.as_str() == "ORDER-03" {
        for section in 1..=80 {
            text.push_str(&format!("\nTraining section {section:02} — ZÁRATE, ZOË 李\nPatient {} / {}. This synthetic paragraph exercises scrolling, selection, and Unicode rendering. Every detail is invented.\n",patient.id,row.id.as_str()));
        }
        text.push_str("\nEND OF INVENTED ORDER DETAIL\n");
    }
    Ok(OrderDetail {
        patient_id: patient.id.clone(),
        order_id: row.id.clone(),
        text,
    })
}
