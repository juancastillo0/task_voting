import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/fields/image_value_view.dart';
import 'package:task_voting/src/sample_feature/sample_item.dart';

class ChoiceInfoTitle extends StatelessWidget {
  const ChoiceInfoTitle(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: textTheme.titleMedium,
      ),
    );
  }
}

class ChoiceInfo extends StatelessObserverWidget {
  const ChoiceInfo({Key? key, required this.choice}) : super(key: key);
  final SampleItemEditable choice;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          key: const Key('title'),
          children: [
            // ChoiceInfoTitle(loc.choiceInfoTitle),
            // const SizedBox(width: 10),
            Expanded(
              child: SelectableText(
                choice.title.value,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        if (choice.image.value != null)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            height: 150,
            child: ImageValueView(
              image: choice.image.value!,
              key: const Key('image'),
            ),
          ),
        if (choice.description.value != null)
          Padding(
            key: const Key('description'),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ChoiceInfoTitle(loc.choiceInfoDescription),
                SelectableText(
                  choice.description.value!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        if (choice.pros.isNotEmpty)
          Column(
            key: const Key('pros'),
            children: [
              const Divider(),
              ChoiceInfoTitle(loc.choiceInfoPros),
              ...choice.pros.map(
                (pro) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.playlist_add_check_rounded,
                        size: 18,
                        color: Colors.green[900],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SelectableText(pro),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        if (choice.cons.isNotEmpty)
          Column(
            key: const Key('cons'),
            children: [
              ChoiceInfoTitle(loc.choiceInfoCons),
              ...choice.cons.map(
                (con) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.playlist_remove_rounded,
                        size: 18,
                        color: Colors.red[900],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SelectableText(con),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}
