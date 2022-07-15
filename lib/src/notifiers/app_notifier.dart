import 'dart:async';
import 'dart:convert' show jsonDecode;

import 'package:file_system_access/file_system_access.dart';
import 'package:flutter/foundation.dart' as flutter;
import 'package:mobx/mobx.dart';

class Obs<T>
    with
        MutableListenableValue<T>,
        JsonSerde<T>,
        MobxListenable<ChangeNotification<T>> {
  @override
  final String name;
  @override
  final Serde<T> serde;

  @override
  final Observable<T> observable;

  @override
  T tryCastValue(Object value) =>
      value is T ? value : (value as dynamic).cast();

  Obs.fromFn(
    this.name,
    T value, {
    FromJsonFn<T>? fromJson,
    ToJsonFn<T>? toJson,
  })  : serde = Serde(fromJson: fromJson, toJson: toJson),
        observable = Observable(value, name: name);

  Obs(
    this.name,
    T value, {
    this.serde = const Serde(),
  }) : observable = Observable(value, name: name);

  // bool canAssign(dynamic object) => object is T;

  @override
  T get value => observable.value;

  @override
  void set(T newValue) {
    observable.value = newValue;
  }

  @override
  String toString() {
    return 'Obs("$name", $value, listeners:${_listeners.length})';
  }
}

mixin MobxListenable<N> implements flutter.Listenable, Listenable<N> {
  Listenable<N> get observable;

  final Map<void Function(), void Function()> _listeners = {};

  @override
  void addListener(void Function() listener) {
    _listeners[listener] = observable.observe((p0) {
      listener();
    });
  }

  @override
  void removeListener(void Function() listener) {
    _listeners.remove(listener)?.call();
  }

  @override
  Dispose observe(Listener<N> listener, {bool fireImmediately = false}) =>
      observable.observe(
        listener,
        fireImmediately: fireImmediately,
      );
}

// abstract class MobxSerde<T>
//     with MutableListenableValue<T>, JsonSerde<T>, MobxListenable {}

class ObsList<T> extends ObservableList<T>
    with
        MutableListenableValue<List<T>>,
        JsonSerde<List<T>>,
        MobxListenable<ListChange<T>> {
  @override
  final Serde<List<T>> serde;

  ObsList(
    String name, {
    ReactiveContext? context,
    this.serde = const Serde(),
  }) : super(context: context, name: name);

  @override
  Listenable<ListChange<T>> get observable => this;

  @override
  List<T> get value => this;

  @override
  List<T> tryCastValue(Object value) => (value as List).cast();

  @override
  void set(List<T> newValue) {
    runInAction(name: 'set', () {
      clear();
      addAll(newValue);
    });
  }

  @override
  String toString() {
    return 'ObsList<$T>("$name", $value, listeners:${_listeners.length})';
  }
}

class ObsMap<T> extends ObservableMap<String, T>
    with
        MutableListenableValue<Map<String, T>>,
        JsonSerde<Map<String, T>>,
        MobxListenable<MapChange<String, T>> {
  @override
  final Serde<Map<String, T>> serde;

  ObsMap(
    String name, {
    ReactiveContext? context,
    this.serde = const Serde(),
  }) : super(context: context, name: name);

  @override
  Listenable<MapChange<String, T>> get observable => this;

  @override
  Map<String, T> get value => this;

  @override
  Map<String, T> tryCastValue(Object value) => (value as Map).cast();

  @override
  void set(Map<String, T> newValue) {
    runInAction(name: 'set', () {
      clear();
      addAll(newValue);
    });
  }

  @override
  String toString() {
    return 'ObsMap<$T>("$name", $value, listeners:${_listeners.length})';
  }
}

mixin StoreSerde implements ToJson {
  @override
  String get name;

  List<ToJson> get serdeProperties;

  @override
  AsyncOrNot<Map<String, Object?>> toJson() async {
    final entries = await Future.wait(
      serdeProperties.map((e) async {
        final value = await e.toJson();
        return MapEntry(e.name, value);
      }),
    );
    return Map.fromEntries(entries);
  }

  @override
  Future<Result<void Function(), AsyncError>> populateFromJson(
    Object? json,
  ) async {
    final Map<String, Object?> jsonMap;
    try {
      if (json is Map) {
        jsonMap = json.cast();
      } else if (json is String) {
        jsonMap = jsonDecode(json) as Map<String, Object?>;
      } else {
        throw Exception(
          '[populateFromJson] json=$json should be a JSON Map or String',
        );
      }
    } catch (e, s) {
      return Err(AsyncError(e, s));
    }

    final List<void Function()> toAssign = [];

    for (final prop in serdeProperties) {
      // TODO:
      if (prop is _ToJsonConstant) continue;

      final value = jsonMap[prop.name];
      if (value == null) continue;

      // try {
      final parsed = await prop.populateFromJson(value);
      if (parsed.isErr) {
        return parsed;
      }
      toAssign.add(parsed.okOrNull!);
      //   if (prop.isAssignable(parsed)) {
      //     toAssign[prop] = parsed;
      //   } else {
      //     throw Exception(
      //       '[populateFromJson] !isAssignable prop=$prop value=$parsed parsed=$parsed',
      //     );
      //   }
      // } catch (e, s) {
      //   return Err(AsyncError(e, s));
      // }
    }

    return Ok(() {
      // for (final e in toAssign.entries) {
      //   e.key.set(e.value);
      // }
      for (final e in toAssign) {
        e();
      }
    });
  }

  @override
  String toString() {
    return 'StoreSerde("$name", runtimeType: $runtimeType,'
        ' ${serdeProperties.map((e) => '${e.name}:$e').join(', ')})';
  }
}

