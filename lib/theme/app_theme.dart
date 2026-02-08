import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: ColorTokens.primary,
          onPrimary: ColorTokens.onPrimary,
          primaryContainer: ColorTokens.primaryContainer,
          onPrimaryContainer: ColorTokens.onPrimaryContainer,
          surface: ColorTokens.surface,
          surfaceContainerLow: ColorTokens.surfaceContainerLow,
          surfaceVariant: ColorTokens.surfaceVariant,
          onSurface: ColorTokens.onSurface,
          onSurfaceVariant: ColorTokens.onSurfaceVariant,
          outline: ColorTokens.outline,
          outlineVariant: ColorTokens.outlineVariant,
        ),
        textTheme: TextTheme(
          headlineLarge: TypographyTokens.headlineLarge,
          titleLarge: TypographyTokens.titleLarge,
          bodyLarge: TypographyTokens.bodyLarge,
          bodyMedium: TypographyTokens.bodyMedium,
          labelLarge: TypographyTokens.labelLarge,
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: ColorTokens.primaryDark,
          onPrimary: ColorTokens.onPrimaryDark,
          primaryContainer: ColorTokens.primaryContainerDark,
          onPrimaryContainer: ColorTokens.onPrimaryContainerDark,
          surface: ColorTokens.surfaceDark,
          surfaceContainerLow: ColorTokens.surfaceContainerLowDark,
          surfaceVariant: ColorTokens.surfaceVariantDark,
          onSurface: ColorTokens.onSurfaceDark,
          onSurfaceVariant: ColorTokens.onSurfaceVariantDark,
          outline: ColorTokens.outlineDark,
          outlineVariant: ColorTokens.outlineVariantDark,
        ),
        textTheme: TextTheme(
          headlineLarge: TypographyTokens.headlineLarge,
          titleLarge: TypographyTokens.titleLarge,
          bodyLarge: TypographyTokens.bodyLarge,
          bodyMedium: TypographyTokens.bodyMedium,
          labelLarge: TypographyTokens.labelLarge,
        ),
      );
}
