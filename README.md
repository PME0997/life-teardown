# Life Teardown · 人生分析师

**An anti-sycophancy self-inquiry kit — two AI skills that analyze you honestly instead of comforting you.**

**不谄媚的 AI 自我拆解工具——两个不哄你、只帮你看清自己的 AI 技能。**

<!-- DEMO GIF PLACEHOLDER: record a real analysis session and drop it here / 演示 GIF 占位：录一段真实分析对话放这里 -->

Most AI assistants agree with you. Life Teardown doesn't. It is a two-skill kit for desktop AI agents that helps you understand **why you do what you do** and **why a specific thing went wrong** — with evidence-based methods, anti-sycophancy discipline, and cross-session memory that tracks how your patterns actually change over time.

大多数 AI 都会顺着你说话。人生分析师不会。它是一套跑在桌面 AI agent 上的双技能工具，帮你搞清楚**自己为什么会这样做**、**某件事为什么没做好**——用循证方法、反谄媚纪律，以及能跨会话追踪你模式变化的本地档案。

The kit contains two independent skills: **behavior-analyst** (行为分析师) maps the *person* — your emotions, habits, motives and relationships — while **problem-diver** (困难拆解师) tears down the *event* — why this specific thing failed and how to do it better next time. Every judgment must cite your own words, carries a confidence level, and is written into a local archive with explicit falsification conditions: conclusions get reviewed, superseded, or overturned as new evidence comes in — and the overturned ones are kept, because they reveal your habitual attribution biases.

盒子里的两个技能平级独立：**behavior-analyst**（行为分析师）拆「人」——你的情绪、习惯、动机与关系；**problem-diver**（困难拆解师）拆「事」——某件事为什么没做好、下次怎么做好。每条判断都必须引用你的原话、标注置信度，并连同「什么新证据会推翻它」一起写进本地档案：结论随新证据被复核、取代或推翻——被推翻的也保留，因为它揭示你自我解释的惯用偏差。

Everything runs locally. One line installs it on WorkBuddy, QwenWork (千问办公), or Claude Code — no API keys, no cloud account, your archive never leaves your machine. The methods are grounded in 60+ academic sources, from Steel's procrastination meta-analysis to Bowen family systems. If you want comfort, ask any chatbot; if you want to know what's actually going on, keep reading.

所有数据都在本地。一行命令即可装到 WorkBuddy、QwenWork（千问办公）或 Claude Code——不需要 API key、不需要云端账号，档案永不离开你的电脑。方法论背后有 60+ 篇学术来源支撑，从 Steel 的拖延元分析到 Bowen 家庭系统理论。想要安慰，随便找个聊天机器人；想弄清楚到底发生了什么，请往下读。

---

## Why this exists · 为什么做这个

Ask a normal chatbot "why do I always procrastinate?" and you'll get "That's so common, don't be too hard on yourself!" — comforting, useless, and slightly reinforcing the exact self-narrative you wanted examined.

你问普通 AI"我为什么总是拖延"，它会回你"这很正常啦，别太苛责自己"——听着舒服，但没用，而且还悄悄强化了你正想审视的那套自我说辞。

Life Teardown is built on a different premise: **an analysis tool that always validates you has no analytical value.** It separates what you *did* from what you *tell yourself about it*, demands that every judgment cite your own words, assigns confidence levels, and refuses to change its conclusion just because you pushed back.

人生分析师的前提不一样：**一个永远肯定你的分析工具，没有分析价值。** 它把你"做了什么"和"你怎么跟自己解释"分开，要求每条判断都引用你自己的原话，给结论标注置信度，并且不会因为你反驳就改口。

## The two skills · 两个技能

| Skill | Domain | Core question | Output |
|---|---|---|---|
| **behavior-analyst** | The *person*: emotions, habits, motives, relationships | "Why am I always like this?" | Pattern mapping → motive/attribution testing → change plan |
| **problem-diver** | The *event*: work/study/growth teardowns | "Why did this go wrong, and how do I do it better?" | Event reconstruction → difficulty location → method routing → root cause → action |

| 技能 | 领域 | 核心问题 | 输出 |
|---|---|---|---|
| **behavior-analyst**（行为分析师） | 「人」：情绪、习惯、动机、关系 | 我为什么总是这样？ | 模式识别 → 动机/归因检验 → 改变规划 |
| **problem-diver**（困难拆解师） | 「事」：工作/学习/成长复盘 | 这件事为什么没做好、下次怎么做好？ | 事件还原 → 困难定位 → 方法选路 → 根因 → 行动 |

They are **independent and never load each other** — with one exception: when a case intertwines "the task" and "the emotion," problem-diver runs a **dual-thread protocol** and may borrow behavior-analyst's method files as a guest (without inheriting its identity or memory-write rights).

