import 'package:flutter/material.dart';

class AppColors {
  // Primary red color
  static const Color primaryColor = Color(0xFFFF0000); // Bright Red
  static const Color textColor = Color(0xFF000000);

  // Accent color, a slightly darker shade of red
  static const Color accentColor = Color(0xFFD32F2F); // Dark Red

  // Background and surface colors
  static const Color backgroundColor = Color(0xFFFFFFFF); // Pure White
  static const Color surfaceColor =
      Color(0xFFF5F5F5); // Light Grey (for cards or containers)

  // Text colors
  static const Color primaryTextColor =
      Color(0xFF333333); // Dark grey for primary text
  static const Color secondaryTextColor =
      Color(0xFF757575); // Medium grey for secondary text

  // Error color (can be the same as accent for simplicity)
  static const Color errorColor = accentColor;

  // Additional shades of red if needed
  static const Color lightRed =
      Color(0xFFFFCDD2); // Light red for backgrounds or highlights
  static const Color darkRed =
      Color(0xFFB71C1C); // Darkest red for intense highlights or borders
}
