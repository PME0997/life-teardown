# QwenWork frontmatter 覆盖

把 `skills/behavior-analyst/SKILL.md` 和 `skills/problem-diver/SKILL.md` 顶部的 frontmatter（`---` 到 `---`）分别替换为下面对应块。正文不变。

## behavior-analyst

```yaml
---
name: behavior-analyst
name_en: Behavior Analyst
name_zh: 行为分析师
description: Objective analysis of personal behavior and psychological patterns. Use when the user wants to unpack a habit, motive, or reaction — e.g. "why do I always procrastinate", "is it normal to feel...", "I keep fighting with my parents". Routes to sub-skills (behavior origin / motive dig / pattern verify / decision emotion / change plan / relationship / emotion clarify / intimacy analysis) with anti-sycophancy rules and cross-session memory. Not a replacement for therapy, emotional comfort, or casual chat.
description_en: Objective analysis of personal behavior and psychological patterns. Use when the user wants to unpack a habit, motive, or reaction. Routes to sub-skills with anti-sycophancy rules and cross-session memory. Not a replacement for therapy or casual chat.
description_zh: 个人行为与心理模式的客观分析与改变技能。当用户希望拆解自己的行为、习惯、动机或心理想法时使用——例如"我为什么总是拖延""我这种想法对不对""我和父母总是吵架该怎么处理""恋爱中总是患得患失正常吗"。通过场景路由唤醒子技能，以反谄媚规则保证分析客观，结论沉淀至本地档案实现跨会话模式追踪。不用于心理咨询替代、情绪安抚或日常闲聊。
argument-hint: Describe the behavior, reaction, or relationship pattern you want to unpack
argument-hint-en: Describe the behavior, reaction, or relationship pattern you want to unpack
argument-hint-zh: 描述你想拆解的行为、反应或关系模式
user-invocable: true
version: 0.1.0
---
```

## problem-diver

```yaml
---
name: problem-diver
name_en: Problem Diver
name_zh: 困难拆解师
description: Structured teardown and review of concrete difficulties in work/study/growth. Use when a specific thing went wrong and the user wants root cause and fixes — e.g. "my proposal was rejected, help me review", "I can't grasp the point in presentations", "should I quit/move/change careers". Flow: event reconstruction -> difficulty location -> method routing (5 Whys / fishbone / pyramid / MECE / Issue Tree / Occam / Inversion / 80-20 / review) -> root cause -> action. Supports a dual-thread protocol for task+emotion cases. Not for emotional counseling, relationship conflicts, or pure psychological pattern analysis (those go to behavior-analyst).
description_en: Structured teardown and review of concrete difficulties in work/study/growth. Use when a specific thing went wrong and the user wants root cause and fixes. Supports a dual-thread protocol for task+emotion cases. Not for emotional counseling or relationship conflicts.
description_zh: 工作/学习/成长场景中的具体困难拆解与复盘技能。当用户遇到一件具体的事没做好、想复盘找原因和改进方法时使用——例如"方案被否了帮我复盘""做 PPT 总是抓不住重点""要不要辞职/换行"。核心流程：事件还原→困难定位→方法论选路→根因确认→改进方案。支持双线程协议处理"事+情绪"交织问题。不用于情绪疏导、人际关系矛盾、纯心理模式分析（归 behavior-analyst）。
argument-hint: Describe what went wrong, or the decision you're weighing
argument-hint-en: Describe what went wrong, or the decision you're weighing
argument-hint-zh: 描述哪件事没做好，或你在纠结的决定
user-invocable: true
version: 0.1.0
---
```
