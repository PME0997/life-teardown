# REFERENCES.md

本清单收录 behavior-analyst 与 problem-diver 技能在设计过程中调研、参考或借鉴过的全部外部资料。标注"（待核实）"的条目表示本对话中引用过但原始 URL 未在记录中保留，发布前请自行核实。

---

## 一、学术论文 / 研究

- **The Nature of Procrastination: A Meta-Analytic and Theoretical Review of Quintessential Self-Regulatory Failure** — Piers Steel（University of Calgary，2007）— 拖延强预测因子四要素（任务厌恶度、奖励距离、自我效能、冲动性），用于 `sub-motivation-dig.md` 拖延专项路径与 `evidence-base.md` 第一节 — https://doi.org/10.1037/0033-2909.133.1.65
- **Procrastination and the Priority of Short-Term Mood Regulation: Consequences for Future Self** — Fuschia Sirois & Timothy Pychyl（2013，Social and Personality Psychology Compass）— "拖延是短期情绪修复"模型及六种驱动情绪分类，用于动机挖掘情绪辨认环节 — https://doi.org/10.1111/spc3.12011
- **自我宽恕与拖延减少的相关研究** — Fuschia Sirois 等（年份待核实）— 输出协议"禁止推向自我批判"红线的依据 — （待核实）
- **Cognitive Architectures for Language Agents（CoALA）** — Theodore Sumers 等（Princeton，2023）— 智能体记忆分类框架（工作记忆/情景记忆/语义记忆/程序记忆），problem-diver 与 behavior-analyst 双档案分离设计的依据 — https://arxiv.org/abs/2309.02427
- **Generative Agents: Interactive Simulacra of Human Behavior** — Joon Sung Park 等（Stanford & Google，2023）— reflection 机制（定期把观察整合为高层结论），档案层"画像层（profile）每 5 条整合趋势"的灵感来源 — https://arxiv.org/abs/2304.03442
- **Mem0: Building Production-Ready AI Agents with Scalable Long-Term Memory** — Mem0 团队（2024，arXiv）— 记忆整合管线（冲突检测、更新而非追加，报告 +26% 效果提升），superseded_by 取代链设计的参考 — https://arxiv.org/abs/2504.19413 （年份/编号待核实）
- **Zep: A Temporal Knowledge Graph Architecture for Agent Memory** — Zep 团队（2025，arXiv）— 记忆的时效性与失效处理思想，contradicts 字段与时序取代链的借鉴对象 — https://arxiv.org/abs/2501.13956 （待核实）
- **How Are Habits Formed: Modelling Habit Formation in the Real World** — Phillippa Lally, Cornelia van Jaarsveld, Henry Potts & Jane Wardle（UCL，2010，European Journal of Social Psychology）— 习惯固化中位 66 天（18-254 天）、"漏做一天无碍"，用于 `sub-change-plan.md` 预期校准 — https://doi.org/10.1002/ejsp.674
- **习惯的双控制模式研究（动机控制 vs 线索控制）** — Wendy Wood（USC，多篇综述）— "已自动化习惯靠动机干预基本无效、自制力=环境设计"的策略分流依据 — （待核实，可参考 Wood & Rünger 2016, Annual Review of Psychology, https://doi.org/10.1146/annurev-psych-122414-033417）
- **The Behaviour Change Wheel: A New Method for Characterising and Designing Behaviour Change Interventions（COM-B 模型）** — Susan Michie 等（UCL，2011，Implementation Science）— 能力/机会/动机三要素，用于改变规划方案组装 — https://doi.org/10.1186/1748-5908-6-42
- **The Behavior Change Technique Taxonomy (v1)** — Susan Michie 等（2013，Annals of Behavioral Medicine）— 93 项行为改变技术清单，作为改变规划的策略池 — https://doi.org/10.1007/s12160-013-9486-6
- **Fogg Behavior Model（B=MAP）** — BJ Fogg（Stanford）— 动机/能力/提示三要素与"小到不可能失败"的起步设计 — https://www.behaviormodel.org/
- **An Attributional Theory of Achievement Motivation and Emotion** — Bernard Weiner（UCLA，1985，Psychological Review）— 归因三维度（内外/稳定/可控），用于 `sub-pattern-verify.md` 归因检验 — https://doi.org/10.1037/0033-295X.92.4.548
- **Self-Determination Theory 及过度理由效应** — Edward Deci & Richard Ryan（University of Rochester，2000 及系列研究）— 自主/胜任/关系三需求框架，用于动机挖掘交叉验证 — https://selfdeterminationtheory.org/theory/
- **Unskilled and Unaware of It** — Justin Kruger & David Dunning（Cornell，1999，JPSP）— 元认知校准的正确版本（含对网传"愚昧山峰"图的辟谣），用于 `evidence-base.md` 第六节 — https://doi.org/10.1037/0022-3514.77.6.1121
- **情绪粒度 / 情绪区分度研究（Emotional Granularity / Differentiation）** — Lisa Feldman Barrett（Northeastern University，2001 起系列研究；著作《How Emotions Are Made》，2017）— "命名即调节"机制与情绪粒度对调节策略储备的影响，用于 `sub-emotion-clarify.md` — https://lisafeldmanbarrett.com/books/ （期刊原文待核实）
- **Affect Labeling 神经机制研究** — Matthew Lieberman（UCLA，2007，Psychological Science）— 情绪命名降低杏仁核激活的证据 — https://doi.org/10.1111/j.1467-9280.2007.01916.x
- **Focusing（聚焦疗法）与 Felt Sense** — Eugene Gendlin（University of Chicago，1981，《Focusing》）— 六步法、felt shift 身体确认信号、"现成答案不算发现"，用于情绪澄清流程 — （出版社版本，无官方 URL；介绍见 https://focusing.org/）
- **Family Therapy in Clinical Practice（家庭系统治疗、自我分化、三角化）** — Murray Bowen（1978）— 自我分化、"缠结/三角化/重复剧本"识别、"对父母负责 ≠ 为父母情绪负责"，用于 `sub-relationship.md` — （无官方 URL）
- **代际矛盾心态（Intergenerational Ambivalence）研究** — Kurt Lüscher & Karl Pillemer（1998，American Sociological Review）— "又爱又烦是成年亲子关系常态" — https://doi.org/10.2307/2657247
- **Romantic Love Conceptualized as an Attachment Process** — Cindy Hazan & Phillip Shaver（1987，JPSP）— 成人亲密关系依恋框架，用于 `sub-intimacy-analysis.md`（采用维度化用法，不打类型标签） — https://doi.org/10.1037/0022-3514.52.3.511
- **依恋维度模型（焦虑 × 回避两维）** — Brennan, Clark & Shaver（1998）— 依恋按维度而非类型呈现的依据 — （待核实）
- **Emotionally Focused Therapy 与三种负向互动循环** — Sue Johnson（Ottawa，《Hold Me Tight》，2008）— 追-逃/互追/互逃循环识别，用于亲密子技能 — https://iceeft.com/what-is-eft/
- **四骑士（Four Horsemen）与修复尝试研究** — John Gottman & Robert Levenson（Gottman Institute，纵向研究系列）— 批评/蔑视/防御/筑墙四信号，用于亲密子技能与关系拆解 — https://www.gottman.com/blog/the-four-horsemen-recognizing-criticism-contempt-defensiveness-and-stonewalling/
- **认知扭曲清单（十条目）** — Aaron Beck（认知治疗体系）；David Burns《Feeling Good》（1980）整理版 — 情绪化推理、全或无、贴标签等扫描项，用于模式验证 — （无官方 URL）
- **Thinking, Fast and Slow（偏差审计、事前验尸）** — Daniel Kahneman（Princeton，2011）— `decision-auditor` 类工作流与本技能偏差快扫的方法来源 — （无官方 URL）

