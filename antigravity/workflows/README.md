# Workflows Directory

## Purpose
Contains templates and examples for Agent Teams workflows.

---

## Directory Structure

```
workflows/
├── README.md                              # This file
├── templates/
│   ├── feature/                           # Feature development template
│   │   └── feature_workflow.md
│   ├── refactor/                          # Refactoring template
│   │   └── refactor_workflow.md
│   └── bugfix/                            # Bug fix template
│       └── bugfix_workflow.md
├── examples/                              # Complete workflow examples
│   ├── new-product-screen/                # Example: Adding product screen
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   └── cart-checkout-flow/                # Example: Cross-feature workflow
│       ├── analysis.md
│       └── implementation-plan.md
└── scripts/                               # Helper scripts
    └── feature-scaffold.sh                # Feature scaffolding script
```

---

## Usage

### For New Features
1. Read `templates/feature/feature_workflow.md`
2. Run `scripts/feature-scaffold.sh <feature-name>`
3. Follow the template

### For Existing Features
1. Review existing code structure
2. Follow patterns in `examples/`
3. Adapt template accordingly

---

## Available Templates

| Template | Description |
|----------|-------------|
| `feature/` | Standard feature development |
| `refactor/` | Safe refactoring guidelines |
| `bugfix/` | Bug fix workflow |

---

## Examples

| Example | Description |
|---------|-------------|
| `new-product-screen/` | Complete feature implementation |
| `cart-checkout-flow/` | Cross-feature integration |

---

## Scripts

| Script | Description |
|--------|-------------|
| `feature-scaffold.sh` | Create new feature directory structure |

---

## Related Documentation

- [`../rules/feature-guidelines.md`](../rules/feature-guidelines.md)
- [`../design/README.md`](../../design/README.md)
