import 'package:flutter/material.dart';
import '../tokens/tokens.dart';
import 'icon_button_standard.dart';

/// Top bar (Figma 29-2908). Leading icon, title, optional trailing icon. Variants: compact (single line), medium (titleLarge), large (displaySmall).
/// Tokens: surface, onSurface; GapTokens.gapLarge, gapSmall, gapExtraSmall; TypographyTokens.titleLarge, displaySmall, bodyMedium; SizeTokens.
enum TopBarVariant { compact, medium, large }

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.supportingText,
    this.trailingIcon,
    this.variant = TopBarVariant.compact,
    this.showLeading = true,
    this.showTrailing = true,
    this.onLeadingTap,
    this.onTrailingTap,
  });

  final IconData leadingIcon;
  final String title;
  final String? supportingText;
  final IconData? trailingIcon;
  final TopBarVariant variant;
  final bool showLeading;
  final bool showTrailing;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GapTokens.gapSmall,
            vertical: GapTokens.gapSmall,
          ),
          child: variant == TopBarVariant.compact
              ? _buildCompact(colorScheme)
              : _buildStacked(colorScheme),
        ),
      ),
    );
  }

  /// Compact (Figma 29-2908): leading icon, título e supporting text na mesma coluna, trailing icon. Uma linha de ícones com texto empilhado ao centro.
  Widget _buildCompact(ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showLeading) ...[
          IconButtonStandard(icon: leadingIcon, onPressed: onLeadingTap),
          const SizedBox(width: GapTokens.gapLarge),
        ] else ...[
          const SizedBox(width: GapTokens.gapMedium),
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TypographyTokens.titleLarge.copyWith(
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (supportingText != null && supportingText!.isNotEmpty) ...[
                const SizedBox(height: GapTokens.gapExtraSmall),
                Text(
                  supportingText!,
                  style: TypographyTokens.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        if (showTrailing && trailingIcon != null) ...[
          const SizedBox(width: GapTokens.gapLarge),
          IconButtonStandard(icon: trailingIcon!, onPressed: onTrailingTap),
        ] else ...[
          const SizedBox(width: GapTokens.gapMedium),
        ],
      ],
    );
  }

  /// Medium/Large: ações (ícones) em cima, título em baixo.
  Widget _buildStacked(ColorScheme colorScheme) {
    final textStyle = variant == TopBarVariant.large
        ? TypographyTokens.displaySmall.copyWith(color: colorScheme.onSurface)
        : TypographyTokens.titleLarge.copyWith(color: colorScheme.onSurface);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (showLeading)
              IconButtonStandard(icon: leadingIcon, onPressed: onLeadingTap),
            const Spacer(),
            if (showTrailing && trailingIcon != null)
              IconButtonStandard(icon: trailingIcon!, onPressed: onTrailingTap),
          ],
        ),
        const SizedBox(height: GapTokens.gapExtraSmall),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GapTokens.gapLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (supportingText != null && supportingText!.isNotEmpty) ...[
                const SizedBox(height: GapTokens.gapExtraSmall),
                Text(
                  supportingText!,
                  style: TypographyTokens.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
