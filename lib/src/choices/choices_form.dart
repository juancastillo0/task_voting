import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/fields/image_value_view.dart';
import 'package:task_voting/src/choices/choices_view.dart';
import 'package:task_voting/src/choices/choices_store.dart';

class ChoiceInfoForm extends StatelessObserverWidget {
  const ChoiceInfoForm({
    Key? key,
    required this.choice,
    this.onRemove,
    this.isExpanded = true,
  }) : super(key: key);

  final bool isExpanded;
  final SampleItemEditable choice;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final titleWidget = Row(
      key: const Key('title'),
      children: [
        ChoiceInfoTitle(loc.choiceInfoTitle),
        const SizedBox(width: 10),
        Expanded(
          child: ObsTextInput(
            obs: choice.title,
            parser: TextInputParser.stringParser,
          ),
        ),
        if (onRemove != null)
          InkWell(
            key: const Key('onRemove'),
            customBorder: const CircleBorder(),
            onTap: onRemove,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.delete),
            ),
          ),
        InkWell(
          key: const Key('collapseOrExpand'),
          customBorder: const CircleBorder(),
          onTap: () {
            choice.isExpanded.set(!isExpanded);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: isExpanded
                ? const Icon(Icons.keyboard_arrow_up)
                : const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
    if (!isExpanded) {
      return Column(
        children: [
          titleWidget,
        ],
      );
    }

    return Column(
      children: [
        titleWidget,
        Column(
          key: const Key('images'),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ChoiceInfoTitle(loc.choiceInfoImages),
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    key: const Key('selectImages'),
                    icon: const Icon(Icons.image),
                    label: Text(loc.choiceInfoSelectImages),
                    onPressed: choice.selectImages,
                  ),
                  const SizedBox(width: 10),
                  RoundedIconButton(
                    key: const Key('removeImages'),
                    onTap:
                        choice.image.value != null ? choice.removeImages : null,
                    icon: Icons.delete,
                  ),
                ],
              ),
            ),
            if (choice.image.value != null)
              SizedBox(
                height: 100,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ImageValueView(
                          key: const Key('mainImage'),
                          image: choice.image.value!,
                        ),
                        if (choice.additionalImages.value != null)
                          ...choice.additionalImages.value!.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ImageValueView(
                                image: e,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
        Column(
          key: const Key('description'),
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ChoiceInfoTitle(loc.choiceInfoDescription),
              ),
            ),
            ObsTextInput(
              obs: choice.description,
              parser: TextInputParser.stringParser,
              textField: const TextField(
                minLines: 3,
                maxLines: null,
              ),
            ),
          ],
        ),
        ProsOrConsList(
          context: context,
          values: choice.pros,
          isPro: true,
        ),
        ProsOrConsList(
          context: context,
          values: choice.cons,
          isPro: false,
        ),
      ],
    );
  }
}

class ProsOrConsList extends StatelessObserverWidget {
  const ProsOrConsList({
    Key? key,
    required this.context,
    required this.values,
    required this.isPro,
  }) : super(key: key);

  final BuildContext context;
  final ObservableList<String> values;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        key: isPro ? const Key('pros') : const Key('cons'),
        children: [
          Row(
            children: [
              Expanded(
                child: ChoiceInfoTitle(
                  isPro ? loc.choiceInfoPros : loc.choiceInfoCons,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  values.add('');
                },
                icon: const Icon(Icons.add),
                label: Text(
                  isPro ? loc.choiceInfoAddPro : loc.choiceInfoAddCon,
                ),
              ),
            ],
          ),
          ...values.mapIndexed(
            (i, pro) => Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ObsTextInput(
                      obs: MutableValue<String>(
                        pro,
                        (v) {
                          values[i] = v;
                        },
                      ),
                      parser: TextInputParser.stringParser,
                    ),
                  ),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      values.removeAt(i);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
