import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

import 'l10n/localization.dart';
import 'services/data_seeder.dart';
import '../features/auth/data/models/user_model.dart';
import '../features/pos/data/models/product_model.dart';
import '../features/pos/data/models/category_model.dart';

// Global Isar instance
Isar? isar;

Future<void> bootstrap({required Widget child}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    // Initialize Isar
    if (!kIsWeb) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      isar = await Isar.open([
        UserModelSchema,
        ProductModelSchema,
        CategoryModelSchema,
      ], directory: directory);

      // Seed Data
      if (isar != null) {
        await DataSeeder.seed(isar!);
      }
    } else {
      debugPrint(
        'Web environment detected. Bypassing Isar initialization to prevent crash.',
      );
    }

    runApp(
      EasyLocalization(
        supportedLocales: AppLocalization.supportedLocales,
        path: AppLocalization.assetPath,
        fallbackLocale: AppLocalization.fallbackLocale,
        startLocale: AppLocalization.fallbackLocale,
        useOnlyLangCode: true,
        child: ProviderScope(child: child),
      ),
    );
  } catch (e, stackTrace) {
    debugPrint('BOOTSTRAP CATASTROPHIC ERROR: $e');
    debugPrint('STACKTRACE: $stackTrace');
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SelectableText(
                'Initialization Error:\n$e\n\n$stackTrace',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
