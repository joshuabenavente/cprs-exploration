//! Session policy only. No socket, credential, RPC or clinical operation API.
//! Production trust comes from the supported platform port, not a UI/config boolean.
use std::fmt;

#[derive(Clone, PartialEq, Eq)]
pub struct OpaqueIdentity(String);
impl OpaqueIdentity {
    pub fn new(value: &str) -> Result<Self, SessionError> {
        if value.trim().is_empty() || value.len() > 256 || value.chars().any(char::is_control) {
            return Err(SessionError::MalformedIdentity);
        }
        Ok(Self(value.into()))
    }
}
impl fmt::Debug for OpaqueIdentity {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str("<redacted identity>")
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct BootstrapBinding {
    pub source: OpaqueIdentity,
    pub site: OpaqueIdentity,
    pub windows_user: OpaqueIdentity,
    pub windows_session: OpaqueIdentity,
    pub application_context: OpaqueIdentity,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SessionBinding {
    pub bootstrap: BootstrapBinding,
    pub vista_user: OpaqueIdentity,
    pub broker_session: OpaqueIdentity,
    /// Monotonic milliseconds, not wall time or a server timestamp.
    pub expires_at: u64,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SourceMode {
    Mock,
    Live,
}
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct SourceStamp(u64);
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct GuardContext {
    pub source_epoch: u64,
    pub connection_epoch: u64,
    pub session_epoch: u64,
}
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum GuardEvidence {
    Unknown,
    Denied,
    Allowed {
        observed_at: u64,
        valid_until: u64,
        revision: u64,
    },
}
impl GuardEvidence {
    fn revision(self, now: u64) -> Option<u64> {
        match self {
            Self::Allowed {
                observed_at,
                valid_until,
                revision,
            } if observed_at <= now && now < valid_until && revision > 0 => Some(revision),
            _ => None,
        }
    }
}
#[derive(Clone, Debug)]
pub struct GuardObservation {
    pub context: GuardContext,
    pub binding: Option<BootstrapBinding>,
    pub network: GuardEvidence,
    pub windows: GuardEvidence,
}
#[derive(Clone, Debug)]
pub struct AuthAttempt {
    context: GuardContext,
    sequence: u64,
    binding: BootstrapBinding,
}
impl AuthAttempt {
    pub fn context(&self) -> GuardContext {
        self.context
    }
    pub fn binding(&self) -> &BootstrapBinding {
        &self.binding
    }
}
impl PartialEq for AuthAttempt {
    fn eq(&self, other: &Self) -> bool {
        self.context == other.context
            && self.sequence == other.sequence
            && self.binding == other.binding
    }
}
impl Eq for AuthAttempt {}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SessionError {
    AdapterUnavailable,
    NetworkNotVerified,
    WindowsSessionNotVerified,
    GuardUnavailable,
    StaleEvidence,
    WrongOwner,
    MalformedIdentity,
    AuthenticationFailed,
    AuthenticationCancelled,
    SessionExpired,
    ContextDenied,
    TransportUnavailable,
    ClockRegressed,
    EpochExhausted,
}
impl SessionError {
    pub fn message(self) -> &'static str {
        match self {
            Self::AdapterUnavailable => {
                "The supported Broker integration is not built into this release."
            }
            Self::NetworkNotVerified => "VA-network access is not verified. Connection blocked.",
            Self::WindowsSessionNotVerified => {
                "An active, unlocked Windows session is not verified."
            }
            Self::GuardUnavailable => {
                "Required connection evidence is unavailable. Connection blocked."
            }
            Self::StaleEvidence => {
                "Connection evidence is stale. Connect again after verification."
            }
            Self::WrongOwner => "The connection owner changed. The previous session was discarded.",
            Self::MalformedIdentity => "The sign-in response could not be validated.",
            Self::AuthenticationFailed => "Sign-in failed. No session is active.",
            Self::AuthenticationCancelled => "Sign-in cancelled. No session is active.",
            Self::SessionExpired => "The VistA session expired. Sign in again.",
            Self::ContextDenied => "The required VistA application context was not authorized.",
            Self::TransportUnavailable => {
                "The Broker session is unavailable. Connect again to retry."
            }
            Self::ClockRegressed => "Connection timing could not be verified. Session discarded.",
            Self::EpochExhausted => "Connection ownership exhausted. Restart the application.",
        }
    }
}
impl fmt::Display for SessionError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(self.message())
    }
}
impl std::error::Error for SessionError {}

