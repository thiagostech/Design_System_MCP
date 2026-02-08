import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'OutlinedButton', type: ButtonOutlined)
Widget outlinedButtonUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(
    label: 'enabled',
    initialValue: true,
  );
  final label = context.knobs.string(
    label: 'label',
    initialValue: 'Label',
  );
  return Center(
    child: ButtonOutlined(
      onPressed: () {},
      label: label,
      enabled: enabled,
    ),
  );
}
