import 'package:flutter/material.dart' hide Divider;
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';
import 'token_count_bar.dart';

@widgetbook.UseCase(name: 'Size', type: SizeTokens)
Widget sizeTokensUseCase(BuildContext context) {
  final theme = Theme.of(context);
  final tokens = [
    ('buttonMinHeight', SizeTokens.buttonMinHeight, 120.0, SizeTokens.buttonMinHeight),
    ('iconButtonMinHeightWidth', SizeTokens.iconButtonMinHeightWidth, SizeTokens.iconButtonMinHeightWidth, SizeTokens.iconButtonMinHeightWidth),
    ('iconSizeSmall', SizeTokens.iconSizeSmall, SizeTokens.iconSizeSmall, SizeTokens.iconSizeSmall),
    ('avatarSmall', SizeTokens.avatarSmall, SizeTokens.avatarSmall, SizeTokens.avatarSmall),
    ('avatarMedium', SizeTokens.avatarMedium, SizeTokens.avatarMedium, SizeTokens.avatarMedium),
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
          final boxW = t.$3;
          final boxH = t.$4;
          final item = Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: boxW.toDouble(),
                  height: boxH.toDouble(),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
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
                    final token = 'SizeTokens.$name';
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
