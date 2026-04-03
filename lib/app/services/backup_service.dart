import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class BackupService {
  BackupService(Isar isar);

  Future<File> createBackup() async {
    final tempDir = await getTemporaryDirectory();
    final backupDir = Directory('${tempDir.path}/pos_backup');
    if (await backupDir.exists()) await backupDir.delete(recursive: true);
    await backupDir.create(recursive: true);

    final manifest = {
      'appVersion': '1.0.0',
      'backupDate': DateTime.now().toIso8601String(),
      'deviceName': Platform.localHostname,
      'isarVersion': '3.1.0',
      'collections': ['orders', 'products'],
    };

    // Very simplified export
    final ordersJson = '[]'; // Simplified export
    final productsJson = '[]'; // Simplified export

    await File('${backupDir.path}/orders.json').writeAsString(ordersJson);
    await File('${backupDir.path}/products.json').writeAsString(productsJson);
    await File('${backupDir.path}/manifest.json').writeAsString(jsonEncode(manifest));

    final zipPath = '${tempDir.path}/thai_pos_backup_${DateTime.now().millisecondsSinceEpoch}.zip';
    final encoder = ZipFileEncoder();
    encoder.create(zipPath);
    encoder.addDirectory(backupDir);
    encoder.close();

    await backupDir.delete(recursive: true);
    return File(zipPath);
  }

  Future<bool> restoreBackup(File zipFile) async {
    final tempDir = await getTemporaryDirectory();
    final extractDir = Directory('${tempDir.path}/pos_restore');
    if (await extractDir.exists()) await extractDir.delete(recursive: true);
    
    final bytes = await zipFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      if (file.isFile) {
        final outputFile = File('${extractDir.path}/${file.name}');
        await outputFile.create(recursive: true);
        await outputFile.writeAsBytes(file.content as List<int>);
      }
    }
    
    // Validate
    final manifestFile = File('${extractDir.path}/manifest.json');
    if (!await manifestFile.exists()) return false;

    // In a real scenario we parse and import JSON
    await extractDir.delete(recursive: true);
    return true;
  }
}
