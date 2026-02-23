# Test Pattern Selection Guide

## When to write which kind of test

| Situation | Test Type | Why |
|-----------|-----------|-----|
| Pure function / utility | Unit test | Fast, isolated, no setup |
| API route handler | Integration test | Needs request/response cycle |
| DB query / mutation | Integration test | Needs real or test DB |
| UI component behavior | Component test | Needs render + user events |
| Full user workflow | E2E test (sparingly) | Expensive, use for critical paths only |

## Test structure: AAA pattern

Every test follows Arrange-Act-Assert:

```
// Arrange: set up the preconditions
const user = createTestUser({ email: "test@example.com" })

// Act: perform the action under test
const result = await registerUser(user)

// Assert: verify the outcome
expect(result.status).toBe("success")
```

## What to test vs what NOT to test

**Test behavior, not implementation:**
- ✅ "when input is invalid, returns error with field name"
- ❌ "calls validateEmail internally"

**Test boundary conditions:**
- Empty input, null, undefined
- Maximum/minimum values
- Duplicate entries
- Concurrent operations (if relevant)

**Do NOT test:**
- Framework internals (Next.js routing, React rendering engine)
- Third-party library behavior
- Simple getters/setters with no logic
