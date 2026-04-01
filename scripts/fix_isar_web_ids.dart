import 'dart:io';

/// This script applies a mathematical patch to large Isar IDs.
///
/// Dart Web compiler crashes when it parses a literal > 53 bits (e.g. 5541857840182343273).
/// By rewriting the literal as `(5541857840 * 1000000000 + 182343273)`, the AST parser
/// only sees small numbers, successfully bypassing the syntax error.
///
/// - For Native: The dart compiler resolves the const expression to the EXACT 64-bit hash.
/// - For Web: The dart compiler resolves it to a double, automatically applying JS-safe rounding dynamically.
void main() {
  final directory = Directory('lib/features');
  if (!directory.existsSync()) {
    print('Directory lib/features not found.');
    return;
  }

  final files = directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.g.dart'))
      .toList();

  final idRegex = RegExp(
    r'id:\s*(-?|)\(?((?:bool\.fromEnvironment[^\?]+\?\s*-?\d+\s*:\s*)?)(\d+)\)?',
  );
  final BigInt jsSafeLimit = BigInt.from(9007199254740991);

  bool modifiedAny = false;

  for (final file in files) {
    var content = file.readAsStringSync();

    // Quick reset of any previous conditional patches back to the pure digits they contained
    content = content.replaceAllMapped(
      RegExp(r'\(\s*bool\.fromEnvironment\([^?]+\?\s*-?\d+\s*:\s*(-?\d+)\s*\)'),
      (match) {
        return match.group(1)!;
      },
    );

    final newContent = content.replaceAllMapped(RegExp(r'id:\s*(-?\d+)'), (
      match,
    ) {
      final fullMatch = match.group(0)!;
      final rawValue = match.group(1)!;

      final isNegative = rawValue.startsWith('-');
      final digits = isNegative ? rawValue.substring(1) : rawValue;

      final val = BigInt.parse(digits);

      // Only split if it exceeds the JS literal safe limit
      if (val > jsSafeLimit) {
        // Split precisely 9 digits for the low part
        final lowStr = digits.substring(digits.length - 9);
        final highStr = digits.substring(0, digits.length - 9);

        final high = int.parse(highStr);
        final low = int.parse(lowStr);

        final sign = isNegative ? '-' : '';

        print(
          'Mathematical patch applied in ${file.path.split(Platform.pathSeparator).last}: $sign($high * 1000000000 + $low)',
        );

        return 'id: $sign($high * 1000000000 + $low)';
      }

      return fullMatch;
    });

    if (newContent != content) {
      file.writeAsStringSync(newContent);
      modifiedAny = true;
    }
  }

  if (modifiedAny) {
    print(
      '\nSuccess! Applied Mathematical Split ID patches for Web AST bypass.',
    );
  } else {
    print('No large IDs found.');
  }
}
