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
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: enabled ? onPressed : null,
        icon: Icon(
          icon,
          size: SizeTokens.iconSizeSmall,
          color: enabled
              ? colorScheme.onPrimary
              : colorScheme.onSurfaceVariant,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.onSurface.withOpacity(0.12);
            }
            return colorScheme.primary;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.onSurfaceVariant;
            }
            return colorScheme.onPrimary;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.pressed)) {
              return colorScheme.onPrimary.withOpacity(0.08);
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