两者**平级独立、互不加载**——唯一例外：当一件事里「事」和「情绪」缠在一起时，problem-diver 启动**双线程协议**，可以"客座引用"behavior-analyst 的方法文件（但不继承它的身份和记忆写入权）。

**Boundary rule of thumb:** asking about *one event* → problem-diver; asking about *a pattern / emotion / relationship* → behavior-analyst. Intent beats signal words.

**边界口诀**：问一件事 → problem-diver；问一类模式/情绪/关系 → behavior-analyst。诉求优先于信号词。

## What makes it different · 它凭什么不一样

- **Anti-sycophancy core (7 rules)** — fact/defense separation, every judgment must cite your verbatim words, "this part is fine" is allowed, three-level confidence, no generic comfort, resists caving when you push back, mandatory status footer every turn.
- **Evidence-based** — grounded in 60+ academic sources: Steel's procrastination meta-analysis, Bowen family systems, Barrett's emotional granularity, Gendlin's focusing, EFT/Gottman, Weiner attribution, Self-Determination Theory, Kahneman. See [REFERENCES.md](REFERENCES.md).
- **Memory with falsifiers** — every stored conclusion must carry a falsification condition. Conclusions aren't appended blindly; they're reviewed, superseded (`superseded_by` chains), or overturned — and overturned ones are *kept*, because they reveal your habitual attribution biases.
- **Two archives, one-way outbox** — write-permission isolation prevents a one-off task conclusion from polluting your long-term behavioral profile.
- **Safety by "guide, don't block"** — self-harm signals get a graded one-line prompt (never an interruption, never a refusal); relationship violence is the single exception that stops technique-style analysis. See the shared safety protocol.

- **反谄媚内核（7 条）**——事实与辩护分离、判断必挂你的原话、允许说"这部分没问题"、置信度三级、禁止普遍化安慰、你反驳也不轻易改口、每轮输出末尾强制状态页脚。
- **循证依据**——60+ 学术来源：Steel 拖延元分析、Bowen 家庭系统、Barrett 情绪粒度、Gendlin 聚焦疗法、EFT/Gottman、Weiner 归因、自我决定理论、卡尼曼。详见 [REFERENCES.md](REFERENCES.md)。
- **带证伪条件的记忆**——每条存档结论必须挂"什么新证据会推翻它"。结论不是无脑追加，而是被复核、被取代（superseded_by 链）、或被推翻——被推翻的也保留，因为它揭示你自我解释的惯用偏差。
- **双档案 + 单向 outbox**——写入权限隔离，防止一次性的「事」结论污染你长期的「人」画像。
- **安全边界「堵不如疏」**——自伤信号只做分级一行提示（绝不中断、绝不拒答）；关系暴力是唯一例外（停止沟通技巧式分析）。

## Platform compatibility · 平台兼容性

| Platform | Status | Notes |
|---|---|---|
| WorkBuddy | ✅ Native | Original development platform |
| QwenWork | ✅ Supported | Apply `adapters/qwenwork/` frontmatter for full bilingual UI |
| Claude Code / Desktop | ✅ Supported | Apply `adapters/claude-code/` frontmatter |
| Cursor | ⚠️ Partial | No skill loading; would need conversion to `.cursorrules` |
| Web-only (ChatGPT/Gemini/Claude.ai) | ❌ Not in v0.1.0 | No local file write → no cross-session memory. Planned for a later release |

| 平台 | 状态 | 说明 |
|---|---|---|
| WorkBuddy | ✅ 原生 | 项目开发平台 |
| QwenWork（千问办公） | ✅ 支持 | 应用 `adapters/qwenwork/` frontmatter 获得完整双语 UI |
| Claude Code / Desktop | ✅ 支持 | 应用 `adapters/claude-code/` frontmatter |
| Cursor | ⚠️ 部分 | 不支持 skill 加载，需转成 `.cursorrules` |
| 网页版（ChatGPT/Gemini/Claude.ai） | ❌ v0.1.0 不支持 | 无本地文件写入 → 无跨会话记忆，后续版本再评估 |

The skills use a **minimal common frontmatter** (`name` + `description` + `version`) that parses everywhere, plus a runtime path-adaptation layer (`$LIFE_TEARDOWN_ROOT` with per-platform defaults). Platform-specific metadata lives in [`adapters/`](adapters/).

技能用**最小公共 frontmatter**（`name` + `description` + `version`），所有平台都能解析；外加运行时路径自适配层（`$LIFE_TEARDOWN_ROOT` + 各平台默认值）。平台专属元数据放在 [`adapters/`](adapters/)。

## Quick start · 快速开始

