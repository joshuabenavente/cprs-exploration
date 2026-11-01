"""Verify M11 evidence survives private-index staging and checkout exactly."""
import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / 'validation/milestone-11'


def git(*args, env=None, input=None):
    return subprocess.check_output(['git', *args], cwd=ROOT, env=env, input=input)


def main():
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S%f')
    local = ROOT / '.local' / ('m11-evidence-' + stamp)
    local.mkdir(parents=True)
    env = {**os.environ, 'GIT_INDEX_FILE': str(local / 'audit.index')}
    git('read-tree', 'HEAD', env=env)
    paths = sorted(p.relative_to(ROOT).as_posix() for p in BASE.rglob('*')
                   if p.is_file() and p.name != 'byte-audit.json')
    git('add', '--', '.gitattributes', *paths, env=env)
    staged = {}
    for line in git('ls-files', '-s', '--', 'validation/milestone-11', env=env).decode().splitlines():
        meta, name = line.split('\t', 1)
        staged[name] = meta.split()[1]
    algorithm = git('rev-parse', '--show-object-format').decode().strip()
    git('-c', 'core.longpaths=true', 'checkout-index', '--prefix=' + (local / 'checkout').as_posix() + '/', '--stdin',
        env=env, input=('\n'.join(paths) + '\n').encode())
    verified = {}
    for name in paths:
        data = (ROOT / name).read_bytes()
        blob = hashlib.new(algorithm, b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
        if staged[name] != blob or (local / 'checkout' / name).read_bytes() != data:
            raise ValueError('Evidence bytes changed on staging/checkout: ' + name)
        verified[name] = hashlib.sha256(data).hexdigest()
    receipt = {'scope': 'Private Git index staging and fresh checkout; real index/branch unchanged',
               'passed': True, 'files_sha256': verified,
               'limit': 'Audit excludes its own output to avoid a self-hash cycle; no M11 commit or remote clone claimed.'}
    (BASE / 'byte-audit.json').write_text(json.dumps(receipt, indent=2) + '\n', encoding='utf-8')
    print(f'Exact staging/checkout bytes verified for {len(paths)} M11 evidence files')


if __name__ == '__main__':
    main()
