# 记忆层规范（L3）

档案根目录：`<档案根>/behavior-archive/`（档案根解析规则见 SKILL.md「运行时平台适配」节；默认 `~/.life-teardown/`，可被环境变量 `$LIFE_TEARDOWN_ROOT` 覆盖）

```
behavior-archive/
├── conclusions.json      # 结论层（默认只访问这里）
├── profile.md            # 画像层（整合产物：趋势与变化）
└── raw/
    └── YYYY-MM-DD.md     # 原文层（按需回溯）
```

## 一、结论层 schema（conclusions.json）

```json
{
  "version": 2,
  "entries": [
    {
      "id": "c-20261009-001",
      "date": "2026-10-09",
      "domain": "拖延",
      "conclusion": "拖延集中发作于成果会被他人评价的任务场景",
      "confidence": "倾向",
      "status": "待验证",
      "evidence_summary": "三个发作场景均为交付物需展示给他人的任务；两个对照场景为私事，无拖延",
      "raw_ref": "raw/2026-10-09.md#c-20261009-001",
      "falsifier": "若发现私事场景下也出现同等程度拖延，则此结论需修正",
      "last_reviewed": "2026-10-09",
      "review_note": ""
    }
  ]
}
```

字段规则：
- `confidence`：仅 `较确定` / `倾向` / `存疑`
- `status`：`成立` / `待验证` / `已修正` / `已推翻`，状态变更只追加 `review_note`，不删除旧值历史
- `falsifier` 必填：没有证伪条件的结论不允许写入
- `raw_ref` 可空：结论能自洽表达时不需要原文层
- `domain` 取值：`拖延` / `情绪` / `行为习惯` / `家庭关系` / `亲密关系` / `其他关系` / `决策` / `意义感` / `其他`
- **亲密关系域量化字段（可选，仅 sub-intimacy-analysis.md 写入时携带）**：`metrics`，证据计数式画像，禁止人格总分：

```json
{
  "domain": "亲密关系",
  "metrics": {
    "attachment_anxiety": {"count": 6, "grade": "模式", "evidence_ids": ["E1", "E2"]},
    "attachment_avoidance": {"count": 1, "grade": "假设", "evidence_ids": ["E3"]},
    "intensity_avg": 70,
    "distortions": {"读心": 2, "灾难化": 1},
    "user_confirmed": true
  }
}
```

- `grade` 三级：`假设`（1-2 次证据）→ `倾向`（3-5 次）→ `模式`（6 次以上）；`user_confirmed` 为 false 的条目不允许在画像中对外呈现为"模式"级
- `evidence_ids` 对应本次会话的 E 编号证据链；计数更新优先于新建条目

## 二、画像层（profile.md）

由整合机制生成，不逐条手写。结构：

```markdown
# 个人行为画像（最近更新：YYYY-MM-DD）
## 活跃主题趋势
### 拖延
- 模式迁移：评价恐惧（10月）→ 任务模糊（11月）
- 能力曲线：...（基于条目链的客观描述）
## 已成立的稳定结论
## 待裁决的矛盾对
## 已推翻的归因（揭示自我解释的惯用偏差）
```

**整合触发**（满足其一）：积累 5 条未整合的新结论 / 用户说"回顾一下我的变化" / 距上次整合超过 30 天。
整合动作：同 domain 条目按时间排序 → 提炼模式迁移方向、行动执行结果 → 重写 profile.md 对应小节（保留旧版本要点，不整篇推倒）。被推翻的结论单独成节，它们揭示用户自我解释的惯用偏差模式，是画像的重要部分。

## 三、原文层格式（raw/YYYY-MM-DD.md）

```markdown
# 2026-10-09 分析会话摘录

## c-20261009-001（对应结论层条目 id）
> 用户原话摘录（只录与结论直接相关的句子，不录整段对话）
场景背景：一句话说明当时讨论的场景
```

## 四、访问规则

- **默认只读结论层 + 画像层**：会话开始、复核触发时，加载 `conclusions.json` + `profile.md`。
- **回溯原文层的触发条件**（满足其一）：
  1. 结论层条目的 `evidence_summary` 不足以支撑当前分析判断
  2. 复核时新叙述与旧结论冲突，需要核对当时语境
  3. 用户明确要求查看某条结论的原始依据

## 五、跨档案读写权限矩阵

| 档案 | behavior-analyst | problem-diver |
|---|---|---|
| behavior-archive/conclusions.json | 读 + 写 | 只读（趋势对照） |
| behavior-archive/profile.md | 读 + 写 | 只读 |
| behavior-archive/raw/ | 读 + 写 | 不可访问 |
| problem-archive/conclusions.json | 只读（趋势对照） | 读 + 写 |
| problem-archive/outbox/ | 读 + 裁决 | 写（自己的人线发现） |

**铁律**：本技能只写 behavior-archive；problem-diver 的人线发现只进 outbox 等待本技能裁决，禁止 problem-diver 直接写 behavior-archive。

## 六、复核触发器（校准回路）

会话中用户描述命中某条目的 `domain` 时：
1. 翻出该条目，向用户复述旧结论与提出日期。
2. 用本次新信息核对：一致 → `last_reviewed` 更新为当日；新证据强化 → confidence 可上调一档（"待验证"三次复核一致可转"成立"）。
3. 冲突 → 进入模式验证流程重新裁决；裁决推翻时状态改"已推翻"并保留条目。

## 七、防污染规则（写入红线）

只允许写入：
- 经"模式验证"子技能裁决的结论
- 经用户 √/× 逐条确认的亲密关系画像条目（仅 sub-intimacy-analysis.md 产出，须满足 metrics schema 且 user_confirmed=true）
- 用户当场未否决的结论

禁止写入：
- 对话中随口提及、未经验证的想法
- 一次性情绪表达
- 会话流水、过程性讨论
- 他人行为分析（本档案只记录用户本人）

## 八、冷启动建档（首次使用执行一次）

检测到 `conclusions.json` 不存在或为空时，执行一次建档引导（之后不再执行）：

向用户说明："档案是空的，先做一次基线采集，以后的分析才有对照。"然后依次询问（一次问完，用户简答即可）：
1. 目前最想拆解的 1-2 个行为模式是什么？
2. 每个模式你自己现有的解释是什么？（记为"待验证归因"）
3. 这些模式大约从什么时候开始？

将回答整理为初始条目，全部标记 `status: 待验证`、`confidence: 存疑`，写入结论层。告知用户这些只是起点假设，会在后续分析中逐条检验。

**fallback（用户拒绝建档时）**：用户说"先不建档""直接开始"时，跳过建档引导直接进入分析，档案只在本次分析产出经验证的结论后按需建立。不强制建档，不反复劝说。
