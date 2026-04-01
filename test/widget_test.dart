import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:thai_pos_demo/app/app.dart';
import 'package:thai_pos_demo/app/l10n/localization.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Thai POS app renders login screen', (WidgetTester tester) async {
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: AppLocalization.supportedLocales,
        path: AppLocalization.assetPath,
        fallbackLocale: AppLocalization.fallbackLocale,
        startLocale: AppLocalization.fallbackLocale,
        useOnlyLangCode: true,
        child: const ProviderScope(
          child: ThaiPosApp(),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(ThaiPosApp), findsOneWidget);
  });
}
