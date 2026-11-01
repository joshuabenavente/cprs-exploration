#!/usr/bin/env bash
set -euo pipefail
export JAVA_HOME=/workspace/cprs-exploration/.tools/jdk-25.0.5+8
export GHIDRA_HEADLESS_MAXMEM=8G
export GHIDRA_JAVA_OPTIONS='-Dapplication.settingsdir=/workspace/reverse-engineering/.ghidra-settings -Djava.io.tmpdir=/workspace/reverse-engineering/tmp'
export XDG_CONFIG_HOME=/workspace/reverse-engineering/.config
export XDG_CACHE_HOME=/workspace/reverse-engineering/.cache
export PATH="$JAVA_HOME/bin:$PATH"
mkdir -p /workspace/reverse-engineering/tmp /workspace/reverse-engineering/projects /workspace/reverse-engineering/evidence
exec /workspace/cprs-exploration/.tools/ghidra_12.2_PUBLIC/support/analyzeHeadless "$@"
