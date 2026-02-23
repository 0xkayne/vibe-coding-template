---
name: debug-forensics
description: >
  This skill should be used when encountering errors, test failures,
  build failures, runtime exceptions, or when the user says "debug",
  "fix this error", "why is this failing", "investigate", "broken",
  "not working", "exception", or "stack trace". It provides an
  evidence-based troubleshooting workflow that prevents speculative fixes.
---

# Debug Forensics: Evidence-Based Troubleshooting

STOP speculating. Gather evidence first.

## Step 1: Collect evidence

1. Read the FULL error message and stack trace (last 50 lines minimum).
2. Identify: exact file, line number, function where error originated.
3. Runtime error → check service/container logs.
4. Build error → find the FIRST error (cascading errors mislead).

For log reading techniques, see `references/log-reading-guide.md`.

## Step 2: Reproduce

1. Find minimal steps to reproduce.
2. Run them. Confirm same error.
3. Cannot reproduce → state this clearly. Do NOT guess.

## Step 3: Hypothesize with evidence

State ONE hypothesis referencing specific code AND specific log output.

❌ "It might be a timing issue"
✅ "Line 42 reads `user.id` but the query at line 38 returns null when user is deleted, as shown in the error: `TypeError: Cannot read property 'id' of null`"

For error classification, see `references/error-taxonomy.md`.

## Step 4: Fix and verify

1. Make ONE minimal change to test the hypothesis.
2. Rerun reproduction steps.
3. Fixed → run full test suite for regressions.
4. Not fixed → REVERT. Return to Step 1 with new info.

## Step 5: 3-Strike Rule

After 3 failed fix attempts:
1. STOP immediately.
2. Summarize: what tried, what evidence found, why each failed.
3. Suggest: `git reset --hard HEAD` to safe state.
4. Ask user for guidance.

## NEVER
- Guess without reading the error.
- Stack multiple speculative fixes.
- Say "this should work" without running the test.
- Change test assertions to make tests pass.
