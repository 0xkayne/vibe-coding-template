# Task Decomposition Guide

## The Atomic Task Test

A task is atomic if it satisfies ALL of:
1. Touches at most 3 files
2. Can be completed in one TDD red-green-refactor cycle
3. Can be described in one sentence without "and"
4. Has a clear verification (test passes, build succeeds, etc.)

If a task fails any of these, split it.

## Decomposition Strategies

### Vertical Slicing (preferred)
Split by user-visible behavior, not by technical layer.

❌ "Build the database layer" → "Build the API layer" → "Build the UI"
✅ "User can submit registration form" → "System validates email uniqueness" → "System sends confirmation email"

Each vertical slice delivers testable value independently.

### Dependency Ordering
Identify dependencies between tasks. Execute in order:
1. Data model / schema changes (foundation)
2. Domain logic / pure functions (core)
3. Infrastructure adapters (DB, external APIs)
4. API endpoints / Server Actions (exposure)
5. UI components (presentation)

### Risk-First Ordering
If uncertain about feasibility, put the riskiest task first.
Fail early on the hard part rather than building everything else first.

## Common Decomposition Mistakes

- **Too large**: "Implement user authentication" (should be 5-8 tasks)
- **Too small**: "Add import statement" (not independently valuable)
- **Wrong cut**: Splitting by file instead of by behavior
- **Missing glue**: Forgetting the integration task that connects components
