import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'backup_service.dart';

class AutoBackupScheduler {
  static const _lastBackupKey = 'last_auto_backup';
  static const _autoBackupEnabledKey = 'auto_backup_enabled';

  static Future<void> checkAndRun(BackupService service) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final enabled = prefs.getBool(_autoBackupEnabledKey) ?? false;
      if (!enabled) return;

      final lastBackup = prefs.getString(_lastBackupKey);
      if (lastBackup != null) {
        final lastDate = DateTime.parse(lastBackup);
        if (DateTime.now().difference(lastDate).inHours < 24) return;
      }

      await service.createBackup();
      prefs.setString(_lastBackupKey, DateTime.now().toIso8601String());
    } catch (e) {
      debugPrint('Auto-backup failed: $e');
    }
  }
}
