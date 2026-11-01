"""Read-only verification of the separate M12 native-finding follow-up."""
import hashlib
import json
from pathlib import Path
import re

from verify_integrated import REQUIRED

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-12/native-followup'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def source_matches(path, expected):
    # Captured source hashes are raw workstation bytes. Git may normalize text
    # line endings; accept that difference only for source/build text inputs.
    raw = path.read_bytes()
    lf = raw.replace(b'\r\n', b'\n')
    return expected in {hashlib.sha256(data).hexdigest()
                        for data in (raw, lf, lf.replace(b'\n', b'\r\n'))}


def main():
    receipt = json.loads((BASE / 'checks.json').read_text(encoding='utf-8-sig'))
    require(receipt['passed'] and receipt['matrix_requested'], 'Full matrix did not pass')
    expected = {'format', 'clippy', 'tests', 'build', 'callbacks', 'integrated'} | {
        f'probe-{size}-{scale}' for size in ('default', 'minimum')
        for scale in (100, 125, 150, 175, 200)
    }
    require(len(receipt['checks']) == len(expected) and
            {c['name'] for c in receipt['checks']} == expected, 'Missing or duplicate check')
    require(digest(ROOT / 'target/debug/cprs-chart-mock.exe') == receipt['executable_sha256'],
            'Executable changed')
    for path, sha in receipt['input_sha256'].items():
        require(source_matches(ROOT / path, sha), f'Input changed: {path}')
    actual_crate_files = {str(p.relative_to(ROOT)).replace('\\', '/')
                          for p in (ROOT / 'crates').rglob('*') if p.is_file()}
    require(actual_crate_files == {p for p in receipt['input_sha256'] if p.startswith('crates/')},
            'Crate file set changed')
    for path, sha in receipt['preserved_m12_sha256'].items():
        relative = path.replace('\\', '/').split('/validation/milestone-12/', 1)[1]
        require(digest(ROOT / 'validation/milestone-12' / relative) == sha,
                f'M12 evidence changed since follow-up snapshot: {relative}')
    for check in receipt['checks']:
        require(check['exit_code'] == 0, f"Failed: {check['name']}")
        path = BASE / check['log']
        require(digest(path) == check['log_sha256'], f"Log changed: {check['name']}")
        if check['name'] == 'integrated' or check['name'].startswith('probe-'):
            log = path.read_text(encoding='utf-8-sig')
            checkpoints = re.findall(r'^M12_CHECK ([a-z-]+) PASS elapsed_ms=\d+\s*$', log, re.M)
            require(len(checkpoints) == len(REQUIRED) and set(checkpoints) == REQUIRED,
                    f"Missing journey checks: {check['name']}")
            require(len(re.findall(r'^M12_INTEGRATED_PASS cases=83 deliveries=92 rejected=38 elapsed_ms=\d+\s*$', log, re.M)) == 1
                    and 'M12_INTEGRATED_FAIL' not in log, f"Journey failed: {check['name']}")
            windows = re.findall(r'^M12_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
            require(len(windows) == 1, f"Missing or duplicate window geometry: {check['name']}")
            if check['name'].startswith('probe-'):
                _, size, percent = check['name'].split('-')
                scale = int(percent) / 100
                width = 980 if size == 'minimum' else 1180
                height = 680 if size == 'minimum' else 700 if scale == 2 else 800
                actual_width, actual_height, actual_scale = windows[0]
                require((int(actual_width), int(actual_height), float(actual_scale)) ==
                        (round(width * scale), round(height * scale), scale),
                        f"Requested/observed window geometry or scale mismatch: {check['name']}")
    print('Follow-up verified: 16 checks, ten geometry samples, M12 files unchanged during follow-up checks. '
          'Native acceptance and new-build listening remain separate.')


if __name__ == '__main__':
    main()
