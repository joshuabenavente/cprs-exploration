use chart_core::*;

fn id(s: &str) -> OpaqueIdentity {
    OpaqueIdentity::new(s).unwrap()
}
fn binding() -> BootstrapBinding {
    BootstrapBinding {
        source: id("PRIVATE_SOURCE"),
        site: id("PRIVATE_SITE"),
        windows_user: id("PRIVATE_WINDOWS_USER"),
        windows_session: id("PRIVATE_WINDOWS_SESSION"),
        application_context: id("PRIVATE_CONTEXT"),
    }
}
fn session() -> SessionBinding {
    SessionBinding {
        bootstrap: binding(),
        vista_user: id("PRIVATE_VISTA_USER"),
        broker_session: id("PRIVATE_HANDLE"),
        expires_at: 500,
    }
}
fn allowed() -> GuardEvidence {
    GuardEvidence::Allowed {
        observed_at: 0,
        valid_until: 400,
        revision: 1,
    }
}
struct FakePort {
    available: bool,
    network: GuardEvidence,
    windows: GuardEvidence,
    binding: Option<BootstrapBinding>,
    stale_context: Option<GuardContext>,
    auth_result: Result<(), SessionError>,
    health: Result<SessionBinding, SessionError>,
    close_failure: bool,
    starts: usize,
    health_calls: usize,
    closes: usize,
}
impl Default for FakePort {
    fn default() -> Self {
        Self {
            available: true,
            network: allowed(),
            windows: allowed(),
            binding: Some(binding()),
            stale_context: None,
            auth_result: Ok(()),
            health: Ok(session()),
            close_failure: false,
            starts: 0,
            health_calls: 0,
            closes: 0,
        }
    }
}
impl SessionPort for FakePort {
    fn available(&self) -> bool {
        self.available
    }
    fn observe(&mut self, context: GuardContext) -> GuardObservation {
        GuardObservation {
            context: self.stale_context.unwrap_or(context),
            binding: self.binding.clone(),
            network: self.network,
            windows: self.windows,
        }
    }
    fn begin_auth(&mut self, _: &AuthAttempt) -> Result<(), SessionError> {
        self.starts += 1;
        self.auth_result
    }
    fn session_health(&mut self, _: &SessionBinding) -> Result<SessionBinding, SessionError> {
        self.health_calls += 1;
        self.health.clone()
    }
    fn close(&mut self) -> Result<(), SessionError> {
        self.closes += 1;
        if self.close_failure {
            Err(SessionError::TransportUnavailable)
        } else {
            Ok(())
        }
    }
}
fn live() -> (SessionCoordinator, FakePort) {
    let mut s = SessionCoordinator::default();
    let mut p = FakePort::default();
    s.switch_mode(SourceMode::Live, &mut p);
    (s, p)
}
fn connected() -> (SessionCoordinator, FakePort, AuthAttempt) {
    let (mut s, mut p) = live();
    let a = s.connect(&mut p, 10).unwrap();
    assert!(s.finish_auth(&mut p, &a, Ok(session()), 20));
    (s, p, a)
}
#[test]
fn default_and_mock_connect_never_dispatch_authentication() {
    let mut s = SessionCoordinator::default();
    let mut p = FakePort::default();
    assert_eq!(s.phase(), SessionPhase::Mock);
    assert!(s.connect(&mut p, 0).is_none());
    assert_eq!(p.starts, 0);
    assert_eq!(p.health_calls, 0);
    assert!(!s.clinical_reads_allowed());
}
#[test]
fn unavailable_port_cannot_connect_or_make_a_ready_claim() {
    let (mut s, mut p) = live();
    p.available = false;
    assert!(s.connect(&mut p, 10).is_none());
    assert_eq!(p.starts, 0);
    assert_eq!(s.phase(), SessionPhase::LiveUnavailable);
    assert_eq!(s.error(), Some(SessionError::AdapterUnavailable));
}
#[test]
fn denied_unknown_stale_future_or_zero_revision_network_blocks_bootstrap() {
    for proof in [
        GuardEvidence::Denied,
        GuardEvidence::Unknown,
        GuardEvidence::Allowed {
            observed_at: 0,
            valid_until: 10,
            revision: 1,
        },
        GuardEvidence::Allowed {
            observed_at: 11,
            valid_until: 30,
            revision: 1,
        },
        GuardEvidence::Allowed {
            observed_at: 0,
            valid_until: 30,
            revision: 0,
        },
    ] {
        let (mut s, mut p) = live();
        p.network = proof;
        assert!(s.connect(&mut p, 10).is_none());
        assert_eq!(p.starts, 0);
        assert_eq!(s.error(), Some(SessionError::NetworkNotVerified));
    }
}
#[test]
fn locked_unknown_or_expired_windows_evidence_blocks_bootstrap() {
    for proof in [
        GuardEvidence::Denied,
        GuardEvidence::Unknown,
        GuardEvidence::Allowed {
            observed_at: 0,
            valid_until: 10,
            revision: 1,
        },
    ] {
        let (mut s, mut p) = live();
        p.windows = proof;
        assert!(s.connect(&mut p, 10).is_none());
        assert_eq!(p.starts, 0);
        assert_eq!(s.error(), Some(SessionError::WindowsSessionNotVerified));
    }
}
#[test]
fn missing_local_owner_or_context_blocks_signin() {
    let (mut s, mut p) = live();
    p.binding = None;
    assert!(s.connect(&mut p, 10).is_none());
    assert_eq!(p.starts, 0);
    assert_eq!(s.error(), Some(SessionError::GuardUnavailable));
}
#[test]
fn bootstrap_does_not_require_existing_vista_login_but_never_enables_reads() {
    let (mut s, mut p) = live();
    p.health = Err(SessionError::SessionExpired);
    let a = s.connect(&mut p, 10).unwrap();
    assert_eq!(p.starts, 1);
    assert_eq!(p.health_calls, 0);
    assert_eq!(s.phase(), SessionPhase::Authenticating);
    assert!(!s.clinical_reads_allowed());
    assert!(s.finish_auth(&mut p, &a, Ok(session()), 20));
    assert_eq!(s.phase(), SessionPhase::Connected);
    assert!(!s.clinical_reads_allowed());
    assert!(s.connect(&mut p, 21).is_none());
    assert_eq!(p.starts, 1);
}
#[test]
fn failed_cancelled_or_denied_authentication_never_becomes_connected() {
    for error in [
        SessionError::AuthenticationFailed,
        SessionError::AuthenticationCancelled,
        SessionError::ContextDenied,
        SessionError::MalformedIdentity,
        SessionError::TransportUnavailable,
    ] {
        let (mut s, mut p) = live();
        let a = s.connect(&mut p, 10).unwrap();
        assert!(!s.finish_auth(&mut p, &a, Err(error), 20));
        assert_eq!(s.phase(), SessionPhase::Disconnected);
        assert_eq!(s.error(), Some(error));
        assert!(!s.clinical_reads_allowed());
        assert!(!s.finish_auth(&mut p, &a, Ok(session()), 21));
    }
}
#[test]
fn synchronous_adapter_failure_leaves_no_pending_attempt() {
    let (mut s, mut p) = live();
    p.auth_result = Err(SessionError::AuthenticationFailed);
    assert!(s.connect(&mut p, 10).is_none());
    assert_eq!(s.phase(), SessionPhase::Disconnected);
    assert_eq!(p.starts, 1);
    assert_eq!(s.error(), Some(SessionError::AuthenticationFailed));
}
#[test]
fn network_or_windows_loss_before_reply_rejects_success_and_disposes() {
    for network_loss in [true, false] {
        let (mut s, mut p) = live();
        let a = s.connect(&mut p, 10).unwrap();
        let before = p.closes;
        if network_loss {
            p.network = GuardEvidence::Unknown;
        } else {
            p.windows = GuardEvidence::Denied;
        }
        assert!(!s.finish_auth(&mut p, &a, Ok(session()), 20));
        assert!(p.closes > before);
        assert_eq!(s.phase(), SessionPhase::Disconnected);
        assert!(!s.clinical_reads_allowed());
    }
}
#[test]
fn owner_site_source_windows_session_or_context_change_rejects_auth_reply() {
    for field in 0..5 {
        let (mut s, mut p) = live();
        let a = s.connect(&mut p, 10).unwrap();
        let owner = p.binding.as_mut().unwrap();
        match field {
            0 => owner.source = id("other"),
            1 => owner.site = id("other"),
            2 => owner.windows_user = id("other"),
            3 => owner.windows_session = id("other"),
            _ => owner.application_context = id("other"),
        }
        assert!(!s.finish_auth(&mut p, &a, Ok(session()), 20));
        assert_eq!(s.error(), Some(SessionError::WrongOwner));
    }
}
#[test]
fn mismatched_auth_owner_and_expired_session_metadata_rejected() {
    let (mut s, mut p) = live();
    let a = s.connect(&mut p, 10).unwrap();
    let mut reply = session();
    reply.bootstrap.site = id("wrong");
    assert!(!s.finish_auth(&mut p, &a, Ok(reply), 20));
    assert_eq!(s.error(), Some(SessionError::WrongOwner));
    let a = s.connect(&mut p, 30).unwrap();
    let mut reply = session();
    reply.expires_at = 40;
    assert!(!s.finish_auth(&mut p, &a, Ok(reply), 40));
    assert_eq!(s.error(), Some(SessionError::SessionExpired));
}
#[test]
fn cancelled_and_duplicate_replies_cannot_replace_new_session_with_same_handle() {
    let (mut s, mut p) = live();
    let old = s.connect(&mut p, 10).unwrap();
    s.disconnect(&mut p);
    let new = s.connect(&mut p, 20).unwrap();
    assert_ne!(old.context(), new.context());
    assert!(!s.finish_auth(&mut p, &old, Ok(session()), 21));
    assert!(s.finish_auth(&mut p, &new, Ok(session()), 22));
    assert!(!s.finish_auth(&mut p, &new, Err(SessionError::TransportUnavailable), 23));
    assert!(!s.finish_auth(&mut p, &old, Err(SessionError::AuthenticationFailed), 24));
    assert_eq!(s.phase(), SessionPhase::Connected);
    assert_eq!(s.error(), None);
}
#[test]
fn stale_attestation_context_cannot_authorize_reconnect() {
    let (mut s, mut p) = live();
    let old = s.connect(&mut p, 10).unwrap();
    s.disconnect(&mut p);
    p.stale_context = Some(old.context());
    assert!(s.connect(&mut p, 20).is_none());
    assert_eq!(s.error(), Some(SessionError::StaleEvidence));
    assert_eq!(p.starts, 1);
}
#[test]
fn regressed_evidence_revision_or_clock_revokes_current_attempt() {
    let (mut s, mut p) = live();
    p.network = GuardEvidence::Allowed {
        observed_at: 0,
        valid_until: 400,
        revision: 2,
    };
    let a = s.connect(&mut p, 10).unwrap();
    p.network = allowed();
    assert!(!s.finish_auth(&mut p, &a, Ok(session()), 20));
    assert_eq!(s.error(), Some(SessionError::StaleEvidence));
    let a = s.connect(&mut p, 30).unwrap();
    assert!(!s.finish_auth(&mut p, &a, Ok(session()), 29));
    assert_eq!(s.error(), Some(SessionError::ClockRegressed));
}
#[test]
fn monitor_loss_during_authentication_revokes_and_does_not_auto_reconnect() {
    let (mut s, mut p) = live();
    let a = s.connect(&mut p, 10).unwrap();
    p.windows = GuardEvidence::Unknown;
    s.refresh(&mut p, 20);
    assert_eq!(s.phase(), SessionPhase::Disconnected);
    p.windows = allowed();
    s.refresh(&mut p, 21);
    assert_eq!(s.phase(), SessionPhase::Disconnected);
    assert_eq!(p.starts, 1);
    assert!(!s.finish_auth(&mut p, &a, Ok(session()), 22));
}
#[test]
fn connected_network_loss_prevents_even_session_status_dispatch() {
    let (mut s, mut p, _) = connected();
    p.network = GuardEvidence::Denied;
    s.refresh(&mut p, 30);
    assert_eq!(p.health_calls, 0);
    assert_eq!(s.phase(), SessionPhase::Disconnected);
}
#[test]
fn connected_expiry_and_changed_vista_identity_or_handle_revoke() {
    for field in 0..4 {
        let (mut s, mut p, _) = connected();
        let result = p.health.as_mut().unwrap();
        match field {
            0 => result.vista_user = id("other"),
            1 => result.broker_session = id("other"),
            2 => result.bootstrap.application_context = id("other"),
            _ => {
                p.health = Err(SessionError::SessionExpired);
            }
        }
        s.refresh(&mut p, 30);
        assert_eq!(s.phase(), SessionPhase::Disconnected);
        assert_eq!(p.health_calls, 1);
    }
    let (mut s, mut p, _) = connected();
    p.network = GuardEvidence::Allowed {
        observed_at: 0,
        valid_until: 1000,
        revision: 2,
    };
    p.windows = p.network;
    s.refresh(&mut p, 500);
    assert_eq!(s.error(), Some(SessionError::SessionExpired));
    assert_eq!(p.health_calls, 0);
}
#[test]
fn source_epoch_survives_mock_live_mock_reset_and_old_auth_never_applies() {
    let mut s = SessionCoordinator::default();
    let mut p = FakePort::default();
    let old_mock = s.mock_stamp().unwrap();
    assert!(s.switch_mode(SourceMode::Live, &mut p));
    assert!(!s.accepts_mock(old_mock));
    let old_auth = s.connect(&mut p, 10).unwrap();
    s.switch_mode(SourceMode::Mock, &mut p);
    let new_mock = s.mock_stamp().unwrap();
    assert_ne!(old_mock, new_mock);
    assert!(!s.accepts_mock(old_mock));
    assert!(s.accepts_mock(new_mock));
    assert!(!s.finish_auth(&mut p, &old_auth, Ok(session()), 20));
    let same = s.mock_stamp().unwrap();
    assert!(!s.switch_mode(SourceMode::Mock, &mut p));
    assert_eq!(s.mock_stamp(), Some(same));
}
#[test]
fn cleanup_failure_does_not_retain_connected_owner_or_accept_old_reply() {
    let (mut s, mut p, a) = connected();
    p.close_failure = true;
    s.disconnect(&mut p);
    assert_eq!(s.phase(), SessionPhase::Disconnected);
    assert!(!s.clinical_reads_allowed());
    assert!(!s.finish_auth(&mut p, &a, Ok(session()), 30));
}
#[test]
fn identity_bounds_and_all_debug_errors_redact_synthetic_secrets() {
    for bad in ["", " ", "line\nsecret", "\0"] {
        assert_eq!(
            OpaqueIdentity::new(bad),
            Err(SessionError::MalformedIdentity)
        );
    }
    assert_eq!(
        OpaqueIdentity::new(&"x".repeat(257)),
        Err(SessionError::MalformedIdentity)
    );
    let (s, p, a) = connected();
    let debug = format!(
        "{s:?} {a:?} {:?} {}",
        p.health,
        SessionError::AuthenticationFailed
    );
    for marker in [
        "PRIVATE_SOURCE",
        "PRIVATE_SITE",
        "PRIVATE_WINDOWS_USER",
        "PRIVATE_WINDOWS_SESSION",
        "PRIVATE_CONTEXT",
        "PRIVATE_VISTA_USER",
        "PRIVATE_HANDLE",
    ] {
        assert!(!debug.contains(marker), "identity leaked: {marker}");
    }
}
