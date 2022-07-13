import 'package:meta/meta.dart';

class Disposer implements Disposable {
  List<void Function()> _disposeCallbacks = [];
  bool isDisposed = false;

  void onDispose(void Function() callback) {
    _disposeCallbacks.add(callback);
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
