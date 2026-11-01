"""Exercise M12 output isolation, silent logs and receipt rejection in temporary trees.

The Cargo shim and parser fixtures are synthetic test inputs, never build or
desktop evidence. The test receipt describes only these validation-tool checks.
"""
import datetime
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import verify_integrated as integrated

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-12'
BOUND_SOURCES = (
    'scripts/test_validation_protocol.py', 'scripts/Test-MockChart.ps1',
    'scripts/Get-MockFileSha256.ps1', 'scripts/verify_integrated.py',
    'scripts/verify_hardening.py', 'scripts/check_clean_checkout.py',
    'scripts/Test-CoverSheetLayout.ps1', 'scripts/Review-CoverSheet.ps1',
    'scripts/audit_m12_bytes.py', '.github/workflows/mock-checks.yml',
)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


class RunnerTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix='cprs-m12-runner-')
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        (self.root / 'scripts').mkdir()
        for name in ('Test-MockChart.ps1', 'Get-MockFileSha256.ps1'):
            shutil.copy2(ROOT / 'scripts' / name, self.root / 'scripts' / name)
        self.historical = self.root / 'validation/milestone-11/sentinel.log'
        self.historical.parent.mkdir(parents=True)
        self.historical.write_bytes(b'historical evidence\r\n')
        self.receipt = self.root / 'validation/milestone-12/code-checks.json'

    def invoke(self, fail=False, historical=False):
        # Function precedence substitutes Cargo only in this disposable process.
        shim = "function global:cargo { $global:LASTEXITCODE = 0 }"
        if fail:
            shim = "function global:cargo { if ($args[0] -eq 'test') { $global:LASTEXITCODE = 7; 'deliberate test failure' } else { $global:LASTEXITCODE = 0 } }"
        invocation = "& './scripts/Test-MockChart.ps1' -CodeOnly"
        if historical:
            invocation += ' -Milestone 11'
        return subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command',
                               "$ErrorActionPreference='Stop'; " + shim + '; ' + invocation],
                              cwd=self.root, capture_output=True, text=True)

    def test_historical_milestone_is_rejected_before_output(self):
        result = self.invoke(historical=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(self.receipt.exists())
        self.assertEqual(self.historical.read_bytes(), b'historical evidence\r\n')

    def test_silent_steps_create_hashed_logs_only_in_m12(self):
        result = self.invoke()
        self.assertEqual(result.returncode, 0, result.stderr)
        receipt = json.loads(self.receipt.read_text(encoding='utf-8-sig'))
        self.assertTrue(receipt['passed'])
        self.assertEqual(receipt['protocol'], 'M12')
        self.assertEqual(len(receipt['checks']), 4)
        for check in receipt['checks']:
            self.assertTrue(check['log'].startswith('validation/milestone-12/'))
            path = self.root / check['log']
            self.assertEqual(path.read_text(encoding='utf-8-sig').strip(), '')
            self.assertEqual(digest(path), check['log_sha256'])
        self.assertEqual(self.historical.read_bytes(), b'historical evidence\r\n')

    def test_failed_step_invalidates_receipt_and_removes_later_log(self):
        self.assertEqual(self.invoke().returncode, 0)
        result = self.invoke(fail=True)
        self.assertNotEqual(result.returncode, 0)
        receipt = json.loads(self.receipt.read_text(encoding='utf-8-sig'))
        self.assertFalse(receipt['passed'])
        self.assertEqual([c['name'] for c in receipt['checks']], ['format', 'clippy', 'tests'])
        self.assertFalse((self.receipt.parent / 'build.log').exists())
        self.assertEqual(self.historical.read_bytes(), b'historical evidence\r\n')


class VerifierTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix='cprs-m12-parser-')
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.base = self.root / 'validation/milestone-12'
        self.base.mkdir(parents=True)
        binary = self.root / 'target/debug/cprs-chart-mock.exe'
        binary.parent.mkdir(parents=True)
        binary.write_bytes(b'synthetic parser fixture, not executable')
        self.auto = {'protocol': 'M12', 'passed': True, 'executable': binary.relative_to(self.root).as_posix(),
                     'executable_sha256': digest(binary), 'checks': []}
        lines = [f'M12_CHECK {name} PASS elapsed_ms=1000' for name in sorted(integrated.REQUIRED)]
        lines += [f'M12_DELIVERY fixture SYNTH-001 "fixture" generation={n} applied={str(n > 38).lower()}' for n in range(1, 93)]
        lines += ['M12_INTEGRATED_PASS cases=83 deliveries=92 rejected=38 elapsed_ms=1000',
                  'M12_WINDOW client_width_px=1180 client_height_px=800 application_scale=1']
        (self.base / 'integrated.log').write_text('\n'.join(lines) + '\n', encoding='utf-8')
        for name in ('format', 'clippy', 'tests', 'build', 'callbacks', 'integrated'):
            path = self.base / (name + '.log')
            if name != 'integrated':
                path.write_bytes(b'')
            self.auto['checks'].append({'name': name, 'passed': True,
                                        'log': path.relative_to(self.root).as_posix(), 'log_sha256': digest(path)})
        self.write_auto()

    def write_auto(self):
        (self.base / 'automated.json').write_text(json.dumps(self.auto), encoding='utf-8')

    def verify(self):
        with patch.object(integrated, 'ROOT', self.root), patch.object(integrated, 'BASE', self.base), redirect_stdout(io.StringIO()):
            integrated.main()

    def test_current_log_is_bound_to_automation_receipt(self):
        self.verify()
        receipt = json.loads((self.base / 'integrated.json').read_text(encoding='utf-8'))
        self.assertEqual(receipt['protocol'], 'M12')
        self.assertEqual(receipt['automated_receipt_sha256'], digest(self.base / 'automated.json'))
        self.assertEqual((len(receipt['checkpoints']), receipt['delivery_count'], receipt['rejected_deliveries']), (83, 92, 38))

    def test_changed_step_log_is_rejected(self):
        (self.base / 'tests.log').write_bytes(b'changed bytes')
        with self.assertRaisesRegex(ValueError, 'Step log missing or changed since receipt: tests'):
            self.verify()
        self.assertFalse((self.base / 'integrated.json').exists())

    def test_historical_log_protocol_is_rejected(self):
        path = self.base / 'integrated.log'
        path.write_bytes(path.read_bytes().replace(b'M12_', b'M11_'))
        self.auto['checks'][-1]['log_sha256'] = digest(path)
        self.write_auto()
        with self.assertRaisesRegex(ValueError, 'Missing or duplicate journey checkpoints'):
            self.verify()

    def test_historical_receipt_protocol_is_rejected(self):
        self.auto['protocol'] = 'M11'
        self.write_auto()
        with self.assertRaisesRegex(ValueError, 'Automated receipt belongs to another protocol'):
            self.verify()


