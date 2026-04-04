# Flutter Conventions

## Purpose
Flutter-specific coding conventions and best practices.

---

## Widget Organization

### Recommended Structure
```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(...),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Header widgets
                ProductSearchBar(...),
                CategoryFilter(...),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: GridView(...),
                ),
              ],
            ),
          ),
          SliverToExtentLoader(
            // ...
          ),
        ],
      ),
    );
  }
}
```

### Widget Separation
- **Small widgets**: < 30 lines, single responsibility
- **Medium widgets**: 30-100 lines, related functionality
- **Large widgets**: > 100 lines → Extract as sub-widgets

### Naming Convention
```dart
// Good
ProductSearchBar
CategoryFilterButton
QuantityAddButton
VatCalculatorWidget

// Bad
Widget1
Screen1
Build1
```

---

## Responsive Design

### Using LayoutBuilder
```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isTablet = constraints.maxWidth > 600;
    return isTablet ? _buildTabletLayout() : _buildMobileLayout();
  },
)
```

### Using MediaQuery
```dart
final paddingHorizontal = MediaQuery.of(context).padding.left;
final safeArea = MediaQuery.of(context).padding.top +
    MediaQuery.of(context).padding.bottom;
```

### Breakpoints
- **Mobile**: < 600px
- **Tablet**: 600px - 1200px
- **Desktop**: > 1200px

---

## Theme Usage

### App Theme
```dart
import 'package:flutter_pos_demo/app/theme/app_theme.dart';

// Access theme
final theme = AppTheme.light;

// Use colors
Container(color: theme.colors.primary);
Text(text: 'Hello', style: theme.textStyles.bodyLarge);
```

### Custom Theme Extension
```dart
class ThemeExtensions {
  static Color? getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }
}
```

---

## Riverpod Usage

### Provider Setup
```dart
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Cart state = Cart();

  Future<void> addItem(Product product) async {
    final cart = state;
    state = cart.copyWith(
      items: [...cart.items, ...[product]],
    );
  }
}
```

### Async Handling
```dart
return FutureBuilder<StoreProfile>(
  future: ref.watch(storeProfileProvider.future),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _loadingWidget();
    }
    if (!snapshot.hasData) {
      return _emptyWidget();
    }
    if (snapshot.error) {
      return _errorWidget(snapshot.error);
    }
    return _profileWidget(snapshot.data!);
  },
);
```

---

## Material 3 Usage

### Theme Data
```dart
return MaterialApp(
  theme: ThemeData(useMaterial3: true),
  ...
);
```

### M3 Components
```dart
// Buttons
ElevatedButton(
  onPressed: () {},
  child: Text('Click'),
);

// Cards
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(...),
  ),
);
```

---

## Asset Management

### Images
```dart
// In pubspec.yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/

// In code
Image.asset('assets/images/logo.png');
```

### SVG Icons
```dart
// If using svg package
SvgPicture.asset('assets/icons/qr_code.svg');
```

---

## Performance Guidelines

### Image Loading
```dart
// Use memory cached images
CachedNetworkImage(
  imageUrl: product.imageUrl,
  fadeInDuration: Duration(milliseconds: 300),
);
```

### List Optimization
```dart
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    return ProductCard(product: products[index]);
  },
)
```

---

## Platform-Specific Code

### Conditional Imports
```dart
// For iOS
// ignore: implementation_imports
import 'package:flutter_pos_demo/features/checkout/platform_specific/ios_specific.dart'
    if (dart.library.html) 'package:flutter_pos_demo/features/checkout/platform_specific/stub.dart';

// For web
// ignore: implementation_imports
import 'package:flutter_pos_demo/features/checkout/platform_specific/web_specific.dart'
    if (dart.library.io) 'package:flutter_pos_demo/features/checkout/platform_specific/stub.dart';
```

### Build Flags
```dart
if (kIsWeb) {
  // Web-specific code
} else if (kIsIOS) {
  // iOS-specific code
}
```

---

## Last Updated
April 2026
