import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

@widgetbook.UseCase(name: 'TopBar', type: TopBar)
Widget topBarUseCase(BuildContext context) {
  final variant = context.knobs.object.dropdown(
    label: 'variant',
    options: TopBarVariant.values,
    labelBuilder: (v) => v!.name,
  ) ?? TopBarVariant.compact;
  final title = context.knobs.string(
    label: 'title',
    initialValue: 'Label',
  );
  final showSupportingText = context.knobs.boolean(
    label: 'showSupportingText',
    initialValue: false,
  );
  final supportingText = context.knobs.string(
    label: 'supportingText',
    initialValue: 'Supporting line text lorem ipsum dolor sit amet, consectetur.',
  );
  final showLeading = context.knobs.boolean(
    label: 'showLeading',
    initialValue: true,
  );
  final showTrailing = context.knobs.boolean(
    label: 'showTrailing',
    initialValue: true,
  );
  return TopBar(
    leadingIcon: Icons.arrow_back,
    title: title,
    supportingText: showSupportingText ? supportingText : null,
    trailingIcon: Icons.more_vert,
    variant: variant,
    showLeading: showLeading,
    showTrailing: showTrailing,
    onLeadingTap: () {},
    onTrailingTap: () {},
  );
}