class RecordedResult(unittest.TextTestResult):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.checks = []

    def addSuccess(self, test):
        super().addSuccess(test)
        self.checks.append({'name': test.id(), 'passed': True})

    def addFailure(self, test, error):
        super().addFailure(test, error)
        self.checks.append({'name': test.id(), 'passed': False})

    def addError(self, test, error):
        super().addError(test, error)
        self.checks.append({'name': test.id(), 'passed': False})


def main():
    stream = io.StringIO()
    suite = unittest.defaultTestLoader.loadTestsFromModule(__import__(__name__))
    result = unittest.TextTestRunner(stream=stream, verbosity=2, resultclass=RecordedResult).run(suite)
    BASE.mkdir(parents=True, exist_ok=True)
    log = BASE / 'protocol-tests.log'
    log.write_text(stream.getvalue(), encoding='utf-8')
    receipt = {'protocol': 'M12', 'checked_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
               'scope': 'Temporary-tree validation-tool tests; synthetic Cargo/parser fixtures, not desktop or acceptance evidence',
               'passed': result.wasSuccessful(), 'checks': result.checks,
               'log': log.relative_to(ROOT).as_posix(), 'log_sha256': digest(log),
               'source_sha256': {name: hashlib.sha256((ROOT / name).read_bytes().replace(b'\r\n', b'\n')).hexdigest() for name in BOUND_SOURCES}}
    (BASE / 'tooling-review.json').write_text(json.dumps(receipt, indent=2) + '\n', encoding='utf-8')
    print(stream.getvalue())
    if not result.wasSuccessful():
        raise SystemExit(1)


if __name__ == '__main__':
    main()
