import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/choices/choices_view.dart';
import 'package:task_voting/src/choices/choice_model.dart';

class OneVsOneSelect extends StatelessObserverWidget {
  const OneVsOneSelect({
    Key? key,
    required this.choice1,
    required this.choice2,
    required this.onSelect,
  }) : super(key: key);

  final ChoiceModel choice1;
  final ChoiceModel choice2;
  final void Function(ChoiceModel) onSelect;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          loc.oneVsOneSelectOne,
          style: textTheme.headline5,
        ),
        Row(
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  onSelect(choice1);
                },
                child: ChoiceInfo(
                  choice: choice1,
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  onSelect(choice2);
                },
                child: ChoiceInfo(
                  choice: choice2,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
