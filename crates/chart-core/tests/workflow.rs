use chart_core::*;

fn search(state: &mut AppState, provider: &MockProvider, query: &str) {
    let request = state.begin_search(query.into(), ListMode::All);
    assert!(state.apply_search(&request, provider.search(&request)));
}

fn open(state: &mut AppState, provider: &MockProvider, id: &str) {
    state.selector_open = true;
    search(state, provider, id);
    state.choose_row(0, provider);
    let request = state.confirm(provider, false).expect("allowed fixture");
    assert!(state.apply_chart(&request, provider.chart(&request.patient_id)));
}

fn active_id(state: &AppState) -> &str {
    state
        .active
        .as_ref()
        .expect("active mock chart")
        .patient
        .id
        .as_str()
}

#[test]
fn ps01_opening_selector_keeps_committed_chart_identity() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    open(&mut state, &provider, "SYNTH-001");
    let request = state.open_selection();
    assert_eq!(active_id(&state), "SYNTH-001");
    assert!(state.pending.is_none());
    state.apply_search(&request, provider.search(&request));
    state.choose_row(1, &provider);
    assert_eq!(active_id(&state), "SYNTH-001");
    assert_eq!(state.pending.as_ref().unwrap().id.as_str(), "SYNTH-003");
}

#[test]
fn ps02_duplicate_names_resolve_to_exact_id_and_demographics() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "MORGAN");
    let rows = &state.page.as_ref().unwrap().rows;
    assert_eq!(rows.len(), 2);
    assert_eq!(rows[0].name, rows[1].name);
    assert_ne!(rows[0].id, rows[1].id);
    state.choose_row(1, &provider);
    assert_eq!(state.pending.as_ref().unwrap().birth_date, "1986-09-23");
    let request = state.confirm(&provider, false).unwrap();
    state.apply_chart(&request, provider.chart(&request.patient_id));
    assert_eq!(active_id(&state), "SYNTH-004");
}

#[test]
fn ps03_editing_query_invalidates_selection_and_acknowledgment() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "PATEL");
    state.choose_row(0, &provider);
    assert!(state.confirm(&provider, false).is_none());
    assert!(state.confirmation.is_some());
    state.begin_search("CARTER".into(), ListMode::All);
    assert!(state.pending.is_none());
    assert!(state.confirmation.is_none());
    assert!(state.confirm(&provider, true).is_none());
    assert!(state.active.is_none());
}

#[test]
fn ps04_stale_search_and_duplicate_delivery_are_ignored() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    let old = state.begin_search("MORGAN".into(), ListMode::All);
    let current = state.begin_search("CARTER".into(), ListMode::All);
    assert!(state.apply_search(&current, provider.search(&current)));
    assert!(!state.apply_search(&old, provider.search(&old)));
    assert!(!state.apply_search(&current, provider.search(&current)));
    assert_eq!(state.page.unwrap().rows[0].id.as_str(), "SYNTH-001");
}

#[test]
fn ps05_successful_zero_rows_is_empty() {
    let mut state = AppState::default();
    search(&mut state, &MockProvider::default(), "NO SUCH FIXTURE");
    assert_eq!(state.search_status, SearchStatus::Empty);
    assert!(state.page.as_ref().unwrap().rows.is_empty());
}

#[test]
fn ps06_unavailable_provider_is_not_an_empty_result() {
    let mut state = AppState::default();
    search(
        &mut state,
        &MockProvider {
            simulation: Simulation::SearchUnavailable,
        },
        "",
    );
    assert!(matches!(
        state.search_status,
        SearchStatus::Error(ProviderError::Unavailable(_))
    ));
    assert!(state.page.is_none());
}

#[test]
fn ps07_malformed_fixture_rows_fail_closed() {
    let mut state = AppState::default();
    search(
        &mut state,
        &MockProvider {
            simulation: Simulation::MalformedResult,
        },
        "",
    );
    assert!(matches!(
        state.search_status,
        SearchStatus::Error(ProviderError::Malformed(_))
    ));
    assert!(state.pending.is_none());
    assert!(state.active.is_none());
}

#[test]
fn ps08_paging_carries_explicit_scoped_cursor_and_direction() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "");
    let original = state.page.as_ref().unwrap().rows.clone();
    let next = state.page_request(Direction::Forward).unwrap();
    assert_eq!(next.direction, Direction::Forward);
    assert_eq!(next.cursor.as_ref().unwrap().offset, 4);
    state.apply_search(&next, provider.search(&next));
    assert_eq!(
        state.page.as_ref().unwrap().rows[0].id.as_str(),
        "SYNTH-005"
    );
    let previous = state.page_request(Direction::Backward).unwrap();
    assert_eq!(previous.direction, Direction::Backward);
    assert_eq!(previous.cursor.as_ref().unwrap().offset, 0);
    state.apply_search(&previous, provider.search(&previous));
    assert_eq!(state.page.unwrap().rows, original);
    let mut wrong_query = next;
    wrong_query.query = "CARTER".into();
    assert!(matches!(
        provider.search(&wrong_query),
        Err(ProviderError::Malformed(_))
    ));
}

#[test]
fn demo_roster_is_a_fixture_filter_and_does_not_override_access() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    let request = state.begin_search(String::new(), ListMode::DemoRoster);
    state.apply_search(&request, provider.search(&request));
    assert_eq!(state.page.as_ref().unwrap().total, 4);
    state.choose_row(3, &provider);
    assert_eq!(state.pending.as_ref().unwrap().id.as_str(), "SYNTH-006");
    assert!(state.confirm(&provider, false).is_none());
}

