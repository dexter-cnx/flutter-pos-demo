# Agent Team Operating Rules

## Purpose
These rules define **how** Agent Teams should work together in this repository. They complement `AGENTS.md` which defines **what** the project is.

---

## Workflow

1. **Read `00-read-order.md` first** - Understand this file
2. **Read `global.md`** - Core repository rules
3. **Read domain-specific rules** (`flutter.md`, etc.)
4. **Follow feature-specific guidelines** in `antigravity/workflows/`

---

## Rules Structure

| File | Purpose |
|------|---------|
| `00-read-order.md` | Entry point - how to read these rules |
| `global.md` | Repo-wide rules (commit style, testing, etc.) |
| `flutter.md` | Flutter-specific conventions |
| `dart.md` | Dart language conventions |
| `architecture.md` | Clean Architecture rules |
| `feature-guidelines.md` | Feature development guidelines |

---

## Quick Start

```bash
# After making changes:
flutter pub get
dart format .
flutter analyze
flutter test
```

---

## When to Use This

- **New Agent joining** → Read all files
- **Feature development** → Follow `feature-guidelines.md`
- **Bug fixes** → Follow `global.md` + domain rules
- **Refactoring** → Follow `architecture.md`

---

## Related Documentation

- [`AGENTS.md`](../../AGENTS.md) - Project overview
- [`antigravity/workflows/`](../workflows/) - Feature templates
- [`design/DESIGN.md`](../../design/DESIGN.md) - UI/UX guidelines
