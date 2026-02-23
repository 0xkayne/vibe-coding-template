# Log Reading Guide

## General Principles

1. **Read bottom-up**: The root cause is usually at the bottom of the stack trace. The top shows the call chain.
2. **Find YOUR code**: Skip framework internals. Look for the first line referencing your project's source files.
3. **Read the full message**: `TypeError: Cannot read properties of null (reading 'id')` tells you exactly what happened — `null.id` was accessed.

## Common Log Sources

### Node.js / Next.js
```bash
# Terminal output shows errors with file:line
# Next.js dev server: errors appear in both terminal and browser console
# Server Action errors: check terminal, NOT browser (browser shows generic error)
```

### Python / FastAPI
```bash
# Uvicorn shows traceback in terminal
# Look for: "Traceback (most recent call last)" — read from bottom
```

### Docker containers
```bash
docker logs <container-name> --tail 50    # Last 50 lines
docker logs <container-name> --since 5m   # Last 5 minutes
```

### PostgreSQL
```bash
# Slow queries: check pg_stat_statements or enable log_min_duration_statement
# Connection issues: check pg_stat_activity for active connections
docker logs postgres-container --tail 50
```

## What to Extract from Logs

For every error, extract these 4 facts before hypothesizing:
1. **What**: The exact error class and message
2. **Where**: File, line number, function name
3. **When**: What operation triggered it (which request, which test)
4. **Input**: What data was being processed (check request payload, function args)