```bash
# Auto-detects your platform and installs both skills / 自动检测平台并安装两个技能
curl -fsSL https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.sh | bash
```

Windows (PowerShell) / Windows 用户：

```powershell
irm https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.ps1 | iex
```

Manual install and per-platform details: see [INSTALL.md](INSTALL.md).

手动安装和各平台细节见 [INSTALL.md](INSTALL.md)。

## Target users · 目标用户

Designed and pressure-tested for **knowledge workers aged 25-40, bilingual (Chinese/English)**. The 22-case classification test drew from quarter-life-crisis research and Reddit communities. Other demographics (students, retirees, non-knowledge workers) may work but aren't the primary design target yet.

按 **25-40 岁、中英双语的知识工作者**设计和压测。22 题分类压测的样本来自四分之一人生危机研究和 Reddit 社区。其他人群（学生、退休、非知识工作者）可能也能用，但还不是主要设计目标。

**This tool will not comfort you.** If you need emotional support right now, please reach out to someone you trust or a professional counselor first. Life Teardown is a self-inquiry instrument, not therapy and not crisis intervention.

**这个工具不会安慰你。** 如果你现在需要情绪支持，请先找信任的人或专业咨询师。人生分析师是自我探索工具，不是心理咨询，不做危机干预。

## Repository layout · 目录结构

```
life-teardown/
├── skills/
│   ├── behavior-analyst/   # SKILL.md + .skill-metadata.yaml + references/
│   └── problem-diver/      # SKILL.md + .skill-metadata.yaml + references/
├── adapters/               # platform-specific frontmatter overrides / 各平台 frontmatter 覆盖版
├── examples/               # anonymized real analysis sessions / 匿名化真实分析案例
├── scripts/                # install.sh / install.ps1 / validate.py
├── DESIGN-NOTES.md         # full design rationale (V1→V5) / 完整设计思路（V1→V5 演化）
├── REFERENCES.md           # 60+ academic & open-source sources / 60+ 学术与开源来源
└── VALIDATION-PLAN.md      # observation-period metrics / 观察期指标
```

## Design philosophy · 设计原则

1. **Boundaries by description, not by rules** — let semantic understanding route, don't hardcode state machines.
2. **Light by default, deep only when worth it** — single perspective is the norm; dual-thread is the heavy weapon.
3. **Switch threads, not owners** — control stays with one skill; no handoff, no lost context.
4. **Separate fact from interpretation** — your self-attributions are marked "unverified"; conclusions must cite your words.
5. **Don't paper over contradictions** — conflicting conclusions are kept with their adjudication conditions.
6. **Memory should tell a story of change** — not a log, a trend.

1. **边界靠描述，不靠规则**——把判断交给语义理解，不写死状态机。
2. **默认轻量，值得才深挖**——单视角是常态，双线程是重武器。
3. **不换人，只换线**——控制权始终在一个技能手里，不交接、不丢上下文。
4. **事实与解释分层**——你的自我归因一律标"待验证"，结论必须挂原话。
5. **矛盾不掩盖**——冲突结论保留并标注裁决条件。
6. **档案要能讲出变化**——不做流水账，做趋势。

Full rationale, rejected designs, and open risks: [DESIGN-NOTES.md](DESIGN-NOTES.md).

完整设计思路、被否掉的方案、未解风险见 [DESIGN-NOTES.md](DESIGN-NOTES.md)。

## Status · 状态

**v0.1.0 beta** — design finalized, skills implemented, cross-platform packaging complete. Not yet validated through extended real-world use. The observation plan and success metrics are in [VALIDATION-PLAN.md](VALIDATION-PLAN.md). Feedback and case reports welcome via issues.

**v0.1.0 beta**——设计定稿、技能已实现、跨平台打包完成，但尚未经长期真实使用验证。观察计划和达标指标见 [VALIDATION-PLAN.md](VALIDATION-PLAN.md)。欢迎通过 issue 反馈和提交案例。

## License · 许可

MIT © 2026 PME0997 — see [LICENSE](LICENSE).

MIT © 2026 PME0997 — 见 [LICENSE](LICENSE)。

## Contributing · 参与贡献

- Bug / platform-compat / case-feedback issue templates in `.github/ISSUE_TEMPLATE/`
- Before contributing, read [DESIGN-NOTES.md](DESIGN-NOTES.md) — especially the anti-sycophancy core. Any change that softens analysis to improve "user experience" will be rejected on principle.

- `.github/ISSUE_TEMPLATE/` 里有 bug / 平台兼容 / 案例反馈模板
- 贡献前请先读 [DESIGN-NOTES.md](DESIGN-NOTES.md)，尤其是反谄媚内核。**任何为了"用户体验"而软化分析的改动，都会被原则性拒绝。**
