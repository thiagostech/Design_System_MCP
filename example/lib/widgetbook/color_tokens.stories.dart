import 'package:flutter/material.dart' hide Divider;
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';
import 'token_count_bar.dart';

String _colorToHex(Color c) =>
    '#${c.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

const _lightTokens = [
  ('primary', ColorTokens.primary),
  ('onPrimary', ColorTokens.onPrimary),
  ('primaryContainer', ColorTokens.primaryContainer),
  ('onPrimaryContainer', ColorTokens.onPrimaryContainer),
  ('surface', ColorTokens.surface),
  ('surfaceContainerLow', ColorTokens.surfaceContainerLow),
  ('surfaceVariant', ColorTokens.surfaceVariant),
  ('onSurface', ColorTokens.onSurface),
  ('onSurfaceVariant', ColorTokens.onSurfaceVariant),
  ('outline', ColorTokens.outline),
  ('outlineVariant', ColorTokens.outlineVariant),
  ('onSurfaceOpacity10', ColorTokens.onSurfaceOpacity10),
  ('onSurfaceVariantOpacity10', ColorTokens.onSurfaceVariantOpacity10),
  ('onPrimaryOpacity10', ColorTokens.onPrimaryOpacity10),
  ('onSurfaceOpacity40', ColorTokens.onSurfaceOpacity40),
];

const _darkTokens = [
  ('primaryDark', ColorTokens.primaryDark),
  ('onPrimaryDark', ColorTokens.onPrimaryDark),
  ('primaryContainerDark', ColorTokens.primaryContainerDark),
  ('onPrimaryContainerDark', ColorTokens.onPrimaryContainerDark),
  ('surfaceDark', ColorTokens.surfaceDark),
  ('surfaceContainerLowDark', ColorTokens.surfaceContainerLowDark),
  ('surfaceVariantDark', ColorTokens.surfaceVariantDark),
  ('onSurfaceDark', ColorTokens.onSurfaceDark),
  ('onSurfaceVariantDark', ColorTokens.onSurfaceVariantDark),
  ('outlineDark', ColorTokens.outlineDark),
  ('outlineVariantDark', ColorTokens.outlineVariantDark),
  ('onSurfaceOpacity10Dark', ColorTokens.onSurfaceOpacity10Dark),
  ('onSurfaceVariantOpacity10Dark', ColorTokens.onSurfaceVariantOpacity10Dark),
  ('onPrimaryOpacity10Dark', ColorTokens.onPrimaryOpacity10Dark),
  ('onSurfaceOpacity40Dark', ColorTokens.onSurfaceOpacity40Dark),
];

@widgetbook.UseCase(name: 'Color', type: ColorTokens)
Widget colorTokensUseCase(BuildContext context) {
  return const _ColorTokensPage();
}

class _ColorTokensPage extends StatefulWidget {
  const _ColorTokensPage();

  @override
  State<_ColorTokensPage> createState() => _ColorTokensPageState();
}

class _ColorTokensPageState extends State<_ColorTokensPage> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = _dark ? _darkTokens : _lightTokens;
    final count = tokens.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        tokenCountBar(context, count),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
            children: [
              Text(
                'Dark',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Switch(
                value: _dark,
                onChanged: (value) => setState(() => _dark = value),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...tokens.expand((t) {
            final name = t.$1;
            final color = t.$2;
            final hex = _colorToHex(color);
            final item = Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.3),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          hex,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      final token = 'ColorTokens.$name';
                      Clipboard.setData(ClipboardData(text: token));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$token copiado'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    tooltip: 'Copiar token',
                  ),
                ],
              ),
            );
            return [item, const Divider(direction: Axis.horizontal)];
          }).toList()
            ..removeLast(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
