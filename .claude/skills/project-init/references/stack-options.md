# Technology Stack Options & Rule Mapping

This file helps the project-init skill determine which rules to keep or prune.

## Stack Archetypes

### A. Next.js Full-Stack (TypeScript only)

Next.js is a full-stack React framework. Frontend (RSC/RCC) and backend (Server Actions, Route Handlers, middleware) coexist in one codebase. No separate backend server needed for most apps.

- **Keep**: `typescript.md` (full, including App Router section), `data-layer.md`
- **Delete**: `python.md`
- ORM: Prisma or Drizzle
- Validation: Zod (shared between client and server)
- Testing: Vitest (unit/integration) + Playwright (E2E)
- Package manager: pnpm recommended

### B. React SPA + Separate Backend API

Frontend is a Vite/CRA React app. Backend is a standalone server (Express, Fastify, Hono, etc.). Communication via REST or tRPC. Two separate deployable units.

- **Keep**: `typescript.md` (remove App Router section), `data-layer.md`
- **Delete**: `python.md`
- Validation: Zod on both sides (share schemas via monorepo package if tRPC)
- Testing: Vitest + React Testing Library (frontend), Vitest or Jest (backend)

### C. Next.js Frontend + Python Backend

Next.js handles SSR, UI, and frontend routing. Python handles compute-heavy work (ML, data pipelines, domain-specific libraries). Two codebases communicating via REST/gRPC.

- **Keep**: all rules files (`typescript.md` full, `python.md`, `data-layer.md`)
- Typical split: Next.js owns the DB via Prisma; Python service is stateless or has its own DB
- Testing: Vitest + Playwright (TS side), Pytest (Python side)

### D. Python Full-Stack (FastAPI / Django)

No TypeScript. Python handles both API and any server-rendered templates.

- **Keep**: `python.md`, `data-layer.md`
- **Delete**: `typescript.md`
- FastAPI: Pydantic V2 (built-in), SQLAlchemy 2.0 async or Prisma Python
- Django: Django ORM + DRF serializers or Pydantic
- Testing: Pytest + httpx (FastAPI) or pytest-django

### E. Python Backend + Non-React Frontend (HTMX, Svelte, Vue, etc.)

Python serves API or full-stack with HTMX. Frontend may be a separate SPA in a non-React framework.

- **Keep**: `python.md`, `data-layer.md`
- **Delete**: `typescript.md` (or keep only the Type Safety section if using TypeScript with Vue/Svelte, removing App Router section entirely)

## Database Choice

| Database | Rule Impact |
|----------|------------|
| PostgreSQL | Keep `data-layer.md` Postgres section. Use migrations (Prisma Migrate / Alembic). |
| MySQL | Keep `data-layer.md` Postgres section (most rules apply). Adjust syntax as needed. |
| SQLite | Keep `data-layer.md` but skip connection pooling / distributed lock rules. Good for MVP, switch before production. |
| No SQL DB (MongoDB, etc.) | Remove Postgres section from `data-layer.md`. Transaction rules still apply conceptually. |

## Cache / Queue Choice

| Technology | Rule Impact |
|------------|------------|
| Redis | Keep `data-layer.md` Redis section |
| No Redis (or Memcached, etc.) | Remove Redis section from `data-layer.md` |

## Quick Decision Matrix

Answer these questions to determine your rules:

1. **Using TypeScript?** No → delete `typescript.md`
2. **Using Next.js App Router?** No → remove App Router section from `typescript.md`
3. **Using Python?** No → delete `python.md`
4. **Using PostgreSQL/MySQL?** No → remove Postgres section from `data-layer.md`
5. **Using Redis?** No → remove Redis section from `data-layer.md`
6. **All sections removed from `data-layer.md`?** → delete the file entirely
