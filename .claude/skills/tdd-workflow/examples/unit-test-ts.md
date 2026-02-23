# TypeScript Unit Test Example (Vitest)

```typescript
import { describe, it, expect } from "vitest";
import { validateRegistration } from "@/domain/auth/validate-registration";

describe("validateRegistration", () => {
  // Test boundary: valid input
  it("accepts valid registration data", () => {
    const input = { email: "user@example.com", password: "Str0ng!Pass" };
    const result = validateRegistration(input);
    expect(result.status).toBe("ok");
  });

  // Test boundary: invalid email
  it("rejects malformed email", () => {
    const input = { email: "not-an-email", password: "Str0ng!Pass" };
    const result = validateRegistration(input);
    expect(result.status).toBe("error");
    expect(result.error).toContain("email");
  });

  // Test boundary: weak password
  it("rejects password without uppercase", () => {
    const input = { email: "user@example.com", password: "weakpassword1!" };
    const result = validateRegistration(input);
    expect(result.status).toBe("error");
    expect(result.error).toContain("password");
  });

  // Test boundary: empty input
  it("rejects empty fields", () => {
    const result = validateRegistration({ email: "", password: "" });
    expect(result.status).toBe("error");
  });
});
```

Key patterns used:
- Discriminated union return type (`status: 'ok' | 'error'`)
- Tests behavior ("rejects malformed email") not implementation
- Each test covers one boundary condition
- No mocking needed (pure function)
