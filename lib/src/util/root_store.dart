import 'package:flutter/widgets.dart';
import 'package:task_voting/src/fields/provider.dart';
import 'package:task_voting/src/util/disposable.dart';

class RootStore {
  final Map<Ref, Object> _refs = {};
  final Map<Type, Object> _values = {};

  void registerGlobal<T extends Object>(T value) {
    _values[T] = value;
  }

  T getGlobal<T extends Object>() {
    return _values[T] as T;
  }

  T ref<T extends Disposable>(Ref<T> reference) {
    if (reference.reCreate) return reference.create(this);

    Object? value = _refs[reference];
    if (value is T) {
      return value;
    }
    value = reference.create(this);
    value.disposer.onDispose(() {
      _refs.remove(reference);
    });
    _refs[reference] = value;
    return value;
  }

  static RootStore of(BuildContext context) => Provider.get(context);
  // static T read<T extends Object>(BuildContext context) =>
  //     RootStore.of(context).get<T>();
}

class Ref<T extends Disposable> {
  final T Function(RootStore) create;
  final bool reCreate;

  const Ref(
    this.create, {
    required this.reCreate,
  });
}

extension RootStoreRef on BuildContext {
  T ref<T extends Disposable>(Ref<T> reference) =>
      RootStore.of(this).ref(reference);
}
