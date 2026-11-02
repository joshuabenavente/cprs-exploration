# M18 morning handoff

This build delivers session policy, source isolation and the connection surface.
**It cannot connect to VistA yet.** The native Broker adapter is explicitly
unavailable; being on the VA network and logged in will not enable it. No endpoint
probe, sign-in attempt or patient read occurs. Do not expect a credential prompt.

The user plans to check the connection on the VA workstation in the morning.
The useful next local step is to verify the unavailable foundation and establish
the supported integration facts needed to build the actual connection. A working
ordinary CPRS login confirms the existing client works, not this Rust adapter.

## Functional review at 100%

After updating main and closing any running mock, use Windows PowerShell:

```powershell
git pull --ff-only
.\scripts\Test-MockChart.ps1 -Matrix -Bootstrap
python scripts/verify_integrated.py
python scripts/test_m18_functional_protocol.py
.\scripts\Review-VistaSession.ps1 -Size default
```

The review launcher opens the **unavailable** session view at 100%, without a
background automatic journey or auth transcript capture. Close it, repeat with
`-Size minimum`, and use the [functional checklist](../validation/milestone-18/functional-100/manual-checklist.md).
The automated protocol is M18F100. Keyboard navigation/focus and screen readers
remain excluded; additional scales remain deferred.

## Native facts to establish locally

Record a supported package/library/helper **name, version, bitness and documentation
reference**, and the supported interface for sign-in/cancel/status/logout and
application-context verification. Identify the site's VA-network attestation or
equivalent enforced access boundary and its revocation behavior, plus the
Windows session event/monitor mechanism the integration can use.

These are the unresolved inputs in the [VS01–VS12 fact table](../specifications/vista-session-foundations.md).
Do not paste credentials, tokens, account identifiers, internal addresses,
installation paths or patient examples into chat or commit them. No connectivity
scan or raw Broker protocol experiment is needed to collect supported method
names/documentation references. Local configuration remains on the workstation.

Once those interfaces are known, the next code step is a real supported adapter
and guard monitors, followed by local session-only acceptance. Patient identity
and Notes reading remain M19. Session integration and native acceptance are not
complete merely because the current mock/guard tests pass.
