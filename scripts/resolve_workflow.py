"""Resolve raw decompiler addresses through the MAP and bounded Delphi literals.

Raw Ghidra output is preserved. Annotations are separate evidence, not Pascal types.
"""
import csv
import argparse
import json
from pathlib import Path
import re
import struct
from inspect_chart import PE

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--cover-sheet', action='store_true')
    group.add_argument('--notes', action='store_true')
    group.add_argument('--orders', action='store_true')
    group.add_argument('--results', action='store_true')
    group.add_argument('--vitals', action='store_true')
    group.add_argument('--active-medications', action='store_true')
    group.add_argument('--appointments', action='store_true')
    args = parser.parse_args()
    analysis = ROOT / 'analysis' / 'cover-sheet' if args.cover_sheet else ROOT / 'analysis'
    if args.notes:
        analysis = ROOT / 'analysis/notes'
    if args.orders:
        analysis = ROOT / 'analysis/orders'
    if args.results:
        analysis = ROOT / 'analysis/results'
    if args.vitals:
        analysis = ROOT / 'analysis/vitals'
    if args.active_medications:
        analysis = ROOT / 'analysis/active-medications'
    if args.appointments:
        analysis = ROOT / 'analysis/appointments'
    pe = PE(ROOT / 'cprs/CPRSChart.exe')
    by_address = {}
    with (ROOT / 'analysis/inventory/chart-symbols.tsv').open(encoding='utf-8', newline='') as f:
        for row in csv.DictReader(f, delimiter='\t'):
            by_address.setdefault(row['address'], []).append(row['name'])

    def literal(address):
        try:
            at = pe.offset(int(address, 16) - pe.image_base)
            codepage, width, refcount, length = struct.unpack_from('<HHii', pe.data, at - 12)
            if width not in (1, 2) or refcount != -1 or not 0 < length <= 4096:
                return None
            if width == 2 and codepage not in (0, 1200):
                return None
            encoding = 'utf-16-le' if width == 2 else ('utf-8' if codepage == 65001 else 'cp1252')
            raw = pe.data[at:at + length * width]
            if pe.data[at + length * width:at + (length + 1) * width] != b'\0' * width:
                return None
            text = raw.decode(encoding)
            if any(ord(c) < 32 and c not in '\r\n\t' for c in text):
                return None
            return {'address': address, 'file_offset': at, 'codepage': codepage,
                    'element_width': width, 'length': length, 'text': text}
        except (ValueError, UnicodeDecodeError, struct.error):
            return None

    out = analysis / 'resolved'
    out.mkdir(parents=True, exist_ok=True)
    results = []
    with (analysis / 'decompiled/workflow-functions.tsv').open(encoding='utf-8', newline='') as f:
        functions = list(csv.DictReader(f, delimiter='\t'))
    for function in functions:
        if function['status'] != 'decompiled':
            continue
        text = (analysis / 'decompiled' / function['file']).read_text(encoding='utf-8')
        assembly = (analysis / 'decompiled' / function['file']).with_suffix('.asm').read_text(encoding='utf-8') if args.appointments else ''
        calls = []
        addresses = set(re.findall(r'func_0x([0-9a-fA-F]{8})', text))
        addresses.update(f'{int(a, 16):08x}' for a in re.findall(r'CALL 0x([0-9a-fA-F]+)', assembly))
        for address in sorted(addresses):
            calls.append({'address': address, 'map_names': by_address.get(address, [])})
        literals = []
        addresses = set(re.findall(r'UNK_([0-9a-fA-F]{8})', text))
        addresses.update(f'{int(a, 16):08x}' for a in re.findall(r'0x([0-9a-fA-F]{6,8})', assembly))
        for address in sorted(addresses):
            if value := literal(address):
                literals.append(value)
        resolved = {**function, 'numeric_callee_references': calls, 'delphi_string_literals': literals}
        (out / (function['file'] + '.json')).write_text(json.dumps(resolved, indent=2, ensure_ascii=False), encoding='utf-8')
        results.append(resolved)
    (out / 'workflow-evidence.json').write_text(json.dumps(results, indent=2, ensure_ascii=False), encoding='utf-8')
    for function in results:
        if args.cover_sheet or args.notes or args.orders or args.results or function['function'].startswith(('fPtSel.', 'rCore.')):
            print(function['function'])
            for call in function['numeric_callee_references']:
                relevant = [n for n in call['map_names'] if n.startswith(('rCore.', 'uCore.', 'fPtSel.', 'fFrame.', 'fDupPts.'))]
                if relevant:
                    print('  call', call['address'], ' | '.join(relevant))
            for value in function['delphi_string_literals']:
                print('  literal', value['address'], repr(value['text']))


if __name__ == '__main__':
    main()
