import 'package:api_client/api/__generated__/poll.data.gql.dart';
import 'package:api_client/api/__generated__/poll.req.gql.dart';
import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  Locale? _locale;

  Locale? get locale => _locale;

  String? _refreshToken;
  String? get refreshToken => _refreshToken;

  ApiClient? _apiClient;
  GFullUser? _user;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _locale = await _settingsService.locale();
    _refreshToken = await _settingsService.refreshToken();
    const backendHost = String.fromEnvironment('BACKEND_HOST');
    if (backendHost.isNotEmpty) {
      final client = makeClient(
        url: backendHost,
        getAuthHeader: () => _refreshToken,
      );
      _apiClient = client;
      if (_refreshToken != null) {
        final getUserResponse =
            await client.requestNoCache(GgetUserReq((u) => u.vars..name = ''));
      }

      final registerUserResponse = await client
          .requestNoCache(GregisterUserReq((u) => u.vars..name = ''));
      final registerUser = registerUserResponse.data?.registerUser;

      if (registerUser == null) {
        throw (registerUserResponse.linkException ??
            registerUserResponse.graphqlErrors)!;
      }
      await updateRefreshToken(registerUser.refreshToken);
    }
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.themeMode.set(newThemeMode);
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == _locale) return;
    _locale = newLocale;
    notifyListeners();
    await _settingsService.locale.set(newLocale);
  }

  Future<void> updateRefreshToken(String? refreshToken) async {
    if (refreshToken == _refreshToken) return;
    _refreshToken = refreshToken;
    notifyListeners();
    await _settingsService.refreshToken.set(refreshToken);
  }
}
