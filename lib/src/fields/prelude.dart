import 'prelude.dart';

export 'package:collection/collection.dart';
export 'package:flutter/material.dart';

export 'package:flutter_mobx/flutter_mobx.dart' hide version;
export 'package:mobx/mobx.dart' hide version, Action, Listener, Listenable;
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:task_voting/src/fields/provider.dart';
export 'package:task_voting/src/fields/fields.dart';
export 'package:task_voting/src/fields/setup_builder.dart';
export 'package:task_voting/src/fields/buttons.dart';
export 'package:task_voting/src/fields/dialogs.dart';
export 'package:task_voting/src/notifiers/app_notifier.dart';
export 'package:task_voting/src/util/root_store.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  ThemeData get theme => Theme.of(this);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String text, {
    bool isError = false,
  }) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: isError ? colorScheme.error : null,
        width: 400,
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: isError ? TextStyle(color: colorScheme.onError) : null,
        ),
      ),
    );
  }
}
