# Claude Code Engineering Template

用于 Claude Code vibe coding 的工程规范模板。从此模板创建新项目后，自动获得工业级编码约束。

## 文件结构

```
CLAUDE.md                                  ← 每次加载。铁律 + 工作流
.claude/
  settings.json                            ← Hooks。确定性安全护栏
  rules/
    typescript.md                          ← 仅编辑 .ts/.tsx 时加载
    python.md                              ← 仅编辑 .py 时加载
    data-layer.md                          ← 仅编辑 DB/Redis 相关文件时加载
  skills/
    tdd-workflow/SKILL.md                  ← TDD Red-Green-Refactor 流程
    architecture-blueprint/SKILL.md        ← 需求分析 → plan.md → 任务拆解
    debug-forensics/SKILL.md               ← 结构化排错流程
  agents/
    code-reviewer.md                       ← 代码审查子代理
```

## 设计原理

### 五层防御体系

| 层 | 机制 | 特点 | 示例 |
|----|------|------|------|
| 1 | **CLAUDE.md** | 每次加载，~300 词 | 5 条铁律、工作流指引 |
| 2 | **Rules** | `paths:` 按需加载 | TS 类型规范、Python 惯例、DB 规则 |
| 3 | **Skills** | Claude 自动判断/手动 `/skill` | TDD 流程、架构规划、排错流程 |
| 4 | **Hooks** | 确定性执行，0 token | 拦截危险命令、保护敏感文件 |
| 5 | **Agents** | 手动委派 | 代码审查专家 |

### Token 效率

| 场景 | 加载内容 | ~tokens |
|------|---------|---------|
| 写 TypeScript | CLAUDE.md + ts rules + skill 元数据 | ~900 |
| 写 Python | CLAUDE.md + py rules + skill 元数据 | ~800 |
| 纯规划 | CLAUDE.md + skill 元数据 | ~600 |
| 调用 /tdd-workflow | 上述 + skill 完整内容 | ~1200 |

## 快速开始

1. **从此模板创建新仓库**

2. **编辑 `CLAUDE.md`**：填入项目描述、实际命令

3. **裁剪不需要的 rules**：
   - 纯 TS 项目 → 删除 `python.md`
   - 不用 Next.js → 删 `typescript.md` 中 App Router 段落
   - 不用 Redis → 删 `data-layer.md` 中 Redis 段落

4. **启用格式化 Hook**（可选，按你的工具链修改）：
   编辑 `.claude/settings.json`，在 PostToolUse 添加：
   ```json
   {
     "matcher": "Edit|MultiEdit|Write",
     "hooks": [{
       "type": "command",
       "command": "jq -r '.tool_input.file_path' | xargs npx prettier --write 2>/dev/null || true"
     }]
   }
   ```

5. **随使用演进**：
   - Claude 反复犯某个错 → 加一条 Rule
   - 某个多步骤流程你经常重复 → 做成 Skill
   - 某个动作必须 100% 执行 → 做成 Hook
   - 没出过问题的 → 不加规则