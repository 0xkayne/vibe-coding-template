---
name: debug-forensics
description: >
  Evidence-based debugging workflow. Use when encountering errors, test failures,
  build failures, runtime exceptions, or when the user says "debug", "fix this error",
  "why is this failing", or "investigate". NEVER speculate — read logs first.
---

# Debug Forensics: Evidence-Based Troubleshooting

STOP speculating. Follow this evidence-gathering process.

## Step 1: Collect evidence

1. Read the FULL error message and stack trace (last 50 lines minimum).
2. Identify the exact file, line number, and function where the error originated.
3. If it's a runtime error: check container/service logs (Docker logs, server output).
4. If it's a build error: check the build output for the FIRST error (not the last).

## Step 2: Reproduce

1. Find or write the minimal steps to reproduce the error.
2. Run those steps and confirm you see the same error.
3. If you cannot reproduce: state this clearly. Do NOT proceed with guesses.

## Step 3: Hypothesize with evidence

1. Based on the evidence, state ONE specific hypothesis.
2. The hypothesis must reference specific code and specific log output.
3. "It might be a timing issue" is NOT a valid hypothesis. "Line 42 reads `user.id` but the query on line 38 returns null when the user is deleted" IS valid.

## Step 4: Fix and verify

1. Make the minimal change to test your hypothesis.
2. Run the reproduction steps again.
3. If fixed: run the full test suite to check for regressions.
4. If NOT fixed: revert your change. Go back to Step 1 with new information.

## Step 5: 3-Strike Rule

If you have attempted 3 different fixes and none worked:

1. STOP immediately.
2. Summarize: what you tried, what evidence you found, why each fix failed.
3. Suggest: `git reset --hard HEAD` to return to safe state.
4. Ask me for guidance before continuing.

## NEVER
- Guess the cause without reading the error.
- Stack multiple speculative fixes on top of each other.
- Say "this should work" without running the test.
- Modify test assertions to make tests pass (fix the code, not the test).