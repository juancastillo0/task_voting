import 'package:task_voting/src/fields/prelude.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessObserverWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootStore = RootStore.of(context);
    final controller = rootStore.getGlobal<SettingsController>();
    final loc = AppLocalizations.of(context)!;
    const itemPadding = EdgeInsets.only(top: 10, left: 24, right: 24);
    const titleWidth = 160.0;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(loc.settingsPageTitle),
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: itemPadding,
                // Glue the SettingsController to the theme selection DropdownButton.
                //
                // When a user selects a theme from the dropdown list, the
                // SettingsController is updated, which rebuilds the MaterialApp.
                child: Row(
                  children: [
                    SizedBox(
                      width: titleWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(loc.settingsColorTheme),
                      ),
                    ),
                    DropdownButton<ThemeMode>(
                      // Read the selected themeMode from the controller
                      value: controller.themeMode,
                      // Call the updateThemeMode method any time the user selects a theme.
                      onChanged: controller.updateThemeMode,
                      items: [
                        DropdownMenuItem(
                          value: ThemeMode.system,
                          child: Text(loc.settingsSystemTheme),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text(loc.settingsLightTheme),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text(loc.settingsDarkTheme),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: itemPadding,
                child: Row(
                  children: [
                    SizedBox(
                      width: titleWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(loc.settingsLanguage),
                      ),
                    ),
                    DropdownButton<String>(
                      value: controller.locale?.languageCode,
                      onChanged: (s) =>
                          controller.updateLocale(s == null ? null : Locale(s)),
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text(loc.settingsSystemLocale),
                        ),
                        const DropdownMenuItem(
                          value: 'en',
                          child: Text('English (en)'),
                        ),
                        const DropdownMenuItem(
                          value: 'es',
                          child: Text('Español (es)'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
