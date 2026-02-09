import 'package:flutter/material.dart' hide Divider;
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';
import 'token_count_bar.dart';

@widgetbook.UseCase(name: 'Padding', type: PaddingTokens)
Widget paddingTokensUseCase(BuildContext context) {
  final theme = Theme.of(context);
  final tokens = [
    ('paddingExtraSmall', PaddingTokens.paddingExtraSmall),
    ('paddingSmall', PaddingTokens.paddingSmall),
    ('paddingMedium', PaddingTokens.paddingMedium),
    ('paddingLarge', PaddingTokens.paddingLarge),
    ('paddingLargeIncreased', PaddingTokens.paddingLargeIncreased),
    ('paddingExtraLarge', PaddingTokens.paddingExtraLarge),
    ('paddingExtraLargeIncreased', PaddingTokens.paddingExtraLargeIncreased),
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
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 4,
                              height: 32,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Container(
                              width: value.clamp(0.0, 200.0),
                              height: 32,
                              color: theme.colorScheme.primaryContainer
                                  .withOpacity(0.5),
                            ),
                            Container(
                              width: 4,
                              height: 32,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
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
                              value.toStringAsFixed(
                                  value == value.truncateToDouble() ? 0 : 1),
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
                          final token = 'PaddingTokens.$name';
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
