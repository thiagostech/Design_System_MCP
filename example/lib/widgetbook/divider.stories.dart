import 'package:flutter/material.dart' hide Divider;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'Divider', type: Divider)
Widget dividerUseCase(BuildContext context) {
  final direction = context.knobs.object.dropdown<Axis>(
    label: 'Direction',
    options: [Axis.horizontal, Axis.vertical],
    labelBuilder: (a) => a == Axis.horizontal ? 'Horizontal' : 'Vertical',
  ) ?? Axis.horizontal;

  final type = context.knobs.object.dropdown<DividerType>(
    label: 'Type',
    options: [
      DividerType.full,
      DividerType.inset,
      DividerType.middleInset,
    ],
    labelBuilder: (t) {
      switch (t) {
        case DividerType.full:
          return 'Full';
        case DividerType.inset:
          return 'Inset';
        case DividerType.middleInset:
          return 'Middle-inset';
      }
    },
  ) ?? DividerType.full;

  final divider = Divider(
    direction: direction,
    type: type,
  );
  return Center(
    child: direction == Axis.horizontal
        ? SizedBox(width: double.infinity, child: divider)
        : SizedBox(height: double.infinity, child: divider),
  );
}
