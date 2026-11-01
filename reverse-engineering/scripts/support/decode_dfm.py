"""Decode bounded Delphi binary form resources into inspectable JSON."""
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parents[1]


class Reader:
    def __init__(self, data):
        self.data, self.at = data, 0

    def take(self, n):
        if n < 0 or self.at + n > len(self.data):
            raise ValueError(f'Invalid length {n} at {self.at}')
        result = self.data[self.at:self.at + n]
        self.at += n
        return result

    def number(self, fmt):
        return struct.unpack(fmt, self.take(struct.calcsize(fmt)))[0]

    def short(self):
        return self.take(self.number('<B')).decode('cp1252')

    def properties(self):
        result = {}
        while name := self.short():
            result[name] = self.value()
        return result

    def value(self):
        tag = self.number('<B')
        if tag in (0, 13):
            return None
        if tag == 1:
            items = []
            while self.data[self.at] != 0:
                items.append(self.value())
            self.take(1)
            return items
        if tag in (2, 3, 4, 15, 16, 17, 19, 21):
            return self.number({2: '<b', 3: '<h', 4: '<i', 15: '<f', 16: '<q',
                                17: '<d', 19: '<q', 21: '<d'}[tag])
        if tag == 5:
            return {'extended80_hex': self.take(10).hex()}
        if tag in (6, 7):
            return self.short()
        if tag in (8, 9):
            return tag == 9
        if tag == 10:
            n = self.number('<I')
            self.take(n)
            return {'binary_bytes': n}
        if tag == 11:
            result = []
            while item := self.short():
                result.append(item)
            return result
        if tag in (12, 18, 20):
            n = self.number('<I')
            return self.take(n * (2 if tag == 18 else 1)).decode(
                {12: 'cp1252', 18: 'utf-16-le', 20: 'utf-8'}[tag])
        if tag == 14:
            result = []
            while self.data[self.at] != 0:
                index = None
                if self.data[self.at] != 1:
                    index = self.value()
                assert self.take(1) == b'\x01', 'Expected collection item'
                result.append({'index': index, 'properties': self.properties()})
            self.take(1)
            return result
        raise ValueError(f'Unsupported DFM value tag {tag} at {self.at - 1}')

    def component(self):
        flags = 0
        if self.data[self.at] & 0xF0 == 0xF0:
            flags = self.number('<B') & 0x0F
        position = self.value() if flags & 2 else None
        result = {'class': self.short(), 'name': self.short(),
                  'inherited': bool(flags & 1), 'inline': bool(flags & 4),
                  'child_position': position, 'properties': self.properties(), 'children': []}
        while self.data[self.at] != 0:
            result['children'].append(self.component())
        self.take(1)
        return result


def decode(path):
    reader = Reader(path.read_bytes())
    assert reader.take(4) == b'TPF0'
    result = reader.component()
    assert reader.at == len(reader.data), f'Unparsed data at {reader.at}'
    target = path.with_suffix('.json')
    target.write_text(json.dumps(result, indent=2, ensure_ascii=False), encoding='utf-8')
    print(f'{target.name}: {reader.at} bytes consumed, root={result["name"]}')


if __name__ == '__main__':
    for path in sorted((ROOT / 'analysis/resources').glob('*.dfm.bin')):
        decode(path)
