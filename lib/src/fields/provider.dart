import 'package:flutter/widgets.dart';

class Provider<T> extends InheritedWidget {
  final T value;

  const Provider({Key? key, required Widget child, required this.value})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Provider<T> oldWidget) {
    return oldWidget.value != value;
  }

  static T of<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider<T>>()!.value;

  static T get<T>(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType<Provider<T>>()!.widget
              as Provider<T>)
          .value;
}
