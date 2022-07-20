import 'dart:async';

import 'package:flutter/widgets.dart' show State, StatefulWidget;
import 'package:meta/meta.dart';

class Disposer implements Disposable {
  List<void Function()> _disposeCallbacks = [];
  bool isDisposed = false;

  void Function() onDispose(void Function() callback) {
    _disposeCallbacks.add(callback);
    return () {
      _disposeCallbacks.remove(callback);
    };
  }

  @override
  Disposer get disposer => this;

  @override
  void dispose() {
    if (isDisposed) return;
    isDisposed = true;
    while (_disposeCallbacks.isNotEmpty) {
      final prev = _disposeCallbacks;
      _disposeCallbacks = [];
      for (final c in prev) {
        c();
      }
    }
  }
}

mixin Disposable {
  final disposer = Disposer();

  @mustCallSuper
  void dispose() {
    disposer.dispose();
  }
}

mixin DisposableWithSetUp implements Disposable {
  @override
  final disposer = Disposer();

  @override
  @mustCallSuper
  void dispose() {
    disposer.dispose();
  }

  final __setUpCompleter = Completer();
  bool __isSettingUp = false;
  bool get isSetUp => __setUpCompleter.isCompleted;

  Future<void> setUp() async {
    if (__isSettingUp || isSetUp) return __setUpCompleter.future;
    __isSettingUp = true;
    try {
      await performSetUp();
    } finally {
      __isSettingUp = false;
      __setUpCompleter.complete();
    }
  }

  @protected
  Future<void> performSetUp();
}

mixin DisposableState<T extends StatefulWidget> on State<T>
    implements Disposable {
  @override
  final disposer = Disposer();

  @override
  void dispose() {
    disposer.dispose();
    super.dispose();
  }
}
