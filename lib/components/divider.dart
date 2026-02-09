import 'package:flutter/material.dart';
import '../tokens/tokens.dart';

/// Tipo do Divider (Figma 34-186): largura/altura da linha.
enum DividerType {
  /// Linha ocupa toda a largura (horizontal) ou altura (vertical).
  full,

  /// Linha com recuo apenas no início (leading).
  inset,

  /// Linha com recuo em ambos os lados (centralizada).
  middleInset,
}

/// Divider (Figma 34-186). Linha horizontal ou vertical com ColorTokens.outlineVariant.
/// Tokens: outlineVariant; GapTokens.gapLarge (insets para type inset/middleInset).
class Divider extends StatelessWidget {
  const Divider({
    super.key,
    this.direction = Axis.horizontal,
    this.type = DividerType.full,
  });

  /// Direção da linha: horizontal ou vertical.
  final Axis direction;

  /// Tipo: full-width, inset (recuo no início) ou middle-inset (recuo nos dois lados).
  final DividerType type;

  static const double _inset = GapTokens.gapLarge;
  static const double _lineSize = 1;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.outlineVariant;
    return direction == Axis.horizontal
        ? _buildHorizontal(color)
        : _buildVertical(color);
  }

  Widget _buildHorizontal(Color color) {
    final line = Container(
      height: _lineSize,
      color: color,
    );
    switch (type) {
      case DividerType.full:
        return SizedBox(width: double.infinity, child: line);
      case DividerType.inset:
        return Row(
          children: [
            const SizedBox(width: _inset),
            Expanded(child: line),
          ],
        );
      case DividerType.middleInset:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: _inset),
          child: SizedBox(width: double.infinity, child: line),
        );
    }
  }

  Widget _buildVertical(Color color) {
    final line = Container(
      width: _lineSize,
      color: color,
    );
    switch (type) {
      case DividerType.full:
        return SizedBox(height: double.infinity, child: line);
      case DividerType.inset:
        return Column(
          children: [
            const SizedBox(height: _inset),
            Expanded(child: line),
          ],
        );
      case DividerType.middleInset:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: _inset),
          child: SizedBox(height: double.infinity, child: line),
        );
    }
  }
}
