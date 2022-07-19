import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:file_system_access/file_system_access.dart';
import 'package:hive/hive.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/sample_feature/sample_item.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  // TODO: make them not static maybe use RootStore
  static late final LazyBox<Map> box;
  static late final FileSystemPersistance? webFilePersistence;

  Future<void> setUp() async {
    Hive.registerAdapter<Map>(_JsonAdapter(typeId: 1));
    box = await Hive.openLazyBox('task_voting_MainBox');

    try {
      webFilePersistence = await FileSystem.instance.getPersistance(
        databaseName: 'task_voting_FilesDB',
        objectStoreName: 'task_voting_FilesObjectStore',
      );
    } catch (_) {
      webFilePersistence = null;
    }
  }

  /// Loads the User's preferred ThemeMode from local or remote storage.
  final themeMode = HiveKey<ThemeMode>._(
    'themeMode',
    (json) => json == null ||
            ThemeMode.values.every((e) => e.name != json['themeMode'])
        ? ThemeMode.system
        : ThemeMode.values.byName(json['themeMode'] as String),
    (v) => {'themeMode': v.name},
  );

  final locale = HiveKey<Locale?>._(
    'locale',
    (json) => json == null ||
            AppLocalizations.supportedLocales.every(
              (l) =>
                  l.languageCode != (json['languageCode'] as String?) ||
                  l.countryCode != (json['countryCode'] as String?),
            )
        ? null
        : Locale(
            json['languageCode'] as String,
            json['countryCode'] as String?,
          ),
    (v) => {'languageCode': v?.languageCode, 'countryCode': v?.countryCode},
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

  HiveKey._(this.key, this.fromJson, this.toJson);

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

class HiveCollectionKey<T> {
  final String boxName;
  final Future<T> Function(
    Map<String, Object?>, {
    required T valueToEdit,
  }) fromJson;
  final Future<Map<String, Object?>> Function(T) toJson;

  HiveCollectionKey._(this.boxName, this.fromJson, this.toJson);

  static final choicesStoreCollection = HiveCollectionKey<ChoicesStore>._(
    'task_voting_ChoicesStoreBox',
    (json, {required valueToEdit}) async {
      final store = valueToEdit;
      final result = await store.populateFromJson(json);
      result.when<void>(
        ok: (ok) => ok(),
        err: (err) {
          store.dispose();

          throw err;
        },
      );
      return store;
    },
    (value) async => value.toJson(),
  );

  Future<T?> get(String key, {required T valueToEdit}) async {
    final box = await Hive.openLazyBox<Map>(boxName);
    final value = await box.get(key);
    if (value == null) return null;
    return fromJson(value.cast(), valueToEdit: valueToEdit);
  }

  Future<Map<String, Object?>> set(String key, T value) async {
    final box = await Hive.openLazyBox<Map>(boxName);
    final json = await toJson(value);
    await box.put(key, json);
    return json;
  }

  Future<List<String>> keys() async {
    final box = await Hive.openLazyBox<Map>(boxName);
    return box.keys.cast<String>().toList();
  }

  // Future<List<T>> getAll() async {
  //   final box = await Hive.openLazyBox<Map>(boxName);
  //   final value = await Future.wait(
  //     box.keys.map(
  //       (key) async {
  //         final map = await box.get(key);
  //         return fromJson(map!.cast());
  //       },
  //     ),
  //   );

  //   return value;
  // }
}
