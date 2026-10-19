# Life Teardown

**An anti-sycophancy self-inquiry kit — two AI skills that analyze you honestly instead of comforting you.**

> 中文文档见 [README.zh-CN.md](README.zh-CN.md)

<!-- DEMO GIF PLACEHOLDER: record a real analysis session and drop it here -->

Most AI assistants agree with you. Life Teardown doesn't. It is a two-skill kit for desktop AI agents that helps you understand **why you do what you do** and **why a specific thing went wrong** — with evidence-based methods, anti-sycophancy discipline, and cross-session memory that tracks how your patterns actually change over time.

---

## Why this exists

Ask a normal chatbot "why do I always procrastinate?" and you'll get "That's so common, don't be too hard on yourself!" — comforting, useless, and slightly reinforcing the exact self-narrative you wanted examined.

Life Teardown is built on a different premise: **an analysis tool that always validates you has no analytical value.** It separates what you *did* from what you *tell yourself about it*, demands that every judgment cite your own words, assigns confidence levels, and refuses to change its conclusion just because you pushed back.

## The two skills

| Skill | Domain | Core question | Output |
|---|---|---|---|
| **behavior-analyst** (行为分析师) | The *person*: emotions, habits, motives, relationships | "Why am I always like this?" | Pattern mapping → motive/attribution testing → change plan |
| **problem-diver** (困难拆解师) | The *event*: work/study/growth teardowns | "Why did this go wrong, and how do I do it better?" | Event reconstruction → difficulty location → method routing → root cause → action |

They are **independent and never load each other** — with one exception: when a case intertwines "the task" and "the emotion," problem-diver runs a **dual-thread protocol** and may borrow behavior-analyst's method files as a guest (without inheriting its identity or memory-write rights).

**Boundary rule of thumb:** asking about *one event* → problem-diver; asking about *a pattern / emotion / relationship* → behavior-analyst. Intent beats signal words.

## What makes it different

- **Anti-sycophancy core (7 rules)** — fact/defense separation, every judgment must cite your verbatim words, "this part is fine" is allowed, three-level confidence, no generic comfort, resists caving when you push back, mandatory status footer every turn.
- **Evidence-based** — grounded in 60+ academic sources: Steel's procrastination meta-analysis, Bowen family systems, Barrett's emotional granularity, Gendlin's focusing, EFT/Gottman, Weiner attribution, Self-Determination Theory, Kahneman. See [REFERENCES.md](REFERENCES.md).
- **Memory with falsifiers** — every stored conclusion must carry a falsification condition. Conclusions aren't appended blindly; they're reviewed, superseded (`superseded_by` chains), or overturned — and overturned ones are *kept*, because they reveal your habitual attribution biases.
- **Two archives, one-way outbox** — write-permission isolation prevents a one-off task conclusion from polluting your long-term behavioral profile.
- **Safety by "guide, don't block"** — self-harm signals get a graded one-line prompt (never an interruption, never a refusal); relationship violence is the single exception that stops technique-style analysis. See the shared safety protocol.

## Platform compatibility

| Platform | Status | Notes |
|---|---|---|
| WorkBuddy | ✅ Native | Original development platform |
| QwenWork | ✅ Supported | Apply `adapters/qwenwork/` frontmatter for full bilingual UI |
| Claude Code / Desktop | ✅ Supported | Apply `adapters/claude-code/` frontmatter |
| Cursor | ⚠️ Partial | No skill loading; would need conversion to `.cursorrules` |
| Web-only (ChatGPT/Gemini/Claude.ai) | ❌ Not in v0.1.0 | No local file write → no cross-session memory. Planned for a later release |

The skills use a **minimal common frontmatter** (`name` + `description` + `version`) that parses everywhere, plus a runtime path-adaptation layer (`$LIFE_TEARDOWN_ROOT` with per-platform defaults). Platform-specific metadata lives in [`adapters/`](adapters/).

## Quick start

```bash
# Auto-detects your platform and installs both skills
curl -fsSL https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.sh | bash
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.ps1 | iex
```

Manual install and per-platform details: see [INSTALL.md](INSTALL.md).

## Target users

Designed and pressure-tested for **knowledge workers aged 25-40, bilingual (Chinese/English)**. The 22-case classification test drew from quarter-life-crisis research and Reddit communities. Other demographics (students, retirees, non-knowledge workers) may work but aren't the primary design target yet.

**This tool will not comfort you.** If you need emotional support right now, please reach out to someone you trust or a professional counselor first. Life Teardown is a self-inquiry instrument, not therapy and not crisis intervention.

## Repository layout

```
life-teardown/
├── skills/
│   ├── behavior-analyst/   # SKILL.md + .skill-metadata.yaml + references/
│   └── problem-diver/      # SKILL.md + .skill-metadata.yaml + references/
├── adapters/               # platform-specific frontmatter overrides
├── examples/               # anonymized real analysis sessions
├── scripts/                # install.sh / install.ps1 / validate.py
├── DESIGN-NOTES.md         # full design rationale (V1→V5 evolution)
├── REFERENCES.md           # 60+ academic & open-source sources
└── VALIDATION-PLAN.md      # observation-period metrics
```

## Design philosophy

1. **Boundaries by description, not by rules** — let semantic understanding route, don't hardcode state machines.
2. **Light by default, deep only when worth it** — single perspective is the norm; dual-thread is the heavy weapon.
3. **Switch threads, not owners** — control stays with one skill; no handoff, no lost context.
4. **Separate fact from interpretation** — your self-attributions are marked "unverified"; conclusions must cite your words.
5. **Don't paper over contradictions** — conflicting conclusions are kept with their adjudication conditions.
6. **Memory should tell a story of change** — not a log, a trend.

Full rationale, rejected designs, and open risks: [DESIGN-NOTES.md](DESIGN-NOTES.md).

## Status

**v0.1.0 beta** — design finalized, skills implemented, cross-platform packaging complete. Not yet validated through extended real-world use. The observation plan and success metrics are in [VALIDATION-PLAN.md](VALIDATION-PLAN.md). Feedback and case reports welcome via issues.

## License

MIT © 2026 PME0997 — see [LICENSE](LICENSE).

## Contributing

- Bug / platform-compat / case-feedback issue templates in `.github/ISSUE_TEMPLATE/`
- Before contributing, read [DESIGN-NOTES.md](DESIGN-NOTES.md) — especially the anti-sycophancy core. Any change that softens analysis to improve "user experience" will be rejected on principle.
