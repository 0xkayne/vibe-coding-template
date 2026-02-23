---
paths:
  - "**/*.sql"
  - "**/prisma/**"
  - "**/drizzle/**"
  - "**/migrations/**"
  - "**/redis*"
  - "**/cache*"
  - "**/infra/**"
  - "**/repository/**"
  - "**/dal/**"
---
# Database & Redis Conventions

## Postgres
- Multi-table writes: MUST use explicit transactions (`$transaction` / `session.begin()`).
- NEVER read-modify-write for counters/state. Use atomic DB ops (`increment`) or optimistic lock (version field).
- NEVER `SELECT *`. Explicitly `select`/`include` only needed fields. Never load secrets/audit fields into app memory.
- Lists over 1000 rows: cursor-based pagination only. NEVER `OFFSET/LIMIT` deep paging.
- Schema changes: migration files only. NEVER DDL from app code. Think about table locks before running.

## Redis
- Partial updates: use Hash (`HSET`/`HGET`), not full JSON serialize/deserialize.
- Ranked data: consider `ZSET` over app-layer sorting.
- Check-and-set: MUST use Lua scripts. NEVER split across multiple round-trips.
- Distributed locks: unique owner ID + absolute TTL + release in `finally` (or Lua). NEVER bare `SET key value`.

## Idempotency
- Retryable endpoints / webhooks / high-value writes: validate `Idempotency-Key` on first line. Use `SETNX` or DB unique constraint for exactly-once execution.
