import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/localization.dart';
import 'services/data_seeder.dart';
import 'services/auto_backup_scheduler.dart';
import 'services/backup_service.dart';
import '../features/auth/data/models/user_model.dart';
import '../features/orders/data/models/order_model.dart';
import '../features/pos/data/models/product_model.dart';
import '../features/pos/data/models/category_model.dart';
import '../features/settings/data/models/app_settings_model.dart';
import '../features/tables/data/models/table_model.dart';
import '../features/tables/data/models/floor_plan_model.dart';
import '../features/tables/data/models/layout_object_model.dart';
import '../features/dining/data/models/dining_session_model.dart';
import '../features/dining/data/models/buffet_tier_model.dart';
import '../features/customer/data/models/customer_model.dart';
import '../features/customer/data/models/promotion_model.dart';
import '../features/printer/data/models/receipt_template_model.dart';

// Global Isar instance
Isar? isar;
SharedPreferences? sharedPreferences;

Future<void> bootstrap({required Widget child}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();

    // Initialize Isar
    if (!kIsWeb) {
      final directory = (await getApplicationDocumentsDirectory()).path;
      isar = await Isar.open([
        UserModelSchema,
        OrderModelSchema,
        ProductModelSchema,
        CategoryModelSchema,
        AppSettingsModelSchema,
        TableModelSchema,
        FloorPlanModelSchema,
        LayoutObjectModelSchema,
        DiningSessionModelSchema,
        BuffetTierModelSchema,
        CustomerModelSchema,
        PromotionModelSchema,
        ReceiptTemplateModelSchema,
      ], directory: directory);

      // Seed Data
      if (isar != null) {
        await DataSeeder.seed(isar!);
        AutoBackupScheduler.checkAndRun(BackupService(isar!));
      }
    } else {
      debugPrint(
        'Web environment detected. Using SharedPreferences-backed persistence.',
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
