import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

class Obs<T> with MutableListenableValue<T> {
  final String name;
  final FromJsonFn<T>? fromJson;
  final ToJsonFn<T>? _toJson;

  AsyncOrNot<Object?> toJson() => _toJson == null ? value : _toJson!(value);

  final Observable<T> _observable;
  final Map<VoidCallback, VoidCallback> _listeners = {};

  Obs(
    this.name,
    T value, {
    this.fromJson,
    ToJsonFn<T>? toJson,
  })  : _toJson = toJson,
        _observable = Observable(value);

  Obs.fromSerde(
    this.name,
    T value, {
    required Serde<T> serde,
  })  : fromJson = serde.fromJson,
        _toJson = serde.toJson,
        _observable = Observable(value);

  bool canAssign(dynamic object) => object is T;

  @override
  void addListener(VoidCallback listener) {
    _listeners[listener] = _observable.observe((p0) {
      listener();
    });
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener)?.call();
  }

  @override
  T get value => _observable.value;

  @override
  void set(T newValue) {
    _observable.value = newValue;
  }
}

abstract class MutableListenableValue<T>
    implements ValueListenable<T>, MutableValue<T> {}

abstract class MutableValue<T> implements ObservableValue<T> {
  factory MutableValue(T value, void Function(T) setValue) = _MutableValue;

  void set(T newValue);
}

class _MutableValue<T> implements MutableValue<T> {
  @override
  final T value;
  final void Function(T) _setValue;

  _MutableValue(this.value, this._setValue);

  @override
  void set(T newValue) => _setValue(newValue);
}

typedef AsyncOrNot<T> = FutureOr<T>;
typedef FromJsonFn<T> = AsyncOrNot<T> Function(Object);
typedef ToJsonFn<T> = AsyncOrNot<Object?> Function(T);

class Serde<T> {
  final FromJsonFn<T>? fromJson;
  final ToJsonFn<T>? toJson;

  const Serde({
    this.fromJson,
    this.toJson,
  });

  Serde<L> list<L extends List<T>?>() {
    return Serde(
      fromJson: fromJson == null
          ? null
          : (v) => Future.wait(
                (v as List).map(
                  (e) async =>
                      (e == null ? null : fromJson!(e)) as AsyncOrNot<T>,
                ),
              ) as Future<L>,
      toJson: toJson == null
          ? null
          : (v) => v == null
              ? null
              : Future.wait(
                  v.map((d) async => toJson!(d)),
                ),
    );
  }
}
