"""Read a bounded Vitals VMT span from the pinned specimen; never execute it."""
import csv
import hashlib
import json
from pathlib import Path
import struct
from inspect_chart import PE

ROOT = Path(__file__).resolve().parents[1]


def recover():
    lock = json.loads((ROOT / 'provenance/chart.lock.json').read_text(encoding='utf-8'))
    pe = PE(ROOT / lock['files'][0]['path'])
    digest = hashlib.sha256(pe.data).hexdigest()
    if digest != lock['files'][0]['sha256']:
        raise ValueError('Vitals extraction requires the pinned Chart specimen')
    with (ROOT / 'analysis/inventory/chart-symbols.tsv').open(encoding='utf-8', newline='') as f:
        names = {r['address']: r['name'] for r in csv.DictReader(f, delimiter='\t')}

    def word(address):
        at = pe.offset(address - pe.image_base)
        raw = pe.data[at:at + 4]
        return {'address': f'{address:08x}', 'file_offset': at, 'bytes': raw.hex(),
                'value': f'{struct.unpack("<I", raw)[0]:08x}'}

    pointer = word(0x00be1cf4)
    vmt = int(pointer['value'], 16)
    slots = []
    for offset in (0x210, 0x214, 0x21c, 0x238):
        value = word(vmt + offset)
        slots.append({**value, 'slot': f'{offset:x}', 'map_name': names.get(value['value'])})
    return {'scope': 'Bounded Vitals class pointer and four VMT slots; no DLL inspection',
            'executable_sha256': digest, 'class_pointer': pointer, 'slots': slots,
            'limits': ['MAP naming and class-table layout do not recover complete Delphi types or runtime site dispatch.']}


if __name__ == '__main__':
    output = ROOT / 'analysis/vitals/vmt.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(recover(), indent=2), encoding='utf-8')
    print('Recovered four bounded Vitals VMT slots')
