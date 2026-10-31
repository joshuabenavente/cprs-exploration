"""Decode pinned Orders resources without changing historical receipts."""
import hashlib
import json
from pathlib import Path
from inspect_chart import PE
from decode_dfm import decode

ROOT = Path(__file__).resolve().parents[1]


def main():
    lock = json.loads((ROOT / 'provenance/chart.lock.json').read_text(encoding='utf-8'))
    pe = PE(ROOT / 'cprs/CPRSChart.exe')
    if hashlib.sha256(pe.data).hexdigest() != lock['files'][0]['sha256']:
        raise ValueError('Orders extraction requires the pinned Chart specimen')
    wanted = {'TFRMORDERS', 'TFRMORDERVIEW'}
    folder = ROOT / 'analysis/orders/resources'
    folder.mkdir(parents=True, exist_ok=True)
    resources = []
    for resource in pe.resources():
        if len(resource['path']) < 2 or resource['path'][1] not in wanted:
            continue
        raw = pe.data[resource['file_offset']:resource['file_offset'] + resource['size']]
        target = folder / (resource['path'][1] + '.dfm.bin')
        target.write_bytes(raw)
        decode(target)
        resources.append({**resource, 'sha256': hashlib.sha256(raw).hexdigest(),
                          'decoded': target.with_suffix('.json').relative_to(ROOT).as_posix()})
    receipt = {'scope': 'Static Orders forms; inherited defaults and runtime behavior remain separate',
               'executable_sha256': hashlib.sha256(pe.data).hexdigest(), 'resources': resources,
               'not_found': sorted(wanted - {r['path'][1] for r in resources})}
    (folder.parent / 'resource-inventory.json').write_text(json.dumps(receipt, indent=2), encoding='utf-8')
    if receipt['not_found']:
        raise ValueError(receipt['not_found'])
    print(f'Decoded {len(resources)} Orders resources completely')


if __name__ == '__main__':
    main()
