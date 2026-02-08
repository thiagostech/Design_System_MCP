import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Filled button (Figma 2-222). Estados: default, hover, disabled.
/// Tokens: ColorTokens.primary, onPrimary, onSurfaceOpacity40, onSurfaceVariant, onPrimaryOpacity10;
/// SpacingTokens.gapLarge, gapMedium; RadiusTokens.cornerFull; TypographyTokens.labelLarge.
class ButtonFilled extends StatelessWidget {
  const ButtonFilled({
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
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorTokens.onSurfaceOpacity40;
            }
            return ColorTokens.primary;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorTokens.onSurfaceVariant;
            }
            return ColorTokens.onPrimary;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return ColorTokens.onPrimaryOpacity10;
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
          elevation: const MaterialStatePropertyAll<double>(0),
        ),
        child: Text(
          label,
          style: TypographyTokens.labelLarge,
        ),
      ),
    );
  }
}
