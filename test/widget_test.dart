import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('material shell renders basic scaffold', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Thai POS Demo'))),
      ),
    );

    await tester.pump();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Thai POS Demo'), findsOneWidget);
  });
}
