import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6FEFF8);
  static const Color primaryContainer = Color(0xFF14B2BA);
  static const Color backgroundColor = Color(0xFF080F17);
  static const Color surfaceLow = Color(0xFF0D141D);
  static const Color surfaceHigh = Color(0xFF1E2632);
  static const Color onSurface = Color(0xFFEBF1FD);
  static const Color onSurfaceVariant = Color(0xFFA5ABB7);
  static const Color errorColor = Color(0xFFFF716C);
  static const Color successColor = Color(0xFF4E9F3D);

  static ThemeData dark() {
    final baseTheme = ThemeData.dark(useMaterial3: true);

    return baseTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: const Color(0xFF003739),
        primaryContainer: primaryContainer,
        onPrimaryContainer: const Color(0xFF002021),
        surface: backgroundColor,
        onSurface: onSurface,
        surfaceContainerLow: surfaceLow,
        surfaceContainerHigh: surfaceHigh,
        error: errorColor,
        onSurfaceVariant: onSurfaceVariant,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: GoogleFonts.notoSansThaiTextTheme(baseTheme.textTheme)
          .copyWith(
            displayLarge: GoogleFonts.notoSansThai(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: onSurface,
            ),
            headlineMedium: GoogleFonts.notoSansThai(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: onSurface,
            ),
            titleLarge: GoogleFonts.notoSansThai(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: onSurface,
            ),
            bodyLarge: GoogleFonts.notoSansThai(
              fontSize: 16,
              height: 1.6,
              color: onSurface,
            ),
          ),
      cardTheme: CardThemeData(
        color: surfaceHigh,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // rounded-xl
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: const Color(0xFF003739),
          minimumSize: const Size.fromHeight(64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24), // rounded-xl
          ),
          textStyle: GoogleFonts.notoSansThai(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
