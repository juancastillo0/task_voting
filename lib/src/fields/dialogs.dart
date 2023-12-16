import 'package:task_voting/src/fields/prelude.dart';

Future<void> showSimpleAlertDialog(
  BuildContext context,
  Widget content, {
  void Function()? onAccept,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: content,
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(AppLocalizations.of(context)!.close),
        ),
        if (onAccept != null)
          TextButton(
            onPressed: onAccept,
            child: Text(AppLocalizations.of(context)!.accept),
          ),
      ],
    ),
  );
}
