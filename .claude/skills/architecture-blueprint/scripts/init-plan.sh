#!/bin/bash
# Usage: bash init-plan.sh "Feature Name"
# Generates a standardized plan.md skeleton in the project root.

FEATURE_NAME="${1:-Untitled Feature}"
DATE=$(date +%Y-%m-%d)
OUTPUT="plan.md"

cat > "$OUTPUT" << EOF
# Plan: ${FEATURE_NAME}

> Generated: ${DATE}

## Goal

<!-- One sentence: what is the desired outcome? -->

## Context

<!-- What existing code/systems does this touch? -->

## Affected Files

- [ ] \`path/to/file1\` — what changes
- [ ] \`path/to/file2\` — what changes

## Atomic Tasks (in execution order)

<!-- Each task = one TDD cycle. If it feels big, split it. -->

1. [ ] Task description (files: \`...\`)
2. [ ] Task description (files: \`...\`)
3. [ ] Task description (files: \`...\`)

## Edge Cases & Risks

| Edge Case | Impact | Mitigation |
|-----------|--------|------------|
|           |        |            |

## Open Questions

- [ ] Question (blocking / non-blocking with assumption: ...)

## Completion Criteria

- [ ] All atomic tasks done
- [ ] All tests pass
- [ ] No TypeScript/Pyright errors
- [ ] Manual smoke test of happy path
EOF

echo "Created ${OUTPUT} for: ${FEATURE_NAME}"
