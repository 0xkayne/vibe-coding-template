# Error Taxonomy and Investigation Paths

## Type Errors / Null Reference
**Symptoms**: `TypeError`, `Cannot read property of null/undefined`, `AttributeError`
**Investigation**:
1. Trace the variable back to its assignment.
2. Check: is the source a DB query that can return null? An optional API field?
3. Fix: add null check or fix the source query.

## Schema / Validation Errors
**Symptoms**: `ZodError`, `ValidationError`, `422 Unprocessable Entity`
**Investigation**:
1. Compare the actual input (from logs) against the expected schema.
2. Look for: missing required fields, wrong types, extra fields in strict mode.
3. Fix: either fix the sender or update the schema (if the new field is valid).

## Connection / Timeout Errors
**Symptoms**: `ECONNREFUSED`, `TimeoutError`, `ConnectionResetError`
**Investigation**:
1. Is the target service running? (`docker ps`, `curl localhost:PORT`)
2. Is the connection string correct? (check .env)
3. Is the connection pool exhausted? (check active connections)
3. Fix: restart service, fix config, or increase pool size.

## Concurrency / Race Conditions
**Symptoms**: Intermittent failures, data inconsistency, deadlocks
**Investigation**:
1. Is there read-modify-write without a transaction?
2. Are there parallel writes to the same row?
3. Fix: add transaction, use atomic operation, or add optimistic lock.

## Build / Compilation Errors
**Symptoms**: `tsc` errors, `SyntaxError`, module not found
**Investigation**:
1. Read the FIRST error only. Fix it. Rebuild. Repeat.
2. "Module not found" → check: installed? correct path? correct export?
3. Type errors → read the full type mismatch, don't just `as any`.
