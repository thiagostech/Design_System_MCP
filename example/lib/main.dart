import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

// Gerado por: dart run build_runner build --delete-conflicting-outputs
import 'main.directories.g.dart';
import 'widgetbook/widgetbook_home.dart';
import 'widgetbook_directories.dart';

void main() {
  runApp(const DesignSystemWidgetbookApp());
}

@widgetbook.App()
class DesignSystemWidgetbookApp extends StatelessWidget {
  const DesignSystemWidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: widgetbookDirectories,
      home: const WidgetbookHome(),
      integrations: const [],
      addons: [
        ViewportAddon(
          [
            IosViewports.iPhone13,
            Viewports.none,
            IosViewports.iPhoneSE,
            IosViewports.iPhone13ProMax,
            AndroidViewports.samsungGalaxyNote20,
            MacosViewports.macbookPro,
          ],
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: AppTheme.light),
            WidgetbookTheme(name: 'Dark', data: AppTheme.dark),
          ],
        ),
      ],
    );
  }
}
