# WorkBuddy frontmatter 覆盖

WorkBuddy 是本项目原生平台。把两个 SKILL.md 顶部 frontmatter 替换为下面对应块（保留 `agent_created` 字段）。正文不变。

> 注：WorkBuddy 用户也可直接用 `skills/` 里的最小公共 frontmatter，功能不受影响；本覆盖版额外提供 `agent_created` 标记与中文 description。

## behavior-analyst

```yaml
---
name: behavior-analyst
description: 个人行为与心理模式的客观分析与改变技能。当用户希望拆解自己的行为、习惯、动机或心理想法时使用——例如"我为什么总是拖延""帮我分析我这个习惯从哪来的""我这种想法对不对""我该怎么改掉这个毛病""我和父母总是吵架该怎么处理""最近有点难受但说不清哪里难受""恋爱中总是患得患失正常吗"。通过场景路由唤醒子技能，以反谄媚规则保证分析客观，结论沉淀至本地档案实现跨会话模式追踪。不用于心理咨询替代、情绪安抚或日常闲聊。English triggers - "why do I always / keep...", "help me understand my reaction", "is it normal to feel..."。输出语言跟随用户输入语言。
agent_created: true
version: 0.1.0
---
```

## problem-diver

```yaml
---
name: problem-diver
description: 工作/学习/成长场景中的具体困难拆解与复盘技能。当用户遇到一件具体的事没做好、想复盘找原因和改进方法时使用——例如"方案被否了帮我复盘""做 PPT 总是抓不住重点""开会听懂了但做不出来""汇报思路混乱""面试挂了帮我分析""要不要辞职/换行/搬家"等决策分析。核心流程：事件还原→困难定位→方法论选路→根因确认→改进方案。支持双线程协议处理"事+情绪"交织问题。不用于情绪疏导、人际关系矛盾、纯心理模式分析（归 behavior-analyst 技能）。English triggers - "help me review what went wrong", "should I quit / move / change careers"。输出语言跟随用户输入语言。
agent_created: true
version: 0.1.0
---
```
