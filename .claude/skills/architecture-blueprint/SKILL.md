---
name: architecture-blueprint
description: >
  This skill should be used when the user has a large feature request,
  wants to plan before coding, or mentions "plan", "design", "architect",
  "break this down", "blueprint", "decompose", or "what's the approach".
  It produces a structured plan.md with atomic tasks before any code is written.
---

# Architecture Blueprint: Plan Before Code

STOP. Do NOT write any code. Follow this planning process.

## Step 1: Understand

1. Restate the requirement in your own words.
2. Ask clarifying questions if anything is ambiguous. Do not proceed with assumptions.
3. Identify: data in → transformations → data out.

## Step 2: Explore existing code

1. Read the current project structure and relevant files.
2. Check if similar functionality already exists (reuse > rebuild).
3. If DB changes needed: read current schema first.

## Step 3: Generate plan.md

Run `bash .claude/skills/architecture-blueprint/scripts/init-plan.sh "[Feature Name]"` to generate the plan skeleton.

Then fill in each section:
- **Affected Files**: list every file that will be created or modified.
- **Atomic Tasks**: each task must be completable in one TDD cycle. If a task feels large, split it further.
- **Edge Cases**: think about what can go wrong. Empty inputs, concurrent access, partial failures.

For task decomposition methodology, see `references/task-decomposition.md`.

## Step 4: Review with user

1. Present the completed plan.md.
2. Wait for approval or corrections.
3. After approval: execute tasks one by one, using /tdd-workflow for each.

## NEVER
- Start coding "to explore". Explore by reading.
- Write vague tasks like "implement the feature".
- Skip the Edge Cases section.
