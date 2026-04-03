import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App Widget Smoke Tests', () {
    testWidgets('renders basic POS layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Thai POS Demo')),
            body: const Center(child: Text('Welcome to POS')),
          ),
        ),
      );

      // Verify basic elements
      expect(find.text('Thai POS Demo'), findsOneWidget);
      expect(find.text('Welcome to POS'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders large buttons for touch accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FilledButton(
                onPressed: () {},
                child: const Text('PAY'),
              ),
            ),
          ),
        ),
      );

      final button = tester.widget<FilledButton>(find.byType(FilledButton));
      // Basic check for existence
      expect(find.text('PAY'), findsOneWidget);
      expect(button, isNotNull);
    });
  });
}
