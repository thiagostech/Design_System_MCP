import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Avatar (Figma 35-125). Círculo com conteúdo: ícone, imagem ou inicial (texto).
/// Tokens: primaryContainer, onPrimaryContainer; surfaceVariant (fallback imagem); SizeTokens.avatarSmall/avatarMedium; TypographyTokens.
class Avatar extends StatelessWidget {
  const Avatar._({
    super.key,
    required this.size,
    this.icon,
    this.image,
    this.text,
  }) : assert(
         (icon != null && image == null && text == null) ||
             (icon == null && image != null && text == null) ||
             (icon == null && image == null && text != null),
         'Exactly one of icon, image, or text must be provided.',
       );

  /// Avatar com ícone (ex.: silhueta de pessoa). Fundo primaryContainer, ícone onPrimaryContainer.
  factory Avatar.icon({
    Key? key,
    required IconData icon,
    double? size,
  }) =>
      Avatar._(key: key, size: size ?? SizeTokens.avatarSmall, icon: icon);

  /// Avatar com imagem. Preenche o círculo; fundo surfaceVariant se imagem não carregar.
  factory Avatar.image({
    Key? key,
    required ImageProvider image,
    double? size,
  }) =>
      Avatar._(key: key, size: size ?? SizeTokens.avatarMedium, image: image);

  /// Avatar com inicial (ex.: letra "A"). Fundo primaryContainer, texto onPrimaryContainer.
  factory Avatar.text({
    Key? key,
    required String text,
    double? size,
  }) =>
      Avatar._(key: key, size: size ?? SizeTokens.avatarSmall, text: text);

  final double size;
  final IconData? icon;
  final ImageProvider? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: image != null ? ColorTokens.surfaceVariant : ColorTokens.primaryContainer,
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: image != null
          ? null
          : icon != null
              ? Icon(
                  icon,
                  size: size * 0.5,
                  color: ColorTokens.onPrimaryContainer,
                )
              : text != null
                  ? Center(
                      child: Text(
                        text!.length > 2 ? text!.substring(0, 2) : text!,
                        style: TypographyTokens.titleLarge.copyWith(
                          color: ColorTokens.onPrimaryContainer,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  : null,
    );
  }
}
