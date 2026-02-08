import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Title list (Figma 36-135). Uma linha de título (titleMedium 16/24) e uma de supporting text (body medium).
/// Tokens: onSurface, onSurfaceVariant, titleMedium, bodyMedium, gapLarge, gapMedium, gapExtraSmall.
class TitleList extends StatelessWidget {
  const TitleList({
    super.key,
    required this.title,
    required this.supportingText,
  });

  final String title;
  final String supportingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.gapLarge,
        vertical: SpacingTokens.gapMedium,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TypographyTokens.titleMedium.copyWith(
              color: ColorTokens.onSurface,
            ),
          ),
          const SizedBox(height: SpacingTokens.gapExtraSmall),
          Text(
            supportingText,
            style: TypographyTokens.bodyMedium.copyWith(
              color: ColorTokens.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
