#!/usr/bin/env bash
# Life Teardown installer — auto-detects platform, installs both skills.
# Usage: curl -fsSL <url>/install.sh | bash
set -euo pipefail

REPO="PME0997/life-teardown"
BRANCH="main"
SKILLS="behavior-analyst problem-diver"

echo "==> Life Teardown installer"

# 1. Detect platform skill dir + archive root
if [ -d "$HOME/.qwenworkcn" ]; then
  PLATFORM="qwenwork"; SKILL_DIR="$HOME/.qwenworkcn/skills"; ARCHIVE="$HOME/.qwenworkcn/user-data/life-teardown"
elif [ -d "$HOME/.claude" ]; then
  PLATFORM="claude-code"; SKILL_DIR="$HOME/.claude/skills"; ARCHIVE="$HOME/.claude/user-data/life-teardown"
elif [ -d "$HOME/.workbuddy" ]; then
  PLATFORM="workbuddy"; SKILL_DIR="$HOME/.workbuddy/skills"; ARCHIVE="$HOME/.workbuddy/life-teardown"
else
  PLATFORM="generic"; SKILL_DIR="$HOME/.local/share/ai-skills"; ARCHIVE="$HOME/.local/share/life-teardown"
  echo "    No known platform detected; installing to generic location."
fi
echo "    Platform: $PLATFORM"
echo "    Skills dir: $SKILL_DIR"
echo "    Archive root: ${LIFE_TEARDOWN_ROOT:-$ARCHIVE}"

# 2. Fetch repo tarball
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "==> Downloading $REPO@$BRANCH"
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" -o "$TMP/repo.tar.gz"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$TMP/repo.tar.gz" "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz"
else
  echo "ERROR: need curl or wget"; exit 1
fi
tar -xzf "$TMP/repo.tar.gz" -C "$TMP"
SRC="$(find "$TMP" -maxdepth 1 -type d -name 'life-teardown-*' | head -1)"

# 3. Copy skills
mkdir -p "$SKILL_DIR"
for s in $SKILLS; do
  echo "==> Installing $s"
  # Guard: refuse to overwrite an existing different skill without backup
  if [ -d "$SKILL_DIR/$s" ]; then
    cp -r "$SKILL_DIR/$s" "$SKILL_DIR/$s.bak.$(date +%s)"
    echo "    (existing $s backed up)"
  fi
  cp -r "$SRC/skills/$s" "$SKILL_DIR/$s"
  # 4. Apply platform frontmatter override if available
  ADAPTER="$SRC/adapters/$PLATFORM/SKILL.frontmatter.md"
  if [ "$PLATFORM" != "generic" ] && [ -f "$ADAPTER" ]; then
    echo "    NOTE: apply $PLATFORM frontmatter from adapters/$PLATFORM/ for full UI (see INSTALL.md step 3)."
  fi
done

# 5. Create archive dirs
ROOT="${LIFE_TEARDOWN_ROOT:-$ARCHIVE}"
mkdir -p "$ROOT/behavior-archive/raw" "$ROOT/problem-archive/raw" "$ROOT/problem-archive/outbox"
echo "==> Archive ready at $ROOT"

echo ""
echo "Done. Try it out:"
echo "  behavior-analyst:  我为什么总是拖延"
echo "  problem-diver:     帮我复盘一件没做好的事"
echo ""
echo "Set LIFE_TEARDOWN_ROOT to relocate archives. Uninstall: remove the two skill dirs + archive root (back up archives first!)."
