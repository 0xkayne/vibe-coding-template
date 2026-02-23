---
paths:
  - "**/*.py"
---
# Python Conventions

## Type Safety
- Core domain objects: `NewType` for IDs (`UserID = NewType("UserID", str)`). Enforce with Pyright.
- All external input: Pydantic V2 model on first line. No raw dicts in domain logic.
- Return types always annotated. NEVER `Any` or bare `Dict`. Use `TypedDict` / `msgspec.Struct`.

## Error Handling
- NEVER `raise` for expected business errors in domain logic. Use `Result[T, Error]` pattern.
- Exceptions only for truly unexpected/fatal errors (Fail-Fast).

## State Machines
- Multi-state flows: `Union` types or `Enum` + `match`. `case _:` MUST `assert_never(val)`.

## Async
- NEVER `asyncio.ensure_future` or standalone `create_task`.
- Use `asyncio.TaskGroup` (3.11+) or `anyio.create_task_group`.

## Architecture
- Domain layer MUST NOT import from infra or API layers. Use protocols for DI.