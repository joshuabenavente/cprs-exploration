"""Check delivered analysis artifacts against their pinned local inputs."""
import csv
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def walk(component):
    yield component
    for child in component['children']:
        yield from walk(child)


def verify():
    inventory = json.loads((ROOT / 'analysis/inventory/chart-inventory.json').read_text(encoding='utf-8'))
    lock = json.loads((ROOT / 'provenance/chart.lock.json').read_text(encoding='utf-8'))
    checks = []
    toolchain = json.loads((ROOT / 'tools/toolchain.lock.json').read_text(encoding='utf-8'))
    for name, tool in toolchain.items():
        archive = ROOT / '.tools/downloads' / tool['archive']
        with archive.open('rb') as stream:
            digest = hashlib.file_digest(stream, 'sha256').hexdigest()
        checks.append({'check': 'official archive ' + name, 'passed': digest == tool['sha256']})
    for item in lock['files']:
        data = (ROOT / item['path']).read_bytes()
        ok = len(data) == item['bytes'] and hashlib.sha256(data).hexdigest() == item['sha256']
        checks.append({'check': 'input ' + item['path'], 'passed': ok})
    checks.append({'check': 'MAP entry point', 'passed': inventory['map']['entry_matches']})
    for section in inventory['map']['sections']:
        if section['name'] in {'.text', '.itext', '.data', '.bss'}:
            checks.append({'check': 'MAP section ' + section['name'],
                           'passed': section['start_matches'] and section['size_matches']})
    with (ROOT / 'analysis/inventory/chart-symbols.tsv').open(encoding='utf-8', newline='') as f:
        symbols = list(csv.DictReader(f, delimiter='\t'))
    names = {s['name'] for s in symbols}
    forms = []
    for resource in inventory['resources']:
        if 'export' not in resource:
            continue
        raw = ROOT / resource['export']
        offset = resource['file_offset']
        source = (ROOT / 'cprs/CPRSChart.exe').read_bytes()[offset:offset + resource['size']]
        checks.append({'check': raw.name + ' exact resource bytes', 'passed': source == raw.read_bytes()})
        decoded = json.loads(raw.with_suffix('.json').read_text(encoding='utf-8'))
        unit = {'TfrmPtSel': 'fPtSel', 'TfrmFrame': 'fFrame',
                'TfrmDupPts': 'fDupPts', 'TfrmPtSelMsg': 'fPtSelMsg'}[decoded['class']]
        links = []
        for node in walk(decoded):
            for key, value in node['properties'].items():
                if key.startswith('On') and isinstance(value, str):
                    candidate = f"{unit}.{decoded['class']}.{value}"
                    links.append({'control': node['name'], 'event': key, 'handler': value,
                                  'map_symbol': candidate, 'resolved': candidate in names})
        forms.append({'form': decoded['name'], 'resource_sha256': hashlib.sha256(source).hexdigest(),
                      'components': len(list(walk(decoded))), 'events': links})
    required = {
        'fPtSel.SelectPatient', 'fPtSel.TfrmPtSel.cboPatientNeedData',
        'fPtSel.TfrmPtSel.cmdOKClick', 'fPtSel.TfrmPtSel.cmdCancelClick',
        'fPtSel.TfrmPtSel.SelectPtByDFN', 'fFrame.TfrmFrame.SetupPatient',
        'fFrame.TfrmFrame.mnuFileOpenClick', 'rCore.ListPtTop', 'rCore.SelectPatient',
        'rCore.CheckSensitiveRecordAccess', 'rCore.setSubSetOfPatients', 'rCore.setRPLPtList',
        'uCore.AllowAccessToSensitivePatient', 'uCore.TPatient.SetDFN'}
    with (ROOT / 'analysis/decompiled/workflow-functions.tsv').open(encoding='utf-8', newline='') as f:
        functions = list(csv.DictReader(f, delimiter='\t'))
    successful = {f['function'] for f in functions if f['status'] == 'decompiled'
                  and (ROOT / 'analysis/decompiled' / f['file']).is_file()}
    for name in sorted(required):
        checks.append({'check': 'decompilation ' + name, 'passed': name in successful})
    program = (ROOT / 'analysis/decompiled/program.txt').read_text(encoding='utf-8')
    checks.append({'check': 'Ghidra Borland Delphi compiler', 'passed': 'compiler=borlanddelphi' in program})
    checks.append({'check': 'Ghidra executable hash', 'passed': inventory['executable']['sha256'] in program.lower()})
    checks.append({'check': 'Focused analysis mode recorded', 'passed': 'automatic_analysis=false' in program})
    script_log = (ROOT / 'analysis/logs/scripts.log').read_text(encoding='utf-8')
    checks.append({'check': 'Ghidra MAP import count and failures',
                   'passed': f"CPRS_MAP imported={len(symbols)} failures=0" in script_log})
    with (ROOT / 'analysis/decompiled/workflow-calls.tsv').open(encoding='utf-8', newline='') as f:
        calls = list(csv.DictReader(f, delimiter='\t'))
    for callee in ('fPtSel.SelectPatient', 'fFrame.TfrmFrame.SetupPatient'):
        checks.append({'check': 'Chart menu handler calls ' + callee,
                       'passed': any(c['caller'] == 'fFrame.TfrmFrame.mnuFileOpenClick'
                                     and c['callee'] == callee for c in calls)})
    receipt = {'checked_on': '2026-10-31', 'evidence': 'static binary and resource analysis',
               'passed': all(c['passed'] for c in checks), 'checks': checks,
               'analysis_mode': 'Focused disassembly and decompilation; automatic whole-program analysis disabled',
               'symbols': len(symbols), 'workflow_functions': len(functions),
               'decompiled_functions': sum(f['status'] == 'decompiled' for f in functions),
               'forms': forms,
               'limits': ['No CPRS process launched or server contacted',
                          'No GUI, assistive-technology, or clinical behavior validation',
                          'TLS MAP address convention is excluded from imported labels',
                          'Resource event links may be inherited and need separate review',
                          'The first whole-program pass exhausted a 4 GB heap; its log is retained',
                          'Decompiled types and security return semantics need further review']}
    target = ROOT / 'analysis/validation/milestone-1.json'
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    print(json.dumps({k: v for k, v in receipt.items() if k != 'forms'}, indent=2))
    if not receipt['passed']:
        raise SystemExit(1)


if __name__ == '__main__':
    verify()
