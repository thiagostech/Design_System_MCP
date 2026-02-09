import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:design_system_mcp_test/design_system_mcp_test.dart';

/// Settings page (Figma 28-56). TopBar with back, title, supporting text; list: Idioma, Thema, Senha.
@widgetbook.UseCase(name: 'Settings', type: SettingsPage)
Widget settingsPageUseCase(BuildContext context) {
  return const SettingsPage();
}

/// Settings screen (Figma 28-56) for Widgetbook example pages.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TopBar(
            leadingIcon: Icons.arrow_back,
            title: 'Settings',
            supportingText:
                'Gerencie idioma, aparência e segurança da sua conta.',
            variant: TopBarVariant.large,
            onLeadingTap: () {},
          ),
          const SizedBox(height: GapTokens.gapExtraLarge),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListItem(
                    title: 'Idioma',
                    supportingText:
                        'Escolha o idioma de exibição do aplicativo.',
                    leadingIcon: Icons.language,
                    trailingIcon: Icons.chevron_right,
                    showDivider: true,
                    onTap: () {},
                  ),
                  ListItem(
                    title: 'Thema',
                    supportingText:
                        'Altere entre tema claro e escuro.',
                    leadingIcon: Icons.palette_outlined,
                    trailingIcon: Icons.chevron_right,
                    showDivider: true,
                    onTap: () {},
                  ),
                  ListItem(
                    title: 'Senha',
                    supportingText:
                        'Verifique ou altere sua senha de acesso.',
                    leadingIcon: Icons.lock_outline,
                    trailingIcon: Icons.chevron_right,
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
