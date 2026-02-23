# Project Instructions

<!-- TODO: 替换为你的项目一句话描述和核心技术栈 -->

## Commands

<!-- TODO: 填入你的实际命令 -->
```bash
# Dev / Build / Test / Lint / DB migrate — fill in after project init
```

## Iron Rules (IMPORTANT — never violate)

1. **Fail-Fast, never silent failure.** Throw on invalid state. NEVER return null/undefined/empty to mask errors. NEVER catch-and-swallow.
2. **Validate at every public boundary.** External input → schema validation first line (Zod / Pydantic). No `any`, no unvalidated casts.
3. **Atomic writes.** Multi-table mutations = explicit DB transaction. NEVER correlated `await a(); await b();`. DB-level atomic ops over read-modify-write.
4. **No hallucination.** Unsure about API, schema, config → STOP and ask me. Debug by reading actual errors + logs. NEVER speculate.
5. **3-strike rule.** Fix fails 3 times → STOP. Report status, suggest `git reset --hard HEAD`.

## Workflow

- Before coding: confirm atomic task scope with me.
- Before boilerplate: check if a reusable script/template exists.
- Before destructive ops (`DROP`, `rm -rf`, `git push -f`): show me, wait for approval.
- After each unit of work: summarize changes, propose Conventional Commit.
- For new features or bug fixes: prefer using /tdd-workflow skill.
- For large requirements: prefer using /architecture-blueprint skill.
- For persistent errors: prefer using /debug-forensics skill.

## Code Style (Universal)

- Guard clauses + early return. Flat control flow.
- Immutability by default. Minimize mutation.
- Pure computation separated from I/O. NEVER network/disk/DB inside loops.
- Structured logging with context (UserID, TraceID). No bare `console.log` / `print`.
- Code is liability: reuse → refactor → delete → new code, in that order.

## Known Gotchas

<!-- 随使用不断补充 -->
- NEVER hardcode secrets. Use `.env`, keep `.env.example` in sync.