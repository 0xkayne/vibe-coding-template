# Claude Code Engineering Template

用于 Claude Code vibe coding 的工程规范模板。从此模板创建新项目后，自动获得工业级编码约束。

## 文件结构与加载机制

```
CLAUDE.md                         ← 每次会话都加载（通用铁律 + 工作流）
.claude/
  rules/
    typescript.md                 ← 仅当编辑 .ts/.tsx 文件时加载
    python.md                     ← 仅当编辑 .py 文件时加载
    data-layer.md                 ← 仅当编辑 DB/Redis 相关文件时加载
```

### 为什么这样设计？

1. **Token 效率**：`CLAUDE.md` 主文件控制在 ~400 词（~600 tokens），每轮对话仅消耗极少上下文。技术栈特定规则通过 `paths:` frontmatter 按需加载，不工作于 Python 时完全不消耗 Python 规则的 tokens。

2. **注意力集中**：研究表明 LLM 能可靠遵循约 150-200 条指令。本模板总指令数控制在 ~60 条，且每个上下文窗口中实际激活的更少。5 条以内的文件各 ~30 行，比单个 150 行文件有更高的规则遵循率（~96% vs ~92%）。

3. **可维护**：每个文件职责单一。修改 Redis 规则不需要通读 TypeScript 约定。

## 使用方法

1. **从此模板创建新仓库**
2. **编辑 `CLAUDE.md`**：
   - 替换顶部注释为你的项目一句话描述
   - 填入实际的 dev/build/test/lint 命令
   - 随着开发推进，在 `Known Gotchas` 部分积累你遇到的真实陷阱
3. **按需裁剪 `.claude/rules/`**：
   - 纯 TypeScript 项目？删除 `python.md`
   - 不用 Next.js？删掉 `typescript.md` 中的 App Router 部分
   - 不用 Redis？删掉 `data-layer.md` 中的 Redis 部分
4. **按需扩展**：
   - 新增 `.claude/rules/testing.md` 写测试规范
   - 新增 `.claude/rules/api-design.md` 写 API 设计约定
   - 使用 `paths:` frontmatter 限定作用域

## 核心理念

- **CLAUDE.md 只放"每次都需要"的内容**：铁律、工作流、通用代码风格
- **技术栈规则放 rules/ 并用 paths 限定**：按需加载，零浪费
- **具体 > 抽象**：`NEVER use @ts-ignore` 比 `保持类型安全` 有效 10 倍
- **指令而非理念**：Claude 不需要知道"为什么"，只需要知道"做什么"和"不做什么"
- **持续演进**：遇到 Claude 反复犯的错 → 加一条规则。没出过问题的 → 不加规则
