import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_voting/src/notifiers/app_notifier.dart';

mixin TextInputParser<T> {
  static TextInputParser<T> value<T>({
    required String Function(T value) asString,
    required T? Function(String value) fromString,
  }) =>
      _TextInputParser(
        asString: asString,
        fromString: fromString,
      );

  static final intParser = TextInputParser.value(
    asString: (i) => i.toString(),
    fromString: int.tryParse,
  );
  static final doubleParser = TextInputParser.value(
    asString: (i) => i.toString(),
    fromString: double.tryParse,
  );
  static final numParser = TextInputParser.value(
    asString: (i) => i.toString(),
    fromString: num.tryParse,
  );
  static final stringParser = TextInputParser.value(
    asString: (i) => i,
    fromString: (s) => s,
  );

  String asString(T value);
  T? fromString(String value);
}

class _TextInputParser<T> with TextInputParser<T> {
  final String Function(T value) _asString;
  @override
  String asString(T value) => _asString(value);

  final T? Function(String value) _fromString;
  @override
  T? fromString(String value) => _fromString(value);

  _TextInputParser({
    required String Function(T value) asString,
    required T? Function(String value) fromString,
  })  : _asString = asString,
        _fromString = fromString;
}

class ObsTextInput<T> extends StatefulObserverWidget {
  const ObsTextInput({
    Key? key,
    required this.obs,
    required this.parser,
    this.textField = const TextField(),
  }) : super(key: key);

  final MutableValue<T?> obs;
  final TextInputParser<T> parser;
  final TextField textField;

  @override
  State<ObsTextInput<T>> createState() => _ObsTextInputState<T>();
}

class _ObsTextInputState<T> extends State<ObsTextInput<T>> {
  final _controller = TextEditingController();

  TextEditingController get controller =>
      widget.textField.controller ?? _controller;

  String? prevString;
  T? parsedValue;

  @override
  void initState() {
    super.initState();
    final value = widget.obs.value;
    if (value != null) {
      controller.text = widget.parser.asString(value);
      parsedValue = value;
    }

    controller.addListener(_onChange);
    handleMutValueChange(null);
  }

  @override
  void didUpdateWidget(covariant ObsTextInput<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final prev = oldWidget.textField.controller ?? _controller;
    if (prev != controller) {
      prev.removeListener(_onChange);
      controller.addListener(_onChange);
      controller.text = prev.text;
    }
    handleMutValueChange(oldWidget.obs);
  }

  void handleMutValueChange(MutableValue<T?>? prev) {
    final obs = widget.obs;
    if (prev == obs) return;
    if (prev is MutableListenableValue<T?>) {
      prev.removeListener(_onValueChanged);
    }
    if (obs is MutableListenableValue<T?>) {
      obs.addListener(_onValueChanged);
    }
  }

  void _onValueChanged() {
    final value = widget.obs.value;
    if (value != parsedValue && value != null) {
      controller.text = widget.parser.asString(value);
    }
  }

  void _onChange() {
    if (prevString == controller.text) return;
    prevString = controller.text;
    final value = widget.parser.fromString(controller.text);
    parsedValue = value;
    if (value != null) {
      widget.obs.set(value);
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onChange);
    _controller.dispose();
    final obs = widget.obs;
    if (obs is MutableListenableValue<T?>) {
      obs.removeListener(_onValueChanged);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: widget.textField.focusNode,
      decoration: widget.textField.decoration,
      keyboardType: widget.textField.keyboardType,
      textInputAction: widget.textField.textInputAction,
      textCapitalization: widget.textField.textCapitalization,
      style: widget.textField.style,
      strutStyle: widget.textField.strutStyle,
      textAlign: widget.textField.textAlign,
      textAlignVertical: widget.textField.textAlignVertical,
      textDirection: widget.textField.textDirection,
      readOnly: widget.textField.readOnly,
      toolbarOptions: widget.textField.toolbarOptions,
      showCursor: widget.textField.showCursor,
      autofocus: widget.textField.autofocus,
      obscuringCharacter: widget.textField.obscuringCharacter,
      obscureText: widget.textField.obscureText,
      autocorrect: widget.textField.autocorrect,
      smartDashesType: widget.textField.smartDashesType,
      smartQuotesType: widget.textField.smartQuotesType,
      enableSuggestions: widget.textField.enableSuggestions,
      maxLines: widget.textField.maxLines,
      minLines: widget.textField.minLines,
      expands: widget.textField.expands,
      maxLength: widget.textField.maxLength,
      maxLengthEnforcement: widget.textField.maxLengthEnforcement,
      onChanged: widget.textField.onChanged,
      onEditingComplete: widget.textField.onEditingComplete,
      onSubmitted: widget.textField.onSubmitted,
      onAppPrivateCommand: widget.textField.onAppPrivateCommand,
      inputFormatters: widget.textField.inputFormatters,
      enabled: widget.textField.enabled,
      cursorWidth: widget.textField.cursorWidth,
      cursorHeight: widget.textField.cursorHeight,
      cursorRadius: widget.textField.cursorRadius,
      cursorColor: widget.textField.cursorColor,
      selectionHeightStyle: widget.textField.selectionHeightStyle,
      selectionWidthStyle: widget.textField.selectionWidthStyle,
      keyboardAppearance: widget.textField.keyboardAppearance,
      scrollPadding: widget.textField.scrollPadding,
      dragStartBehavior: widget.textField.dragStartBehavior,
      enableInteractiveSelection: widget.textField.enableInteractiveSelection,
      selectionControls: widget.textField.selectionControls,
      onTap: widget.textField.onTap,
      mouseCursor: widget.textField.mouseCursor,
      buildCounter: widget.textField.buildCounter,
      scrollController: widget.textField.scrollController,
      scrollPhysics: widget.textField.scrollPhysics,
      autofillHints: widget.textField.autofillHints,
      clipBehavior: widget.textField.clipBehavior,
      restorationId: widget.textField.restorationId,
      scribbleEnabled: widget.textField.scribbleEnabled,
      enableIMEPersonalizedLearning:
          widget.textField.enableIMEPersonalizedLearning,
      key: widget.textField.key,
    );
  }
}

class IntInput extends StatefulWidget {
  const IntInput({
    Key? key,
    required this.obs,
  }) : super(key: key);
  final Obs<int> obs;

  @override
  State<IntInput> createState() => _IntInputState();
}

class _IntInputState extends State<IntInput> {
  final controller = TextEditingController();

  int? parsedValue;

  @override
  void initState() {
    super.initState();
    controller.text = widget.obs.value.toString();
    controller.addListener(() {
      final value = int.tryParse(controller.text);
      parsedValue = value;
      if (value != null) {
        widget.obs.set(value);
      }
    });
    widget.obs.addListener(_onValueChanged);
  }

  void _onValueChanged() {
    if (widget.obs.value != parsedValue) {
      controller.text = widget.obs.value.toString();
    }
  }

  @override
  void dispose() {
    widget.obs.removeListener(_onValueChanged);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }
}
