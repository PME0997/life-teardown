#!/usr/bin/env bash
# make-zip.sh — 把技能打包成规范 zip（macOS/Linux 版，对应 make-zip.ps1）
# macOS/Linux 的 zip 默认就用正斜杠条目，无需特殊处理。
# 用法：bash scripts/make-zip.sh [输出目录，默认 dist/]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUT="${1:-$ROOT/dist}"

if ! command -v zip >/dev/null 2>&1; then
  echo "ERROR: 需要 zip 命令（macOS 自带；Linux: apt install zip / brew install zip）"; exit 1
fi

mkdir -p "$OUT"
cd "$ROOT/skills"
for skill in behavior-analyst problem-diver; do
  # 从 skills/ 打包，条目为 skillname/...（无多余嵌套）
  zip -rq "$OUT/$skill.zip" "$skill"
  echo "Created $OUT/$skill.zip"
done
echo "完成。zip 条目为正斜杠（跨平台解压安全）。"
