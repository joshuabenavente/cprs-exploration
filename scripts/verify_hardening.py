"""Bind M12 automation to source, logs and preserved history; keep acceptance open."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
from verify_integrated import REQUIRED, require

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-12'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(name):
    return json.loads((BASE / name).read_text(encoding='utf-8-sig'))


def main():
    auto, integrated, clean, probes = [read(n) for n in
                                      ('automated.json', 'integrated.json', 'clean-checkout.json', 'probe-run.json')]
    native, ci, tooling = [read(n) for n in ('native-status.json', 'ci-status.json', 'tooling-review.json')]
    require(all(r['protocol'] == 'M12' for r in (auto, integrated, clean, probes, native, ci, tooling)), 'Receipt belongs to another protocol')
    require(tooling['passed'] and tooling['checks'] and all(c['passed'] for c in tooling['checks']), 'Protocol test failed')
    require(digest(ROOT / tooling['log']) == tooling['log_sha256'], 'Protocol test log changed')
    for name, expected in tooling['source_sha256'].items():
        require(hashlib.sha256((ROOT / name).read_bytes().replace(b'\r\n', b'\n')).hexdigest() == expected, 'Protocol tests are stale: ' + name)
    workflow = (ROOT / '.github/workflows/mock-checks.yml').read_bytes().replace(b'\r\n', b'\n')
    require(hashlib.sha256(workflow).hexdigest() == ci['workflow_sha256'], 'CI status belongs to another workflow')
    binary = digest(ROOT / auto['executable'])
    require(native['executable_sha256'] == binary, 'Native/listening status belongs to another executable')
    require(auto['passed'] and integrated['passed'] and clean['passed'], 'Required code/build receipt failed')
    require(binary == auto['executable_sha256'] == integrated['executable_sha256'] == probes['executable_sha256'], 'Executable changed')
    require(digest(BASE / 'automated.json') == integrated['automated_receipt_sha256'], 'Automated receipt changed after journey verification')
    for check in auto['checks']:
        require(check['passed'] and digest(ROOT / check['log']) == check['log_sha256'], 'Step log changed: ' + check['name'])
    require(len(REQUIRED) == 83 and {c['name'] for c in integrated['checkpoints']} == REQUIRED, 'Wrong journey version')
    require(integrated['delivery_count'] == 92 and integrated['rejected_deliveries'] == 38, 'Delivery baseline changed')
    require(digest(ROOT / integrated['log']) == integrated['log_sha256'], 'Integrated log changed')
    tests_check = next(c for c in auto['checks'] if c['name'] == 'tests')
    require(digest(ROOT / tests_check['log']) == tests_check['log_sha256'], 'tests.log is not from the receipt run')
    tests = (ROOT / tests_check['log']).read_text(encoding='utf-8-sig')
    require(sum(map(int, re.findall(r'^test result: ok\. (\d+) passed;', tests, re.M))) == 96, 'Core coverage changed')
    history = read('historical-bytes.json')
    git_blobs = dict(line.split(maxsplit=3)[2:][::-1] for line in subprocess.check_output(
        ['git', 'ls-tree', '-r', 'HEAD', '--', 'analysis', 'validation'], cwd=ROOT, text=True).splitlines())
    for name, entry in history['files'].items():
        require(digest(ROOT / name) == entry['worktree_sha256'], 'Historical workstation bytes changed: ' + name)
        require(git_blobs.get(name) == entry['git_blob'], 'Historical Git blob changed: ' + name)
    require(clean['historical_git_blobs_verified'] == len(history['files']), 'Clean historical coverage mismatch')
    for name, expected in clean['source_sha256'].items():
        # core.autocrlf=false exports canonical LF source bytes. Existing source
        # checkout text may be CRLF; evidence files above still require exact bytes.
        canonical = hashlib.sha256((ROOT / name).read_bytes().replace(b'\r\n', b'\n')).hexdigest()
        require(canonical == expected, 'Clean checkout source is stale: ' + name)
    # Hashing only receipt entries would miss files added later (e.g. a new
    # integration test Cargo discovers automatically); compare the file set too.
    current = set(subprocess.check_output(
        ['git', 'ls-files', '--cached', '--others', '--exclude-standard', '--', 'crates'],
        cwd=ROOT, text=True).splitlines())
    require(current == set(clean['source_sha256']), 'Clean checkout source set differs from current crates/')
    build_inputs = {}
    for name in ('Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml'):
        # Uncommitted snapshot trees are workstation-local objects. Bind the
        # checked bytes in the receipt so fresh clones need no orphan Git tree.
        canonical = (ROOT / name).read_bytes().replace(b'\r\n', b'\n')
        build_inputs[name] = hashlib.sha256(canonical).hexdigest()
        require(build_inputs[name] == clean['build_input_sha256'][name], 'Clean checkout build input is stale: ' + name)
    require(digest(BASE / 'clean-checkout.log') == clean['log_sha256'], 'Clean checkout log changed')
    published = None
    if (BASE / 'published-clone.json').exists():
        published = read('published-clone.json')
        require(published['passed'] and published['code_checks']['passed'], 'Published clone failed')
        require(digest(BASE / 'published-clone.log') == published['log_sha256'], 'Published clone log changed')
    if ci['ci_passed']:
        require(ci['runs'] and all(r['status'] == 'completed' and r['conclusion'] == 'success' for r in ci['runs']), 'CI evidence is incomplete')
        # A matching workflow hash alone could describe CI on another commit.
        expected_commit = published['commit'] if published is not None else ci['commit']
        require({r['headSha'] for r in ci['runs']} == {expected_commit}, 'CI runs belong to another commit')
    samples = probes['samples']
    require(len(samples) == 10 and {(r['size'], float(r['scale'])) for r in samples} ==
            {(size, scale) for size in ('default', 'minimum') for scale in (1, 1.25, 1.5, 1.75, 2)}, 'Missing probe matrix sample')
    observations = []
    for sample in samples:
        path = ROOT / sample['log']
        require(sample['exit_code'] == 0 and digest(path) == sample['log_sha256'], 'Failed/changed probe log')
        log = path.read_text(encoding='utf-8-sig')
        checks = re.findall(r'^M12_CHECK ([a-z-]+) PASS elapsed_ms=\d+\s*$', log, re.M)
        require(len(checks) == len(REQUIRED) and set(checks) == REQUIRED and 'M12_INTEGRATED_FAIL' not in log, 'Incomplete probe journey')
        require(f'M12_INTEGRATED_PASS cases={len(REQUIRED)} deliveries=92 rejected=38' in log, 'Probe summary changed')
        rows = re.findall(r'^M12_LAYOUT panel=(\d) top=([\d.-]+) bottom=([\d.-]+) table_bottom=([\d.-]+) view_top=([\d.-]+) help_bottom=([\d.-]+) viewport_top=([\d.-]+) viewport_bottom=([\d.-]+) content_height=([\d.-]+) scroll_y=([\d.-]+)\s*$', log, re.M)
        require(len(rows) == 5 and {int(r[0]) for r in rows} == set(range(5)), 'Missing panel geometry')
        geometry = []
        for row in rows:
            panel, top, bottom, table, view, help_bottom, vp_top, vp_bottom, content, scroll = map(float, row)
            require(top >= vp_top - 1 and table <= vp_bottom + 1 and table <= view <= help_bottom <= bottom,
                    'Clipped/overlapping panel geometry')
            geometry.append({'panel': int(panel), 'content_top': top - vp_top - scroll,
                             'content_bottom': bottom - vp_top - scroll, 'content_height': content})
        require(geometry[0]['content_top'] == geometry[1]['content_top'], 'Top row changed')
        for before, after in zip(geometry[1:], geometry[2:]):
            require(after['content_top'] > before['content_bottom'], 'Panel cards overlap')
        windows = re.findall(r'^M12_WINDOW client_width_px=(\d+) client_height_px=(\d+) application_scale=([0-9.]+)\s*$', log, re.M)
        require(len(windows) == 1, 'Missing window geometry')
        width, height, scale = windows[0]
        logical = (980, 680) if sample['size'] == 'minimum' else (1180, 700 if float(scale) == 2 else 800)
        require(float(scale) == float(sample['scale']) and [int(width), int(height)] == [round(v * float(scale)) for v in logical], 'Window size/scale mismatch')
        observations.append({**sample, 'client_pixels': [int(width), int(height)], 'geometry': geometry})
    # This receipt intentionally cannot promote unavailable native/listening/CI
    # evidence into acceptance. Future native review needs its own bound receipt.
    receipt = {
        'protocol': 'M12',
        'scope': 'M12 local code/build/timer/geometry checkpoint; separate native/listening/remote CI statuses below',
        'local_automated_checkpoint_passed': True, 'milestone_acceptance_complete': False,
        'executable_sha256': binary, 'core_tests': 96, 'timed_checkpoints': len(REQUIRED),
        'actual_deliveries': 92, 'rejected_stale_deliveries': 38,
        'historical_worktree_and_git_files_verified': len(history['files']),
        'clean_windows_tree_passed': True, 'probe_samples': observations,
        'native_layout_and_keyboard': native['status'],
        'm12_affected_controls_listening': native['m12_listening'],
        'm10_appointments_listening': 'pending; historical acceptance remains unchanged',
        'remote_ci': ci['status'],
        'published_windows_clone': None if published is None else {'passed': published['passed'], 'commit': published['commit']},
        'source_sha256': clean['source_sha256'],
        'build_input_sha256': build_inputs,
        'source_hash_policy': 'Raw LF Git-tree source bytes; current source compared after CRLF-to-LF normalization. Historical evidence remains byte-exact.',
        'receipts_sha256': {n: digest(BASE / n) for n in ('automated.json', 'integrated.json', 'clean-checkout.json', 'probe-run.json', 'historical-bytes.json', 'startup-handoff.md', 'native-status.json', 'ci-status.json', 'tooling-review.json')},
    }
    if published is not None:
        receipt['receipts_sha256']['published-clone.json'] = digest(BASE / 'published-clone.json')
    (BASE / 'acceptance.json').write_text(json.dumps(receipt, indent=2) + '\n', encoding='utf-8')
    print(f"M12 local automated checkpoint passed; listening={native['m12_listening']}; CI={ci['status']}; native review remains open")


if __name__ == '__main__':
    main()
