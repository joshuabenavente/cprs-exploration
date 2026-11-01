"""Read-only PE/MAP inventory. Never executes CPRS or reads terminal profiles."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parents[1]


class PE:
    def __init__(self, path):
        self.data = path.read_bytes()
        d = self.data
        pe = struct.unpack_from('<I', d, 0x3C)[0]
        assert d[pe:pe + 4] == b'PE\0\0', 'Invalid PE signature'
        self.machine, count = struct.unpack_from('<HH', d, pe + 4)
        opt_size = struct.unpack_from('<H', d, pe + 20)[0]
        opt = pe + 24
        assert struct.unpack_from('<H', d, opt)[0] == 0x10B, 'Expected PE32'
        self.entry_rva = struct.unpack_from('<I', d, opt + 16)[0]
        self.image_base = struct.unpack_from('<I', d, opt + 28)[0]
        self.resource_rva = struct.unpack_from('<I', d, opt + 96 + 16)[0]
        self.import_rva = struct.unpack_from('<I', d, opt + 96 + 8)[0]
        self.sections = []
        for i in range(count):
            at = opt + opt_size + i * 40
            name = d[at:at + 8].rstrip(b'\0').decode('ascii')
            vsize, rva, rawsize, raw = struct.unpack_from('<IIII', d, at + 8)
            self.sections.append(dict(index=i + 1, name=name, rva=rva,
                                      virtual_size=vsize, raw_size=rawsize, raw_offset=raw))

    def offset(self, rva):
        for s in self.sections:
            delta = rva - s['rva']
            if 0 <= delta < s['raw_size']:
                return s['raw_offset'] + delta
        raise ValueError(f'RVA has no file bytes: {rva:x}')

    def imports(self):
        result = []
        at = self.offset(self.import_rva)
        while any(self.data[at:at + 20]):
            original, _, _, name_rva, first = struct.unpack_from('<IIIII', self.data, at)
            name_at = self.offset(name_rva)
            name = self.data[name_at:self.data.index(0, name_at)].decode('ascii')
            result.append(name)
            at += 20
        return result

    def resources(self):
        d = self.data
        base = self.offset(self.resource_rva)
        found = []

        def walk(relative, path):
            at = base + relative
            named, ids = struct.unpack_from('<HH', d, at + 12)
            for i in range(named + ids):
                name, dest = struct.unpack_from('<II', d, at + 16 + i * 8)
                if name & 0x80000000:
                    pos = base + (name & 0x7FFFFFFF)
                    length = struct.unpack_from('<H', d, pos)[0]
                    key = d[pos + 2:pos + 2 + length * 2].decode('utf-16-le')
                else:
                    key = name
                if dest & 0x80000000:
                    walk(dest & 0x7FFFFFFF, path + [key])
                else:
                    rva, size, codepage, _ = struct.unpack_from('<IIII', d, base + dest)
                    offset = self.offset(rva)
                    found.append(dict(path=path + [key], rva=rva, size=size,
                                      file_offset=offset, codepage=codepage))
        walk(0, [])
        return found


def inspect(root):
    exe = root / 'cprs/CPRSChart.exe'
    map_path = root / 'cprs/CPRSChart.map'
    out = root / 'analysis/inventory'
    out.mkdir(parents=True, exist_ok=True)
    lock = json.loads((root / 'provenance/chart.lock.json').read_text(encoding='utf-8'))
    for item in lock['files']:
        content = (root / item['path']).read_bytes()
        if len(content) != item['bytes'] or hashlib.sha256(content).hexdigest() != item['sha256']:
            raise ValueError(f"Input differs from pinned reference: {item['path']}")
    pe = PE(exe)
    lines = map_path.read_text(encoding='utf-8', errors='replace').splitlines()
    segments = {}
    for line in lines:
        m = re.match(r'\s+([0-9A-F]{4}):([0-9A-F]{8}) ([0-9A-F]{8})H (\S+)\s+(\S+)', line)
        if m:
            seg, start, size, name, kind = m.groups()
            segments[int(seg, 16)] = dict(start=int(start, 16), size=int(size, 16), name=name)
    entry_match = re.search(r'Program entry point at ([0-9A-F]{4}):([0-9A-F]{8})', '\n'.join(lines))
    seg, off = (int(x, 16) for x in entry_match.groups())
    map_entry = segments[seg]['start'] + off
    section_checks = []
    for seg, s in segments.items():
        candidates = [p for p in pe.sections if p['name'] == s['name']]
        if candidates:
            p = candidates[0]
            section_checks.append(dict(segment=seg, name=s['name'], map_start=s['start'],
                pe_start=pe.image_base + p['rva'], start_matches=s['start'] == pe.image_base + p['rva'],
                map_size=s['size'], pe_virtual_size=p['virtual_size'], size_matches=s['size'] == p['virtual_size']))
    symbols = {}
    # The MAP repeats publics by name and value; deduplicate by address and name.
    for number, line in enumerate(lines, 1):
        m = re.match(r'^ ([0-9A-F]{4}):([0-9A-F]{8})\s{2,}(\S+)\s*$', line)
        if not m:
            continue
        seg, off, name = m.groups()
        seg, off = int(seg, 16), int(off, 16)
        if seg not in segments or off >= segments[seg]['size']:
            continue
        address = segments[seg]['start'] + off
        try:
            pe.offset(address - pe.image_base)
        except ValueError:
            continue
        symbols.setdefault((address, name), dict(address=f'{address:08x}', name=name,
            segment=seg, offset=f'{off:08x}', map_line=number))
    values = list(symbols.values())
    required = {'.text', '.itext', '.data', '.bss'}
    checked = {s['name'] for s in section_checks if s['start_matches'] and s['size_matches']}
    if not required <= checked or map_entry != pe.image_base + pe.entry_rva:
        raise ValueError('Required MAP/PE section or entry-point compatibility check failed')
    with (out / 'chart-symbols.tsv').open('w', encoding='utf-8', newline='') as f:
        f.write('address\tname\tmap_line\n')
        for s in values:
            f.write(f"{s['address']}\t{s['name']}\t{s['map_line']}\n")
    resources = pe.resources()
    forms_dir = root / 'analysis/resources'
    forms_dir.mkdir(parents=True, exist_ok=True)
    for r in resources:
        if len(r['path']) >= 2 and str(r['path'][1]).upper() in {'TFRMPTSEL', 'TFRMFRAME', 'TFRMCOVER', 'TFRMPTSELMSG', 'TFRMDUPPTS'}:
            raw = pe.data[r['file_offset']:r['file_offset'] + r['size']]
            target = forms_dir / (str(r['path'][1]) + '.dfm.bin')
            target.write_bytes(raw)
            r['export'] = target.relative_to(root).as_posix()
    summary = dict(executable=dict(path='cprs/CPRSChart.exe', sha256=hashlib.sha256(pe.data).hexdigest(),
        bytes=len(pe.data), machine=hex(pe.machine), image_base=hex(pe.image_base),
        entry_rva=hex(pe.entry_rva), entry_va=hex(pe.image_base + pe.entry_rva)),
        map=dict(path='cprs/CPRSChart.map', sha256=hashlib.sha256(map_path.read_bytes()).hexdigest(),
                 entry_va=hex(map_entry), entry_matches=map_entry == pe.image_base + pe.entry_rva,
                 sections=section_checks, unique_file_backed_symbols=len(values)),
        sections=pe.sections, imported_dlls=pe.imports(), resources=resources,
        workflow_symbols=[s for s in values if s['name'].startswith(('fPtSel.', 'fFrame.', 'rCore.', 'ORNet.', 'Trpcb.'))])
    (out / 'chart-inventory.json').write_text(json.dumps(summary, indent=2), encoding='utf-8')
    print(json.dumps(dict(entry_matches=summary['map']['entry_matches'], section_checks=section_checks,
        symbols=len(values), resources=len(resources), imports=summary['imported_dlls'],
        forms=[r for r in resources if 'export' in r]), indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', type=Path, default=ROOT)
    args = parser.parse_args()
    inspect(args.root)
