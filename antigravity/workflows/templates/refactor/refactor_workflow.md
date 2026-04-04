# Refactoring Workflow Template

## Purpose
Guide for safe refactoring of existing code without breaking functionality.

---

## Principles

### Golden Rules

1. **Test First**: Add tests before refactoring
2. **Incremental**: Refactor small pieces at a time
3. **Run Tests**: Always run tests after changes
4. **One Concern**: Each function/method handles one responsibility
5. **Simple Names**: Use clear, descriptive names

---

## When to Refactor

### Good Candidates

- **Duplicated Code**: Copy-paste duplicates
- **Long Methods**: > 50 lines or complex logic
- **Long Parameter Lists**: > 4 parameters
- **Switch Statements**: Complex or with string cases
- **Comments Explaining Why**: Indicates bad design
- **Feature Envy**: Methods accessing other classes too much
- **Large Classes**: > 200 lines or > 10 methods

### Not a Refactoring

- Adding new features
- Removing unused code (unless cleaning up)
- Formatting changes

---

## Step 1: Add Tests

### Before Refactoring
```dart
class <FeatureName> {
  Future<void> complexMethod({
    required String a,
    required String b,
    required String c,
    required String d,
  }) async {
    // TODO: This is 200+ lines, needs refactoring
    if (a == 'x') {
      // logic for x
    } else if (b == 'y') {
      // logic for y
    }
  }
}
```

### Add Tests
```dart
// test/features/<feature>/<feature>_test.dart
import 'package:flutter_pos_demo/features/<feature>/<feature>.dart';

void main() {
  late <FeatureName> feature;

  setUp(() {
    feature = <FeatureName>();
  });

  test('complexMethod handles x', () async {
    final result = await feature.complexMethod(a: 'x', b: '', c: '', d: '');
    expect(result, equals(expected));
  });

  test('complexMethod handles y', () async {
    final result = await feature.complexMethod(a: '', b: 'y', c: '', d: '');
    expect(result, equals(expected));
  });
}
```

### Verify
```bash
flutter test test/features/<feature>/<feature>_test.dart
```

---

## Step 2: Extract Methods

### Before
```dart
Future<void> complexMethod() async {
  // 100+ lines of code
  // ... logic A ...
  // ... logic B ...
  // ... logic C ...
}
```

### After
```dart
Future<void> complexMethod() async {
  // Extract method calls
  await handleA();
  await handleB();
  await handleC();
}

Future<void> handleA() async {
  // Logic A
}

Future<void> handleB() async {
  // Logic B
}

Future<void> handleC() async {
  // Logic C
}
```

---

## Step 3: Replace Conditionals

### Before
```dart
void process(String type) {
  if (type == 'create') {
    // create logic
  } else if (type == 'update') {
    // update logic
  } else if (type == 'delete') {
    // delete logic
  }
}
```

### After
```dart
abstract class Command {
  Future<void> execute();
}

class CreateCommand implements Command {
  @override
  Future<void> execute() async {
    // create logic
  }
}

class UpdateCommand implements Command {
  @override
  Future<void> execute() async {
    // update logic
  }
}

class DeleteCommand implements Command {
  @override
  Future<void> execute() async {
    // delete logic
  }
}

void process(String type) {
  final command = <String, Command> {
    'create': CreateCommand(),
    'update': UpdateCommand(),
    'delete': DeleteCommand(),
  }[type];

  command?.execute();
}
```

---

## Step 4: Extract Classes

### Before
```dart
class <FeatureName> {
  final String name;
  final List<String> items;
  final int status;

  // ... lots of methods ...

  // ... lots of fields ...
}
```

### After
```dart
class <FeatureName> {
  final String name;
  final Status status;

  // Simplified, focused class
}

enum Status {
  active,
  inactive,
}

class Items {
  final List<String> items;

  // Methods related to items only
  List<String> get activeItems => items.where((i) => status == Status.active).toList();
}
```

---

## Step 5: Introduce Parameters

### Before
```dart
class <FeatureName> {
  void filterItems(String status, String category, String type) {
    // ...
  }
}
```

### After
```dart
class <FeatureName> {
  void filterItems({
    required String status,
    required String category,
    required String type,
    bool sortByDate = false,
  }) {
    // ...
  }
}
```

---

## Step 6: Replace Temporary Variables

### Before
```dart
String value = null;
if (condition1) {
  value = 'A';
} else if (condition2) {
  value = 'B';
}
result = process(value);
```

### After
```dart
result = process(
  condition1 ? 'A' : (condition2 ? 'B' : null),
);

// Or even better - extract method
result = process(getValue());
```

---

## Step 7: Move Functions

### Move Function Up
```dart
class <FeatureName> {
  Future<void> loadData() async {
    await _validateInput();
    // ... load logic
  }

  Future<void> _validateInput() async {
    // Validation logic
  }
}
```

### Move to Separate Class
```dart
class <FeatureName> {
  Future<void> loadData() async {
    final result = await <Validator>().validateInput();
    // ... load logic
  }
}

class Validator {
  Future<void> validateInput() async {
    // Validation logic
  }
}
```

---

## Step 8: Remove Code Duplication

### Before
```dart
void methodA() {
  // Common code
  // Unique to A
}

void methodB() {
  // Common code
  // Unique to B
}
```

### After
```dart
abstract interface CommonInterface {
  void doCommon();
}

class MethodA implements CommonInterface {
  @override
  void doCommon() {
    // Common code
  }

  void uniqueA() {
    // Unique to A
  }
}

class MethodB implements CommonInterface {
  @override
  void doCommon() {
    // Common code
  }

  void uniqueB() {
    // Unique to B
  }
}
```

---

## Common Refactoring Patterns

### 1. Strangler Fig Pattern
Gradually replace large class with smaller classes.

### 2. Decorator Pattern
Add behavior to classes without inheritance.

### 3. Composite Pattern
Group related items under a common parent.

### 4. Strategy Pattern
Replace conditionals with strategy interfaces.

---

## Checklist

- [ ] Tests added for current behavior
- [ ] Tests passing before refactoring
- [ ] Extracted methods where appropriate
- [ ] Replaced conditionals with strategies
- [ ] Extracted small, focused classes
- [ ] Added named parameters
- [ ] Removed duplicate code
- [ ] All tests still passing
- [ ] Code reviewed by peer
- [ ] Documentation updated

---

## After Refactoring

1. **Remove Unused Code**
   ```bash
   # Check for unused exports
   flutter analyze

   # Remove unused code
   # (only if confident it's truly unused)
   ```

2. **Update Documentation**
   - Update CHANGELOG.md
   - Update README.md if necessary

3. **Notify Team**
   - If breaking changes were made

---

## Related Documentation

- [`../rules/architecture.md`](../../rules/architecture.md)
- [`../rules/dart.md`](../../rules/dart.md)

---

## Example Refactoring

Before:
```dart
class Product {
  Future<void> loadProduct() async {
    final products = await repository.getAll();
    final product = products.firstWhere(
      (p) => p.id == id,
      orElse: () => Product(),
    );
    // ... lots of code ...
  }
}
```

After:
```dart
class Product {
  final id;
  final name;
  final price;

  Product.fromEntity(product)
      : id = product.id,
        name = product.name,
        price = product.price;
}

class ProductRepository {
  final IsarCollection<IsarProductModel> _collection;

  Future<Product> get(Product product) async {
    return product.toEntity();
  }
}
```

---

## Related Files

- [`../templates/bugfix/bugfix_workflow.md`](../templates/bugfix/bugfix_workflow.md)
- [`../../design/README.md`](../../../design/README.md)
