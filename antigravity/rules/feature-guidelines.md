# Feature Development Guidelines

## Purpose
Guidelines for developing new features in the POS system.

---

## Feature Template

When adding a new feature, follow this structure:

```
lib/features/<feature-name>/
├── data/
│   ├── models/
│   │   └── <model>.dart
│   │   └── <model>.g.dart
│   └── repositories/
│       └── <repository>.dart
├── domain/
│   ├── entities/
│   │   └── <entity>.dart
│   └── repositories/
│       └── <repository_interface>.dart
└── presentation/
    ├── pages/
    │   └── <feature>_page.dart
    ├── providers/
    │   └── <feature>_providers.dart
    └── widgets/
        └── (optional)
```

---

## Step-by-Step Guide

### 1. Define Domain Layer First

**Entity**
```dart
// lib/features/<feature>/domain/entities/<entity>.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '<entity>.freezed.dart';

@freezed
class <EntityName> with _$<EntityName> {
  const factory <EntityName>({
    required String id,
    required String name,
    // ...
  }) = _<EntityName>;
}
```

**Repository Interface**
```dart
// lib/features/<feature>/domain/repositories/<repo>.dart
abstract class <Feature>Repository {
  Future<List<Feature>> getAll();
  Future<Feature?> getById(String id);
  // ...
}
```

### 2. Implement Data Layer

**Repository Implementation**
```dart
// lib/features/<feature>/data/repositories/<repository>.dart
import '../domain/repositories/<repo>.dart';
import '../models/<model>.dart';

class Local<Feature>Repository implements <Feature>Repository {
  final <Model>Collection _collection =
      Isar.<Model>Collection(); // Isar collection

  @override
  Future<List<Feature>> getAll() async {
    final models = await _collection.find().sortBy('id').limit(-1).toList();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Feature?> getById(String id) async {
    final model = await _collection.get(id: id);
    return model?.toEntity();
  }
}
```

**Data Model**
```dart
// lib/features/<feature>/data/models/<model>.dart
import '../../domain/entities/<entity>.dart';

@isar
class <Model> extends <Entity> {
  @Id()
  String? id;

  @Index()
  String name;

  // ...
}

extension on <Model> {
  <Entity> toEntity() => <Entity>(...);
  static <Model> fromEntity(<Entity> entity) => <Model>(...);
}
```

### 3. Build Presentation Layer

**Riverpod Provider**
```dart
// lib/features/<feature>/presentation/providers/<feature>_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '<feature>_providers.g.dart';

@riverpod
<Feature>Repository <feature>Repository(<feature>RepositoryRef ref) {
  return Local<Feature>Repository();
}

@riverpod
Future<List<Feature>> all<Feature>(all<Feature>Ref ref) async {
  final repository = ref.watch(<feature>RepositoryProvider);
  return repository.getAll();
}
```

**Page**
```dart
// lib/features/<feature>/presentation/pages/<feature>_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class <FeatureName>Page extends ConsumerWidget {
  const <FeatureName>Page({super.key});

  @override
  Widget build(BuildContext context, AsyncValue<List<Feature>> state) {
    return Scaffold(
      appBar: AppBar(title: Text('<FeatureName>')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (features) => ListView.builder(
          itemCount: features.length,
          itemBuilder: (context, index) => FeatureCard(feature: features[index]),
        ),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
```

---

## Adding Feature to Router

### Update App Router
```dart
// lib/app/router/app_router.dart
import 'package:flutter_pos_demo/features/<feature>/presentation/pages/<feature>_page.dart';

// In buildMethod
case '/<feature>':
  return <FeatureName>Page();
```

### Register in Navigation Tree
```dart
// Use go_router navigation tree
final routes = NavigationTree()
  .addScreen(
    id: '<feature>',
    route: '/<feature>',
    builder: (context, params) => <FeatureName>Page(),
  )
  // ...
```

---

## Seed Data Integration

### Add to Seeder
```dart
// lib/app/services/data_seeder.dart
class DataSeeder {
  Future<void> seedData() async {
    // ...
    
    // Seed new feature data
    final <feature>s = [
      <Entity>(
        id: '1',
        name: 'Sample Feature Item',
        // ...
      ),
    ];
    
    final collection = Isar.<Model>Collection();
    await collection.bulkAdd(<feature>s.map((e) => <Model>.fromEntity(e)).toList());
  }
}
```

---

## Widget Reusability

### Create Small Widgets
```dart
// lib/features/<feature>/presentation/widgets/<widget>.dart
class <WidgetName> extends StatelessWidget {
  final <Entity> entity;

  const <WidgetName>({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entity.name),
        subtitle: Text(entity.something),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => <DetailPage>(entity: entity)),
        ),
      ),
    );
  }
}
```

---

## Testing Strategy

### Unit Tests for Providers
```dart
// test/unit/features/<feature>/<feature>_providers_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_pos_demo/features/<feature>/presentation/providers/<feature>_providers.dart';
import 'package:flutter_pos_demo/features/<feature>/data/repositories/<repository>.dart';
import 'package:flutter_pos_demo/features/<feature>/domain/entities/<entity>.dart';

void main() {
  group('<FeatureName>Provider', () {
    test('loads all features', () async {
      final provider = all<Feature>(all<Feature>.Provider);
      final result = await provider();
      expect(result, isA<AsyncData>());
    });
  });
}
```

### Widget Tests
```dart
// test/widget_features/<feature>/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_pos_demo/features/<feature>/presentation/pages/<feature>_page.dart';

void main() {
  testWidgets('displays features', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: <FeatureName>Page(),
      ),
    );

    expect(find.text('Sample Feature Item'), findsOneWidget);
  });
}
```

---

## Migration Notes

When creating a new feature:
1. Check if similar feature exists (e.g., orders, receipts)
2. Follow existing patterns
3. Update relevant seed data
4. Add to router
5. Add tests
6. Document in AGENTS.md if needed

---

## Common Feature Types

### List Item Feature
- Product list → POS main screen
- Category filter → Product grid
- Order list → Order history

### Detail Feature
- Product detail → Product info + variant selection
- Order detail → Order items + payment methods

### Settings Feature
- Settings screen → Toggle features, configure options

---

## Last Updated
April 2026
