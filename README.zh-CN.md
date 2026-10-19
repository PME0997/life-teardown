# 人生分析师 · Life Teardown

**不谄媚的 AI 自我拆解工具——两个不哄你、只帮你看清自己的 AI 技能。**

> English: [README.md](README.md)

<!-- 演示 GIF 占位：录一段真实分析对话放这里 -->

大多数 AI 都会顺着你说话。人生分析师不会。它是一套跑在桌面 AI agent 上的双技能工具，帮你搞清楚**自己为什么会这样做**、**某件事为什么没做好**——用循证方法、反谄媚纪律，以及能跨会话追踪你模式变化的本地档案。

---

## 为什么做这个

你问普通 AI"我为什么总是拖延"，它会回你"这很正常啦，别太苛责自己"——听着舒服，但没用，而且还悄悄强化了你正想审视的那套自我说辞。

人生分析师的前提不一样：**一个永远肯定你的分析工具，没有分析价值。** 它把你"做了什么"和"你怎么跟自己解释"分开，要求每条判断都引用你自己的原话，给结论标注置信度，并且不会因为你反驳就改口。

## 两个技能

| 技能 | 领域 | 核心问题 | 输出 |
|---|---|---|---|
| **behavior-analyst**（行为分析师） | "人"：情绪、习惯、动机、关系 | 我为什么总是这样？ | 模式识别 → 动机/归因检验 → 改变规划 |
| **problem-diver**（困难拆解师） | "事"：工作/学习/成长复盘 | 这件事为什么没做好、下次怎么做好？ | 事件还原 → 困难定位 → 方法选路 → 根因 → 行动 |

两者**平级独立、互不加载**——唯一例外：当一件事里"事"和"情绪"缠在一起时，problem-diver 启动**双线程协议**，可以"客座引用"behavior-analyst 的方法文件（但不继承它的身份和记忆写入权）。

**边界口诀**：问一件事 → problem-diver；问一类模式/情绪/关系 → behavior-analyst。诉求优先于信号词。

## 它凭什么不一样

- **反谄媚内核（7 条）**——事实与辩护分离、判断必挂你的原话、允许说"这部分没问题"、置信度三级、禁止普遍化安慰、你反驳也不轻易改口、每轮输出末尾强制状态页脚。
- **循证依据**——60+ 学术来源：Steel 拖延元分析、Bowen 家庭系统、Barrett 情绪粒度、Gendlin 聚焦疗法、EFT/Gottman、Weiner 归因、自我决定理论、卡尼曼。详见 [REFERENCES.md](REFERENCES.md)。
- **带证伪条件的记忆**——每条存档结论必须挂"什么新证据会推翻它"。结论不是无脑追加，而是被复核、被取代（superseded_by 链）、或被推翻——被推翻的也保留，因为它揭示你自我解释的惯用偏差。
- **双档案 + 单向 outbox**——写入权限隔离，防止一次性的"事"结论污染你长期的"人"画像。
- **安全边界"堵不如疏"**——自伤信号只做分级一行提示（绝不中断、绝不拒答）；关系暴力是唯一例外（停止沟通技巧式分析）。

## 平台兼容性

| 平台 | 状态 | 说明 |
|---|---|---|
| WorkBuddy | ✅ 原生 | 项目开发平台 |
| QwenWork（千问办公） | ✅ 支持 | 应用 `adapters/qwenwork/` frontmatter 获得完整双语 UI |
| Claude Code / Desktop | ✅ 支持 | 应用 `adapters/claude-code/` frontmatter |
| Cursor | ⚠️ 部分 | 不支持 skill 加载，需转成 `.cursorrules` |
| 网页版（ChatGPT/Gemini/Claude.ai） | ❌ v0.1.0 不支持 | 无本地文件写入 → 无跨会话记忆，后续版本再评估 |

技能用**最小公共 frontmatter**（`name` + `description` + `version`），所有平台都能解析；外加运行时路径自适配层（`$LIFE_TEARDOWN_ROOT` + 各平台默认值）。平台专属元数据放在 [`adapters/`](adapters/)。

## 快速开始

```bash
# 自动检测平台并安装两个技能
curl -fsSL https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.sh | bash
```

Windows（PowerShell）：

```powershell
irm https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.ps1 | iex
```

手动安装和各平台细节见 [INSTALL.md](INSTALL.md)。

## 目标用户

按 **25-40 岁、中英双语的知识工作者**设计和压测。22 题分类压测的样本来自四分之一人生危机研究和 Reddit 社区。其他人群（学生、退休、非知识工作者）可能也能用，但还不是主要设计目标。

**这个工具不会安慰你。** 如果你现在需要情绪支持，请先找信任的人或专业咨询师。人生分析师是自我探索工具，不是心理咨询，不做危机干预。

## 目录结构

```
life-teardown/
├── skills/
│   ├── behavior-analyst/   # SKILL.md + .skill-metadata.yaml + references/
│   └── problem-diver/      # SKILL.md + .skill-metadata.yaml + references/
├── adapters/               # 各平台 frontmatter 覆盖版
├── examples/               # 匿名化真实分析案例
├── scripts/                # install.sh / install.ps1 / validate.py
├── DESIGN-NOTES.md         # 完整设计思路（V1→V5 演化）
├── REFERENCES.md           # 60+ 学术与开源来源
└── VALIDATION-PLAN.md      # 观察期指标
```

## 设计原则

1. **边界靠描述，不靠规则**——把判断交给语义理解，不写死状态机。
2. **默认轻量，值得才深挖**——单视角是常态，双线程是重武器。
3. **不换人，只换线**——控制权始终在一个技能手里，不交接、不丢上下文。
4. **事实与解释分层**——你的自我归因一律标"待验证"，结论必须挂原话。
5. **矛盾不掩盖**——冲突结论保留并标注裁决条件。
6. **档案要能讲出变化**——不做流水账，做趋势。

完整设计思路、被否掉的方案、未解风险见 [DESIGN-NOTES.md](DESIGN-NOTES.md)。

## 状态

**v0.1.0 beta**——设计定稿、技能已实现、跨平台打包完成，但尚未经长期真实使用验证。观察计划和达标指标见 [VALIDATION-PLAN.md](VALIDATION-PLAN.md)。欢迎通过 issue 反馈和提交案例。

## 许可

MIT © 2026 PME0997 — 见 [LICENSE](LICENSE)。

## 参与贡献

- `.github/ISSUE_TEMPLATE/` 里有 bug / 平台兼容 / 案例反馈模板
- 贡献前请先读 [DESIGN-NOTES.md](DESIGN-NOTES.md)，尤其是反谄媚内核。**任何为了"用户体验"而软化分析的改动，都会被原则性拒绝。**
