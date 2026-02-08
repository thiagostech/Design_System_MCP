import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Outlined icon button (Figma 29-1189). Circular, outline border, onSurfaceVariant icon. Estados: default, hover, disabled.
/// Tokens: outline, onSurfaceVariant, onSurfaceOpacity10, onSurfaceOpacity40; RadiusTokens.cornerFull; SpacingTokens.gapMedium.
class IconButtonOutlined extends StatelessWidget {
  const IconButtonOutlined({
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
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: enabled ? onPressed : null,
        icon: Icon(
          icon,
          size: SizeTokens.iconSizeSmall,
          color: colorScheme.onSurfaceVariant,
        ),
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
            return colorScheme.onSurfaceVariant;
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
