---
paths:
  - "**/*.py"
---
# Python Conventions

## Type Safety
- Core domain objects: `NewType` for IDs (`UserID = NewType("UserID", str)`). Enforce with Pyright.
- All external input (JSON, dicts): Pydantic V2 model on first line. No raw dicts in domain logic.
- Return types always annotated. NEVER `Any` or bare `Dict`. Use `TypedDict` / `msgspec.Struct` for complex structures.

## Error Handling
- NEVER `raise` for expected business errors in domain logic. Use `Result[T, Error]` pattern. Callers MUST handle Failure branch.
- Exceptions only for truly unexpected/fatal errors (Fail-Fast).

## State Machines
- Multi-state flows: `Union` types or `Enum` + `match` statement.
- `case _:` MUST call `assert_never(val)` for exhaustive coverage.

## Async
- NEVER `asyncio.ensure_future` or standalone `create_task`.
- Use `asyncio.TaskGroup` (3.11+) or `anyio.create_task_group`. All child tasks collected before scope exits.

## Architecture
- Domain layer MUST NOT import from infra or API layers. Use protocols/interfaces for dependency inversion.
