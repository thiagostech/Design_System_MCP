import 'package:flutter/material.dart' hide Divider;
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';
import 'token_count_bar.dart';

@widgetbook.UseCase(name: 'Radius', type: RadiusTokens)
Widget radiusTokensUseCase(BuildContext context) {
  final theme = Theme.of(context);
  final tokens = [
    ('cornerNone', RadiusTokens.cornerNone),
    ('cornerSmall', RadiusTokens.cornerSmall),
    ('cornerMedium', RadiusTokens.cornerMedium),
    ('cornerLarge', RadiusTokens.cornerLarge),
    ('cornerFull', RadiusTokens.cornerFull),
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      tokenCountBar(context, tokens.length),
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...tokens.expand((t) {
          final name = t.$1;
          final value = t.$2;
          final item = Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(value.clamp(0.0, 999.0)),
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
                        value.toStringAsFixed(value == value.truncateToDouble() ? 0 : 1),
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
                    final token = 'RadiusTokens.$name';
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
