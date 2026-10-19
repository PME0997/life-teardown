# Changelog

All notable changes to Life Teardown are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/); versioning follows [SemVer](https://semver.org/).

## [0.1.0] - 2026-10-19 — Beta

First public release. Two-skill anti-sycophancy self-inquiry kit for desktop AI agents.

### Added
- **behavior-analyst** (行为分析师): router skill with 8 sub-skills — behavior origin, motive dig, pattern verify, decision-emotion review, change plan, relationship teardown, emotion clarify, intimacy analysis.
- **problem-diver** (困难拆解师): five-stage event teardown — reconstruction → difficulty location → method routing → root cause → action.
- **Shared anti-sycophancy core** (`references/shared/anti-sycophancy-core.md`): 7 rules inherited by both skills and by guest-referenced sub-skills.
- **Shared safety protocol** (`references/shared/safety-protocol.md`): three-level self-harm response, relationship-violence exception, trauma-narrative boundary, good-vs-bad neutrality, dependency downgrade, no-diagnosis rule, platform-compliance wording.
- **Dual-thread protocol** with case worksheet schema and guest-depth guardrail (soft trigger + 8-round backstop + 3-round buffer).
- **Evidence base**: 10 sections grounded in 60+ academic sources (see REFERENCES.md).
- **Memory layer**: conclusions.json with mandatory falsifiers, profile.md trend integration, raw/ excerpts, superseded_by chains, contradicts preservation, two-archive write-permission isolation with one-way outbox.
- **Cross-platform packaging**: minimal common frontmatter + runtime path adaptation (`$LIFE_TEARDOWN_ROOT`) + `adapters/` overrides for QwenWork / Claude Code / WorkBuddy.
- **`.skill-metadata.yaml`** for both skills (bilingual recommended queries).
- **Method library** with routing table, mutual-exclusion notes, and failure signals for all 8 frameworks.
- **Output protocols**: three-part verdict, pyramid expression, three-level confidence with calibration checklist, mandatory status footer, tone-softening (content unchanged).
- Install scripts (`install.sh` / `install.ps1`), `validate.py`, examples, VALIDATION-PLAN, issue templates.

### Decisions
- Decision-analysis ("should I do X") routed to problem-diver; behavior-analyst's decision sub-skill handles only the emotional resistance behind decisions (per DESIGN-NOTES 4.2.1).
- relationship teardown expanded beyond family to friends/colleagues/roommates/mentor, including power-asymmetry and friendship-drift handling.
- Safety philosophy "guide, don't block": analysis continues through self-harm signals with a graded one-line prompt; relationship violence is the only interruption.

### Deferred to 0.2.0
- Splitting evidence-base.md into on-demand topic files.
- Full English translation of references/ (only SKILL.md frontmatter is bilingual in 0.1.0).
- Complete "gentle mode": pause mechanism + pending-topics list + re-raise timing.
- Web-only platform support.

### Rejected (will not implement)
- Satisfaction/feedback hooks — conflicts with the anti-sycophancy core.

### Known limitations
- Not yet validated through extended real-world use; classification pressure test was manual, not live-trigger based. See VALIDATION-PLAN.md.
- Guest-reference boundary erosion has only soft constraints plus the depth guardrail.