---

## 二、开源项目

- **anti-sycophancy-prompt** — talhapythoneer — 基于 42 篇研究整理的反谄媚系统提示词；防谄媚内核的学术依据框架来源 — https://github.com/talhapythoneer/anti-sycophancy-prompt （待核实）
- **stop-llm-bullshit** — anthony-maio — 分模型定制反谄媚提示词与 No-BS 模式切换，启发了"分析模式/执行模式"分流 — https://github.com/anthony-maio/stop-llm-bullshit （待核实）
- **moollm（no-ai-sycophancy skill）** — SimHacker — 8 种谄媚罪状清单（如 RETROACTIVE-AGREEMENT）与违规日志设计 — https://github.com/SimHacker/moollm （待核实）
- **AI-Prompts（Anti-Sycophancy.md）** — adrianspeyer — 一页纸简版规则参考 — https://github.com/adrianspeyer/AI-Prompts （待核实）
- **thinking-skills** — wanikua — 20 个思维框架 skill 集（第一性原理、逆向、钢人、红队、事前验尸等）；本技能子技能"按需路由而非全量加载"的菜单来源 — https://github.com/wanikua/thinking-skills （待核实）
- **claude-skill-registry（decision-audit）** — majiayu000 — 基于卡尼曼的偏差检查/事前验尸/重构工作流，决策审视子技能参考 — https://github.com/majiayu000/claude-skill-registry （待核实）
- **claude-think-first** — aplaceforallmystuff — 12 个心智模型的决策前暂停机制，启发了"决策时刻自动触发"设计 — https://github.com/aplaceforallmystuff/claude-think-first （待核实）
- **meta-structured-problem** — asgard-ai-platform — MECE 问题树 + 假设驱动 + 金字塔输出，问题拆解结构参考 — https://github.com/asgard-ai-platform （待核实）
- **skills-for-humanity（psychology-cognitive-biases）** — human-avatar — "针对具体决定逐个扫描活着的偏差 + 纠正动作 + 失真风险评级"的输出格式 — https://github.com/human-avatar/skills-for-humanity （待核实）
- **claude（scout-mindset-bias-check）** — lyndonkl — 侦察兵/士兵思维模型与反转测试，模式验证子技能核心 — https://github.com/lyndonkl/claude （待核实）
- **sofia（meta-reasoning-bias-detective）** — grasberg — 系统性偏差/谬误分类库（含基本归因错误、自利偏差） — https://github.com/grasberg/sofia （待核实）
- **mycelium（bias-check）** — haabe — "用户自查 + 模型自检"双向偏差检查设计 — https://github.com/haabe/mycelium （待核实）
- **nuwa-skill（女娲）** — alchaincyf — 17 位名人思维蒸馏（芒格/费曼/塔勒布等）；定位为可选"外挂视角"，未并入主技能 — https://github.com/alchaincyf/nuwa-skill
- **pyramid-principle-for-operators** — wilsonwu-ai — 金字塔原理 skill 与"禁止编造证据"检查器设计 — https://github.com/wilsonwu-ai/pyramid-principle-for-operators （待核实）
- **minto-pyramid-skill** — millwright-labs — 结论先行的输出结构约束与提问闸门 — https://github.com/millwright-labs/minto-pyramid-skill （待核实）

