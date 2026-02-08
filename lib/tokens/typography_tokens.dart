import 'package:flutter/material.dart';

abstract final class TypographyTokens {
  static const String fontPrimary = 'Barlow';
  static const String fontSecondary = 'Poppins';

  // Display small - 32 / 40, SemiBold
  static const double displaySmallSize = 32;
  static const double displaySmallLineHeight = 40;
  static const FontWeight displaySmallWeight = FontWeight.w600;

  // Headline large - 32 / 40, SemiBold
  static const double headlineLargeSize = 32;
  static const double headlineLargeLineHeight = 40;
  static const FontWeight headlineLargeWeight = FontWeight.w600;

  // Title large - 22 / 28, Medium
  static const double titleLargeSize = 22;
  static const double titleLargeLineHeight = 28;
  static const FontWeight titleLargeWeight = FontWeight.w500;

  // Title medium - 16 / 24, Medium
  static const double titleMediumSize = 16;
  static const double titleMediumLineHeight = 24;
  static const FontWeight titleMediumWeight = FontWeight.w500;

  // Title small - 14 / 20, Medium
  static const double titleSmallSize = 14;
  static const double titleSmallLineHeight = 20;
  static const FontWeight titleSmallWeight = FontWeight.w500;

  // Body large - 16 / 24, Regular
  static const double bodyLargeSize = 16;
  static const double bodyLargeLineHeight = 24;
  static const FontWeight bodyLargeWeight = FontWeight.w400;

  // Body medium - 14 / 20, Regular
  static const double bodyMediumSize = 14;
  static const double bodyMediumLineHeight = 20;
  static const FontWeight bodyMediumWeight = FontWeight.w400;

  // Body small - 12 / 16, Regular
  static const double bodySmallSize = 12;
  static const double bodySmallLineHeight = 16;
  static const FontWeight bodySmallWeight = FontWeight.w400;

  // Label large - 14 / 20, Medium
  static const double labelLargeSize = 14;
  static const double labelLargeLineHeight = 20;
  static const FontWeight labelLargeWeight = FontWeight.w500;

  /// Display small: Primary SemiBold 32/40
  static TextStyle get displaySmall => TextStyle(
        fontFamily: fontPrimary,
        fontSize: displaySmallSize,
        height: displaySmallLineHeight / displaySmallSize,
        fontWeight: displaySmallWeight,
      );

  /// Headline large: Primary SemiBold 32/40
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: fontPrimary,
        fontSize: headlineLargeSize,
        height: headlineLargeLineHeight / headlineLargeSize,
        fontWeight: headlineLargeWeight,
      );

  /// Title large: Primary Medium 22/28
  static TextStyle get titleLarge => TextStyle(
        fontFamily: fontPrimary,
        fontSize: titleLargeSize,
        height: titleLargeLineHeight / titleLargeSize,
        fontWeight: titleLargeWeight,
      );

  /// Title medium: Primary Medium 16/24
  static TextStyle get titleMedium => TextStyle(
        fontFamily: fontPrimary,
        fontSize: titleMediumSize,
        height: titleMediumLineHeight / titleMediumSize,
        fontWeight: titleMediumWeight,
      );

  /// Title small: Primary Medium 14/20
  static TextStyle get titleSmall => TextStyle(
        fontFamily: fontPrimary,
        fontSize: titleSmallSize,
        height: titleSmallLineHeight / titleSmallSize,
        fontWeight: titleSmallWeight,
      );

  /// Body large: Secondary Regular 16/24
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: fontSecondary,
        fontSize: bodyLargeSize,
        height: bodyLargeLineHeight / bodyLargeSize,
        fontWeight: bodyLargeWeight,
      );

  /// Body medium: Secondary Regular 14/20
  static TextStyle get bodyMedium => TextStyle(
        fontFamily: fontSecondary,
        fontSize: bodyMediumSize,
        height: bodyMediumLineHeight / bodyMediumSize,
        fontWeight: bodyMediumWeight,
      );

  /// Body small: Secondary Regular 12/16
  static TextStyle get bodySmall => TextStyle(
        fontFamily: fontSecondary,
        fontSize: bodySmallSize,
        height: bodySmallLineHeight / bodySmallSize,
        fontWeight: bodySmallWeight,
      );

  /// Label large: Primary Medium 14/20
  static TextStyle get labelLarge => TextStyle(
        fontFamily: fontPrimary,
        fontSize: labelLargeSize,
        height: labelLargeLineHeight / labelLargeSize,
        fontWeight: labelLargeWeight,
      );
}