/// A supported adapter must verify observations and identity/context before returning them.
/// Implementations own threading/handles and must not export raw errors or credentials.
/// There is deliberately no RPC-name, patient, read or write method in this port.
pub trait SessionPort {
    fn available(&self) -> bool;
    fn observe(&mut self, context: GuardContext) -> GuardObservation;
    fn begin_auth(&mut self, attempt: &AuthAttempt) -> Result<(), SessionError>;
    fn session_health(&mut self, binding: &SessionBinding) -> Result<SessionBinding, SessionError>;
    /// Local cancel/disposal only; must not queue remote cleanup after guard loss.
    fn close(&mut self) -> Result<(), SessionError>;
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SessionPhase {
    Mock,
    LiveUnavailable,
    Disconnected,
    CheckingGuards,
    Authenticating,
    Connected,
    Revoking,
}
#[derive(Debug)]
pub struct SessionCoordinator {
    mode: SourceMode,
    phase: SessionPhase,
    context: GuardContext,
    sequence: u64,
    pending: Option<AuthAttempt>,
    connected: Option<SessionBinding>,
    revisions: Option<(u64, u64)>,
    last_now: u64,
    error: Option<SessionError>,
}
impl Default for SessionCoordinator {
    fn default() -> Self {
        Self {
            mode: SourceMode::Mock,
            phase: SessionPhase::Mock,
            context: GuardContext {
                source_epoch: 1,
                connection_epoch: 1,
                session_epoch: 1,
            },
            sequence: 0,
            pending: None,
            connected: None,
            revisions: None,
            last_now: 0,
            error: None,
        }
    }
}
impl SessionCoordinator {
    pub fn mode(&self) -> SourceMode {
        self.mode
    }
    pub fn phase(&self) -> SessionPhase {
        self.phase
    }
    pub fn error(&self) -> Option<SessionError> {
        self.error
    }
    pub fn is_mock(&self) -> bool {
        self.mode == SourceMode::Mock
    }
    pub fn mock_stamp(&self) -> Option<SourceStamp> {
        self.is_mock()
            .then_some(SourceStamp(self.context.source_epoch))
    }
    pub fn accepts_mock(&self, stamp: SourceStamp) -> bool {
        self.is_mock()
            && stamp.0 == self.context.source_epoch
            && self.error != Some(SessionError::EpochExhausted)
    }
    /// M18's clinical allowlist is empty, including after successful authentication.
    pub fn clinical_reads_allowed(&self) -> bool {
        false
    }
    pub fn status(&self) -> &'static str {
        if let Some(error) = self.error {
            return error.message();
        }
        match self.phase {
            SessionPhase::Mock => "Mock source. All patient records are invented.",
            SessionPhase::LiveUnavailable => SessionError::AdapterUnavailable.message(),
            SessionPhase::Disconnected => "Live session disconnected. No patient data loaded.",
            SessionPhase::CheckingGuards => "Verifying VA-network and active Windows session…",
            SessionPhase::Authenticating => "Signing in through the supported Broker path…",
            SessionPhase::Connected => {
                "Session identity and context verified. Patient reading is not enabled in M18."
            }
            SessionPhase::Revoking => "Closing the previous session…",
        }
    }
    fn bump(value: &mut u64) -> bool {
        if let Some(next) = value.checked_add(1) {
            *value = next;
            true
        } else {
            false
        }
    }
    fn invalidate(&mut self) {
        self.phase = SessionPhase::Revoking;
        self.pending = None;
        self.connected = None;
        self.revisions = None;
        if !Self::bump(&mut self.context.connection_epoch)
            || !Self::bump(&mut self.context.session_epoch)
        {
            self.error = Some(SessionError::EpochExhausted);
        }
    }
    pub fn switch_mode(&mut self, mode: SourceMode, port: &mut impl SessionPort) -> bool {
        if self.mode == mode {
            return false;
        }
        self.invalidate();
        if !Self::bump(&mut self.context.source_epoch) {
            self.error = Some(SessionError::EpochExhausted);
        }
        let exhausted = self.error == Some(SessionError::EpochExhausted);
        let _ = port.close();
        self.mode = mode;
        self.error = exhausted.then_some(SessionError::EpochExhausted);
        self.phase = if mode == SourceMode::Mock {
            SessionPhase::Mock
        } else if port.available() {
            SessionPhase::Disconnected
        } else {
            SessionPhase::LiveUnavailable
        };
        true
    }
    pub fn disconnect(&mut self, port: &mut impl SessionPort) {
        if self.is_mock() {
            return;
        }
        self.revoke(port, None);
    }
    fn revoke(&mut self, port: &mut impl SessionPort, reason: Option<SessionError>) {
        self.invalidate(); // Ownership is invalid before disposal, even if disposal fails.
        let exhausted = self.error == Some(SessionError::EpochExhausted);
        self.error = if exhausted {
            Some(SessionError::EpochExhausted)
        } else {
            reason
        };
        let _ = port.close();
        self.phase = if port.available() {
            SessionPhase::Disconnected
        } else {
            SessionPhase::LiveUnavailable
        };
    }
    fn time(&mut self, now: u64) -> Result<(), SessionError> {
        if now < self.last_now {
            return Err(SessionError::ClockRegressed);
        }
        self.last_now = now;
        Ok(())
    }
    fn guards(
        &mut self,
        port: &mut impl SessionPort,
        now: u64,
        expected: Option<&BootstrapBinding>,
    ) -> Result<BootstrapBinding, SessionError> {
        self.time(now)?;
        if !port.available() {
            return Err(SessionError::AdapterUnavailable);
        }
        let observation = port.observe(self.context);
        if observation.context != self.context {
            return Err(SessionError::StaleEvidence);
        }
        let network = observation
            .network
            .revision(now)
            .ok_or(SessionError::NetworkNotVerified)?;
        let windows = observation
            .windows
            .revision(now)
            .ok_or(SessionError::WindowsSessionNotVerified)?;
        if self
            .revisions
            .is_some_and(|(n, w)| network < n || windows < w)
        {
            return Err(SessionError::StaleEvidence);
        }
        let binding = observation.binding.ok_or(SessionError::GuardUnavailable)?;
        if expected.is_some_and(|owner| owner != &binding) {
            return Err(SessionError::WrongOwner);
        }
        self.revisions = Some((network, windows));
        Ok(binding)
    }
    pub fn connect(&mut self, port: &mut impl SessionPort, now: u64) -> Option<AuthAttempt> {
        if self.is_mock()
            || self.error == Some(SessionError::EpochExhausted)
            || matches!(
                self.phase,
                SessionPhase::Authenticating | SessionPhase::Connected
            )
        {
            return None;
        }
        self.invalidate();
        if self.error == Some(SessionError::EpochExhausted) {
            return None;
        }
        self.error = None;
        self.phase = SessionPhase::CheckingGuards;
        let binding = match self.guards(port, now, None) {
            Ok(binding) => binding,
            Err(error) => {
                self.revoke(port, Some(error));
                return None;
            }
        };
        if !Self::bump(&mut self.sequence) {
            self.revoke(port, Some(SessionError::EpochExhausted));
            return None;
        }
        let attempt = AuthAttempt {
            context: self.context,
            sequence: self.sequence,
            binding,
        };
        self.pending = Some(attempt.clone());
        self.phase = SessionPhase::Authenticating;
        if let Err(error) = port.begin_auth(&attempt) {
            self.revoke(port, Some(error));
            return None;
        }
        Some(attempt)
    }
    /// Called on the coordinator owner context. Stale replies cannot revoke a newer session.
    pub fn finish_auth(
        &mut self,
        port: &mut impl SessionPort,
        attempt: &AuthAttempt,
        result: Result<SessionBinding, SessionError>,
        now: u64,
    ) -> bool {
        if self.mode != SourceMode::Live
            || self.phase != SessionPhase::Authenticating
            || self.pending.as_ref() != Some(attempt)
        {
            return false;
        }
        if let Err(error) = self.guards(port, now, Some(&attempt.binding)) {
            self.revoke(port, Some(error));
            return false;
        }
        let session = match result {
            Ok(session) if session.bootstrap != attempt.binding => {
                self.revoke(port, Some(SessionError::WrongOwner));
                return false;
            }
            Ok(session) if session.expires_at <= now => {
                self.revoke(port, Some(SessionError::SessionExpired));
                return false;
            }
            Ok(session) => session,
            Err(error) => {
                self.revoke(port, Some(error));
                return false;
            }
        };
        self.pending = None;
        self.connected = Some(session);
        self.phase = SessionPhase::Connected;
        self.error = None;
        true
    }
    /// Platform events/watchdog invoke this; unknown, changed or expired evidence revokes.
    pub fn refresh(&mut self, port: &mut impl SessionPort, now: u64) {
        if self.is_mock()
            || !matches!(
                self.phase,
                SessionPhase::Authenticating | SessionPhase::Connected
            )
        {
            return;
        }
        let binding = self
            .pending
            .as_ref()
            .map(|a| a.binding.clone())
            .or_else(|| self.connected.as_ref().map(|s| s.bootstrap.clone()));
        if let Err(error) = self.guards(port, now, binding.as_ref()) {
            self.revoke(port, Some(error));
            return;
        }
        if let Some(current) = self.connected.clone() {
            if current.expires_at <= now {
                self.revoke(port, Some(SessionError::SessionExpired));
                return;
            }
            match port.session_health(&current) {
                Ok(verified) if verified == current => (),
                Ok(_) => self.revoke(port, Some(SessionError::WrongOwner)),
                Err(error) => self.revoke(port, Some(error)),
            }
        }
    }
}
