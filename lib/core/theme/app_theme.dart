import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.amber,
      primaryColor: AppColors.primaryGold,
      scaffoldBackgroundColor: AppColors.primaryBlack,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryGold,
        secondary: AppColors.richRed,
        surface: AppColors.secondaryBlack,
        onPrimary: AppColors.primaryBlack,
        onSecondary: AppColors.textWhite,
        onSurface: AppColors.textWhite,
      ),

      // Text Theme - Using Cinematic Fonts
      textTheme: TextTheme(
        // Headlines
        headlineLarge: GoogleFonts.oswald(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textWhite,
          letterSpacing: 1.2,
        ),
        headlineMedium: GoogleFonts.oswald(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textWhite,
          letterSpacing: 1.0,
        ),
        headlineSmall: GoogleFonts.oswald(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.textWhite,
          letterSpacing: 0.8,
        ),

        // Titles
        titleLarge: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryGold,
          letterSpacing: 0.5,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textWhite,
          letterSpacing: 0.3,
        ),
        titleSmall: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textGray,
          letterSpacing: 0.2,
        ),

        // Body Text
        bodyLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textWhite,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textGray,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.textLightGray,
          height: 1.3,
        ),
      ),

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.oswald(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryGold,
          letterSpacing: 1.0,
        ),
        iconTheme: const IconThemeData(color: AppColors.primaryGold),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGold,
          foregroundColor: AppColors.primaryBlack,
          textStyle: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 8,
          shadowColor: AppColors.primaryGold.withOpacity(0.3),
        ),
      ),

      // Card Theme
      cardTheme: const CardThemeData(
        color: AppColors.secondaryBlack,
        elevation: 8,
        shadowColor: Color(0x1AFFD700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.primaryGold, size: 24),
    );
  }
}

class AppTextStyles {
  // Dr Abu Brand Typography
  static TextStyle get heroTitle => GoogleFonts.oswald(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGold,
    letterSpacing: 2.0,
    shadows: [
      Shadow(
        color: AppColors.primaryGold.withOpacity(0.5),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ],
  );

  static TextStyle get characterName => GoogleFonts.oswald(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
    letterSpacing: 3.0,
    shadows: [
      Shadow(
        color: AppColors.richRed.withOpacity(0.8),
        offset: const Offset(2, 2),
        blurRadius: 6,
      ),
    ],
  );

  static TextStyle get sectionTitle => GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGold,
    letterSpacing: 0.8,
  );

  static TextStyle get cardTitle => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    letterSpacing: 0.5,
  );

  static TextStyle get cardSubtitle => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textGray,
    height: 1.3,
  );

  static TextStyle get buttonText => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );
}

class AppAnimations {
  // Animation Durations
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration verySlow = Duration(milliseconds: 1000);

  // Animation Curves
  static const Curve bounceIn = Curves.bounceIn;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve elasticOut = Curves.elasticOut;
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
}
