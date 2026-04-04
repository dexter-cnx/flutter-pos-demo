# Feature Workflow Template

## Purpose
Standard workflow for developing new features in the POS system.

---

## Before Starting

1. **Check for existing implementations**
   ```bash
   # Look for similar features
   grep -r "class.*Repository" lib/features/
   grep -r "class.*Page" lib/features/
   ```

2. **Review seed data**
   ```bash
   cat lib/app/services/data_seeder.dart | grep -A 20 "seedData"
   ```

3. **Check router**
   ```bash
   grep -A 10 "buildMethod" lib/app/router/app_router.dart
   ```

---

## Step 1: Domain Layer

### Create Entity
```dart
// lib/features/<feature>/domain/entities/<entity>.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '<entity>.freezed.dart';

@freezed
class <EntityName> with _$<EntityName> {
  const factory <EntityName>({
    required String id,
    required String name,
    // ... other fields
  }) = _<EntityName>;
}
```

### Create Repository Interface
```dart
// lib/features/<feature>/domain/repositories/<repo>.dart
import '../entities/<entity>.dart';

abstract class <EntityName>Repository {
  Future<List<EntityName>> getAll();
  Future<EntityName?> getById(String id);
  Future<void> delete(String id);
  // ... other operations
}
```

---

## Step 2: Data Layer

### Create Model
```dart
// lib/features/<feature>/data/models/<model>.dart
import '../../domain/entities/<entity>.dart';
import 'package:isar/isar.dart';

part '<model>.g.dart';

@Collection()
@name('entities/<entity>.entities')
abstract class <ModelName> implements <EntityName> {
  Id? id;
  required String name;
  // ... other fields
  
  // Indexes
  @Index()
  String get indexField => name;

  // Entity conversion
  @override
  <EntityName> toEntity() => <EntityName>(
    id: id ?? '',
    name: name,
    // ...
  );

  @override
  static <ModelName> fromEntity(<EntityName> entity) => <ModelName>(
    id: entity.id,
    name: entity.name,
    // ...
  );
}
```

### Implement Repository
```dart
// lib/features/<feature>/data/repositories/local_<repo>.dart
import '../../domain/repositories/<repo>.dart';
import '../models/<model>.dart';

class Local<FeatureName>Repository implements <FeatureName>Repository {
  final <ModelName>Collection _collection = Isar.<ModelName>Collection();

  @override
  Future<List<FeatureName>> getAll() async {
    final models = await _collection.find().sortBy('id').limit(-1).toList();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<FeatureName?> getById(String id) async {
    final model = await _collection.get(id: id);
    return model?.toEntity();
  }

  @override
  Future<void> delete(String id) async {
    await _collection.delete(id);
  }
}
```

---

## Step 3: Presentation Layer

### Create Riverpod Provider
```dart
// lib/features/<feature>/presentation/providers/<feature>_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/local_<repo>.dart';
import '../../domain/repositories/<repo>.dart';

part '<feature>_providers.g.dart';

@riverpod
<FeatureName>Repository <feature>Repository(<feature>RepositoryRef ref) {
  return Local<FeatureName>Repository();
}

@riverpod
Future<List<FeatureName>> all<Feature>(all<Feature>Ref ref) async {
  final repository = ref.watch(<feature>RepositoryProvider);
  return repository.getAll();
}

@riverpod
Future<FeatureName?> byId<Feature>(byId<Feature>Ref ref, String id) async {
  final repository = ref.watch(<feature>RepositoryProvider);
  return repository.getById(id);
}
```

### Create Page
```dart
// lib/features/<feature>/presentation/pages/<feature>_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/<feature>_providers.dart';
import '../widgets/<widget>.dart';

class <FeatureName>Page extends ConsumerWidget {
  const <FeatureName>Page({super.key});

  @override
  Widget build(BuildContext context, AsyncValue<List<FeatureName>> state) {
    return Scaffold(
      appBar: AppBar(
        title: Text('<FeatureName>.title'),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (features) => ListView.separated(
          itemCount: features.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return FeatureCardWidget(feature: features[index]);
          },
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    // Show add form dialog
  }
}
```

### Create Widget
```dart
// lib/features/<feature>/presentation/widgets/<widget>.dart
import 'package:flutter/material.dart';
import '../../domain/entities/<entity>.dart';

class <WidgetName> extends StatelessWidget {
  const <WidgetName>({
    required this.feature,
    this.onTap,
    super.key,
  });

  final <FeatureName> feature;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(feature.name),
        subtitle: Text('${feature.someField}'),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
```

---

## Step 4: Seed Data

Add seed data to `lib/app/services/data_seeder.dart`:

```dart
class DataSeeder {
  Future<void> seedData() async {
    // ...

    // Seed new feature
    final <feature>s = [
      <EntityName>(
        id: '1',
        name: 'Sample <EntityName>',
        // ...
      ),
    ];

    final collection = Isar.<ModelName>Collection();
    await collection.bulkAdd(<feature>s.map((e) => <ModelName>.fromEntity(e)).toList());
  }
}
```

---

## Step 5: Router

Update `lib/app/router/app_router.dart`:

```dart
// In buildMethod
case '/<feature>':
  return <FeatureName>Page();
```

---

## Step 6: Tests

### Unit Tests
```dart
// test/unit/features/<feature>/<feature>_repository_test.dart
import 'package:flutter_pos_demo/features/<feature>/data/repositories/local_<repo>.dart';
import 'package:flutter_pos_demo/features/<feature>/domain/entities/<entity>.dart';

void main() {
  group('Local<FeatureName>Repository', () {
    late Local<FeatureName>Repository repository;

    setUp(() {
      repository = Local<FeatureName>Repository();
    });

    test('getAll returns empty list', () async {
      final result = await repository.getAll();
      expect(result, isEmpty);
    });
  });
}
```

### Widget Tests
```dart
// test/widget_features/<feature>/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pos_demo/features/<feature>/presentation/pages/<feature>_page.dart';

void main() {
  testWidgets('displays features', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: <FeatureName>Page(),
      ),
    );

    expect(find.text('Sample <EntityName>'), findsOneWidget);
  });
}
```

---

## Common Issues

### Issue: Feature not showing
**Solution:** Check if router route is registered
```bash
grep "case '/<feature>'" lib/app/router/app_router.dart
```

### Issue: Riverpod error
**Solution:** Check if providers are generated
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Issue: Seed data not persisting
**Solution:** Check Isar collection name in model
```dart
@name('entities/<entity>.entities') // Make sure it matches
```

---

## Checklist

- [ ] Domain entity created
- [ ] Repository interface defined
- [ ] Data model created
- [ ] Repository implementation created
- [ ] Riverpod providers created
- [ ] Provider generation completed
- [ ] Page created
- [ ] Widget(s) created
- [ ] Seed data added
- [ ] Router updated
- [ ] Tests written
- [ ] All tests passing

---

## Cleanup

After feature is complete:
1. Remove temporary files
2. Update documentation
3. Notify team if feature requires attention

---

## Related Files

- [`../rules/feature-guidelines.md`](../../rules/feature-guidelines.md)
- [`../../design/README.md`](../../../design/README.md)
