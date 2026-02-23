# Python Unit Test Example (Pytest)

```python
import pytest
from domain.auth.validate_registration import validate_registration

class TestValidateRegistration:
    """Test boundary conditions for registration validation."""

    def test_valid_input_returns_ok(self):
        result = validate_registration(
            email="user@example.com", password="Str0ng!Pass"
        )
        assert result.is_ok()
        assert result.unwrap().email == "user@example.com"

    def test_malformed_email_returns_error(self):
        result = validate_registration(
            email="not-an-email", password="Str0ng!Pass"
        )
        assert result.is_err()
        assert "email" in result.unwrap_err().message

    def test_weak_password_returns_error(self):
        result = validate_registration(
            email="user@example.com", password="weak"
        )
        assert result.is_err()
        assert "password" in result.unwrap_err().message

    def test_empty_fields_returns_error(self):
        result = validate_registration(email="", password="")
        assert result.is_err()
```

Key patterns used:
- Result[T, Error] return type (not exceptions for expected errors)
- Tests behavior, not implementation
- Each test covers one boundary
- No mocking (pure function)
