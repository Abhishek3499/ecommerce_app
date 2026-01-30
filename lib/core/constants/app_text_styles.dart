import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App-wide text style constants
/// Ensures consistent typography across the app
class AppTextStyles {
  // Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: "raleway",
    color: AppColors.textGrey,
  );

  // Price Styles
  static const TextStyle price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );

  // Discount Badge Style
  static const TextStyle discount = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
  );

  // Button Styles
  static const TextStyle buttonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    fontFamily: "raleway",
    color: AppColors.textDark,
  );
}
