import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'ListItem', type: ListItem)
Widget listItemUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'title',
    initialValue: 'DS List Item',
  );
  final supportingText = context.knobs.string(
    label: 'supportingText',
    initialValue:
        'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  );
  final enableClick = context.knobs.boolean(
    label: 'enableClick',
    initialValue: true,
  );
  final showLeading = context.knobs.boolean(
    label: 'showLeading',
    initialValue: true,
  );
  final showTrailing = context.knobs.boolean(
    label: 'showTrailing',
    initialValue: true,
  );
  const alignmentOptions = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
  ];
  final rowAlignment = context.knobs.object.dropdown(
    label: 'rowAlignment',
    options: alignmentOptions,
    labelBuilder: (a) => a == CrossAxisAlignment.start ? 'start' : 'center',
  ) ?? CrossAxisAlignment.center;
  final showDivider = context.knobs.boolean(
    label: 'showDivider',
    initialValue: false,
  );
  return Center(
    child: ListItem(
      title: title,
      supportingText: supportingText,
      onTap: enableClick ? () {} : null,
      leadingIcon: showLeading ? Icons.person_outline : null,
      trailingIcon: showTrailing ? Icons.chevron_right : null,
      rowAlignment: rowAlignment,
      showDivider: showDivider,
    ),
  );
}
