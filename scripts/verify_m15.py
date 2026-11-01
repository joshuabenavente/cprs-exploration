"""Verify M15 receipts, complete timer checkpoint sets, source and executable bindings."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-15' / ('windows' if sys.platform == 'win32' else 'linux')

REQUIRED = {
    'acknowledgment-accept',
    'acknowledgment-decline',
    'acknowledgment-required',
    'acknowledgment-search',
    'appointments-close-retains-row',
    'appointments-error',
    'appointments-explicit-close-race',
    'appointments-late-error-tab',
    'appointments-retry-real-timer',
    'appointments-same-id-new-owner',
    'appointments-selector-cancel',
    'commit-exact-duplicate',
    'cover-close-rejects-late-detail',
    'denied-patient-keeps-chart',
    'denied-patient-search',
    'empty-appointments',
    'empty-medications',
    'empty-notes',
    'empty-orders',
    'empty-patient-commit',
    'empty-patient-search',
    'empty-report-is-success',
    'empty-results',
    'empty-vitals',
    'filter-invalidates-pending-report',
    'late-list-error-after-recovery',
    'late-order-error-after-tab-change',
    'late-orders-list-after-tab-change',
    'layout-allergies',
    'layout-appointments',
    'layout-fixture-footer',
    'layout-medications',
    'layout-problems',
    'layout-vitals',
    'medications-close-retains-row',
    'medications-error',
    'medications-explicit-close-race',
    'medications-late-error-tab',
    'medications-retry-real-timer',
    'medications-same-id-new-owner',
    'medications-selector-cancel',
    'new-patient-notes-list',
    'notes-filter-author-race',
    'notes-filter-combined-empty',
    'notes-filter-date-recovery',
    'notes-filter-invalid-date',
    'notes-filter-reading',
    'notes-filter-reset-race',
    'notes-filter-selector-reset',
    'notes-filter-unicode-author',
    'notes-list-real-delay',
    'notes-out-of-order',
    'notes-reading-focus',
    'order-detail-retry-real-timer',
    'order-recovery-and-slow-list',
    'order-selection-is-explicit',
    'patient-commit-before-old-note',
    'pending-note-open-selector',
    'pending-order-cancel-selector',
    'recover-then-orders-error',
    'report-close-invalidates-inflight',
    'reports-explicit-and-out-of-order',
    'results-cancel-focus',
    'results-list-error',
    'results-list-real-delay',
    'results-list-retry-real-timer',
    'reveal-allergies-view',
    'reveal-appointments-view',
    'reveal-medications-view',
    'reveal-problems-view',
    'reveal-vitals-view',
    'review-appointments-closed',
    'review-appointments-layout',
    'review-final-state',
    'review-long-unicode-report',
    'review-medications-closed',
    'review-medications-layout',
    'review-patient-commit',
    'review-patient-search',
    'review-results-list',
    'review-vitals-closed',
    'review-vitals-layout',
    'same-note-id-new-owner',
    'search-out-of-order',
    'vitals-close-retains-row',
    'vitals-error',
    'vitals-explicit-close-race',
    'vitals-late-error-tab',
    'vitals-retry-real-timer',
    'vitals-same-id-new-owner',
    'vitals-selector-cancel',
    'results-filter-date-race',
    'results-filter-invalid-date',
    'results-filter-inclusive-recovery',
    'results-filter-combined-empty',
    'results-filter-reset-race',
    'results-filter-unicode-combined',
    'results-filter-retry-keeps-dates',
    'results-filter-reading-geometry',
    'results-filter-selector-reset',
    'orders-filter-open',
    'orders-filter-date-race',
    'orders-filter-invalid-date',
    'orders-filter-inclusive-recovery',
    'orders-filter-status-combined',
    'orders-filter-combined-empty',
    'orders-filter-reset-race',
    'orders-filter-unicode-combined',
    'orders-filter-retry-keeps-dates',
    'orders-filter-reading-geometry',
    'orders-filter-selector-reset',
    'orders-filter-return-results',
}

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def source_inputs():
    files = [p for p in (ROOT / 'crates').rglob('*') if p.is_file()]
    files += [ROOT / p for p in ('Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml',
              'scripts/validate_m15.py', 'scripts/verify_integrated.py', 'scripts/verify_m15.py',
              'scripts/Test-MockChart.ps1', 'scripts/Review-OrdersFilters.ps1', 'scripts/test_m15_protocol.py',
              'scripts/validate_m14.py', 'scripts/verify_m14.py', 'scripts/test_m14_protocol.py',
              'scripts/Review-ResultsFilters.ps1', '.github/workflows/mock-checks.yml')]
    return {p.relative_to(ROOT).as_posix(): hashlib.sha256(p.read_bytes().replace(b'\r\n', b'\n')).hexdigest() for p in sorted(files)}


def parse_journey(path):
    log = path.read_text(encoding='utf-8-sig')
    require('M15_INTEGRATED_FAIL' not in log, 'Journey failure recorded')
    checks = re.findall(r'^M15_CHECK ([a-z-]+) PASS elapsed_ms=(\d+)\s*$', log, re.M)
    require(len(checks) == len(REQUIRED) and {x[0] for x in checks} == REQUIRED,
            'Missing or duplicate journey checkpoints')
    summaries = re.findall(r'^M15_INTEGRATED_PASS cases=(\d+) deliveries=(\d+) rejected=(\d+) elapsed_ms=(\d+)\s*$', log, re.M)
    require(len(summaries) == 1, 'Expected one completed journey')
    cases, total, rejected, elapsed = map(int, summaries[0])
    require(cases == len(REQUIRED), 'Checkpoint count mismatch')
    deliveries = []
    for operation, owner, key, generation, applied in re.findall(
            r'^M15_DELIVERY (\S+) (.*?) (".*") generation=(\d+) applied=(true|false)\s*$', log, re.M):
        require(owner == '' or re.fullmatch(r'SYNTH-\d{3}', owner), 'Unexpected delivery owner')
        deliveries.append({'operation': operation, 'owner': owner, 'key': json.loads(key),
                           'generation': int(generation), 'applied': applied == 'true'})
    require(total == len(deliveries) and rejected == sum(not d['applied'] for d in deliveries)
            and rejected > 0, 'Delivery audit count mismatch')
    windows = re.findall(r'^M15_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
    require(len(windows) == 1, 'Missing or duplicate final window observation')
    width, height, scale = windows[0]
    return {'checkpoints': [{'name': n, 'elapsed_ms': int(t)} for n,t in checks],
            'deliveries': deliveries, 'delivery_count': total, 'rejected_deliveries': rejected,
            'elapsed_ms': elapsed, 'window': {'client_pixels': [int(width),int(height)], 'application_scale': float(scale)}}


def verify(code_only=False):
    path = BASE / ('code-checks.json' if code_only else 'automated.json')
    auto = json.loads(path.read_text(encoding='utf-8-sig'))
    require(auto['protocol'] == 'M15', 'Receipt belongs to another protocol')
    require(auto['passed'] and auto['code_only'] == code_only, 'Wrong mode or failed receipt')
    require(auto['source_sha256'] == source_inputs(), 'Source/build input hash or file set changed')
    executable = (ROOT / auto['executable']).resolve()
    require(executable.is_relative_to((ROOT / 'target').resolve()), 'Unexpected executable path')
    require(digest(executable) == auto['executable_sha256'], 'Executable differs from receipt')
    expected = {'format','clippy','tests','build'}
    if not code_only:
        expected |= {'callbacks','integrated'}
    if auto['dependency_bootstrap_requested']:
        expected.add('bootstrap')
    if auto['matrix_requested']:
        require(not code_only, 'Matrix requires desktop mode')
        expected |= {f'probe-{size}-{scale}' for size in ('default','minimum') for scale in (100,125,150,175,200)}
    require(len(auto['checks']) == len(expected) and {x['name'] for x in auto['checks']} == expected, 'Missing or duplicate automated checks')
    journeys = {}
    for check in auto['checks']:
        log = (ROOT / check['log']).resolve()
        require(log.parent == BASE.resolve() and log.name == check['name'] + '.log', 'Log outside M15 destination')
        require(check['passed'] and check['exit_code'] == 0 and digest(log) == check['log_sha256'], 'Failed or changed step log: ' + check['name'])
        if check['name'] == 'integrated' or check['name'].startswith('probe-'):
            journey = parse_journey(log)
            geometry = (1180,800,1.0)
            if check['name'].startswith('probe-'):
                _,size,percent = check['name'].split('-'); scale = int(percent)/100
                geometry = (round((980 if size == 'minimum' else 1180)*scale),round((680 if size == 'minimum' else 700 if scale == 2 else 800)*scale),scale)
            require((*journey['window']['client_pixels'],journey['window']['application_scale']) == geometry, 'Requested/observed geometry mismatch: ' + check['name'])
            journeys[check['name']] = journey
    for relative, expected_hash in auto['preserved_evidence_sha256'].items():
        historical = (ROOT / relative).resolve()
        require(historical.is_relative_to(ROOT.resolve()), 'Historical path outside repository')
        require(digest(historical) == expected_hash, 'Historical evidence changed: ' + relative)
    return auto, journeys


def main(argv=None):
    raise SystemExit("M15 is frozen history; use the M16 runner in this checkout.")
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--code-only', action='store_true')
    args = parser.parse_args(argv)
    auto, journeys = verify(args.code_only)
    if not args.code_only:
        result = {'protocol':'M15','scope':'New verification of synthetic timer/geometry evidence; native/listening separate',
                  'passed':True,'automated_receipt_sha256':digest(BASE/'automated.json'),
                  'executable_sha256':auto['executable_sha256'],'required_checkpoints':len(REQUIRED),'journeys':journeys,
                  'limits':['Synthetic callbacks and geometry do not prove physical keyboard, Windows UIA or speech.']}
        (BASE/'integrated.json').write_text(json.dumps(result,indent=2)+'\n')
    print('M15 receipt verified:', len(auto['checks']), 'steps;', len(journeys), 'journeys;', len(REQUIRED), 'required checkpoints per journey')


if __name__ == '__main__':
    main()
