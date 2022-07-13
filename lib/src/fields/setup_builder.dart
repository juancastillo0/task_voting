import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SetUpBuilder<T> extends StatefulObserverWidget {
  const SetUpBuilder({
    Key? key,
    required this.create,
    required this.builder,
    required this.dispose,
  }) : super(key: key);

  final T Function() create;
  final Widget Function(BuildContext context, T value) builder;
  final void Function(T value) dispose;

  @override
  State<SetUpBuilder<T>> createState() => _SetUpBuilderState<T>();
}

class _SetUpBuilderState<T> extends State<SetUpBuilder<T>> {
  late final T value;
  @override
  void initState() {
    value = widget.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}
