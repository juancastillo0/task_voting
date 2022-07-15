import 'package:task_voting/src/fields/prelude.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    const itemPadding = EdgeInsets.only(top: 10, left: 24, right: 24);
    const titleWidth = 160.0;

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
                DropdownButton<Locale>(
                  value: controller.locale,
                  onChanged: (v) => controller.updateLocale(v!),
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English (en)'),
                    ),
                    DropdownMenuItem(
                      value: Locale('es'),
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
  }
}
