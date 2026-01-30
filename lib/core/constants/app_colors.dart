import 'package:flutter/material.dart';

/// App-wide color constants
/// Use these instead of hardcoding colors for easier theming and maintenance
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF004CFF);
  static const Color primaryLight = Color(0xFFEBF0FF);

  // Accent Colors
  static const Color accent = Color(0xFFF81140);
  static const Color accentLight = Color(0xFFFF5790);

  // Backgrounds
  static const Color bgLight = Color(0xFFF9FAFC);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgGrey = Color(0xFFF6F6F6);
  static const Color bgLightGrey = Color(0xFFF8F8F8);
  static const Color bgPinkLight = Color(0xFFFFEBEB);

  // Text Colors
  static const Color textDark = Color(0xFF202020);
  static const Color textGrey = Color(0xFF666666);
  static const Color textLight = Color(0xFFFFFFFF);

  // Shadows & Borders
  static const Color shadowColor = Colors.black;
  static const Color borderColor = Color(0xFFE0E0E0);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFBC02D);
}
