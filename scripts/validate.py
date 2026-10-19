#!/usr/bin/env python3
"""Life Teardown skill validator.

Checks structural integrity of the two skills for CI and local pre-release:
  - SKILL.md exists and has valid YAML frontmatter with required fields
  - .skill-metadata.yaml parses and every example has zh + en
  - internal reference links (references/*.md, shared/*.md) resolve
  - no leftover WorkBuddy-private fields in the minimal-common frontmatter
  - no nested skillname/skillname/ packaging error

Usage:
    python scripts/validate.py            # validate repo root (cwd)
    python scripts/validate.py path/to/repo

Exit code 0 = all pass, 1 = failures found.
"""
import sys, os, re

try:
    import yaml
except ImportError:
    yaml = None  # fall back to regex frontmatter parse

REQUIRED_FRONTMATTER = ["name", "description", "version"]
FORBIDDEN_IN_COMMON = ["agent_created"]  # belongs in adapters/workbuddy only
SKILLS = ["behavior-analyst", "problem-diver"]


def fail(errors, msg):
    errors.append(msg)
    print("  FAIL:", msg)


def ok(msg):
    print("  ok:", msg)


def parse_frontmatter(text):
    """Return (dict, body) from a markdown file with --- frontmatter ---."""
    m = re.match(r"^---\n(.*?)\n---\n?(.*)$", text, re.DOTALL)
    if not m:
        return None, text
    raw, body = m.group(1), m.group(2)
    if yaml:
        try:
            return yaml.safe_load(raw), body
        except Exception as e:
            return {"__yaml_error__": str(e)}, body
    # regex fallback: only top-level simple keys
    fm = {}
    for line in raw.splitlines():
        km = re.match(r"^([A-Za-z0-9_-]+):\s*(.*)$", line)
        if km:
            fm[km.group(1)] = km.group(2).strip()
    return fm, body


def check_skill(root, skill, errors):
    print(f"[{skill}]")
    sdir = os.path.join(root, "skills", skill)
    skill_md = os.path.join(sdir, "SKILL.md")

    # nested packaging error
    if os.path.isdir(os.path.join(sdir, skill)):
        fail(errors, f"{skill}: nested {skill}/{skill}/ detected (packaging error)")

    if not os.path.isfile(skill_md):
        fail(errors, f"{skill}: SKILL.md missing")
        return
    text = open(skill_md, encoding="utf-8").read()
    fm, body = parse_frontmatter(text)
    if fm is None:
        fail(errors, f"{skill}: SKILL.md has no YAML frontmatter")
        return
    if "__yaml_error__" in fm:
        fail(errors, f"{skill}: frontmatter YAML parse error: {fm['__yaml_error__']}")
        return

    # Degraded mode only (no PyYAML): regex-scan for the ': ' hazard inside plain
    # scalars -- the exact bug class PyYAML would otherwise catch as a parse error.
    if yaml is None:
        fmraw = re.match(r"^---\n(.*?)\n---", text, re.DOTALL)
        if fmraw:
            for line in fmraw.group(1).splitlines():
                km = re.match(r"^([A-Za-z0-9_-]+):[ \t](.*)$", line)
                if not km:
                    continue
                key, val = km.group(1), km.group(2)
                if val and val[0] not in "\"'|>#&*!%@`" and ": " in val:
                    i = val.find(": ")
                    snippet = val[max(0, i - 30):i + 12]
                    fail(errors, f"{skill}: frontmatter '{key}' is a plain scalar containing ': ' "
                                 f"(breaks strict YAML; quote the value or remove the colon). Near: ...{snippet}...")

    for field in REQUIRED_FRONTMATTER:
        if field not in fm or not str(fm[field]).strip():
            fail(errors, f"{skill}: frontmatter missing '{field}'")
    for bad in FORBIDDEN_IN_COMMON:
        if bad in fm:
            fail(errors, f"{skill}: minimal-common frontmatter must not contain '{bad}' (put it in adapters/workbuddy/)")
    if fm.get("name") != skill:
        fail(errors, f"{skill}: frontmatter name '{fm.get('name')}' != directory name")
    ok("frontmatter fields present")

    # .skill-metadata.yaml
    meta = os.path.join(sdir, ".skill-metadata.yaml")
    if not os.path.isfile(meta):
        fail(errors, f"{skill}: .skill-metadata.yaml missing")
    elif yaml:
        try:
            data = yaml.safe_load(open(meta, encoding="utf-8"))
            examples = data.get("examples", [])
            if not examples:
                fail(errors, f"{skill}: .skill-metadata.yaml has no examples")
            for ex in examples:
                for key in ("id", "title", "description", "prompt"):
                    if key not in ex:
                        fail(errors, f"{skill}: example '{ex.get('id','?')}' missing '{key}'")
                        continue
                    if key != "id":
                        for lang in ("zh", "en"):
                            if lang not in ex[key] or not str(ex[key][lang]).strip():
                                fail(errors, f"{skill}: example '{ex.get('id','?')}' {key} missing '{lang}'")
            ok(f".skill-metadata.yaml valid ({len(examples)} examples)")
        except Exception as e:
            fail(errors, f"{skill}: .skill-metadata.yaml parse error: {e}")
    else:
        ok(".skill-metadata.yaml present (PyYAML not installed; skipped deep check)")

    # internal reference links resolve (cross-skill guest references aware)
    # A ref like "behavior-analyst/references/x.md" inside problem-diver is a
    # cross-skill GUEST reference (dual-thread protocol), not a missing local file.
    refs = set(re.findall(r"(?:([A-Za-z0-9-]+)/)?references/([A-Za-z0-9_./-]+\.md)", body))
    local_count = 0
    cross_count = 0
    for prefix, path in sorted(refs):
        path = path.split("#")[0]
        if prefix and prefix in SKILLS and prefix != skill:
            # cross-skill guest reference: resolve against the sibling skill
            full = os.path.join(root, "skills", prefix, "references", path)
            label = f"{prefix}/references/{path} (cross-skill guest ref)"
            cross_count += 1
        else:
            full = os.path.join(sdir, "references", path)
            label = f"references/{path}"
            local_count += 1
        if not os.path.isfile(full):
            fail(errors, f"{skill}: body references missing file {label}")
    ok(f"checked {local_count} local + {cross_count} cross-skill reference links")

    # shared files must exist in each skill (independent installability)
    for shared in ("anti-sycophancy-core.md", "safety-protocol.md"):
        p = os.path.join(sdir, "references", "shared", shared)
        if not os.path.isfile(p):
            fail(errors, f"{skill}: missing references/shared/{shared}")
    ok("shared/ core files present")


