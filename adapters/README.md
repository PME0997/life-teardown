# adapters/ — 平台专属 frontmatter 覆盖

`skills/` 目录里的 SKILL.md 使用**最小公共 frontmatter**（`name` + `description` + `version`），保证在所有平台都能被解析。本目录提供各平台的**完整 frontmatter 覆盖版**，按需替换 SKILL.md 顶部的 frontmatter 块，以获得该平台的完整本地化体验。

## 用法

1. 找到你所在平台的子目录（qwenwork / claude-code / workbuddy）
2. 打开对应的 `SKILL.frontmatter.md`，里面有两个技能的完整 frontmatter
3. 用编辑器把 `skills/<技能名>/SKILL.md` 顶部 `---` 到 `---` 之间的内容，替换为对应平台的 frontmatter
4. 正文（frontmatter 以下）保持不变

> 一键安装脚本 `scripts/install.sh` / `install.ps1` 会自动检测平台并应用对应覆盖，无需手动替换。本目录是给"想手动装"或"脚本检测失败"的用户准备的。

## 各平台差异

| 平台 | frontmatter 特点 | 档案默认路径 |
|---|---|---|
| QwenWork | 需 name_en/name_zh、description_en/description_zh、argument-hint(+en/zh)、user-invocable | `~/.qwenworkcn/user-data/life-teardown/` |
| Claude Code | name + description（英文为主）即可 | `~/.claude/user-data/life-teardown/` |
| WorkBuddy | name + description + agent_created | `~/.workbuddy/life-teardown/` |
| 其他/通用 | 用 skills/ 里的最小公共 frontmatter，无需覆盖 | `~/.local/share/life-teardown/` |

## 不替换会怎样

不替换也能用——最小公共 frontmatter 在所有平台都能被解析，技能功能完整。替换只是为了：
- QwenWork：获得双语显示名、Quick Command 提示、`.skill-metadata.yaml` 推荐 query 的完整 UI 体验
- 其他平台：获得该平台原生的元数据字段

功能（分析逻辑、路由、记忆层）不依赖 frontmatter 覆盖。
