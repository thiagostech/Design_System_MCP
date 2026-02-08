import 'package:flutter/material.dart';
import '../tokens/tokens.dart';
import 'icon_button_standard.dart';

/// Top bar (Figma 29-2908). Leading icon, title, optional trailing icon. Variants: compact (single line), medium (titleLarge), large (displaySmall).
/// Tokens: surface, onSurface; SpacingTokens.gapLarge, gapSmall, gapExtraSmall; TypographyTokens.titleLarge, displaySmall, bodyMedium; SizeTokens.
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
    return ColoredBox(
      color: ColorTokens.surface,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.gapSmall,
            vertical: SpacingTokens.gapSmall,
          ),
          child: variant == TopBarVariant.compact ? _buildCompact() : _buildStacked(),
        ),
      ),
    );
  }

  /// Compact (Figma 29-2908): leading icon, título e supporting text na mesma coluna, trailing icon. Uma linha de ícones com texto empilhado ao centro.
  Widget _buildCompact() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showLeading) ...[
          IconButtonStandard(icon: leadingIcon, onPressed: onLeadingTap),
          const SizedBox(width: SpacingTokens.gapLarge),
        ] else ...[
          const SizedBox(width: SpacingTokens.gapMedium),
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
                  color: ColorTokens.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (supportingText != null && supportingText!.isNotEmpty) ...[
                const SizedBox(height: SpacingTokens.gapExtraSmall),
                Text(
                  supportingText!,
                  style: TypographyTokens.bodyMedium.copyWith(
                    color: ColorTokens.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        if (showTrailing && trailingIcon != null) ...[
          const SizedBox(width: SpacingTokens.gapLarge),
          IconButtonStandard(icon: trailingIcon!, onPressed: onTrailingTap),
        ] else ...[
          const SizedBox(width: SpacingTokens.gapMedium),
        ],
      ],
    );
  }

  /// Medium/Large: ações (ícones) em cima, título em baixo.
  Widget _buildStacked() {
    final textStyle = variant == TopBarVariant.large
        ? TypographyTokens.displaySmall.copyWith(color: ColorTokens.onSurface)
        : TypographyTokens.titleLarge.copyWith(color: ColorTokens.onSurface);

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
        const SizedBox(height: SpacingTokens.gapExtraSmall),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.gapLarge),
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
                const SizedBox(height: SpacingTokens.gapExtraSmall),
                Text(
                  supportingText!,
                  style: TypographyTokens.bodyMedium.copyWith(
                    color: ColorTokens.onSurfaceVariant,
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
