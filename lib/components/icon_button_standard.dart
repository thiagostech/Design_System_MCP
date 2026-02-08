import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Icon button standard (Figma 29-1187). Circular, transparent container, onSurfaceVariant icon. Estados: default, hover, disabled.
/// Tokens: onSurfaceVariant, onSurfaceOpacity10, onSurfaceOpacity40; RadiusTokens.cornerFull; SpacingTokens.gapMedium; SizeTokens.
class IconButtonStandard extends StatelessWidget {
  const IconButtonStandard({
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
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorTokens.onSurfaceVariant;
            }
            return ColorTokens.onSurfaceVariant;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return ColorTokens.onSurfaceOpacity10;
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
