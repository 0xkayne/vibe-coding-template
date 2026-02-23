---
name: tdd-workflow
description: >
  This skill should be used when the user wants to implement a new feature,
  fix a bug, write tests, add test coverage, or mentions "TDD", "test first",
  "red green refactor", "write tests", "add tests", or "test-driven".
  It guides through a structured Red-Green-Refactor cycle ensuring tests
  are written before implementation code.
---

# TDD Workflow: Red-Green-Refactor

Execute these 4 steps strictly in order. Do NOT skip any step.

## Step 1: RED — Failing test first

1. Identify the behavior to test (not implementation details).
2. Write one minimal test asserting expected behavior.
3. Run it. It MUST fail. Show failure output.
4. If it passes without changes, the test is wrong — rewrite.

For test pattern selection guidance, see `references/test-patterns.md`.

## Step 2: GREEN — Minimal implementation

1. Write minimum code to make the test pass. Nothing more.
2. Run the test. Show passing output.
3. Do NOT optimize or abstract at this stage.

## Step 3: REFACTOR — Clean up while green

1. Apply project code style (guard clauses, extract functions, name constants).
2. Run tests after every refactor step. Must stay green.
3. Revert any refactor that breaks tests.

## Step 4: Checkpoint

1. Summarize what was tested and implemented.
2. Propose a Conventional Commit (e.g., `feat: add email validation`).
3. Wait for user approval before next task.

## NEVER

- Write implementation before tests.
- Test implementation details instead of behavior.
- Skip showing the RED failure output.
- Over-engineer during GREEN.

For common anti-patterns and fixes, see `references/anti-patterns.md`.
For language-specific test examples, see `examples/`.
