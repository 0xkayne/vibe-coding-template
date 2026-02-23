# Project Instructions

<!-- 使用此模板时，替换此行为项目的一句话描述和核心技术栈 -->

## Commands

<!-- 使用此模板时，填入你的项目实际命令 -->
```bash
# Dev / Build / Test / Lint — fill in after project init
```

## Iron Rules (IMPORTANT — never violate)

1. **Fail-Fast, never silent failure.** Throw on invalid state. NEVER return null/undefined/empty string to mask errors. NEVER catch-and-swallow exceptions.
2. **Validate at every public boundary.** All external input (API, webhook, DB read) → schema validation on first line (Zod / Pydantic). No `any`, no unvalidated casts.
3. **Atomic writes.** Multi-table mutations MUST use explicit DB transactions. NEVER `await a(); await b();` for correlated writes. Use DB-level atomic ops over read-modify-write.
4. **No hallucination.** Unsure about API, schema, config, or behavior → STOP and ask me. When debugging, read the actual error + logs first. NEVER speculate.
5. **3-strike rule.** Fix attempt fails 3 times → STOP. Report status, suggest `git reset --hard HEAD`. Do not stack speculative fixes.

## Workflow

- Before coding: confirm the atomic task scope with me. Break large work into small steps.
- Before boilerplate: check if a reusable script/template exists in the project.
- Before destructive ops (`DROP`, `rm -rf`, `git push -f`): show me and wait for explicit approval.
- After each completed unit of work: summarize changes, propose a Conventional Commit (`feat:` / `fix:` / `refactor:` / `test:` / `chore:`).

## Code Style (Universal)

- Guard clauses + early return. Flat control flow. Eliminate deep nesting.
- Immutability by default. Minimize mutation.
- Pure computation separated from I/O. NEVER do network/disk/DB calls inside computation loops.
- Structured logging with context (UserID, TraceID). No bare `console.log("here")` or `print("debug")`.
- Code is liability. Prefer reusing existing libs/patterns → refactoring → deleting dead code → writing new code, in that order.

## Known Gotchas

<!-- 随着使用不断补充你发现的具体陷阱 -->
- NEVER hardcode secrets. Use `.env`, keep `.env.example` in sync.
