import 'package:widgetbook/widgetbook.dart';

import 'main.directories.g.dart';
import 'widgetbook/settings_page.stories.dart' as settings_page_stories;

/// Example pages folder: full screens built with DS components.
WidgetbookFolder get _examplePagesFolder => WidgetbookFolder(
      name: 'Example Pages',
      children: [
        WidgetbookComponent(
          name: 'Settings',
          useCases: [
            WidgetbookUseCase(
              name: 'Settings',
              builder: settings_page_stories.settingsPageUseCase,
            ),
          ],
        ),
      ],
    );

/// Order: Tokens > Components > Example Pages. All names start with capital letter.
List<WidgetbookNode> get widgetbookDirectories => [
      WidgetbookFolder(
        name: 'Tokens',
        children: directories[1].children ?? [],
      ),
      WidgetbookFolder(
        name: 'Components',
        children: directories[0].children ?? [],
      ),
      _examplePagesFolder,
    ];
