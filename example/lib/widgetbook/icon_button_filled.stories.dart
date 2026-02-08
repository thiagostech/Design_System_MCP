import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'IconButtonFilled', type: IconButtonFilled)
Widget iconButtonFilledUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(
    label: 'enabled',
    initialValue: true,
  );
  return Center(
    child: IconButtonFilled(
      icon: Icons.star,
      onPressed: () {},
      enabled: enabled,
    ),
  );
}
