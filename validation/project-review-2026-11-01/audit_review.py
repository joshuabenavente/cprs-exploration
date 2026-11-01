"""Read existing evidence without invoking historical receipt writers or executables.

Run from any directory. Output belongs only to this review directory. Hash checks
establish artifact consistency, not truth of captured observations or binary parity.
"""
import ast
from collections import Counter
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import subprocess

BASE = Path(__file__).resolve().parent
ROOT = BASE.parents[1]
FOLLOWUP = ROOT / 'validation/milestone-12/native-followup'


def read(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def compare(path, expected, source=False):
    if not path.is_file():
        return 'missing'
    if sha(path) == expected:
        return 'exact'
    if source:
        lf = path.read_bytes().replace(b'\r\n', b'\n')
        if expected in {hashlib.sha256(x).hexdigest() for x in (lf, lf.replace(b'\n', b'\r\n'))}:
            return 'line_endings_only'
    return 'mismatch'


def summary(rows):
    return dict(Counter(row['status'] for row in rows))


def main():
    checks = read(FOLLOWUP / 'checks.json')
    acceptance = read(FOLLOWUP / 'user-acceptance.json')
    index = read(FOLLOWUP / 'index.json')
    source = [{'path': p, 'status': compare(ROOT / p, h, source=True)}
              for p, h in checks['input_sha256'].items()]
    # Read the literal checkpoint set without importing any historical writer.
    tree = ast.parse((ROOT / 'scripts/verify_integrated.py').read_text())
    required = next(ast.literal_eval(n.value) for n in tree.body
                    if isinstance(n, ast.Assign)
                    and any(isinstance(t, ast.Name) and t.id == 'REQUIRED' for t in n.targets))
    logs = []
    journeys = []
    for check in checks['checks']:
        path = FOLLOWUP / check['log']
        logs.append({'name': check['name'], 'status': compare(path, check['log_sha256']),
                     'recorded_exit_code': check['exit_code']})
        if not path.is_file() or not (check['name'] == 'integrated' or check['name'].startswith('probe-')):
            continue
        raw = path.read_text(encoding='utf-8-sig')
        names = re.findall(r'^M12_CHECK ([a-z-]+) PASS elapsed_ms=\d+\s*$', raw, re.M)
        windows = re.findall(r'^M12_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', raw, re.M)
        geometry_matches = None
        if check['name'].startswith('probe-'):
            _, size, percent = check['name'].split('-')
            scale = int(percent) / 100
            width = 980 if size == 'minimum' else 1180
            height = 680 if size == 'minimum' else 700 if scale == 2 else 800
            geometry_matches = (len(windows) == 1 and
                                tuple(map(float, windows[0])) == (round(width * scale), round(height * scale), scale))
        journeys.append({'name': check['name'], 'checkpoints': len(names),
                         'complete_checkpoint_set': len(names) == len(required) and set(names) == required,
                         'pass_83_deliveries_92_rejected_38': len(re.findall(r'^M12_INTEGRATED_PASS cases=83 deliveries=92 rejected=38 elapsed_ms=\d+\s*$', raw, re.M)) == 1 and 'M12_INTEGRATED_FAIL' not in raw,
                         'window': windows, 'requested_geometry_matches': geometry_matches})
    indexed = []
    for path, expected in index['files_sha256'].items():
        actual = 'report-before-user-acceptance.md' if path == 'report.md' else path
        indexed.append({'indexed_path': path, 'verified_path': actual,
                        'status': compare(FOLLOWUP / actual, expected)})
    preserved = []
    for path, expected in checks['preserved_m12_sha256'].items():
        relative = path.replace('\\', '/').split('/validation/milestone-12/', 1)[1]
        preserved.append({'path': relative, 'status': compare(ROOT / 'validation/milestone-12' / relative, expected)})
    static = []
    for path in sorted((ROOT / 'validation').glob('milestone-*/static.json')):
        receipt = read(path)
        rows = [{'path': p, 'status': compare(ROOT / p, h)}
                for p, h in receipt.get('evidence_sha256', {}).items()]
        static.append({'receipt': str(path.relative_to(ROOT)), 'summary': summary(rows), 'files': rows})
    before = read(BASE / 'historical-before.json')
    unchanged = [{'path': row['path'], 'status': compare(ROOT / row['path'], row['sha256'])}
                 for row in before['historical_files']]
    actual_crates = {str(p.relative_to(ROOT)) for p in (ROOT / 'crates').rglob('*') if p.is_file()}
    recorded_crates = {p for p in checks['input_sha256'] if p.startswith('crates/')}
    lock = read(ROOT / 'provenance/chart.lock.json')
    specimen = [{'path': row['path'], 'status': compare(ROOT / row['path'], row['sha256'])} for row in lock['files']]
    known_symbols = {}
    wanted = {'ORNet.SetParams', 'fNotes.TfrmNotes.SaveEditedNote', 'Wsockc.TXWBWinsock.NetStart',
              'RpcSLogin.StartProgSLogin', 'rMisc.LoadDll', 'rTIU.CosignDocument', 'rTIU.SignDocument'}
    for line in (ROOT / 'analysis/inventory/chart-symbols.tsv').read_text().splitlines():
        parts = line.split('\t')
        if len(parts) >= 2 and parts[1] in wanted:
            known_symbols[parts[1]] = parts[0]
    sample_expected = {f'{size}-{scale}' for size in ('default', 'minimum') for scale in (100, 125, 150, 175, 200)}
    report_mapping = acceptance['historical_report_preservation']
    preparation = acceptance['supporting_preparation']
    result = {
        'recorded_at': datetime.now(timezone.utc).isoformat(),
        'head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
        'audit_script_sha256': sha(Path(__file__)),
        'reviewed_source_sha256': {str(p.relative_to(ROOT)): sha(p) for p in sorted(
            [*(ROOT / 'crates').rglob('*.rs'), *(ROOT / 'crates').rglob('*.slint'),
             *(ROOT / 'crates').rglob('*.toml'), *(ROOT / 'crates').rglob('*.txt'),
             ROOT / 'Cargo.toml', ROOT / 'Cargo.lock', ROOT / 'rust-toolchain.toml'])},
        'scope': 'Independent read-only artifact audit; no original-client execution, Windows rebuild, native input, or listening rerun',
        'new_analysis_workspace_present': Path('/workspace/reverse-engineering').is_dir(),
        'new_analysis_bundle_present': Path('/workspace/reverse-engineering/cprs-reverse-engineering.zip').is_file(),
        'specimen': specimen,
        'reviewed_windows_executable': {'path': 'target/debug/cprs-chart-mock.exe',
                                       'status': compare(ROOT / 'target/debug/cprs-chart-mock.exe', checks['executable_sha256'])},
        'source_bindings': {'summary': summary(source), 'files': source, 'crate_file_set_matches': actual_crates == recorded_crates},
        'followup_logs': logs, 'recorded_journeys': journeys,
        'followup_index': {'summary': summary(indexed), 'files': indexed},
        'preserved_m12': {'summary': summary(preserved), 'files': preserved},
        'static_receipt_artifacts': static,
        'user_report_receipt': {
            'receipt': str((FOLLOWUP / 'user-acceptance.json').relative_to(ROOT)),
            'executable_hash_agrees_with_checks_and_index': acceptance['executable_sha256'] == checks['executable_sha256'] == index['corrected_executable_sha256'],
            'complete_unique_sample_set': len(acceptance['samples']) == 10 and {s['sample'] for s in acceptance['samples']} == sample_expected,
            'preparation_log': compare(ROOT / preparation['path'], preparation['sha256']),
            'preserved_report': compare(FOLLOWUP / report_mapping['preserved_path'], report_mapping['sha256']),
            'classification': 'user-reported; build reference inherited from preceding instructions, not independently repeated by user',
        },
        'map_symbols_only': known_symbols,
        'historical_preservation': {'summary': summary(unchanged), 'changed': [r for r in unchanged if r['status'] != 'exact']},
        'limits': ['Missing executable prevents complete verification by verify_cover_followup.py.',
                   'Existing assembly, resource, and VMT exports were inspected; absent specimen prevents new byte-level verification.',
                   'No new reverse-engineering inventory, call-destination, metadata, or TIU semantic claim was verified.',
                   'Matching log hashes and parsing stored journeys are not new executions of those journeys.'],
    }
    (BASE / 'artifact-audit.json').write_text(json.dumps(result, indent=2) + '\n')
    for label in ['source_bindings', 'followup_index', 'preserved_m12', 'historical_preservation']:
        print(label, result[label]['summary'])
    for item in static:
        print(item['receipt'], item['summary'])
    print('stored journeys complete:', all(j['complete_checkpoint_set'] and j['pass_83_deliveries_92_rejected_38'] for j in journeys))
    print('geometry samples match:', sum(j['requested_geometry_matches'] is True for j in journeys))


if __name__ == '__main__':
    main()
