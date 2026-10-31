"""Bind Milestone 9's bounded checkpoint to its final mock and inspectable receipts."""
import hashlib
import json
from pathlib import Path
import re
from verify_integrated import REQUIRED, require

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-9'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    automated, integrated, native, static = [json.loads((BASE / name).read_text(encoding='utf-8-sig'))
                                            for name in ('automated.json', 'integrated.json', 'native-ui.json', 'static.json')]
    executable = digest(ROOT / automated['executable'])
    tests = (BASE / 'tests.log').read_text(encoding='utf-8-sig')
    require(sum(map(int, re.findall(r'^test result: ok\. (\d+) passed;', tests, re.M))) == 87,
            'Wrong core test coverage')
    require(automated['passed'] and integrated['passed'] and static['passed'], 'A required receipt failed')
    require(executable == automated['executable_sha256'] == integrated['executable_sha256'] == native['executable_sha256'], 'Mock executable mismatch')
    require(len(integrated['checkpoints']) == 61 and len(REQUIRED) == 61, 'Wrong journey version')
    for path, expected in static['evidence_sha256'].items():
        require(digest(ROOT / path) == expected, f'Changed static evidence: {path}')
    require(digest(ROOT / integrated['log']) == integrated['log_sha256'], 'Changed integrated log')
    history = json.loads((BASE / 'historical-bytes.json').read_text(encoding='utf-8'))
    for path, expected in history.items():
        require(digest(ROOT / path) == expected, f'Historical evidence changed: {path}')
    samples = native['layout_samples']
    require({(r['size'], r['application_scale']) for r in samples} ==
            {(size, scale) for size in ('default', 'minimum') for scale in (1, 1.25, 1.5, 1.75, 2)}, 'Missing scale sample')
    require(len(samples) == 10 and native['native_smoke_completed'], 'Native review incomplete')
    for sample in samples:
        require(sample['layout_passed'] and sample['capture_pixels'][0] >= sample['client_pixels'][0] and sample['capture_pixels'][1] >= sample['client_pixels'][1], 'Incomplete or clipped layout sample')
        path = ROOT / sample['log']
        require(digest(path) == sample['log_sha256'], f'Changed native log: {path}')
        log = path.read_text(encoding='utf-8-sig')
        checks = re.findall(r'^M9_CHECK ([a-z-]+) PASS elapsed_ms=\d+\s*$', log, re.M)
        require(len(checks) == 61 and set(checks) == REQUIRED and 'M9_INTEGRATED_FAIL' not in log, 'Layout journey incomplete')
        require('M9_INTEGRATED_PASS cases=61 deliveries=82 rejected=34' in log and 'M9_REVIEW_READY SYNTH-001 CoverSheet MED-03' in log, 'Wrong layout review state')
        windows = re.findall(r'^M9_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
        require(len(windows) == 1, 'Missing native geometry')
        width, height, scale = windows[0]
        require([int(width), int(height)] == sample['client_pixels'] and float(scale) == sample['application_scale'], 'Native geometry mismatch')
    receipt = {'scope': 'Milestone 9 mock-only Active Medications bounded code/automated/native checkpoint',
               'checkpoint_passed': True, 'milestone_acceptance_complete': native['spoken_output']['status'] == 'user-reported pass',
               'executable_sha256': executable, 'core_tests': 87, 'timed_checkpoints': 61,
               'actual_deliveries': integrated['delivery_count'], 'rejected_stale_deliveries': integrated['rejected_deliveries'],
               'native_layout_samples': 10, 'spoken_output': native['spoken_output']['status'],
               'receipts_sha256': {f'validation/milestone-9/{name}': digest(BASE / name)
                                  for name in ('automated.json', 'integrated.json', 'native-ui.json', 'static.json', 'historical-bytes.json', 'startup-handoff.md')},
               'review': 'Local self-review; no independent review or original-client runtime parity claimed',
               'boundary': 'Compiled invented records only; no server, transport, credentials, imports, original CPRS execution, DLL internals or clinical writes',
               'limits': ['User listening is separate from native input, UIA snapshots and callback/focus probes.',
                          'No full accessibility, monitor-DPI, physical IME or clinical-compatibility claim.']}
    (BASE / 'acceptance.json').write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(f"Bounded checkpoint verified; Active Medications listening: {receipt['spoken_output']}")


if __name__ == '__main__':
    main()
