---
name: architecture-blueprint
description: >
  Architectural planning before implementation. Use when receiving a large
  feature request, a new project requirement, or when the user says "plan",
  "design", "architect", or "break this down". Produces a plan.md with
  atomic tasks before any code is written.
---

# Architecture Blueprint Workflow

STOP. Do NOT write any code yet. Follow this planning process first.

## Step 1: Understand the requirement

1. Restate the requirement in your own words. Ask clarifying questions if anything is ambiguous.
2. Identify: what data flows in, what transformations happen, what comes out.
3. Identify which existing files/modules are affected (read them first).

## Step 2: Explore before assuming

1. Check the current project structure and existing patterns.
2. Check if similar functionality already exists (reuse > rebuild).
3. If DB changes are needed, read the current schema first (Prisma schema or migration files).

## Step 3: Write plan.md

Create or update `plan.md` in the project root with this structure:

```markdown
# Plan: [Feature Name]

## Goal
One sentence describing the desired outcome.

## Affected Files
- [ ] path/to/file1 — what changes
- [ ] path/to/file2 — what changes

## Atomic Tasks (in execution order)
1. [ ] Task description (scope: which file(s))
2. [ ] Task description
3. [ ] Task description

## Edge Cases & Risks
- Risk 1 and mitigation
- Risk 2 and mitigation

## Open Questions
- Question 1 (blocking? or can proceed with assumption X?)
```

## Step 4: Review with user

1. Present the plan to me.
2. Wait for my approval or corrections.
3. Only after approval: begin executing tasks one by one using /tdd-workflow.

## Anti-Patterns
- Starting to code "just to explore". Explore by reading, not writing.
- Plans with vague tasks like "implement the feature". Each task must be atomic.
- Plans without edge cases section. Always think about what can go wrong.