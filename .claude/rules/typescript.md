---
paths:
  - "**/*.ts"
  - "**/*.tsx"
---
# TypeScript Conventions

## Type Safety
- NEVER use `@ts-ignore`, `@ts-expect-error`, or `as any`. Narrow with Zod `.safeParse()` or type guards (`x is Type`).
- Use discriminated unions: `{ status: 'ok'; data: T } | { status: 'error'; error: string }`. NEVER `{ data?: T; error?: string }`.
- DB models and component Props must be separate types. Map to DTOs before crossing boundaries.

## Next.js App Router (skip if not using Next.js)
- Files touching DB/secrets/Node APIs: `import 'server-only'` at top.
- Server → Client props must be JSON-serializable. No Date, Map, Set, Function.
- NEVER `'use client'` a parent just for child interactivity. Use children composition.
- NEVER `useEffect` for initial data fetch. Data in RSC; mutations via Server Actions.
- Server Actions = public POST endpoints. First lines: (1) auth, (2) Zod validation.
- Server Actions return `{ success: boolean; data?: T; error?: string }`. NEVER throw raw.
- After DB mutation in Server Action: always `revalidatePath` / `revalidateTag`.
- Forms: `useActionState` + `useFormStatus`. NEVER manual `useState` for loading.
- Caching: dynamic data needs `export const dynamic = 'force-dynamic'` or `{ cache: 'no-store' }`.