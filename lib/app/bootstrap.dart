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
late Isar isar;

Future<void> bootstrap({required Widget child}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Initialize Isar
  late final String directory;
  if (!kIsWeb) {
    directory = (await getApplicationDocumentsDirectory()).path;
  } else {
    directory = ''; // Isar on web handles its own storage
  }

  isar = await Isar.open(
    [UserModelSchema, ProductModelSchema, CategoryModelSchema],
    directory: directory,
    inspector: !kIsWeb, // Disable the native inspector on the web to prevent white screen and 404
  );

  // Seed Data
  await DataSeeder.seed(isar);

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.assetPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.fallbackLocale,
      useOnlyLangCode: true,
      child: ProviderScope(
        child: child,
      ),
    ),
  );
}
