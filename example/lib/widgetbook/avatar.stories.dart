import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'Avatar', type: Avatar)
Widget avatarUseCase(BuildContext context) {
  final variant = context.knobs.object.dropdown<String>(
    label: 'Variant',
    options: ['Icon', 'Image', 'Text'],
    labelBuilder: (v) => v,
  ) ?? 'Icon';

  final size = context.knobs.object.dropdown<double>(
    label: 'Size',
    options: [SizeTokens.avatarSmall, SizeTokens.avatarMedium],
    labelBuilder: (s) => s == SizeTokens.avatarSmall ? 'Small (40)' : 'Medium (56)',
  ) ?? SizeTokens.avatarSmall;

  if (variant == 'Image') {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(size * 0.15),
          child: const FittedBox(
            fit: BoxFit.contain,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
  if (variant == 'Text') {
    return Center(
      child: Avatar.text(text: 'A', size: size),
    );
  }
  return Center(
    child: Avatar.icon(icon: Icons.person, size: size),
  );
}
