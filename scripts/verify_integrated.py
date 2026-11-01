"""Verify Milestone 12's real-timer log and bind its receipt to the tested mock."""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-12'
REQUIRED = {
    'layout-problems', 'layout-allergies', 'layout-vitals', 'layout-medications', 'layout-appointments',
    'reveal-appointments-view', 'reveal-medications-view', 'reveal-vitals-view', 'reveal-allergies-view', 'reveal-problems-view', 'layout-fixture-footer',
    'review-final-state',
    'appointments-explicit-close-race', 'appointments-close-retains-row',
    'appointments-error', 'appointments-retry-real-timer',
    'appointments-late-error-tab', 'appointments-selector-cancel',
    'appointments-same-id-new-owner', 'empty-appointments',
    'review-appointments-layout', 'review-appointments-closed',
    'medications-explicit-close-race', 'medications-close-retains-row',
    'medications-error', 'medications-retry-real-timer',
    'medications-late-error-tab', 'medications-selector-cancel',
    'medications-same-id-new-owner', 'empty-medications',
    'review-medications-layout', 'review-medications-closed',
    'vitals-explicit-close-race', 'vitals-close-retains-row', 'vitals-error',
    'vitals-retry-real-timer', 'vitals-late-error-tab', 'vitals-selector-cancel',
    'vitals-same-id-new-owner', 'empty-vitals', 'review-vitals-layout', 'review-vitals-closed',
    'search-out-of-order', 'commit-exact-duplicate', 'cover-close-rejects-late-detail',
    'notes-list-real-delay', 'notes-out-of-order', 'notes-reading-focus',
    'pending-note-open-selector', 'patient-commit-before-old-note',
    'new-patient-notes-list', 'same-note-id-new-owner',
    'late-orders-list-after-tab-change', 'results-list-real-delay',
    'reports-explicit-and-out-of-order', 'report-close-invalidates-inflight',
    'empty-report-is-success', 'filter-invalidates-pending-report',
    'results-list-error', 'results-list-retry-real-timer', 'late-list-error-after-recovery',
    'recover-then-orders-error', 'order-selection-is-explicit',
    'order-detail-retry-real-timer', 'late-order-error-after-tab-change',
    'order-recovery-and-slow-list', 'pending-order-cancel-selector',
    'acknowledgment-search', 'acknowledgment-required', 'acknowledgment-decline',
    'acknowledgment-accept', 'denied-patient-search', 'denied-patient-keeps-chart',
    'empty-patient-search', 'empty-patient-commit', 'empty-notes', 'empty-results',
    'empty-orders', 'review-patient-search', 'review-patient-commit',
    'review-results-list', 'results-cancel-focus', 'review-long-unicode-report',
}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def main():
    automated = json.loads((BASE / 'automated.json').read_text(encoding='utf-8-sig'))
    require(automated['protocol'] == 'M12', 'Automated receipt belongs to another protocol')
    require(automated['passed'], 'Automated checks did not pass')
    expected = {'format', 'clippy', 'tests', 'build', 'callbacks', 'integrated'}
    if automated.get('dependency_bootstrap_requested'):
        expected.add('bootstrap')
    require(len(automated['checks']) == len(expected) and
            {c['name'] for c in automated['checks'] if c['passed']} == expected, 'Missing or duplicate automated check')
    for check in automated['checks']:
        # Step logs are rewritten in place by later runs; trust only the bytes
        # this receipt recorded.
        log = ROOT / check['log']
        require(log.exists() and hashlib.sha256(log.read_bytes()).hexdigest() == check['log_sha256'],
                'Step log missing or changed since receipt: ' + check['name'])
    digest = hashlib.sha256((ROOT / automated['executable']).read_bytes()).hexdigest()
    require(digest == automated['executable_sha256'], 'Executable differs from automated receipt')
    path = BASE / 'integrated.log'
    log = path.read_text(encoding='utf-8-sig')
    require('M12_INTEGRATED_FAIL' not in log, 'Journey failure recorded')
    checks = re.findall(r'^M12_CHECK ([a-z-]+) PASS elapsed_ms=(\d+)\s*$', log, re.M)
    require(len(checks) == len(REQUIRED) and {c[0] for c in checks} == REQUIRED,
            'Missing or duplicate journey checkpoints')
    summary = re.findall(r'^M12_INTEGRATED_PASS cases=(\d+) deliveries=(\d+) rejected=(\d+) elapsed_ms=(\d+)\s*$', log, re.M)
    require(len(summary) == 1, 'Expected one completed journey')
    count, total, rejected, elapsed = map(int, summary[0])
    require(count == len(checks), 'Checkpoint count mismatch')
    deliveries = []
    for operation, owner, key, generation, applied in re.findall(
            r'^M12_DELIVERY (\S+) (.*?) (".*") generation=(\d+) applied=(true|false)\s*$', log, re.M):
        require(owner == '' or re.fullmatch(r'SYNTH-\d{3}', owner), 'Unexpected delivery owner')
        deliveries.append({'operation': operation, 'owner': owner, 'key': json.loads(key),
                           'generation': int(generation), 'applied': applied == 'true'})
    require(total == len(deliveries) and rejected == sum(not d['applied'] for d in deliveries)
            and rejected > 0, 'Delivery audit count mismatch')
    windows = re.findall(r'^M12_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
    require(len(windows) == 1, 'Missing final window observation')
    width, height, scale = windows[0]
    receipt = {
        'protocol': 'M12',
        'automated_receipt_sha256': hashlib.sha256((BASE / 'automated.json').read_bytes()).hexdigest(),
        'scope': 'Mock desktop callbacks, real timers, binding ownership and widget focus probes',
        'passed': True, 'executable_sha256': digest,
        'log': path.relative_to(ROOT).as_posix(), 'log_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
        'checkpoints': [{'name': n, 'elapsed_ms': int(t)} for n, t in checks],
        'deliveries': deliveries, 'delivery_count': total, 'rejected_deliveries': rejected,
        'elapsed_ms': elapsed,
        'window': {'client_pixels': [int(width), int(height)], 'application_scale': float(scale)},
        'limits': ['No physical keys or pointer input are injected by this journey.',
                   'Binding/focus-probe checks do not establish UIA, compositor atomicity, or spoken output.',
                   'Native layout/keyboard observations and user listening results are recorded separately.',
                   'No original client, server, credentials, or clinical data is involved.'],
    }
    (BASE / 'integrated.json').write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(f'Integrated journey verified: {count} checkpoints, {total} deliveries, {rejected} rejected')


if __name__ == '__main__':
    main()
