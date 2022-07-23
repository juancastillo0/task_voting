import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:task_voting/src/fields/provider.dart';
import 'package:task_voting/src/util/root_store.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  setHashUrlStrategy();
  mainContext.config = ReactiveConfig(
    writePolicy: ReactiveWritePolicy.never,
  );
  final prev = debugPrint;
  debugPrint = (message, {wrapWidth}) {
    if (message != null &&
        message.startsWith('No observables detected in the build method of')) {
      return;
    }
    prev(message, wrapWidth: wrapWidth);
  };

  final rootStore = RootStore();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  await Hive.initFlutter();
  final settingsService = SettingsService();
  await settingsService.setUp();

  final settingsController = SettingsController(settingsService);

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  rootStore.registerGlobal(settingsService);
  rootStore.registerGlobal(settingsController);

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    Provider(
      value: rootStore,
      child: const MyApp(),
    ),
  );
}
