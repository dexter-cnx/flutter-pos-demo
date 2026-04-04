# Global Repository Rules

## Purpose
Core rules that apply to ALL work in this repository.

---

## Commit Conventions

### Type Prefixes
```
feat:    New feature
fix:     Bug fix
docs:    Documentation
style:   Formatting (no logic change)
refactor: Refactoring
perf:    Performance improvement
test:    Adding tests
chore:   Maintenance tasks
```

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

### Examples
```bash
feat(pos): add Thai food items to seed data

feat(auth): implement PIN validation with 4-digit format

fix(checkout): correct VAT calculation edge case for zero price items

refactor(settings): extract profile form into subwidgets
```

---

## Testing Rules

### Test Requirements
- **All public methods** must have unit tests
- **Widget tests** for screens with critical behavior
- **Mock repositories** in tests, real repos in integration tests

### Test Naming
```
# Unit tests
lib/features/pos/presentation/providers/cart_provider.dart
test/unit/features/pos/cart_provider_test.dart

# Widget tests
test/widget_test.dart

# Integration tests (when needed)
test/integration/features/pos_integration_test.dart
```

### Test Structure
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pos_demo/features/pos/...';

void main() {
  group('CartProvider', () {
    test('adds item to cart', () {
      // ...
    });

    test('calculates subtotal correctly', () {
      // ...
    });
  });
}
```

---

## Code Review Checklist

- [ ] No hardcoded strings (use i18n)
- [ ] Proper separation of concerns (presentation/domain/data)
- [ ] Widgets don't contain business logic
- [ ] Error states handled (loading, empty, error, success)
- [ ] Follows existing patterns in the codebase
- [ ] All tests passing
- [ ] Code formatted (`dart format`)
- [ ] Analysis clean (`flutter analyze`)

---

## Branch Naming

```
feature/<feature-name>    # New features
bugfix/<issue-id>         # Bug fixes
refactor/<area>           # Refactoring
docs/<type>               # Documentation
```

---

## PR Guidelines

### Title Format
```
feat(pos): add cart quantity badge to product card
```

### PR Description Template
```markdown
## Summary
Added quantity badge to product cards showing available stock

## Test plan
1. Start app
2. View POS screen
3. Check product cards show quantity
4. Verify zero stock items are greyed out

## Related issues
Closes #XXX
```

---

## Emergency Contacts

- **Breaking change caught** → Revert immediately, file bug
- **Critical bug in prod** → Use hotfix branch, communicate in Slack

---

## Last Updated
April 2026
