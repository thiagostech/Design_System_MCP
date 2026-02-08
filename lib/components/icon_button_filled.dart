import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Filled icon button (Figma 29-1202). Circular, primary container, onPrimary icon. Estados: default, hover, disabled.
/// Tokens: primary, onPrimary, onPrimaryOpacity10, onSurfaceOpacity40, onSurfaceVariant; RadiusTokens.cornerFull; SpacingTokens.gapMedium.
class IconButtonFilled extends StatelessWidget {
  const IconButtonFilled({
    super.key,
    required this.onPressed,
    required this.icon,
    this.enabled = true,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: enabled ? onPressed : null,
        icon: Icon(icon, size: SizeTokens.iconSizeSmall),
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
          shape: const MaterialStatePropertyAll<OutlinedBorder>(CircleBorder()),
          minimumSize: const MaterialStatePropertyAll<Size>(
            Size(
              SizeTokens.iconButtonMinHeightWidth,
              SizeTokens.iconButtonMinHeightWidth,
            ),
          ),
        ),
      ),
    );
  }
}