#[test]
fn ps09_cancel_rejects_pending_chart_and_preserves_previous_chart() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    open(&mut state, &provider, "SYNTH-001");
    state.open_selection();
    search(&mut state, &provider, "SYNTH-002");
    state.choose_row(0, &provider);
    let request = state.confirm(&provider, false).unwrap();
    state.cancel_selection();
    assert!(!state.apply_chart(&request, provider.chart(&request.patient_id)));
    assert_eq!(active_id(&state), "SYNTH-001");
    assert!(!state.selector_open);
}

#[test]
fn cancel_and_reopen_rejects_old_search_generation() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    let old = state.open_selection();
    state.cancel_selection();
    let current = state.open_selection();
    assert!(!state.apply_search(&old, provider.search(&old)));
    assert!(state.apply_search(&current, provider.search(&current)));
}

#[test]
fn ps10_no_valid_selected_identifier_cannot_open_a_chart() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "");
    state.choose_row(0, &provider);
    assert!(state.pending.is_some());
    state.choose_row(usize::MAX, &provider);
    assert!(state.confirm(&provider, false).is_none());
    assert!(state.active.is_none());
    assert!(state.selector_open);
    assert!(PatientId::synthetic("real-dfn").is_err());
}

#[test]
fn ps11_denied_and_unavailable_access_preserve_active_chart() {
    let provider = MockProvider::default();
    for id in ["SYNTH-006", "SYNTH-007"] {
        let mut state = AppState::default();
        open(&mut state, &provider, "SYNTH-001");
        state.open_selection();
        search(&mut state, &provider, id);
        state.choose_row(0, &provider);
        assert!(state.confirm(&provider, false).is_none());
        assert_eq!(active_id(&state), "SYNTH-001");
        assert!(state.confirmation.is_none());
    }
}

#[test]
fn ps12_access_and_deceased_flags_require_explicit_acknowledgment() {
    let provider = MockProvider::default();
    for id in ["SYNTH-005", "SYNTH-008"] {
        let mut state = AppState::default();
        search(&mut state, &provider, id);
        state.choose_row(0, &provider);
        assert!(
            state.confirm(&provider, true).is_none(),
            "No bypass before prompt"
        );
        assert!(state.confirm(&provider, false).is_none());
        assert!(state.confirmation.is_some());
        state.decline_confirmation();
        assert!(state.active.is_none());
        assert!(state.confirm(&provider, false).is_none());
        let request = state.confirm(&provider, true).unwrap();
        state.apply_chart(&request, provider.chart(&request.patient_id));
        assert_eq!(active_id(&state), id);
    }
}

#[test]
fn queued_row_selection_cannot_dismiss_an_access_prompt() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "PATEL");
    state.choose_row(0, &provider);
    state.confirm(&provider, false);
    state.choose_row(0, &provider);
    assert!(state.confirmation.is_some());
    assert!(state.active.is_none());
}

#[test]
fn ps14_late_old_patient_data_cannot_replace_new_chart() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    search(&mut state, &provider, "SYNTH-001");
    state.choose_row(0, &provider);
    let old = state.confirm(&provider, false).unwrap();
    search(&mut state, &provider, "SYNTH-002");
    state.choose_row(0, &provider);
    let current = state.confirm(&provider, false).unwrap();
    state.apply_chart(&current, provider.chart(&current.patient_id));
    assert!(!state.apply_chart(&old, provider.chart(&old.patient_id)));
    assert_eq!(active_id(&state), "SYNTH-002");
}

#[test]
fn mismatched_chart_identity_is_rejected_atomically() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    open(&mut state, &provider, "SYNTH-001");
    state.open_selection();
    search(&mut state, &provider, "SYNTH-002");
    state.choose_row(0, &provider);
    let request = state.confirm(&provider, false).unwrap();
    let wrong_id = PatientId::synthetic("SYNTH-004").unwrap();
    state.apply_chart(&request, provider.chart(&wrong_id));
    assert_eq!(active_id(&state), "SYNTH-001");
    assert!(state.selector_open);
    assert!(state.message.contains("mismatch"));
}

#[test]
fn failed_chart_load_preserves_previous_header_and_view() {
    let mut provider = MockProvider::default();
    let mut state = AppState::default();
    open(&mut state, &provider, "SYNTH-001");
    state.open_selection();
    search(&mut state, &provider, "SYNTH-002");
    state.choose_row(0, &provider);
    provider.simulation = Simulation::ChartUnavailable;
    let request = state.confirm(&provider, false).unwrap();
    assert!(state.is_chart_loading());
    assert_eq!(active_id(&state), "SYNTH-001");
    state.apply_chart(&request, provider.chart(&request.patient_id));
    assert!(!state.is_chart_loading());
    assert_eq!(active_id(&state), "SYNTH-001");
}

#[test]
fn ps16_unimplemented_tabs_are_explicit_placeholders() {
    let provider = MockProvider::default();
    let mut state = AppState::default();
    state.set_tab(ChartTab::Orders);
    assert_eq!(state.tab, ChartTab::Overview);
    open(&mut state, &provider, "SYNTH-001");
    for tab in [ChartTab::Notes, ChartTab::Orders, ChartTab::Results] {
        state.set_tab(tab);
        assert!(state.tab.placeholder().contains("not implemented"));
        assert_eq!(active_id(&state), "SYNTH-001");
    }
}
