import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/choices/choices_view.dart';
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/choices/choice_model.dart';

class RankedVoting extends StatelessObserverWidget {
  const RankedVoting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final store = Provider.of<ChoicesStore>(context);
    final sortedRank = store.sortedRaked.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(loc.rankedVotingIsNumericRanked),
                  ),
                  Switch(
                    value: store.rankedIsNumeric.value,
                    onChanged: store.rankedIsNumeric.set,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ReorderableListView(
            onReorder: store.onReorder,
            buildDefaultDragHandles: false,
            proxyDecorator: (child, index, animation) =>
                itemWidget(index, sortedRank[index], store.computeRanked),
            children: [
              ...sortedRank.mapIndexed(
                (i, e) => KeyedSubtree(
                  key: ValueKey(e),
                  child: itemWidget(i, e, store.computeRanked),
                ),
              ),
              const SizedBox(key: Key('bottomPadding'), height: 50),
            ],
            // itemBuilder: (context, index) {
            //   final choice = sortedRank[index];
            //   // final listController = AnimatedList.of(context);
            //   void onChange() {
            //     store.computeRanked();
            //     // final current = store.sortedRaked.value;
            //     // final map = Map.fromEntries(
            //     //     sortedRank.mapIndexed((i, e) => MapEntry(e, i)));
            //     // for (final i in Iterable.generate(sortedRank.length)) {
            //     //   final p = sortedRank[i];
            //     //   final c = current[i];
            //     //   if (p != c) {
            //     //     listController.removeItem(
            //     //       map[p]!,
            //     //       (context, animation) => itemWidget(p, onChange),
            //     //     );
            //     //     listController.insertItem(index);
            //     //   }
            //     // }
            //   }

            //   return itemWidget(choice, onChange);
            // },
          ),
        ),
      ],
    );
  }

  Widget itemWidget(
    int index,
    ChoiceModel choice,
    void Function() onChange,
  ) {
    return Center(
      child: SizedBox(
        width: 600,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ChoiceInfo(
                    choice: choice,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Observer(builder: (context) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SetUpBuilder<FocusNode>(
                            create: () {
                              final focusNode = FocusNode();
                              bool isMain = false;
                              focusNode.addListener(() {
                                if (!focusNode.hasPrimaryFocus && isMain) {
                                  onChange();
                                }
                                isMain = focusNode.hasPrimaryFocus;
                              });
                              return focusNode;
                            },
                            dispose: (focusNode) => focusNode.dispose(),
                            builder: (context, focusNode) {
                              return ObsTextInput(
                                obs: choice.rankingPoints,
                                parser: TextInputParser.intParser,
                                textField: TextField(focusNode: focusNode),
                              );
                            },
                          ),
                          Positioned(
                            right: 0,
                            child: ReorderableDragStartListener(
                              index: index,
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.grab,
                                child: Icon(Icons.drag_handle),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: choice.rankingPoints.value.toDouble(),
                        onChanged: (v) {
                          choice.rankingPoints.set(v.toInt());
                        },
                        onChangeEnd: (_) {
                          onChange();
                        },
                        // label: ,
                        min: 0,
                        max: 100,
                        divisions: 100,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
