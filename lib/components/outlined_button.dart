import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Outlined button (Figma 2-493). Estados: default, hover, disabled.
/// Tokens: ColorTokens.outline, onSurface, onSurfaceOpacity10, onSurfaceOpacity40, onSurfaceVariant;
/// SpacingTokens.gapLarge, gapMedium; RadiusTokens.cornerFull; TypographyTokens.labelLarge.
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
    return Material(
      color: Colors.transparent,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorTokens.onSurfaceOpacity40;
            }
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorTokens.onSurfaceVariant;
            }
            return ColorTokens.onSurface;
          }),
          side: MaterialStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(MaterialState.disabled)) {
              return const BorderSide(
                color: ColorTokens.onSurfaceOpacity40,
                width: 1,
              );
            }
            return const BorderSide(
              color: ColorTokens.outline,
              width: 1,
            );
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return ColorTokens.onSurfaceOpacity10;
            }
            return Colors.transparent;
          }),
          padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              horizontal: SpacingTokens.gapLarge,
              vertical: SpacingTokens.gapLarge,
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
          style: TypographyTokens.labelLarge,
        ),
      ),
    );
  }
}
