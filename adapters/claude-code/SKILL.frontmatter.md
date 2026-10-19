# Claude Code / Claude Desktop frontmatter 覆盖

Claude 的 skill 规范较宽松，`name` + `description`（英文为主）即可。把两个 SKILL.md 顶部 frontmatter 替换为下面对应块。正文不变。

> 注：Claude 官方推荐 description 用英文以利触发匹配。中文用户可在 description 末尾保留中文触发词。

## behavior-analyst

```yaml
---
name: behavior-analyst
description: Objective analysis of personal behavior and psychological patterns. Use when the user wants to unpack a habit, motive, or reaction — "why do I always procrastinate", "is it normal to feel...", "I keep fighting with my parents", "I can't stick to...". Routes to sub-skills with anti-sycophancy rules and cross-session memory. Not a replacement for therapy or casual chat. 中文触发："我为什么总是""帮我分析我这个习惯""我这种想法对不对""我和父母总是吵架"。
version: 0.1.0
---
```

## problem-diver

```yaml
---
name: problem-diver
description: Structured teardown and review of concrete difficulties in work/study/growth. Use when a specific thing went wrong and the user wants root cause and fixes — "my proposal was rejected", "I can't grasp the point in presentations", "I understand in meetings but can't execute", "should I quit/move/change careers". Flow: event reconstruction -> difficulty location -> method routing -> root cause -> action. Dual-thread protocol for task+emotion cases. Not for emotional counseling or relationship conflicts. 中文触发："方案被否了帮我复盘""做 PPT 抓不住重点""要不要辞职"。
version: 0.1.0
---
```