SHARED_FILES = ["anti-sycophancy-core.md", "safety-protocol.md"]


def check_shared_sync(root, errors):
    """Verify shared/ files are byte-identical across shared-src/ and both skills.

    The two skills each carry a copy of the shared core files (for self-contained
    single-skill zips). shared-src/ is the canonical source. All three must match,
    otherwise they have drifted (someone edited a distributed copy directly).
    """
    print("[shared-sync]")
    src_dir = os.path.join(root, "shared-src")
    if not os.path.isdir(src_dir):
        fail(errors, "shared-sync: shared-src/ canonical directory missing")
        return
    for fname in SHARED_FILES:
        blobs = {}
        srcf = os.path.join(src_dir, fname)
        if os.path.isfile(srcf):
            blobs["shared-src"] = open(srcf, "rb").read()
        else:
            fail(errors, f"shared-sync: shared-src/{fname} missing")
        for skill in SKILLS:
            f = os.path.join(root, "skills", skill, "references", "shared", fname)
            if not os.path.isfile(f):
                fail(errors, f"shared-sync: {skill} missing references/shared/{fname}")
                continue
            blobs[skill] = open(f, "rb").read()
        if len(set(blobs.values())) > 1:
            fail(errors, f"shared-sync: {fname} DRIFTED between copies ({', '.join(blobs.keys())}); "
                         f"edit shared-src/ then run scripts/sync-shared.sh")
        elif blobs:
            ok(f"{fname}: {len(blobs)} copies byte-identical")


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    flags = {a for a in sys.argv[1:] if a.startswith("--")}
    allow_no_yaml = "--allow-no-yaml" in flags
    root = os.path.abspath(args[0]) if args else os.getcwd()
    print(f"Validating Life Teardown at: {root}")
    if yaml is None:
        if not allow_no_yaml:
            print("ERROR: PyYAML is REQUIRED for reliable validation.")
            print("  Without it, frontmatter YAML syntax CANNOT be verified -- the regex")
            print("  fallback once gave a FALSE PASS on a real frontmatter bug (a ': ' inside")
            print("  the description plain scalar, which breaks strict YAML parsers).")
            print("  Run with PyYAML via one of:")
            print("    uv run --with pyyaml python scripts/validate.py <root>")
            print("    python -m pip install pyyaml    (then re-run)")
            print("  Or pass --allow-no-yaml for a DEGRADED regex-only check (adds a colon")
            print("  hazard scan, but still cannot fully verify YAML syntax). Not recommended.")
            sys.exit(2)
        print("!! DEGRADED MODE (--allow-no-yaml): full YAML syntax NOT verified !!")
    errors = []
    for skill in SKILLS:
        check_skill(root, skill, errors)
    check_shared_sync(root, errors)
    # top-level docs
    for doc in ("README.md", "LICENSE", "CHANGELOG.md", "INSTALL.md", "REFERENCES.md", "DESIGN-NOTES.md"):
        if not os.path.isfile(os.path.join(root, doc)):
            fail(errors, f"top-level {doc} missing")
    print()
    if errors:
        print(f"VALIDATION FAILED — {len(errors)} problem(s):")
        for e in errors:
            print("  -", e)
        sys.exit(1)
    print("VALIDATION PASSED — all checks green.")
    sys.exit(0)


if __name__ == "__main__":
    main()
