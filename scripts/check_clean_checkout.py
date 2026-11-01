"""Export the current source via a private Git index and validate a fresh Windows tree.

No branch/index is changed. The receipt identifies the uncommitted Git tree, not
a published commit. Dependency registries may be cached; the target starts empty.
"""
import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-12'


def git(*args, env=None):
    return subprocess.check_output(['git', *args], cwd=ROOT, env=env).decode().strip()


def long_path(path):
    # Historical analysis paths reach 147 characters; under a deep checkout
    # root they exceed Windows MAX_PATH unless the extended prefix is used.
    return Path('\\\\?\\' + str(Path(path).resolve())) if os.name == 'nt' else Path(path)


def digest(path):
    return hashlib.sha256(long_path(path).read_bytes()).hexdigest()


def main():
    if os.name != 'nt':
        raise RuntimeError('This check requires Windows with the MSVC Rust toolchain')
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S%f')
    local = ROOT / '.local' / ('m12-clean-' + stamp)
    local.mkdir(parents=True)
    destination = local / 'checkout'
    destination.mkdir()
    env = os.environ.copy()
    env['GIT_INDEX_FILE'] = str(local / 'snapshot.index')
    git('read-tree', 'HEAD', env=env)
    changed = git('diff', 'HEAD', '--name-only').splitlines()
    if changed:
        git('add', '-u', '--', *changed, env=env)
    # Include new build/check infrastructure, never ignored workstation files.
    additions = [str(p.relative_to(ROOT)).replace('\\', '/')
                 for folder in ('scripts', '.github') for p in (ROOT / folder).rglob('*')
                 if p.is_file() and p.suffix in ('.py', '.ps1', '.yml', '.yaml')]
    git('add', '--', *additions, 'rust-toolchain.toml',
        'validation/milestone-12/historical-bytes.json',
        'validation/milestone-12/startup-handoff.md', env=env)
    tree = git('write-tree', env=env)
    git('-c', 'core.autocrlf=false', '-c', 'core.longpaths=true', 'checkout-index', '--all',
        '--prefix=' + destination.as_posix() + '/', env=env)
    history = json.loads((BASE / 'historical-bytes.json').read_text(encoding='utf-8'))
    object_format = git('rev-parse', '--show-object-format')
    normalized = []
    for name, entry in history['files'].items():
        data = long_path(destination / name).read_bytes()
        actual_blob = hashlib.new(object_format, b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        if actual_blob != entry['git_blob']:
            raise ValueError('Historical Git blob changed: ' + name)
        if hashlib.sha256(data).hexdigest() != entry['worktree_sha256']:
            original = long_path(ROOT / name).read_bytes()
            if data.replace(b'\r\n', b'\n') != original.replace(b'\r\n', b'\n'):
                raise ValueError('Non-line-ending historical difference: ' + name)
            normalized.append(name)
    for forbidden in ('cprs', 'vista', '.tools', 'analysis/projects', 'target'):
        if (destination / forbidden).exists():
            raise ValueError('Ignored prerequisite leaked into clean tree: ' + forbidden)
    # Every new receipt/export in this snapshot must survive exactly, including
    # the startup manifest that hashes the older workstation bytes.
    for name in ('historical-bytes.json', 'startup-handoff.md'):
        if digest(BASE / name) != digest(destination / 'validation/milestone-12' / name):
            raise ValueError('New evidence checkout bytes changed: ' + name)
    build_env = os.environ.copy()
    build_env.pop('CARGO_TARGET_DIR', None)
    build_env.pop('GIT_INDEX_FILE', None)
    build_env['CARGO_INCREMENTAL'] = '0'
    command = ['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass',
               '-File', str(destination / 'scripts/Test-MockChart.ps1'), '-CodeOnly', '-Bootstrap']
    with (BASE / 'clean-checkout.log').open('w', encoding='utf-8') as log:
        result = subprocess.run(command, cwd=destination, env=build_env, stdout=log, stderr=subprocess.STDOUT)
    checks_path = destination / 'validation/milestone-12/code-checks.json'
    checks = json.loads(checks_path.read_text(encoding='utf-8-sig')) if checks_path.exists() else None
    source_hashes = {p.relative_to(destination).as_posix(): digest(p)
                     for p in (destination / 'crates').rglob('*') if p.is_file()}
    receipt = {
        'protocol': 'M12',
        'scope': 'Fresh Windows Git-tree checkout, explicit core.autocrlf=false, new empty target directory',
        'passed': result.returncode == 0 and checks is not None and checks['passed'],
        'baseline_commit': history['baseline_commit'], 'source_tree': tree,
        'source_status': 'Current uncommitted source exported with a separate Git index; no branch or real index changed',
        'checkout_path': str(destination), 'source_sha256': source_hashes,
        'build_input_sha256': {name: digest(destination / name)
                               for name in ('Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml')},
        'historical_git_blobs_verified': len(history['files']),
        'legacy_crlf_only_differences': normalized,
        'new_startup_evidence_exact': True, 'ignored_specimen_tools_absent': True,
        'command': command, 'exit_code': result.returncode, 'code_checks': checks,
        'log_sha256': digest(BASE / 'clean-checkout.log'),
        'limits': ['Existing Cargo registry cache reused; fetch --locked is a separate online bootstrap step.',
                   'No desktop callback, native keyboard, listening or remote CI claim from this code/build check.',
                   'A fresh clone of a published M12 commit remains pending publication.'],
    }
    (BASE / 'clean-checkout.json').write_text(json.dumps(receipt, indent=2) + '\n', encoding='utf-8')
    print(f"Clean checkout passed={receipt['passed']}; historical blobs={len(history['files'])}; CRLF-only={len(normalized)}")
    if not receipt['passed']:
        raise RuntimeError('Clean checkout failed; inspect clean-checkout.log')


if __name__ == '__main__':
    main()
