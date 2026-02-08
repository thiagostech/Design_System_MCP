import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'TitleList', type: TitleList)
Widget titleListUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'title',
    initialValue: 'List item',
  );
  final supportingText = context.knobs.string(
    label: 'supportingText',
    initialValue:
        'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  );
  return Center(
    child: TitleList(
      title: title,
      supportingText: supportingText,
    ),
  );
}
