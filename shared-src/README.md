# shared-src/ — 跨技能共享文件的唯一源（canonical source）

本目录是 `anti-sycophancy-core.md`（反谄媚内核）和 `safety-protocol.md`（安全协议）的**唯一编辑入口**。

这两个文件会被分发到两个技能各自的 `skills/<skill>/references/shared/` 下，让每个技能 zip 自包含、可单独安装。因此仓库里同一内容存在**三份**：这里一份（源）+ 两个技能各一份（分发副本）。

## 规则（防漂移）

1. **只在这里编辑**，不要直接改 `skills/*/references/shared/` 下的分发副本。
2. 改完运行同步脚本，把源复制到两个技能：
   - macOS / Linux / git-bash：`bash scripts/sync-shared.sh`
   - Windows PowerShell：`powershell -ExecutionPolicy Bypass -File scripts\sync-shared.ps1`
3. `scripts/validate.py` 和 CI（`.github/workflows/validate.yml`）会检测三份是否**字节一致**，不一致直接 FAIL。

## 为什么保留分发副本，而不是只放一份

- **单技能 zip 必须自包含**：behavior-analyst.zip / problem-diver.zip 可被单独安装，若 shared 只放一处，单独装另一个技能就找不到。
- **手动复制安装**：INSTALL.md 方式二直接复制 `skills/` 目录，要求其完整。
- **符号链接不可行**：symlink 在 Windows zip 和多数技能加载器下会失效。

所以采用：**源在 shared-src/（唯一编辑点，防漂移）+ 副本在 skills/*/references/shared/（保自包含）+ 同步脚本与 CI 检测保证一致**。这是"自包含"与"防漂移"的兼顾方案。