mixin JsonSerde<T> implements ToJson, MutableValue<T> {
  @override
  String get name;

  Serde<T> get serde;

  T tryCastValue(Object value);

  AsyncOrNot<T> fromJson(Object json) {
    if (serde.fromJson != null) {
      return serde.fromJson!(json);
    } else if (json is AsyncOrNot<T>) {
      return json as AsyncOrNot<T>;
    } else {
      // try {
      return tryCastValue(json);

      // } catch (_) {

      // }
    }
  }

  @override
  AsyncOrNot<Object?> toJson() {
    if (serde.toJson != null) {
      return serde.toJson!(value);
    }
    return value;
  }

  // bool isAssignable(Object? value) => value is T;

  @override
  Future<Result<void Function(), AsyncError>> populateFromJson(
    Object? json,
  ) async {
    try {
      final value = await fromJson(json!);
      return Ok(() => set(value));
    } catch (e, s) {
      return Err(AsyncError(e, s));
    }
  }
}

typedef Nullable<T> = T?;

bool isType<T, O>() => T == O;
bool isTypeOrNull<T, O>() =>
    isType<Nullable<T>, O>() || isType<T, Nullable<O>>() || isType<T, O>();
bool isTypeOrList<T, O>() => isType<T, O>() || isType<T, List<O>>();
bool isTypeOrListOrNull<T, O>() =>
    isTypeOrNull<T, O>() ||
    isTypeOrNull<T, List<O>>() ||
    isTypeOrNull<T, List<Nullable<O>>>();

mixin ToJson {
  String get name;
  AsyncOrNot<Object?> toJson();
  Future<Result<void Function(), AsyncError>> populateFromJson(Object? json);

  static ToJson constant(String name, Object value) =>
      _ToJsonConstant(name, value);
}

class _ToJsonConstant with ToJson {
  @override
  final String name;
  final Object value;

  const _ToJsonConstant(this.name, this.value);

  @override
  Future<Result<void Function(), AsyncError>> populateFromJson(Object? json) {
    throw UnimplementedError();
  }

  @override
  AsyncOrNot<Object?> toJson() {
    return value;
  }
}

abstract class MutableListenableValue<T>
    implements flutter.ValueListenable<T>, MutableValue<T> {}

abstract class MutableValue<T> implements ObservableValue<T> {
  const factory MutableValue(T value, void Function(T) setValue) =
      _MutableValue;

  void set(T newValue);

  @override
  T get value;
}

class _MutableValue<T> implements MutableValue<T> {
  @override
  final T value;
  final void Function(T) _setValue;

  const _MutableValue(this.value, this._setValue);

  @override
  void set(T newValue) => _setValue(newValue);
}

typedef AsyncOrNot<T> = FutureOr<T>;
typedef FromJsonFn<T> = AsyncOrNot<T> Function(Object json);
typedef ToJsonFn<T> = AsyncOrNot<Object?> Function(T? value);

class Serde<T> {
  final FromJsonFn<T>? fromJson;
  final ToJsonFn<T>? toJson;

  const Serde({
    this.fromJson,
    this.toJson,
  });

  static Serde<T> fromStore<T extends StoreSerde>(
    T Function(Object json) create,
  ) {
    return Serde(
      toJson: (value) => value?.toJson(),
      fromJson: (json) async {
        final value = create(json);
        final result = await value.populateFromJson(json);
        final edit = result.unwrap();
        edit();
        return value;
      },
    );
  }

  Serde<L> list<L extends List<T>?>() {
    return Serde(
      fromJson: fromJson == null
          ? null
          : (v) async => (await Future.wait(
                (v as List).map(
                  (e) async => (e == null ? null : await fromJson!(e)) as T,
                ),
              )) as L,
      toJson: toJson == null
          ? null
          : (v) => v == null
              ? null
              : Future.wait(
                  v.map((d) async => toJson!(d)),
                ),
    );
  }

  Serde<L> map<L extends Map<String, T>?>() {
    return Serde(
      fromJson: fromJson == null
          ? null
          : (v) async => Map.fromEntries(await Future.wait(
                (v as Map).entries.map(
                      (e) async => MapEntry(
                        e.key as String,
                        (e.value == null ? null : await fromJson!(e.value))
                            as T,
                      ),
                    ),
              )) as L,
      toJson: toJson == null
          ? null
          : (v) async => v == null
              ? null
              : Map.fromIterables(
                  v.keys,
                  await Future.wait(
                    v.values.map((d) async => toJson!(d)),
                  ),
                ),
    );
  }
}
