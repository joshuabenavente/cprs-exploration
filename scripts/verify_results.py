"""Verify the pinned, focused Results evidence; this is not runtime parity."""
import csv
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    lock = json.loads((ROOT / 'provenance/chart.lock.json').read_text(encoding='utf-8'))
    for file in lock['files']:
        require(digest(ROOT / file['path']) == file['sha256'].lower(), f"Changed pinned input: {file['path']}")
    base = ROOT / 'analysis/results'
    metadata = dict(line.split('=', 1) for line in (base / 'decompiled/program.txt').read_text().splitlines())
    require(metadata['sha256'] == lock['files'][0]['sha256'], 'Wrong Ghidra specimen')
    require(metadata['automatic_analysis'] == 'false', 'Unexpected whole-program analysis')
    require(metadata['analysis_timeout'] == 'false', 'Ghidra reported an analysis timeout')
    targets = (ROOT / 'provenance/results-targets.txt').read_text().splitlines()
    with (base / 'decompiled/workflow-functions.tsv').open(newline='', encoding='utf-8') as f:
        functions = list(csv.DictReader(f, delimiter='\t'))
    require(len(targets) == len(set(targets)), 'Duplicate target names')
    require({r['function'] for r in functions} == set(targets), 'Exported function set differs from target list')
    with (ROOT / 'analysis/inventory/chart-symbols.tsv').open(newline='', encoding='utf-8') as f:
        symbols = {(r['name'], r['address']) for r in csv.DictReader(f, delimiter='\t')}
    expected = {(name,address) for name,address in symbols if name in set(targets)}
    require(len(functions) == len(expected) and {(r['function'],r['address']) for r in functions} == expected, 'Missing or duplicate MAP overload exports')
    for row in functions:
        require(row['status'] == 'decompiled', f"Incomplete export: {row['function']}")
        require((row['function'], row['address']) in symbols, f"MAP address mismatch: {row['function']}")
        for path in [base / 'decompiled' / row['file'], (base / 'decompiled' / row['file']).with_suffix('.asm'), base / 'resolved' / (row['file'] + '.json')]:
            require(path.is_file() and path.stat().st_size > 0, f'Missing evidence: {path}')
    inventory = json.loads((base / 'resource-inventory.json').read_text())
    require(inventory['executable_sha256'] == metadata['sha256'], 'Wrong resource specimen')
    require(len(inventory['resources']) == 1 and not inventory['not_found'], 'Missing resource evidence')
    require({r['path'][1] for r in inventory['resources']} == {'TFRMLABS'}, 'Unexpected Results resource set')
    for resource in inventory['resources']:
        decoded = json.loads((ROOT / resource['decoded']).read_text(encoding='utf-8'))
        require(decoded['class'], 'Resource has no class')
    files = sorted(p for p in base.rglob('*') if p.is_file() and p.suffix != '.bin')
    receipt = {'scope': 'Pinned static Results evidence only', 'passed': True,
               'target_functions': len(functions), 'decoded_resources': 1,
               'executable_sha256': metadata['sha256'], 'automatic_analysis': False,
               'evidence_sha256': {p.relative_to(ROOT).as_posix(): digest(p) for p in files},
               'limits': ['Decompiler output retains ABI, indirect dispatch, and exception-flow uncertainty.',
                          'RPC strings do not establish server contracts or clinical compatibility.',
                          'Inherited form defaults, complete report/date/view context, and site behavior are not recovered.']}
    output = ROOT / 'validation/milestone-6/static.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(f"Static Results evidence verified: {len(functions)} functions, 1 decoded resource")


if __name__ == '__main__':
    main()
