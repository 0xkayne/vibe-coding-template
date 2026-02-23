---
name: project-init
description: >
  This skill should be used when setting up a new project from this template,
  or when the user says "initialize", "set up", "bootstrap", "configure project",
  "first time setup", or "customize template". It guides through configuring
  CLAUDE.md, pruning unused rules, and setting up the development environment.
---

# Project Initialization from Template

Guide the user through customizing this template for their specific project.

## Step 1: Gather project info

Ask the user:
1. What is this project? (one sentence description)
2. What's the tech stack? (e.g., Next.js + Prisma, or FastAPI + SQLAlchemy)
3. What are the dev/build/test/lint commands?

## Step 2: Configure CLAUDE.md

1. Replace the TODO comment at the top with the project description.
2. Fill in the Commands section with actual commands.
3. Remove any placeholder comments.

## Step 3: Prune rules

Run `bash .claude/skills/project-init/scripts/setup-checklist.sh` to check current state.

Based on the tech stack:
- **No Python** → delete `.claude/rules/python.md`
- **No TypeScript** → delete `.claude/rules/typescript.md`
- **No Next.js** → remove App Router section from `typescript.md`
- **No Redis** → remove Redis section from `data-layer.md`
- **No Postgres** → remove Postgres section from `data-layer.md`

## Step 4: Environment setup

1. Create `.env.example` with required variables (no real values).
2. Verify `.gitignore` includes `.env`, `.env.local`, `.claude/settings.local.json`.
3. Confirm dev server starts successfully.

## Step 5: First commit

Propose: `chore: initialize project from engineering template`

For technology stack guidance, see `references/stack-options.md`.
