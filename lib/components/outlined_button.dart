import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Outlined button (Figma 2-493). Estados: default, hover, disabled.
/// Tokens: ColorTokens.outline, onSurface, onSurfaceOpacity10, onSurfaceOpacity40, onSurfaceVariant;
/// GapTokens.gapLarge, gapMedium; RadiusTokens.cornerFull; TypographyTokens.labelLarge.
class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
    required this.onPressed,
    this.label = 'Label',
    this.enabled = true,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.onSurface.withOpacity(0.12);
            }
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.onSurfaceVariant;
            }
            return colorScheme.onSurface;
          }),
          side: MaterialStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: colorScheme.onSurface.withOpacity(0.12),
                width: 1,
              );
            }
            return BorderSide(
              color: colorScheme.outline,
              width: 1,
            );
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return colorScheme.onSurface.withOpacity(0.08);
            }
            return Colors.transparent;
          }),
          padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              horizontal: GapTokens.gapLarge,
              vertical: GapTokens.gapLarge,
            ),
          ),
          minimumSize: const MaterialStatePropertyAll<Size>(
            Size(0, SizeTokens.buttonMinHeight),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusTokens.cornerFull),
            ),
          ),
        ),
        child: Text(
          label,
          style: TypographyTokens.labelLarge.copyWith(
            color: enabled ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
