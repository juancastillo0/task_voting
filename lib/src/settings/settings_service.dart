import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:file_system_access/file_system_access.dart';
import 'package:hive/hive.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';

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
    Hive.registerAdapter<MapWrapper>(_JsonAdapter(typeId: 2));
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

class MapWrapper {
  final Map<String, Object?> map;

  const MapWrapper(this.map);
}

class _JsonAdapter extends TypeAdapter<MapWrapper> {
  _JsonAdapter({required this.typeId});

  @override
  final int typeId;

  @override
  MapWrapper read(BinaryReader reader) {
    Map json;
    try {
      final jsonString = reader.readString();
      json = jsonDecode(jsonString);
    } catch (_) {
      final map = reader.readMap();
      json = jsonDecode(jsonEncode(map));
    }
    return MapWrapper(json.cast());
  }

  @override
  void write(BinaryWriter writer, MapWrapper json) {
    final jsonString = jsonEncode(json.map);
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
          throw err;
        },
      );
      return store;
    },
    (value) async => value.toJson(),
  );

  static final tasksStoreCollection = HiveCollectionKey<TasksStore>._(
    'task_voting_TasksStoreBox',
    (json, {required valueToEdit}) async {
      final store = TasksStore.fromJson(json);
      // TODO: don't require valueToEdit
      store.root = valueToEdit.root;
      return store;
    },
    (value) async => value.toJson(),
  );

  Future<LazyBox> _getBox() => Hive.openLazyBox(boxName);

  Future<T?> get(String key, {required T valueToEdit}) async {
    final box = await _getBox();
    final value = await box.get(key);
    if (value == null) return null;
    final json =
        jsonDecode(jsonEncode(value is MapWrapper ? value.map : value));
    return fromJson(json, valueToEdit: valueToEdit);
  }

  Future<Map<String, Object?>> set(String key, T value) async {
    final box = await _getBox();
    final json = await toJson(value);
    // TODO: dont jsonDecode(jsonEncode()
    final jsonCast = jsonDecode(jsonEncode(json)) as Map;
    await box.put(key, MapWrapper(jsonCast.cast()));
    return json;
  }

  Future<List<String>> keys() async {
    final box = await _getBox();
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
