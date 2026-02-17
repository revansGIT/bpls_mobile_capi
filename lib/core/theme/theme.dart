import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // Figma Specified Colors
  static const Color primaryPurple = Color(0xFF5F469B);
  static const Color textDark = Color(0xFF21005D);
  static const Color cardBg = Color(0xFFECE6F0);
  static const Color scaffoldBg = Color(0xFFFFFBFD);

  // --- NEW LISTING FORM SPECS ---
  static const Color listingLabelColor = Color(0xFF07200A);
  static const Color listingPlaceholderColor = Color(0xFF5C516F);
  static const Color listingButtonColor = Color(0xFF21005D);
  static const Color listingBorderColor = Color(0xFFD0D1DA);

  // Updated styles using .sp for responsive font scaling
  static TextStyle get listingLabelStyle => TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w600, fontSize: 14, height: 1.2, color: listingLabelColor);

  static TextStyle get listingHintStyle => TextStyle(fontFamily: 'Noto Sans Bengali', fontWeight: FontWeight.w400, fontSize: 12, height: 1.5, color: listingPlaceholderColor);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Noto Sans Bengali',
      scaffoldBackgroundColor: scaffoldBg,
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBg,
        elevation: 2,
        leadingWidth: 140.w,
        // Responsive width
        iconTheme: IconThemeData(color: textDark, size: 32.sp),
        titleTextStyle: TextStyle(
          fontFamily: 'Noto Sans Bengali',
          fontWeight: FontWeight.w600,
          fontSize: 15, // Scalable pixels
          color: textDark,
        ),
        centerTitle: true,
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return listingButtonColor;
          return listingBorderColor;
        }),
        // Scale radio button visual density if needed
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, primary: primaryPurple, onPrimary: Colors.white, surface: cardBg, onSurface: textDark),

      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r), // Responsive radius
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16.sp), // Scalable button text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // Responsive radius
          ),
        ),
      ),
    );
  }
}
