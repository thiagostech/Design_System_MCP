import 'package:flutter/material.dart' hide Divider;
import '../tokens/tokens.dart';
import 'divider.dart';

/// DS List Item (Figma node 24-3305, 34-54). Optional leading/trailing icon, title (body large), supporting text (body medium).
/// Pass leadingIcon/trailingIcon null for text-only. When onTap is null, no interaction (no InkWell).
/// [rowAlignment] alinha leading, conteúdo e trailing na vertical (start, center).
/// [showDivider] exibe um Divider abaixo do item quando true.
/// Tokens: onSurface, onSurfaceVariant, bodyLarge, bodyMedium, gapMedium, gapLarge.
class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.supportingText,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
    this.rowAlignment = CrossAxisAlignment.center,
    this.showDivider = false,
  });

  final String title;
  final String supportingText;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final CrossAxisAlignment rowAlignment;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: GapTokens.gapLarge,
        vertical: GapTokens.gapMedium,
      ),
      child: Row(
        crossAxisAlignment: rowAlignment,
        children: [
          if (leadingIcon != null) ...[
            Icon(
              leadingIcon,
              color: colorScheme.onSurface,
              size: SizeTokens.iconSizeSmall,
            ),
            const SizedBox(width: GapTokens.gapMedium),
          ],
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TypographyTokens.bodyLarge.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: GapTokens.gapExtraSmall),
                Text(
                  supportingText,
                  style: TypographyTokens.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: GapTokens.gapSmall),
            Icon(
              trailingIcon,
              color: colorScheme.onSurface,
              size: SizeTokens.iconSizeSmall,
            ),
          ],
        ],
      ),
    );

    final child = Material(
      color: Colors.transparent,
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              child: content,
            )
          : content,
    );

    if (!showDivider) return child;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        child,
        const Divider(direction: Axis.horizontal),
      ],
    );
  }
}
