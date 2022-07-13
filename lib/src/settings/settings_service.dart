import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:task_voting/src/fields/prelude.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  static late final LazyBox<Map> box;

  Future<void> setUp() async {
    Hive.registerAdapter<Map>(_JsonAdapter(typeId: 1));
    box = await Hive.openLazyBox('MainBox');
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  final themeMode = HiveKey<ThemeMode>(
    'themeMode',
    (json) => json == null ||
            ThemeMode.values.every((e) => e.name != json['themeMode'])
        ? ThemeMode.system
        : ThemeMode.values.byName(json['themeMode'] as String),
    (v) => {'themeMode': v.name},
  );

  final locale = HiveKey<Locale>(
    'locale',
    (json) => json == null ||
            AppLocalizations.supportedLocales.every(
              (l) =>
                  l.languageCode != (json['languageCode'] as String) ||
                  l.countryCode != (json['countryCode'] as String?),
            )
        ? const Locale('en', null)
        : Locale(
            json['languageCode'] as String,
            json['countryCode'] as String?,
          ),
    (v) => {'languageCode': v.languageCode, 'countryCode': v.countryCode},
  );
}

class _JsonAdapter extends TypeAdapter<Map<String, Object?>> {
  _JsonAdapter({required this.typeId});

  @override
  final int typeId;

  @override
  Map<String, Object?> read(BinaryReader reader) {
    final jsonString = reader.readString();
    final json = jsonDecode(jsonString);
    return (json as Map).cast();
  }

  @override
  void write(BinaryWriter writer, Map<String, Object?> json) {
    final jsonString = jsonEncode(json);
    writer.writeString(jsonString);
  }
}

class HiveKey<T> {
  final String key;
  final T Function(Map<String, Object?>?) fromJson;
  final Map<String, Object?> Function(T) toJson;

  HiveKey(this.key, this.fromJson, this.toJson);

  Future<T> call() => get();

  Future<T> get() async {
    final value = await SettingsService.box.get(key);
    return fromJson(value?.cast());
  }

  Future<Map<String, Object?>> set(T value) async {
    final json = toJson(value);
    await SettingsService.box.put(key, json);
    return json;
  }
}
