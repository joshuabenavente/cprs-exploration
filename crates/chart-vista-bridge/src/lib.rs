#![forbid(unsafe_code)]
//! Explicitly unavailable native integration. No network, discovery or credential API.
//! The supported SDK, attestation and authentication interfaces are not yet established.
use chart_core::*;

#[derive(Default)]
pub struct NativeSessionPort;
impl SessionPort for NativeSessionPort {
    fn available(&self) -> bool {
        false
    }
    fn observe(&mut self, context: GuardContext) -> GuardObservation {
        GuardObservation {
            context,
            binding: None,
            network: GuardEvidence::Unknown,
            windows: GuardEvidence::Unknown,
        }
    }
    fn begin_auth(&mut self, _: &AuthAttempt) -> Result<(), SessionError> {
        Err(SessionError::AdapterUnavailable)
    }
    fn session_health(&mut self, _: &SessionBinding) -> Result<SessionBinding, SessionError> {
        Err(SessionError::AdapterUnavailable)
    }
    fn close(&mut self) -> Result<(), SessionError> {
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn native_port_never_claims_network_or_session_availability() {
        let mut port = NativeSessionPort;
        let mut session = SessionCoordinator::default();
        session.switch_mode(SourceMode::Live, &mut port);
        assert_eq!(session.phase(), SessionPhase::LiveUnavailable);
        assert!(session.connect(&mut port, 0).is_none());
        assert_eq!(session.error(), Some(SessionError::AdapterUnavailable));
        assert!(!session.clinical_reads_allowed());
        let proof = port.observe(GuardContext {
            source_epoch: 1,
            connection_epoch: 1,
            session_epoch: 1,
        });
        assert!(proof.binding.is_none());
        assert_eq!(proof.network, GuardEvidence::Unknown);
        assert_eq!(proof.windows, GuardEvidence::Unknown);
    }
}
