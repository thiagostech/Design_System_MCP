import 'package:flutter/material.dart';

/// Barra fixa no topo das páginas de tokens exibindo a quantidade de tokens (texto bem pequeno).
Widget tokenCountBar(BuildContext context, int count) {
  final theme = Theme.of(context);
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
    decoration: BoxDecoration(
      color: theme.colorScheme.surfaceContainerLow,
    ),
    child: Text(
      '$count tokens',
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: 10,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    ),
  );
}
