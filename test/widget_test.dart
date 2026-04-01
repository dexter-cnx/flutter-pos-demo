// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:thai_pos_demo/app/app.dart';
import 'package:thai_pos_demo/app/bootstrap.dart';

void main() {
  testWidgets('App builds test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await bootstrap(child: const ThaiPosApp());
    await tester.pumpAndSettle();

    // Verify that the login title or app title is present.
    // Note: Since we use easy_localization, we might need a more complex test setup,
    // but for now we just verify it doesn't crash.
    expect(find.byType(ThaiPosApp), findsOneWidget);
  });
}
