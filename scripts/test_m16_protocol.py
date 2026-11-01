"""Temporary-tree M16 receipt/isolation tests; fake binaries/logs are parser fixtures."""
from contextlib import redirect_stdout
import io
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import validate_m16 as runner
import verify_m16 as verifier
import validate_m15 as frozen_m15
import verify_m15 as frozen_verifier
import test_m15_protocol as frozen_protocol


class ProtocolTests(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory(prefix='cprs-m16-protocol-')
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.base = self.root / 'validation/milestone-16' / runner.PLATFORM
        self.base.mkdir(parents=True)
        for name in ('crates/core.rs', 'Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml',
                     'scripts/validate_m16.py', 'scripts/verify_integrated.py', 'scripts/verify_m16.py',
                     'scripts/Test-MockChart.ps1', 'scripts/Review-SearchPages.ps1', 'scripts/test_m16_protocol.py',
              'scripts/validate_m15.py', 'scripts/verify_m15.py', 'scripts/test_m15_protocol.py',
              'scripts/Review-OrdersFilters.ps1', '.github/workflows/mock-checks.yml'):
            p = self.root / name
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text('synthetic protocol fixture\n')
        self.historical = self.root / 'validation/milestone-12/sentinel.log'
        self.historical.parent.mkdir(parents=True)
        self.historical.write_bytes(b'historical receipt bytes\r\n')
        self.binary = self.root / 'target/debug/cprs-chart-mock'
        self.binary.parent.mkdir(parents=True)
        self.binary.write_bytes(b'parser fixture, not executable')
        self.patches = [patch.object(module, attr, value) for module in (runner, verifier)
                        for attr, value in (('ROOT', self.root), ('BASE', self.base))]
        for p in self.patches:
            p.start()
            self.addCleanup(p.stop)
        self.auto = {'protocol': 'M16', 'passed': True, 'code_only': False,
                     'dependency_bootstrap_requested': False, 'matrix_requested': False,
                     'executable': self.binary.relative_to(self.root).as_posix(),
                     'executable_sha256': runner.digest(self.binary), 'source_sha256': verifier.source_inputs(),
                     'preserved_evidence_sha256': {'validation/milestone-12/sentinel.log': runner.digest(self.historical)}, 'checks': []}
        lines = [f'M16_CHECK {name} PASS elapsed_ms=1' for name in sorted(verifier.REQUIRED)]
        lines += ['M16_DELIVERY fixture SYNTH-001 "a" generation=1 applied=false',
                  'M16_DELIVERY fixture SYNTH-001 "b" generation=2 applied=true',
                  f'M16_INTEGRATED_PASS cases={len(verifier.REQUIRED)} deliveries=2 rejected=1 elapsed_ms=1',
                  'M16_WINDOW client_width_px=1180 client_height_px=800 application_scale=1']
        for name in ('format', 'clippy', 'tests', 'build', 'callbacks', 'integrated'):
            p = self.base / (name + '.log')
            p.write_text('\n'.join(lines) + '\n' if name == 'integrated' else '')
            self.auto['checks'].append({'name': name, 'passed': True, 'exit_code': 0,
                                       'log': p.relative_to(self.root).as_posix(), 'log_sha256': runner.digest(p)})
        self.write_receipt()

    def write_receipt(self):
        (self.base / 'automated.json').write_text(json.dumps(self.auto))

    def test_valid_complete_source_bound_receipt(self):
        auto, journeys = verifier.verify()
        self.assertTrue(auto['passed'])
        self.assertEqual(len(journeys['integrated']['checkpoints']), 121)

    def test_missing_search_page_checkpoint_is_rejected(self):
        p = self.base / 'integrated.log'
        p.write_text('\n'.join(line for line in p.read_text().splitlines() if not line.startswith('M16_CHECK search-page-invalid ')) + '\n')
        self.auto['checks'][-1]['log_sha256'] = runner.digest(p)
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'checkpoints'):
            verifier.verify()

    def test_changed_step_log_is_rejected(self):
        (self.base / 'tests.log').write_bytes(b'changed')
        with self.assertRaisesRegex(ValueError, 'changed step log'):
            verifier.verify()

    def test_added_crate_file_is_rejected(self):
        (self.root / 'crates/extra.rs').write_text('extra source')
        with self.assertRaisesRegex(ValueError, 'file set changed'):
            verifier.verify()

    def test_changed_executable_is_rejected(self):
        self.binary.write_bytes(b'different executable')
        with self.assertRaisesRegex(ValueError, 'Executable differs'):
            verifier.verify()

    def test_historical_receipt_and_protocol_are_rejected(self):
        self.auto['protocol'] = 'M12'
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'another protocol'):
            verifier.verify()

    def test_historical_log_is_rejected_even_with_updated_hash(self):
        p = self.base / 'integrated.log'
        p.write_text(p.read_text().replace('M16_', 'M12_'))
        self.auto['checks'][-1]['log_sha256'] = runner.digest(p)
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'checkpoints'):
            verifier.verify()

    def test_requested_matrix_requires_every_sample(self):
        self.auto['matrix_requested'] = True
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'Missing or duplicate automated'):
            verifier.verify()

    def test_reported_scale_mismatch_is_rejected(self):
        p = self.base / 'integrated.log'
        p.write_text(p.read_text().replace('application_scale=1', 'application_scale=2'))
        self.auto['checks'][-1]['log_sha256'] = runner.digest(p)
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'geometry mismatch'):
            verifier.verify()

    def test_delivery_summary_cannot_hide_missing_deliveries(self):
        p = self.base / 'integrated.log'
        p.write_text(p.read_text().replace('deliveries=2 rejected=1', 'deliveries=3 rejected=1'))
        self.auto['checks'][-1]['log_sha256'] = runner.digest(p)
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'Delivery audit count mismatch'):
            verifier.verify()

    def test_evidence_log_cannot_point_to_historical_folder(self):
        self.auto['checks'][0]['log'] = 'validation/milestone-12/sentinel.log'
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'outside M16'):
            verifier.verify()

    def test_historical_byte_change_is_rejected(self):
        self.historical.write_bytes(b'mutated history')
        with self.assertRaisesRegex(ValueError, 'Historical evidence changed'):
            verifier.verify()

    def test_runner_rejects_old_milestone_before_writing(self):
        before = self.historical.read_bytes()
        with self.assertRaises(SystemExit), redirect_stdout(io.StringIO()), patch('sys.stderr', io.StringIO()):
            runner.main(['--milestone', '12'])
        self.assertEqual(self.historical.read_bytes(), before)

    def test_m15_protocol_and_milestone_cannot_be_reused_for_m16(self):
        self.auto['protocol'] = 'M15'
        self.write_receipt()
        with self.assertRaisesRegex(ValueError, 'another protocol'):
            verifier.verify()
        before = self.historical.read_bytes()
        with self.assertRaises(SystemExit), patch('sys.stderr', io.StringIO()):
            runner.main(['--milestone', '15'])
        self.assertEqual(self.historical.read_bytes(), before)

    def test_frozen_m15_writer_exits_before_touching_historical_destination(self):
        with patch.object(frozen_m15, 'BASE', self.historical.parent):
            with self.assertRaisesRegex(SystemExit, 'frozen history'):
                frozen_m15.main(['--matrix'])
        self.assertEqual(self.historical.read_bytes(), b'historical receipt bytes\r\n')

    def test_frozen_m15_verifier_and_protocol_entrypoints_cannot_write(self):
        before = {p: p.read_bytes() for p in self.root.rglob('*') if p.is_file()}
        for module in (frozen_verifier, frozen_protocol):
            with self.assertRaisesRegex(SystemExit, 'frozen history'):
                module.main()
        self.assertEqual(before, {p: p.read_bytes() for p in self.root.rglob('*') if p.is_file()})

    def test_runner_hashes_silent_logs_and_removes_stale_failed_outputs(self):
        failure = [False]
        def cargo(command, **options):
            if command[1] == 'build':
                binary = self.root / 'target/debug' / ('cprs-chart-mock.exe' if runner.PLATFORM == 'windows' else 'cprs-chart-mock')
                binary.write_bytes(b'fake Cargo fixture')
            return SimpleNamespace(returncode=7 if failure[0] and command[1] == 'test' else 0)
        with patch.object(runner.subprocess, 'run', cargo), redirect_stdout(io.StringIO()):
            runner.main(['--code-only'])
            self.assertEqual((self.base / 'format.log').read_bytes(), b'')
            receipt = json.loads((self.base / 'code-checks.json').read_text())
            self.assertTrue(receipt['passed'])
            failure[0] = True
            with self.assertRaises(SystemExit):
                runner.main(['--code-only'])
        self.assertFalse(json.loads((self.base / 'code-checks.json').read_text())['passed'])
        self.assertFalse((self.base / 'build.log').exists())
        self.assertEqual(self.historical.read_bytes(), b'historical receipt bytes\r\n')

    def test_matrix_runner_does_not_forward_its_flags_to_verifier(self):
        def command(args, **options):
            if len(args) > 1 and args[1] == 'build':
                binary = self.root / 'target/debug' / ('cprs-chart-mock.exe' if runner.PLATFORM == 'windows' else 'cprs-chart-mock')
                binary.write_bytes(b'fake Cargo fixture')
            return SimpleNamespace(returncode=0)
        with patch.object(runner.subprocess, 'run', command), patch.object(verifier, 'main') as verify, redirect_stdout(io.StringIO()):
            runner.main(['--matrix'])
            verify.assert_called_once_with([])


def main():
    output = io.StringIO()
    result = unittest.TextTestRunner(stream=output, verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(ProtocolTests))
    runner.BASE.mkdir(parents=True, exist_ok=True)
    log = runner.BASE / 'protocol-tests.log'
    log.write_text(output.getvalue())
    (runner.BASE / 'tooling-review.json').write_text(json.dumps({
        'protocol': 'M16', 'scope': __doc__, 'passed': result.wasSuccessful(),
        'tests_run': result.testsRun, 'failures': len(result.failures), 'errors': len(result.errors),
        'log_sha256': runner.digest(log), 'script_sha256': runner.digest(Path(__file__)),
    }, indent=2) + '\n')
    print(output.getvalue())
    if not result.wasSuccessful():
        raise SystemExit(1)


if __name__ == '__main__':
    main()
