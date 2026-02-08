import 'package:flutter/material.dart';

abstract final class ColorTokens {
  // Light mode (default)
  static const primary = Color(0xFF6750A4);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFEADDFF);
  static const onPrimaryContainer = Color(0xFF4F378A);
  static const surface = Color(0xFFFEF7FF);
  static const surfaceContainerLow = Color(0xFFF5EFF7);
  static const surfaceVariant = Color(0xFFE7E0EC);
  static const onSurface = Color(0xFF1D1B20);
  static const onSurfaceVariant = Color(0xFF49454F);
  static const outline = Color(0xFF79747E);
  static const outlineVariant = Color(0xFFCAC4D0);

  // Opacity 10 - Light
  static const onSurfaceOpacity10 = Color(0x1A1D1B20);
  static const onSurfaceVariantOpacity10 = Color(0x1A49454F);
  static const onPrimaryOpacity10 = Color(0x1AFFFFFF);

  // Opacity 40 - Light
  static const onSurfaceOpacity40 = Color(0x661D1B20);

  // Dark mode
  static const primaryDark = Color(0xFFD0BCFF);
  static const onPrimaryDark = Color(0xFF381E72);
  static const primaryContainerDark = Color(0xFF4F378B);
  static const onPrimaryContainerDark = Color(0xFFEADDFF);
  static const surfaceDark = Color(0xFF141218);
  static const surfaceContainerLowDark = Color(0xFF2D2932);
  static const surfaceVariantDark = Color(0xFF49454F);
  static const onSurfaceDark = Color(0xFFE6E0E9);
  static const onSurfaceVariantDark = Color(0xFFCAC4D0);
  static const outlineDark = Color(0xFF938F99);
  static const outlineVariantDark = Color(0xFF49454F);

  // Opacity 10 - Dark
  static const onSurfaceOpacity10Dark = Color(0x1AE6E0E9);
  static const onSurfaceVariantOpacity10Dark = Color(0x1ACAC4D0);
  static const onPrimaryOpacity10Dark = Color(0x1A381E72);

  // Opacity 40 - Dark
  static const onSurfaceOpacity40Dark = Color(0x66E6E0E9);
}
