# Test Anti-Patterns and Fixes

## 1. Implementation coupling
❌ `expect(service.validateEmail).toHaveBeenCalled()`
✅ `expect(result.error).toBe("Invalid email format")`
Fix: Assert on outputs, not on internal method calls.

## 2. Fragile assertions on unrelated data
❌ `expect(user).toEqual({ id: 1, name: "Test", email: "t@t.com", createdAt: "2025-01-01T..." })`
✅ `expect(user).toMatchObject({ name: "Test", email: "t@t.com" })`
Fix: Assert only on fields relevant to the behavior being tested.

## 3. Shared mutable state between tests
❌ Tests depend on execution order or global variable.
✅ Each test sets up and tears down its own state.
Fix: Use `beforeEach` for setup. Never share state across `it` blocks.

## 4. Testing the mock, not the code
❌ Mock returns exactly what the test expects, proving nothing.
✅ Mock provides realistic input; test verifies real transformation logic.
Fix: Mocks simulate dependencies, not the system under test.

## 5. "Assert-free" tests
❌ Test runs code but never asserts anything (passes because it doesn't throw).
✅ Every test has at least one explicit assertion.
Fix: Count assertions. Zero = not a test.

## 6. Modifying test to match wrong behavior
❌ Code returns wrong result → change test expectation to match.
✅ Code returns wrong result → fix the code, keep the test.
Fix: Tests define correctness. Code conforms to tests, not vice versa.
