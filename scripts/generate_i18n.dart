import 'dart:convert';
import 'dart:io';

void main() async {
  final csvFile = File('assets/i18n/translations.csv');
  if (!await csvFile.exists()) {
    stderr.writeln('Missing assets/i18n/translations.csv');
    exitCode = 1;
    return;
  }

  final lines = await csvFile.readAsLines();
  final rows = lines
      .map(_parseCsvLine)
      .where((row) => row.any((cell) => cell.trim().isNotEmpty))
      .toList();

  if (rows.length < 2) {
    stderr.writeln(
      'translations.csv must contain a header and at least one key row.',
    );
    exitCode = 1;
    return;
  }

  final header = rows.first.map((cell) => cell.trim()).toList();
  if (header.isEmpty || header.first != 'key' || header.length < 2) {
    stderr.writeln(
      'Header must start with "key" and include at least one locale column.',
    );
    exitCode = 1;
    return;
  }

  final locales = header.sublist(1);
  final localeMaps = <String, Map<String, Object?>>{
    for (final locale in locales) locale: <String, Object?>{},
  };

  for (var rowIndex = 1; rowIndex < rows.length; rowIndex++) {
    final row = rows[rowIndex];
    if (row.isEmpty) continue;

    final key = row.first.trim();
    if (key.isEmpty) {
      stderr.writeln('Row ${rowIndex + 1} is missing a translation key.');
      exitCode = 1;
      return;
    }

    for (var localeIndex = 0; localeIndex < locales.length; localeIndex++) {
      final locale = locales[localeIndex];
      final value = localeIndex + 1 < row.length
          ? row[localeIndex + 1].trim()
          : '';
      _writeNestedValue(localeMaps[locale]!, key, value);
    }
  }

  final outputDir = Directory('assets/i18n/generated');
  await outputDir.create(recursive: true);

  for (final entry in localeMaps.entries) {
    final outputFile = File('${outputDir.path}/${entry.key}.json');
    const encoder = JsonEncoder.withIndent('  ');
    await outputFile.writeAsString('${encoder.convert(entry.value)}\n');
  }
}

List<String> _parseCsvLine(String line) {
  final cells = <String>[];
  final buffer = StringBuffer();
  var inQuotes = false;

  for (var i = 0; i < line.length; i++) {
    final char = line[i];
    if (char == '"') {
      final nextIsQuote = i + 1 < line.length && line[i + 1] == '"';
      if (inQuotes && nextIsQuote) {
        buffer.write('"');
        i++;
      } else {
        inQuotes = !inQuotes;
      }
      continue;
    }

    if (char == ',' && !inQuotes) {
      cells.add(buffer.toString());
      buffer.clear();
      continue;
    }

    buffer.write(char);
  }

  cells.add(buffer.toString());
  return cells;
}

void _writeNestedValue(
  Map<String, Object?> root,
  String dottedKey,
  String value,
) {
  final segments = dottedKey.split('.');
  Map<String, Object?> current = root;

  for (var i = 0; i < segments.length; i++) {
    final segment = segments[i].trim();
    if (segment.isEmpty) {
      throw FormatException('Invalid dotted key: $dottedKey');
    }

    final isLeaf = i == segments.length - 1;
    if (isLeaf) {
      current[segment] = value;
      return;
    }

    final next = current.putIfAbsent(segment, () => <String, Object?>{});
    if (next is! Map<String, Object?>) {
      throw FormatException('Key collision while writing $dottedKey');
    }
    current = next;
  }
}
