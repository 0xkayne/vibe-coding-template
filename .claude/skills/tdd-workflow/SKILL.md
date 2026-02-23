---
name: tdd-workflow
description: >
  Test-Driven Development workflow. Use when implementing new features,
  fixing bugs, or when the user asks to "write tests first", "TDD",
  or "add a feature with tests". Guides through Red-Green-Refactor cycle.
---

# TDD Workflow: Red-Green-Refactor

Follow these steps strictly in order. Do NOT skip steps.

## Step 1: RED — Write the failing test first

1. Identify the behavior to implement or the bug to reproduce.
2. Write a minimal test that asserts the expected behavior.
3. Run the test. It MUST fail. Show me the failure output.
4. If the test passes without code changes, the test is wrong — rewrite it.

## Step 2: GREEN — Minimal implementation

1. Write the minimum code needed to make the test pass.
2. Do NOT add extra features, optimizations, or abstractions at this stage.
3. Run the test. It MUST pass. Show me the output.
4. If it fails, fix the implementation (not the test) until green.

## Step 3: REFACTOR — Clean up while green

1. Now apply project code style: guard clauses, extract functions, name constants.
2. Run tests again after every refactor step. Tests must stay green.
3. If a refactor breaks tests, revert that specific refactor.

## Step 4: Checkpoint

1. Summarize what was tested and implemented.
2. Propose a Conventional Commit message (e.g., `feat: add user email validation`).
3. Wait for my approval before moving to the next task.

## Anti-Patterns to AVOID
- Writing implementation first, then backfilling tests.
- Writing tests that test implementation details instead of behavior.
- Skipping the RED step ("I know it will fail").
- Over-engineering during the GREEN step.