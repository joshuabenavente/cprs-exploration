"""Bind Milestone 8's bounded checkpoint to its final mock and inspectable receipts."""
import hashlib
import json
from pathlib import Path
import re
from verify_integrated import REQUIRED, require

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-8'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    automated, integrated, native, static = [json.loads((BASE / name).read_text(encoding='utf-8-sig'))
                                            for name in ('automated.json', 'integrated.json', 'native-ui.json', 'static.json')]
    executable = digest(ROOT / automated['executable'])
    require(automated['passed'] and integrated['passed'] and static['passed'], 'A required receipt failed')
    require(executable == automated['executable_sha256'] == integrated['executable_sha256'] == native['executable_sha256'], 'Mock executable mismatch')
    require(len(integrated['checkpoints']) == 51 and len(REQUIRED) == 51, 'Wrong journey version')
    for path, expected in static['evidence_sha256'].items():
        require(digest(ROOT / path) == expected, f'Changed static evidence: {path}')
    require(digest(ROOT / integrated['log']) == integrated['log_sha256'], 'Changed integrated log')
    samples = native['layout_samples']
    require({(r['size'], r['application_scale']) for r in samples} ==
            {(size, scale) for size in ('default', 'minimum') for scale in (1, 1.25, 1.5, 1.75, 2)}, 'Missing scale sample')
    require(len(samples) == 10 and native['native_smoke_completed'], 'Native review incomplete')
    for sample in samples:
        path = ROOT / sample['log']
        require(digest(path) == sample['log_sha256'], f'Changed native log: {path}')
        log = path.read_text(encoding='utf-8-sig')
        checks = re.findall(r'^M8_CHECK ([a-z-]+) PASS elapsed_ms=\d+\s*$', log, re.M)
        require(len(checks) == 51 and set(checks) == REQUIRED and 'M8_INTEGRATED_FAIL' not in log, 'Layout journey incomplete')
        require('M8_INTEGRATED_PASS cases=51 deliveries=72 rejected=30' in log and 'M8_REVIEW_READY SYNTH-001 CoverSheet VITAL-03' in log, 'Wrong layout review state')
        windows = re.findall(r'^M8_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
        require(len(windows) == 1, 'Missing native geometry')
        width, height, scale = windows[0]
        require([int(width), int(height)] == sample['client_pixels'] and float(scale) == sample['application_scale'], 'Native geometry mismatch')
    receipt = {'scope': 'Milestone 8 mock-only Vitals bounded code/automated/native checkpoint',
               'checkpoint_passed': True, 'milestone_acceptance_complete': native['spoken_output']['status'] == 'user-reported pass',
               'executable_sha256': executable, 'core_tests': 78, 'timed_checkpoints': 51,
               'actual_deliveries': integrated['delivery_count'], 'rejected_stale_deliveries': integrated['rejected_deliveries'],
               'native_layout_samples': 10, 'spoken_output': native['spoken_output']['status'],
               'receipts_sha256': {f'validation/milestone-8/{name}': digest(BASE / name)
                                  for name in ('automated.json', 'integrated.json', 'native-ui.json', 'static.json')},
               'review': 'Local self-review; no independent review or original-client runtime parity claimed',
               'boundary': 'Compiled invented records only; no server, transport, credentials, imports, original CPRS execution, DLL internals or clinical writes',
               'limits': ['User listening is separate from native input, UIA snapshots and callback/focus probes.',
                          'No full accessibility, monitor-DPI, physical IME or clinical-compatibility claim.']}
    (BASE / 'acceptance.json').write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(f"Bounded checkpoint verified; Vitals listening: {receipt['spoken_output']}")


if __name__ == '__main__':
    main()
