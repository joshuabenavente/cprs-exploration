"""Cross-platform M16F100 runner; all outputs stay in a platform-specific M16F100 folder."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
PLATFORM = 'windows' if sys.platform == 'win32' else 'linux'
BASE = ROOT / 'validation/milestone-16/functional-100' / PLATFORM


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs():
    files = [p for p in (ROOT / 'crates').rglob('*') if p.is_file()]
    files += [ROOT / p for p in ('Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml',
              'scripts/validate_m16_functional.py', 'scripts/verify_integrated.py', 'scripts/verify_m16_functional.py',
              'scripts/Test-MockChart.ps1', 'scripts/Review-Functional.ps1', 'scripts/test_m16_functional_protocol.py',
              'scripts/validate_m16.py', 'scripts/verify_m16.py', 'scripts/test_m16_protocol.py',
              'scripts/Review-SearchPages.ps1', '.github/workflows/mock-checks.yml')]
    return {p.relative_to(ROOT).as_posix(): hashlib.sha256(p.read_bytes().replace(b'\r\n', b'\n')).hexdigest() for p in sorted(files)}


def historical():
    return {p.relative_to(ROOT).as_posix(): digest(p)
            for folder in ('analysis', 'reverse-engineering', 'validation')
            for p in (ROOT / folder).rglob('*') if p.is_file()
            and not p.is_relative_to(ROOT / 'validation/milestone-16/functional-100')}


def main(argv=None):
    raise SystemExit('M16F100 is frozen history; use the M17F100 entry points.')

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--milestone', type=int, choices=[16], default=16)
    parser.add_argument('--code-only', action='store_true')
    parser.add_argument('--bootstrap', action='store_true')
    parser.add_argument('--matrix', action='store_true')
    args = parser.parse_args(argv)
    if args.code_only and args.matrix:
        parser.error('--matrix requires desktop checks')
    BASE.mkdir(parents=True, exist_ok=True)
    receipt_path = BASE / ('code-checks.json' if args.code_only else 'automated.json')
    # Remove stale same-platform outputs before starting; no historical paths.
    receipt_path.unlink(missing_ok=True)
    if not args.code_only:
        (BASE / 'integrated.json').unlink(missing_ok=True)
    names = ['bootstrap', 'format', 'clippy', 'tests', 'build', 'callbacks', 'integrated']
    names += [f'probe-{size}-{percent}' for size in ('default', 'minimum') for percent in (100,)]
    for name in names:
        (BASE / (name + '.log')).unlink(missing_ok=True)
    source = inputs()
    preserved = historical()
    binary = ROOT / 'target/debug' / ('cprs-chart-mock.exe' if PLATFORM == 'windows' else 'cprs-chart-mock')
    steps = [('format', ['cargo', 'fmt', '--all', '--', '--check']),
             ('clippy', ['cargo', 'clippy', '--workspace', '--all-targets', '--locked', '--offline', '--', '-D', 'warnings']),
             ('tests', ['cargo', 'test', '--workspace', '--locked', '--offline']),
             ('build', ['cargo', 'build', '-p', 'cprs-chart-mock', '--locked', '--offline'])]
    if args.bootstrap:
        steps.insert(0, ('bootstrap', ['cargo', 'fetch', '--locked']))
    if not args.code_only:
        steps += [('callbacks', [str(binary), '--smoke-check']), ('integrated', [str(binary), '--integration-check'])]
    if args.matrix:
        steps += [(f'probe-{size}-{percent}', [str(binary), '--integration-check'] + (['--minimum-size'] if size == 'minimum' else []))
                  for size in ('default', 'minimum') for percent in (100,)]
    results = []
    built_hash = None
    failure = None
    try:
        for name, command in steps:
            env = os.environ.copy()
            env['CARGO_INCREMENTAL'] = '0'
            # Slint may freeze scale at compile time. Runtime overrides only.
            env.pop('SLINT_SCALE_FACTOR', None)
            if name == 'callbacks' or name == 'integrated' or name.startswith('probe-'):
                env['SLINT_SCALE_FACTOR'] = str(int(name.rsplit('-', 1)[1]) / 100) if name.startswith('probe-') else '1'
            log = BASE / (name + '.log')
            print('Running', name, flush=True)
            with log.open('wb') as stream:
                try:
                    result = subprocess.run(command, cwd=ROOT, env=env, stdout=stream, stderr=subprocess.STDOUT, timeout=1200 if command[0] == 'cargo' else 120)
                    code = result.returncode
                except (OSError, subprocess.TimeoutExpired) as error:
                    stream.write(str(error).encode())
                    code = 1
            results.append({'name': name, 'command': command, 'exit_code': code, 'passed': code == 0,
                            'log': log.relative_to(ROOT).as_posix(), 'log_sha256': digest(log)})
            if code:
                failure = name
                break
            if name == 'build':
                built_hash = digest(binary)
        if inputs() != source:
            failure = 'source/build inputs changed during validation'
        if historical() != preserved:
            failure = 'historical evidence changed during validation'
        if built_hash and digest(binary) != built_hash:
            failure = 'executable changed during validation'
    finally:
        receipt = {'protocol': 'M16F100', 'platform': PLATFORM, 'checked_at': datetime.now(timezone.utc).isoformat(),
                   'scope': 'M16 functional code/build/callback/timer validation at 100%; keyboard/focus/navigation and screen readers excluded',
                   'passed': failure is None and len(results) == len(steps), 'failure': failure,
                   'code_only': args.code_only, 'matrix_requested': args.matrix,
                   'dependency_bootstrap_requested': args.bootstrap, 'checks': results,
                   'executable': binary.relative_to(ROOT).as_posix(), 'executable_sha256': built_hash,
                   'source_sha256': source, 'preserved_evidence_sha256': preserved,
                   'limits': ['Functional scope at 100% only; keyboard/focus/navigation and screen-reader checks excluded by user.',
                              'A new executable does not inherit historical M12 native/listening acceptance.']}
        receipt_path.write_text(json.dumps(receipt, indent=2) + '\n')
    if failure:
        raise SystemExit('M16F100 failed: ' + failure + '; inspect ' + str(BASE))
    if not args.code_only:
        import verify_m16_functional
        verify_m16_functional.main([])
    print('M16F100 functional checks passed at 100%; keyboard/focus/navigation and screen readers excluded.')


if __name__ == '__main__':
    main()
