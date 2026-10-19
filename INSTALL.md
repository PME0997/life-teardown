# INSTALL — 安装指南

Life Teardown 是两个技能（behavior-analyst + problem-diver）的套件。安装 = 把 `skills/` 下的两个目录放进你平台的技能目录，并创建档案根目录。

---

## 方式一：一键安装（推荐）

**macOS / Linux：**
```bash
curl -fsSL https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.sh | bash
```

**Windows（PowerShell）：**
```powershell
irm https://raw.githubusercontent.com/PME0997/life-teardown/main/scripts/install.ps1 | iex
```

脚本会自动：检测平台 → 复制技能到正确目录 → 应用对应 `adapters/` frontmatter → 创建档案根目录 → 打印试用示例。

---

## 方式二：手动安装

### 1. 确定你的平台技能目录

| 平台 | 技能目录 | 档案根目录（默认） |
|---|---|---|
| QwenWork | `~/.qwenworkcn/skills/` | `~/.qwenworkcn/user-data/life-teardown/` |
| Claude Code | `~/.claude/skills/` | `~/.claude/user-data/life-teardown/` |
| WorkBuddy | `~/.workbuddy/skills/` | `~/.workbuddy/life-teardown/` |
| 其他/通用 | 平台指定目录 | `~/.local/share/life-teardown/` |

（Windows 下 `~` = `%USERPROFILE%`）

### 2. 复制技能目录

把本仓库 `skills/behavior-analyst/` 和 `skills/problem-diver/` **整个目录**复制到上表对应技能目录下。复制后应是：
```
<技能目录>/behavior-analyst/SKILL.md
<技能目录>/behavior-analyst/references/...
<技能目录>/problem-diver/SKILL.md
<技能目录>/problem-diver/references/...
```
⚠️ 注意：SKILL.md 必须直接在 `behavior-analyst/` 下，**不要多套一层同名目录**。

### 3. 应用平台 frontmatter（可选，提升体验）

打开 `adapters/<你的平台>/SKILL.frontmatter.md`，把对应技能的 frontmatter 块替换进 SKILL.md 顶部（`---` 到 `---` 之间）。正文不动。

不替换也能用——`skills/` 里的最小公共 frontmatter 在所有平台都能解析，功能完整。替换只是为了获得平台原生的双语显示名 / Quick Command 提示等 UI 体验。

### 4. 创建档案根目录

```bash
mkdir -p ~/.local/share/life-teardown/behavior-archive
mkdir -p ~/.local/share/life-teardown/problem-archive
```
（按你的平台默认路径替换；或用环境变量指定，见下）

### 5. 自定义档案位置（可选）

技能启动时按以下顺序解析档案根目录：
1. 环境变量 `$LIFE_TEARDOWN_ROOT`（若设置，优先）
2. 平台默认路径（见上表）

想统一放到别处：
```bash
export LIFE_TEARDOWN_ROOT=/your/path/life-teardown   # macOS/Linux
# Windows PowerShell: $env:LIFE_TEARDOWN_ROOT="D:\your\path\life-teardown"
```

---

## 验证安装

在你的平台里输入任一触发语：
- behavior-analyst：`我为什么总是拖延`
- problem-diver：`帮我复盘一件没做好的事`

技能应被自动唤醒并开始问诊。若没触发，用明确指令：`用行为分析师帮我分析…` 或 `用困难拆解师帮我复盘…`。

---

## 卸载

1. 删除技能目录下的 `behavior-analyst/` 和 `problem-diver/`
2. 删除档案根目录（**注意：这会删除你的全部分析档案，卸载前请备份**）

档案是你长期积累的分析记录，删除不可恢复。建议卸载前先备份 `<档案根>/` 整个目录。

---

## 常见问题

**Q：两个技能必须一起装吗？**
A：建议一起装。双线程协议和跨档案趋势对照依赖两者都在。单独装一个也能用，但客座引用和 outbox 裁决功能会降级。

**Q：网页版（ChatGPT/Claude.ai）能用吗？**
A：v0.1.0 不支持。网页版无本地文件写入，跨会话记忆（本工具核心价值）无法工作。后续版本会评估精简体验包。

**Q：档案会上传吗？隐私如何？**
A：不会。档案是纯本地文件（`<档案根>/*.json` 和 `*.md`），不联网、不上传。你可以随时打开查看、编辑、删除。

**Q：references/ 是中文，英文用户能用吗？**
A：能。SKILL.md 的 frontmatter 和 README 是双语，模型读中文 references 不影响英文对话输出（输出语言跟随用户输入语言）。references/ 的完整英文翻译在 v0.2.0。
