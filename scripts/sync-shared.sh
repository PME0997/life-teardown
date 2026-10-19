#!/usr/bin/env bash
# sync-shared.sh — 把唯一源 shared-src/ 同步到两个技能的 references/shared/
# 用途：编辑 shared-src/ 后运行本脚本，保证两份分发副本与源一致（防漂移）。
# 可从任意位置运行；脚本自动定位仓库根。纯 bash，无需 Python。
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC="$ROOT/shared-src"

if [ ! -d "$SRC" ]; then
  echo "ERROR: 找不到 $SRC（应在仓库根）"; exit 1
fi

for skill in behavior-analyst problem-diver; do
  DEST="$ROOT/skills/$skill/references/shared"
  mkdir -p "$DEST"
  cp "$SRC"/*.md "$DEST"/
  echo "  synced -> skills/$skill/references/shared/"
done

echo "完成：两份分发副本现与 shared-src/ 一致。可跑 scripts/validate.py 复核。"
