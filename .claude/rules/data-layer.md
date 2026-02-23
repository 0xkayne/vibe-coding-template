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
- Multi-table writes = explicit transactions. NEVER correlated `await a(); await b();`.
- NEVER read-modify-write. Use atomic ops (`increment`) or optimistic lock (version field).
- NEVER `SELECT *`. Explicit `select`/`include` only needed fields.
- Lists over 1000 rows: cursor-based pagination only. NEVER deep `OFFSET/LIMIT`.
- Schema changes: migration files only. NEVER DDL from app code. Think about table locks.

## Redis
- Partial updates: Hash (`HSET`/`HGET`), not full JSON round-trip.
- Ranked data: consider `ZSET` over app-layer sorting.
- Check-and-set: Lua scripts. NEVER split across multiple round-trips.
- Distributed locks: unique owner ID + absolute TTL + release in `finally`.

## Idempotency
- Retryable endpoints / webhooks: validate `Idempotency-Key` first line. `SETNX` or DB unique constraint.