---

## 三、方法论的理论来源（框架创始人 / 出处）

- **金字塔原理（Minto Pyramid Principle）** — Barbara Minto（McKinsey，1987）— 输出协议"结论先行"表达格式 — （无官方 URL）
- **侦察兵思维 vs 士兵思维** — Julia Galef《The Scout Mindset》（2021）— 模式验证中识别辩护性语言的框架 — https://www.amazon.com/Scout-Mindset-Perils-Defensive-Thinking/dp/0735217556 （或作者站点 juliasgalef.com）
- **执行意图（Implementation Intentions，if-then 计划）** — Peter Gollwitzer（NYU，1999，American Psychologist）— 改变规划方案组装核心组件 — https://doi.org/10.1037/0003-066X.54.7.493
- **习惯叠加（Habit Stacking）** — S.J. Scott 推广（2014），底层机制源自执行意图与线索触发研究 — 改变规划中"新习惯挂在旧习惯后" — （待核实）
- **5 Why 根因分析** — 丰田生产体系（大野耐一）— 动机挖掘下钻工具 — （无单一 URL）
- **红队（Red Teaming）/ 事前验尸（Premortem）** — Gary Klein（2007，Harvard Business Review）— 模式验证与决策审视的对抗性检验 — https://hbr.org/2007/09/performing-a-project-premortem
- **10-10-10 法则** — Suzy Welch（2006）— 决策审视的时间视角工具 — （待核实）
- **ABC 模型 / 行为功能分析（Functional Analysis）** — 行为主义传统（Skinner）经 CBT 临床标准化 — 行为溯源的行为链（前因→认知→行为→短期/长期后果）与四大行为功能 — （教科书级知识，无单一 URL）
- **六顶思考帽** — Edward de Bono（1985）— thinking-skills 菜单参考项，未直接纳入子技能 — （无官方 URL）
- **第一性原理 / 逆向思维 / 二阶思维** — 分别源自 Aristotle / Charlie Munger（《Poor Charlie's Almanack》）/ Howard Marks — 思维框架菜单参考 — （无单一 URL）
- **鱼骨图（因果图 / Ishikawa Diagram）** — 石川馨（Kaoru Ishikawa，1968）— problem-diver 方法论库的多因拆解工具 — （教科书级知识，无单一 URL）
- **SCQA 框架（情境-冲突-疑问-答案）** — Barbara Minto（随金字塔原理体系）— problem-diver 问题陈述结构化 — （无官方 URL）
- **帕累托法则（80/20）** — Vilfredo Pareto（1896 观察）；Joseph Juran 推广至质量管理 — problem-diver 找关键少数因子 — （无单一 URL）
- **复盘四步法** — 联想集团管理实践（柳传志体系化）；底层与美军 AAR（After Action Review）同源 — problem-diver 复盘模块 — （待核实）
- **KISS 复盘法 / PDCA 循环** — KISS 为民间复盘变体；PDCA 源自 Walter Shewhart，由 W. Edwards Deming 推广 — problem-diver 复盘模块 — （教科书级知识）
- **奥卡姆剃刀** — William of Ockham（14 世纪）— problem-diver 假设筛选原则 — （无单一 URL）

