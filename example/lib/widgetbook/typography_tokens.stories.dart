import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

String _weightLabel(FontWeight w) {
  if (w == FontWeight.w400) return 'Regular';
  if (w == FontWeight.w500) return 'Medium';
  if (w == FontWeight.w600) return 'SemiBold';
  if (w == FontWeight.w700) return 'Bold';
  return 'w${w.index}';
}

@widgetbook.UseCase(name: 'Typography', type: TypographyTokens)
Widget typographyTokensUseCase(BuildContext context) {
  const sampleText = 'The quick brown fox jumps over the lazy dog. 0123456789';
  final theme = Theme.of(context);
  final tokens = [
    ('displaySmall', TypographyTokens.displaySmallSize, TypographyTokens.displaySmallLineHeight, TypographyTokens.displaySmallWeight, TypographyTokens.displaySmall),
    ('headlineLarge', TypographyTokens.headlineLargeSize, TypographyTokens.headlineLargeLineHeight, TypographyTokens.headlineLargeWeight, TypographyTokens.headlineLarge),
    ('titleLarge', TypographyTokens.titleLargeSize, TypographyTokens.titleLargeLineHeight, TypographyTokens.titleLargeWeight, TypographyTokens.titleLarge),
    ('titleMedium', TypographyTokens.titleMediumSize, TypographyTokens.titleMediumLineHeight, TypographyTokens.titleMediumWeight, TypographyTokens.titleMedium),
    ('titleSmall', TypographyTokens.titleSmallSize, TypographyTokens.titleSmallLineHeight, TypographyTokens.titleSmallWeight, TypographyTokens.titleSmall),
    ('bodyLarge', TypographyTokens.bodyLargeSize, TypographyTokens.bodyLargeLineHeight, TypographyTokens.bodyLargeWeight, TypographyTokens.bodyLarge),
    ('bodyMedium', TypographyTokens.bodyMediumSize, TypographyTokens.bodyMediumLineHeight, TypographyTokens.bodyMediumWeight, TypographyTokens.bodyMedium),
    ('bodySmall', TypographyTokens.bodySmallSize, TypographyTokens.bodySmallLineHeight, TypographyTokens.bodySmallWeight, TypographyTokens.bodySmall),
    ('labelLarge', TypographyTokens.labelLargeSize, TypographyTokens.labelLargeLineHeight, TypographyTokens.labelLargeWeight, TypographyTokens.labelLarge),
  ];

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Typography tokens',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...tokens.map((t) {
          final name = t.$1;
          final size = t.$2;
          final lineHeight = t.$3;
          final weight = t.$4;
          final style = t.$5;
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        name,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${size.toInt()} / ${lineHeight.toInt()}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _weightLabel(weight),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  sampleText,
                  style: style.copyWith(color: theme.colorScheme.onSurface),
                ),
              ],
            ),
          );
        }),
      ],
    ),
  );
}
