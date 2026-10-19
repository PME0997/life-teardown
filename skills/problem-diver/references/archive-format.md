# 记忆层规范（problem-archive）

档案根目录：`<档案根>/problem-archive/`（档案根解析规则见 SKILL.md「运行时平台适配」节；默认 `~/.life-teardown/`，可被环境变量 `$LIFE_TEARDOWN_ROOT` 覆盖）

```
problem-archive/
├── conclusions.json      # 结论层（默认只访问这里）
├── profile.md            # 画像层（整合产物：趋势与变化）
├── raw/
│   └── YYYY-MM-DD.md     # 原文层（按需回溯）
└── outbox/
    └── YYYY-MM-DD.md     # 人线发现候选（待 behavior-analyst 裁决）
```

## 一、结论层 schema（conclusions.json）

```json
{
  "version": 1,
  "entries": [
    {
      "id": "p-20261018-001",
      "date": "2026-10-18",
      "domain": "方案制作",
      "event": "季度汇报方案被否，要求重做",
      "conclusion": "卡点不在内容理解而在信息优先级排序：能复述方案细节但无法判断呈现顺序",
      "root_cause": "听需求时只记结论不记约束条件，导致制作时缺判断依据",
      "confidence": "倾向",
      "status": "待验证",
      "action": "下次听需求时用'结论+约束+细节'三栏笔记法",
      "verify_at": "下次做方案时",
      "falsifier": "若按三栏笔记法执行后仍抓不住优先级，则此根因需修正",
      "evidence_summary": "用户自述'听的时候感觉都懂，做的时候发现细节不理解'",
      "raw_ref": "raw/2026-10-18.md#p-20261018-001",
      "linked_domain": "",
      "superseded_by": "",
      "contradicts": "",
      "last_reviewed": "2026-10-18",
      "review_note": ""
    }
  ]
}
```

字段规则：
- `confidence`：仅 `较确定` / `倾向` / `存疑`
- `status`：`成立` / `待验证` / `已修正` / `已推翻`。状态变更只追加 `review_note`，不删除历史；被推翻的条目保留（揭示归因惯用偏差）
- `falsifier` 必填：没有证伪条件的结论不允许写入
- `domain` 自由取值但保持稳定（如：方案制作/汇报表达/沟通理解/决策/学习方法/时间管理），便于同域趋势整合
- `linked_domain`：双线程案例中关联的人线领域（如"情绪/抵触"），用于跨档案趋势对照
- `superseded_by`：新结论取代旧结论时，旧条目填新条目 id（取代链，体现认知演化）；被取代条目状态转"已修正"
- `contradicts`：与人线或旧结论矛盾时填对方条目 id；矛盾不合并、不删除，双方 falsifier 中写入裁决条件

## 二、画像层（profile.md）

由整合机制生成，不逐条手写。结构：

```markdown
# 个人成长画像（最近更新：YYYY-MM-DD）
## 活跃主题趋势
### 方案制作
- 困难迁移：信息优先级（10月）→ 情绪启动（11月）
- 能力曲线：...（基于条目链的客观描述）
- 联动观察：事线进展与人线变化的同步关系
## 已成立的稳定结论
## 待裁决的矛盾对
```

**整合触发**（满足其一）：积累 5 条未整合的新结论 / 用户说"回顾一下我的变化" / 距上次整合超过 30 天。
整合动作：同 domain 条目按时间排序 → 提炼困难迁移方向、行动执行结果、与 linked_domain 的联动 → 重写 profile.md 对应小节（保留旧版本要点，不整篇推倒）。

## 三、原文层（raw/YYYY-MM-DD.md）

```markdown
# 2026-10-18 复盘会话摘录
## p-20261018-001（对应结论层 id）
> 用户原话摘录（只录与结论直接相关的句子）
场景背景：一句话说明
```

## 四、outbox（人线发现候选）

双线程会话的人线结论写入 `outbox/YYYY-MM-DD.md`：

```markdown
## o-20261018-001
- 来源案例：p-20261018-001（方案制作复盘）
- 发现：对"制作"环节的抵触情绪强度显著高于"使用"环节（用户原话："别人做好给我我用得很好，自己做就很反感"）
- 建议 behavior-analyst 评估方向：抵触的对象是过程还是评价暴露风险
- 状态：待裁决
```

- problem-diver 只写 outbox，**禁止直接写 behavior-archive**
- 会话结束时告知用户："有一条人线发现已存候选，下次使用行为分析师时会提示你确认"

## 五、跨档案读写权限矩阵

| 档案 | problem-diver | behavior-analyst |
|---|---|---|
| problem-archive/conclusions.json | 读 + 写 | 只读（趋势对照） |
| problem-archive/profile.md | 读 + 写 | 只读 |
| problem-archive/raw/ | 读 + 写 | 不可访问 |
| problem-archive/outbox/ | 写（自己的人线发现） | 读 + 裁决 |
| behavior-archive/conclusions.json | 只读（趋势对照） | 读 + 写 |

**铁律**：本技能只写 problem-archive 和自己的 outbox；人线发现进 outbox 待 behavior-analyst 裁决，禁止直接写 behavior-archive。

## 六、复核触发器（校准回路）

会话中用户描述命中某条目 `domain` 时：
1. 翻出该条目，复述旧结论与提出日期；
2. 用新信息核对：一致 → 更新 `last_reviewed`，三次复核一致可转"成立"；强化 → confidence 可上调一档；
3. **变化对比**：显式指出本次与上次在反应强度、处理方式、结果上的差异（趋势体现的核心环节）；
4. 冲突 → 重新分析裁决；推翻时状态改"已推翻"并保留。

## 七、访问规则

- 默认只读 conclusions.json + profile.md
- 回溯 raw 层的条件：evidence_summary 不足以支撑当前判断 / 复核冲突需核对语境 / 用户要求查看原始依据

## 八、防污染红线

只允许写入：走完主流程或双线程收敛的结论、用户当场未否决的结论。
禁止写入：随口提及未验证的想法、一次性情绪、会话流水、对他人行为的分析（只记录用户本人）。