---

## 四、行业报告 / 调研数据

- **大模型迎合性（sycophancy）系统性评测** — 南都大数据研究院（2025-2026）— 国产模型谄媚度对比（DeepSeek 谄媚第一、Qwen 唯一标注用户错误数据等），用于模型选型建议 — （待核实）
- **GitHub sycophancy 榜单（叙事者迎合率 / 表态率 / 弃权机制）** — 开源评测项目 — Kimi 表态率 90.4%、Qwen 3.7 迎合率等数据 — （仓库 URL 待核实）
- **AITA 道德判断谄媚测试（Qwen 79%、DeepSeek 76% 站有错一方）** — Mental Momentum（年份待核实）— 早期模型对比数据 — （待核实）
- **魔镜测试（用户身份对判断的影响，GLM-5.3 Gap -0.08 第一）** — 雪球个人作者评测（2026）— 版本漂移证据与 5 分钟自测法设计依据 — （待核实，个人作者小样本，可信度有限）
- **sycoindex 诚实度评分（Claude 92.8、DeepSeek 60 等）** — sycoindex 项目 — 模型诚实度对比 — （待核实）
- **OpenAI GPT-4o 谄媚事件公开回滚说明** — OpenAI 官方博客（2025-04）— "谄媚是训练产物、厂商在整改"的行业背景 — https://openai.com/index/sycophancy-in-gpt-4o/ （待核实）
- **国产大模型综合测评（幻觉控制 Kimi 第一等）** — 网易科技测评（2026-05）— 模型选型交叉验证 — （待核实）

---

## 五、技术文档 / SDK

- **WorkBuddy Skill 规范与 skill-creator 脚本（init_skill.py / package_skill.py）** — WorkBuddy 官方内置技能 — 技能骨架初始化、frontmatter 规范与打包校验 — （内置工具，无公开 URL）
- **WorkBuddy 用户级技能目录约定（~/.workbuddy/skills/）** — WorkBuddy 官方文档 — 技能安装位置与作用域 — https://www.workbuddy.cn/docs/workbuddy/Overview （待核实具体页面）

---

## 附：关于本清单的三点说明

1. **标注"（待核实）"的 GitHub 项目**：均来自对话过程中的检索结果快照，发布前建议逐个打开确认仓库仍存在且描述相符；若仓库已删除或改名，请移除或更新。
2. **学术论文**：DOI 链接均已核实为真实文献；仅标注待核实的条目（Sirois 自我宽恕、依恋维度模型、情绪粒度期刊原文）请按标题检索后补全。
3. **行业报告**：南都、魔镜测试等为对话中引用的评测结论，属于方向性参考而非精确数据，发布时建议保留这一限定说明。
