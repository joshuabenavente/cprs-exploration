"""Independent publication/catalog audit. Never executes shipped analysis tools.

Streams compressed catalogs; does not expand or modify published evidence.
Does not claim a fresh check against the absent original executable.
"""
from collections import Counter
from datetime import datetime, timezone
import gzip
import hashlib
import json
from pathlib import Path
import re
import subprocess

BASE = Path(__file__).resolve().parent
ROOT = BASE.parents[1]
RE = ROOT / 'reverse-engineering'


def read(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def rows(relative):
    path = RE / relative
    op = gzip.open if path.suffix == '.gz' else open
    with op(path, 'rt', encoding='utf-8') as stream:
        for line in stream:
            if line.strip():
                yield json.loads(line)


def safe_path(relative):
    path = (RE / relative).resolve()
    if not path.is_relative_to(RE.resolve()):
        raise ValueError(relative)
    return path


def main():
    manifest = read(RE / 'PUBLICATION-MANIFEST.json')
    publication = read(RE / 'PUBLICATION-VALIDATION.json')
    final = read(RE / 'validation/final-receipt.json')
    coverage = read(RE / 'catalog/coverage.json')
    spec = read(RE / 'specification.json')
    progress = read(RE / 'progress.json')
    stored = []
    compressed = []
    for item in manifest['files']:
        path = safe_path(item['stored_path'])
        stored.append({'path': item['stored_path'],
                       'match': path.stat().st_size == item['stored_bytes'] and sha(path) == item['stored_sha256']})
        if item['compressed']:
            digest = hashlib.sha256()
            size = 0
            with gzip.open(path, 'rb') as stream:
                while chunk := stream.read(1024 * 1024):
                    digest.update(chunk)
                    size += len(chunk)
            compressed.append({'path': item['stored_path'], 'uncompressed_bytes': size,
                               'match': size == item['source_bytes'] and digest.hexdigest() == item['source_sha256']})
    published = [{'path': p, 'match': safe_path(p).is_file() and sha(safe_path(p)) == expected}
                 for p, expected in publication['files'].items()]
    source_index = {item['path']: item for item in manifest['files']}
    receipt_bindings = []
    for section in ('script_hashes', 'document_hashes'):
        for path, expected in final[section].items():
            item = source_index.get(path)
            receipt_bindings.append({'section': section, 'path': path,
                                     'matches_source_manifest': item is not None and item['source_sha256'] == expected,
                                     'matches_stored_bytes': (RE / path).is_file() and sha(RE / path) == expected})
    selected_addresses = {'00a0b3e0', '00a0c6fc', '00ae6bd4', '00ae6cb0', '01011c80',
                          '009ad030', '00e19034', '009916c8', '00996390', '01192018',
                          '00e202f8', '00e19480', '00e21f14', '00be22f4', '00be2334',
                          '00bd615c', '00bd7cb8', '00ea9ee4', '00ff4658',
                          '00cf1898', '00cf235c', '00cf188c', '00cf256c', '00e1df9c', '00a0ddb0'}
    counts = Counter()
    subsystems = Counter()
    addresses = set()
    selected = []
    incomplete = []
    for row in rows('catalog/function-inventory.jsonl.gz'):
        address = row['address']
        if address in addresses:
            raise ValueError('Duplicate function address: ' + address)
        addresses.add(address)
        counts[row['status']] += 1
        counts['external' if row['external'] else 'internal'] += 1
        subsystems[row['subsystem']] += 1
        if not all(k in row for k in ('evidence', 'uncertainties', 'module', 'static_relationships', 'assignment_basis')):
            incomplete.append(address)
        if address in selected_addresses:
            selected.append(row)
    (BASE / 'selected-functions.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in selected))
    thunks = list(rows('catalog/verified-import-thunks.jsonl'))
    small = list(rows('catalog/verified-small-function-semantics.jsonl'))
    forms = list((RE / 'evidence/static/forms').glob('*.json'))
    bindings = list(rows('evidence/static/form-bindings.jsonl'))
    event_count = len(bindings)
    class_count = sum(1 for _ in rows('evidence/static/classes.jsonl'))
    call_count = sum(1 for _ in rows('evidence/inventory-reviewed/calls.jsonl.gz'))
    indirect_count = sum(1 for _ in rows('catalog/unresolved-indirect-calls.jsonl.gz'))
    edge_count = sum(1 for _ in rows('catalog/verified-archived-call-edges.jsonl'))
    changes = read(RE / 'evidence/metadata-changes.json')
    metadata = Counter((x['kind'], x.get('result')) for x in changes)
    batches = [row for p in sorted((RE / 'evidence').glob('batch-*/annotations.json')) for row in read(p)]
    # Verify exported E8 encodings arithmetically, not against unavailable PE bytes.
    direct = []
    bad_edges = []
    instructions = 0
    for path in sorted((RE / 'evidence').glob('batch-*/*.asm')):
        for line in path.read_text().splitlines():
            match = re.match(r'^([0-9a-f]{8})\s+([0-9a-f]+)\s+(.+)$', line)
            if not match:
                continue
            instructions += 1
            site, encoded, mnemonic = match.groups()
            raw = bytes.fromhex(encoded)
            if len(raw) == 5 and raw[0] == 0xe8:
                target = (int(site, 16) + 5 + int.from_bytes(raw[1:], 'little', signed=True)) & 0xffffffff
                printed = re.search(r'CALL 0x([0-9a-f]+)', mnemonic)
                if printed and target != int(printed.group(1), 16):
                    bad_edges.append({'file': str(path.relative_to(RE)), 'site': site})
                direct.append((site, target))
    before = read(ROOT / 'validation/project-review-2026-11-01/historical-before.json')
    historical_changed = [x['path'] for x in before['historical_files'] if sha(ROOT / x['path']) != x['sha256']]
    intake = read(BASE / 'intake.json')
    intake_changed = [x['path'] for x in intake['files'] if sha(ROOT / x['path']) != x['sha256']]
    reference = []
    for item in read(RE / 'reference-input/manifest.json'):
        p = safe_path(item['copy'])
        if not p.is_file() and (RE / (item['copy'] + '.gz')).is_file():
            with gzip.open(RE / (item['copy'] + '.gz'), 'rb') as f:
                copied = f.read()
        else:
            copied = p.read_bytes()
        original = ROOT / item['source'].split('/workspace/cprs-exploration/', 1)[1]
        reference.append({'path': str(original.relative_to(ROOT)),
                          'copied_hash_matches': hashlib.sha256(copied).hexdigest() == item['sha256'],
                          'repository_bytes_match_copy': original.is_file() and original.read_bytes() == copied,
                          'repository_matches_after_text_normalization': original.is_file() and original.read_bytes().replace(b'\r\n', b'\n') == copied.replace(b'\r\n', b'\n')})
    portable_base = ROOT / 'validation/project-review-2026-11-01'
    portable = read(portable_base / 'portable-checks.json')
    prior_audit = read(portable_base / 'artifact-audit.json')
    portable_logs_match = all(sha(portable_base / x['log']) == x['sha256'] for x in portable['checks'])
    portable_inputs_match = all(sha(ROOT / p) == h for p, h in prior_audit['reviewed_source_sha256'].items())
    result = {
        'recorded_at': datetime.now(timezone.utc).isoformat(),
        'source_commit': intake['source_commit'], 'audit_script_sha256': sha(Path(__file__)),
        'scope': 'Independent distribution hash, decompression, catalog and bounded export consistency checks; no original executable execution or fresh PE byte validation',
        'declared_specimen_identity': {
            'executable_hash_agrees': spec['identity']['sha256'] == coverage['target_sha256'] == final['target_sha256'] == manifest['source_target_sha256'] == read(ROOT / 'provenance/chart.lock.json')['files'][0]['sha256'],
            'map_hash_agrees': next(x['sha256'] for x in read(RE / 'evidence/static/summary.json')['inputs'] if x['path'] == 'input/cprs/CPRSChart.map') == read(ROOT / 'provenance/chart.lock.json')['files'][1]['sha256'],
            'new_raw_file_hashing': False,
        },
        'publication_manifest': {'files': len(stored), 'matches': sum(x['match'] for x in stored), 'failures': [x for x in stored if not x['match']]},
        'publication_receipt': {'files': len(published), 'matches': sum(x['match'] for x in published), 'failures': [x for x in published if not x['match']]},
        'gzip_streams': compressed, 'original_receipt_bindings': receipt_bindings,
        'function_inventory': {'unique_entries': len(addresses), 'counts': dict(counts), 'subsystems': dict(subsystems), 'missing_fields': incomplete,
                               'statuses_match_coverage': all(counts[k] == v for k, v in coverage['statuses'].items()),
                               'subsystems_match_coverage': all(subsystems[k] == v['functions'] for k, v in coverage['subsystems'].items()),
                               'selected_rows': len(selected)},
        'scope_catalogs': {'import_thunks': len(thunks), 'small_patterns': len(small), 'forms': len(forms), 'events': event_count, 'classes': class_count,
                          'call_sites': call_count, 'unresolved_indirect': indirect_count, 'archived_direct_edges': edge_count},
        'coverage_copies_agree': coverage == spec['coverage'] == progress['coverage'],
        'bounded_exports': {'exports': len(batches), 'distinct_entries': len({x['address'] for x in batches}),
                            'instructions_in_listings': instructions, 'recorded_instructions_checked': sum(x['instructions_verified'] for x in batches),
                            'E8_encodings_decoded': len(direct), 'E8_mismatches': bad_edges,
                            'export_time_statuses': dict(Counter(x['analysis_status'] for x in batches)),
                            'final_catalog_status': 'selected substantive routines are partially_analyzed; raw export status unresolved is an earlier export-only label'},
        'metadata_change_kinds': [{'kind': k[0], 'result': k[1], 'count': v} for k, v in metadata.items()],
        'cleanup_repairs': read(RE / 'evidence/function-boundary-changes.json'),
        'notes_filter_resource_bindings': [x for x in bindings if x['form'] in ('TfrmNotesByAuthor', 'TfrmNotesByDate')],
        'historical_reference_copies': {'files': len(reference), 'copied_hash_matches': sum(x['copied_hash_matches'] for x in reference),
                                        'repository_exact': sum(x['repository_bytes_match_copy'] for x in reference),
                                        'repository_text_normalized': sum(x['repository_matches_after_text_normalization'] for x in reference),
                                        'differences': [x for x in reference if not x['repository_bytes_match_copy']]},
        'old_1424_files_changed': historical_changed, 'intake_956_files_changed': intake_changed,
        'runtime_changes_upstream': subprocess.check_output(['git', 'diff', '--name-only', intake['previous_head'], intake['source_commit'], '--', 'crates', 'Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml'], cwd=ROOT, text=True).splitlines(),
        'reused_portable_validation': {'receipt_passed': portable['passed'], 'all_log_hashes_match': portable_logs_match,
                                       'all_recorded_runtime_source_hashes_match': portable_inputs_match,
                                       'new_execution': False, 'reason': 'Runtime/build inputs unchanged since independent 96-test, Clippy and formatting run'},
        'limits': ['Raw EXE/MAP, DLLs, original archive and Ghidra project are intentionally excluded from publication.',
                   'Full 204270-call byte verification and specimen hash assertions are inherited from original receipts, not rerun here.',
                   'Decompression validates hash identity of catalogs, not correctness of every classified semantic claim.',
                   'No Rust, native, Narrator, original-client or DLL execution was needed for this evidence-only continuation.'],
    }
    (BASE / 'audit.json').write_text(json.dumps(result, indent=2) + '\n')
    for key in ('publication_manifest', 'publication_receipt', 'function_inventory', 'scope_catalogs', 'bounded_exports', 'historical_reference_copies'):
        value = dict(result[key])
        for k in ('differences', 'subsystems'):
            value.pop(k, None)
        print(key, json.dumps(value))
    print('gzip matches', sum(x['match'] for x in compressed), '/', len(compressed))
    print('historical changes', historical_changed, 'published input changes', intake_changed)


if __name__ == '__main__':
    main()
