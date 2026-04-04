# Bugfix Workflow Template

## Purpose
Guide for identifying, fixing, and preventing bugs in the POS system.

---

## Bugfix Process

### Step 1: Reproduce the Bug

1. **Understand the Bug**
   - What does the bug do?
   - When does it occur?
   - Who encounters it?

2. **Create Test Case**
   ```dart
   // Create a test to reproduce the bug
   // test/features/<feature>/bug_test.dart
   testWidgets('reproduces bug', (tester) async {
     // Reproduce steps
     // Assert failure
   });
   ```

3. **Verify Reproduction**
   - Can you reproduce it locally?
   - Can you document steps to reproduce?

---

### Step 2: Isolate the Bug

1. **Find the Code Path**
   ```bash
   # Use debug mode
   flutter run --debug

   # Or use hot reload with breakpoint
   ```

2. **Check Recent Changes**
   ```bash
   # Check git history
   git log -p --oneline -n 20 -- path/to/file

   # Check blame
   git blame path/to/file
   ```

3. **Search for Error Messages**
   ```bash
   grep -r "Error message" lib/
   grep -r "Warning message" lib/
   ```

4. **Check Stack Traces**
   - Examine stack trace in error message
   - Identify where exception is thrown
   - Find where it's caught (or not caught)

---

### Step 3: Analyze the Root Cause

#### Common Bug Types

##### 1. Null Safety Issues

**Before (Bug)**
```dart
String? name = null;
print(name!.length); // Null safety error
```

**After (Fixed)**
```dart
String? name = null;
if (name != null) {
  print(name.length);
}

// Or
name ??= 'default';
print(name!.length);
```

##### 2. Race Conditions

**Before (Bug)**
```dart
var counter = 0;

void increment() async {
  await Future.delayed(100);
  counter++; // Race condition
}
```

**After (Fixed)**
```dart
int counter = 0;

class Counter {
  int _value = 0;
  
  Future<void> increment() async {
    await Future.delayed(100);
    _value++;
  }

  Future<int> get value => _value;
}
```

##### 3. Data Model Mismatch

**Before (Bug)**
```dart
// Domain
@freezed
class Product {
  const factory Product({
    required String id,
    required String name,
  }) = _Product;
}

// Data model (mismatch - missing field)
@collection()
abstract class ProductModel implements IsarObject {
  Id id();
  String name();
  String? description; // Missing in domain
}
```

**After (Fixed)**
```dart
// Add missing field to data model
@collection()
abstract class ProductModel implements IsarObject {
  Id id();
  String name();
  String description(); // Added
}
```

##### 4. Incorrect API Usage

**Before (Bug)**
```dart
final query = await Isar.<ModelName>Collection().find();
// Missing filter - returns everything

final product = await repository.getById('123');
// Returns null but code expects non-null
```

**After (Fixed)**
```dart
// Add filter
final query = await Isar.<ModelName>Collection()
  .filter(<ModelName>Entity.id == 'target-id')
  .findFirst();

// Add null check
final product = await repository.getById('123');
if (product == null) {
  return; // Handle appropriately
}
```

---

### Step 4: Fix the Bug

#### Option 1: Direct Fix
```dart
// Before
String? maybeName = getFromApi();
if (maybeName != null) {
  print(maybeName);
}

// After
String? maybeName = getFromApi();
maybeName ??= ''; // Provide default value
print(maybeName);
```

#### Option 2: Better Defaults
```dart
// Before
String name = ''; // Empty string as default

// After
String name = 'N/A'; // More meaningful default
```

#### Option 3: Better Validation
```dart
// Before
if (name.isEmpty) {
  // Show error
}

// After
if (name.isEmpty) {
  throw ArgumentError('Name is required');
}
```

#### Option 4: Better Error Handling
```dart
// Before
try {
  result = await someApiCall();
} catch (e) {
  print('Error: $e');
}

// After
try {
  result = await someApiCall();
} on ServerException catch (e) {
  showError('Server error');
} on NetworkException catch (e) {
  showError('No internet');
} catch (e) {
  // Handle unexpected errors
}
```

---

### Step 5: Test the Fix

1. **Run Unit Tests**
   ```bash
   flutter test test/features/<feature>/feature_test.dart
   ```

2. **Run Widget Tests**
   ```bash
   flutter test test/widget_features/<feature>/widget_test.dart
   ```

3. **Run Integration Tests**
   ```bash
   flutter test test/integration/features/<feature>/integration_test.dart
   ```

4. **Verify Bug is Fixed**
   ```bash
   # Run test case that reproduces the bug
   flutter test test/features/<feature>/bug_test.dart
   ```

5. **Check for Regression**
   ```bash
   # Run full test suite
   flutter test
   ```

---

### Step 6: Prevent Regression

#### Add Guard Clauses
```dart
// Add validation at boundaries
void process(String input) {
  // Validate input
  if (input == null || input.isEmpty) {
    return; // Early return
  }

  // Validate range
  if (input.length < 1 || input.length > 100) {
    return;
  }

  // Process input
  doSomething(input);
}
```

#### Add Documentation
```dart
void process(String input) {
  // Validate input is not null
  if (input == null || input.isEmpty) {
    return;
  }

  // Validate input is not empty
  if (input.length < 1) {
    return;
  }

  // Process input
  doSomething(input);
}
```

#### Add Assertions (Debug Mode)
```dart
void process(String input) {
  assert(input != null, 'input cannot be null');
  assert(input.isNotEmpty, 'input must not be empty');
  
  // Process input
  doSomething(input);
}
```

---

## Checklist

- [ ] Bug reproduced locally
- [ ] Test case created
- [ ] Root cause identified
- [ ] Fix implemented
- [ ] Tests passing
- [ ] No regression introduced
- [ ] Code reviewed
- [ ] Documentation updated
- [ ] Bug closed in issue tracker

---

## Related Documentation

- [`../templates/refactor/refactor_workflow.md`](../templates/refactor/refactor_workflow.md)
- [`../../design/README.md`](../../../design/README.md)
