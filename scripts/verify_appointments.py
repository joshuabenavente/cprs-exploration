"""Verify focused Milestone 10 static evidence; does not claim original runtime parity."""
import csv
import hashlib
import json
from pathlib import Path
from inspect_appointments import recover

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
    base = ROOT / 'analysis/appointments'
    metadata = dict(line.split('=', 1) for line in (base / 'decompiled/program.txt').read_text(encoding='utf-8').splitlines())
    require(metadata['sha256'] == lock['files'][0]['sha256'], 'Wrong specimen')
    require(metadata['automatic_analysis'] == 'false' and metadata['analysis_timeout'] == 'false', 'Unexpected analysis mode/timeout')
    targets = (ROOT / 'provenance/appointments-targets.txt').read_text(encoding='utf-8').splitlines()
    with (base / 'decompiled/workflow-functions.tsv').open(encoding='utf-8', newline='') as f:
        functions = list(csv.DictReader(f, delimiter='\t'))
    with (ROOT / 'analysis/inventory/chart-symbols.tsv').open(encoding='utf-8', newline='') as f:
        symbols = {(r['name'], r['address']) for r in csv.DictReader(f, delimiter='\t')}
    require(len(targets) == len(set(targets)) == len(functions), 'Duplicate/missing targets')
    require({r['function'] for r in functions} == set(targets), 'Target set mismatch')
    for row in functions:
        require(row['status'] == 'decompiled' and (row['function'], row['address']) in symbols, 'MAP/export mismatch')
        for p in [base / 'decompiled' / row['file'], (base / 'decompiled' / row['file']).with_suffix('.asm'), base / 'resolved' / (row['file'] + '.json')]:
            require(p.is_file() and p.stat().st_size > 0, f'Missing evidence: {p}')
    vmt = json.loads((base / 'vmt.json').read_text(encoding='utf-8'))
    require(vmt == recover(), 'VMT evidence differs from original bytes')
    require([r['value'] for r in vmt['slots']] == ['00bd7954', '00bd7cb8', '00bd4908', '00bd35d0'], 'Unexpected Appts dispatch')
    evidence = json.loads((base / 'resolved/workflow-evidence.json').read_text(encoding='utf-8'))
    constructor = next(r for r in evidence if r['address'] == '00bd787c')
    require([v['text'] for v in constructor['delphi_string_literals']] == ['Date/Time', 'Location', 'Action Req'], 'Column literal mismatch')
    population = next(r for r in evidence if r['address'] == '00bd7954')
    require([v['text'] for v in population['delphi_string_literals']] ==
            ['^No Visit Data.', 'No Visit Data.', 'MMM DD, YYYY@hh:nn'], 'Population literal mismatch')
    assembly = (base / 'decompiled' / population['file']).with_suffix('.asm').read_text(encoding='utf-8')
    for site, opcode in [('00bd7ad8', 'MOV EDX,0x2'), ('00bd7b2c', 'MOV EDX,0x3'),
                         ('00bd7b53', 'MOV EDX,0x4')]:
        require(any(line.startswith(site) and line.endswith(opcode) for line in assembly.splitlines()),
                f'Missing bounded row piece instruction: {site}')
    with (base / 'decompiled/workflow-calls.tsv').open(encoding='utf-8', newline='') as f:
        calls = list(csv.DictReader(f, delimiter='\t'))
    require(any(r['caller_address'] == '00bd7cb8' and r['callee_address'] == '009ada80' for r in calls), 'Missing excluded CallVistA boundary call')
    require(any(r['caller_address'] == '00bd4908' and r['callee_address'] == '01007fec' for r in calls), 'Missing ReportBox boundary')
    require(any(r['caller_address'] == '00bd7954' and r['call_site'] == '00bd7b1a'
                and r['callee_address'] == '00432550' for r in calls), 'Missing original date-format boundary')
    require(any(r['caller_address'] == '00bd7954' and r['call_site'] == '00bd7be9'
                and r['callee_address'] == '0067d264' for r in calls), 'Missing bounded finally EndUpdate')
    files = sorted(p for p in base.rglob('*') if p.is_file())
    receipt = {'scope': 'Milestone 10 pinned Appointments static evidence only', 'passed': True,
               'target_functions': len(functions), 'executable_sha256': metadata['sha256'],
               'automatic_analysis': False, 'vmt_slots': 4,
               'evidence_sha256': {p.relative_to(ROOT).as_posix(): digest(p) for p in files},
               'limits': ['Delphi ABI, exception continuations and complete virtual dispatch remain uncertain.',
                          'Appts OnGetDetail reaches CallVistA; inherited OnShowDetail calls ReportBox. Mock text is authored policy.',
                          'No DLL internals, server semantics, conversions or clinical compatibility recovered.']}
    output = ROOT / 'validation/milestone-10/static.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(f'Static Appointments evidence verified: {len(functions)} functions, four VMT slots')


if __name__ == '__main__':
    main()
