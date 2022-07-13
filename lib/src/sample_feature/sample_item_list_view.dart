import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/sample_feature/choices_form.dart';
import 'package:task_voting/src/sample_feature/choices_view.dart';
import 'package:task_voting/src/sample_feature/ice_voting.dart';
import 'package:task_voting/src/sample_feature/ranked_voting.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessObserverWidget {
  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Items'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: const ChoicesForm()
        // ListView.builder(
        //   // Providing a restorationId allows the ListView to restore the
        //   // scroll position when a user leaves and returns to the app after it
        //   // has been killed while running in the background.
        //   restorationId: 'sampleItemListView',
        //   itemCount: items.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final item = items[index];

        //     return ListTile(
        //         title: Text('SampleItem ${item.id}'),
        //         leading: const CircleAvatar(
        //           // Display the Flutter Logo image asset.
        //           foregroundImage: AssetImage('assets/images/flutter_logo.png'),
        //         ),
        //         onTap: () {
        //           // Navigate to the details page. If the user leaves and returns to
        //           // the app after it has been killed while running in the
        //           // background, the navigation stack is restored.
        //           Navigator.restorablePushNamed(
        //             context,
        //             SampleItemDetailsView.routeName,
        //           );
        //         });
        //   },
        // ),
        );
  }
}

class ChoicesForm extends StatefulObserverWidget {
  const ChoicesForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoicesForm> createState() => _ChoicesFormState();
}

class _ChoicesFormState extends State<ChoicesForm> {
  final ChoicesStore store = ChoicesStore();
  final itemsScrollController = ScrollController();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Provider(
      value: store,
      child: Column(
        // reversed to maintain the app bar's shadow
        verticalDirection: VerticalDirection.up,
        children: [
          Material(
            elevation: 1,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: ChoiceInfoTitle(loc.choiceListTitle)),
                  if (store.isCreatingItems.value) ...[
                    OutlinedButton.icon(
                      key: const Key('toggleAreItemsExpanded'),
                      onPressed: store.toggleAreItemsExpanded,
                      icon: store.areItemsExpanded.value
                          ? const Icon(Icons.arrow_drop_up_outlined)
                          : const Icon(Icons.arrow_drop_down_outlined),
                      label: Text(
                        store.areItemsExpanded.value
                            ? loc.choiceListCollapseItems
                            : loc.choiceListExpandItems,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      key: const Key('addChoice'),
                      onPressed: store.addChoice,
                      icon: const Icon(Icons.add),
                      label: Text(loc.choiceListAddChoice),
                    ),
                    const SizedBox(width: 10),
                  ],
                  OutlinedButton.icon(
                    onPressed: store.isCreatingItems.value
                        ? store.toggleICEVote
                        : store.toggleIsCreatingItems,
                    icon: store.isCreatingItems.value
                        ? const Icon(Icons.how_to_vote)
                        : const Icon(Icons.edit),
                    label: Text(
                      store.isCreatingItems.value
                          ? loc.choiceListVoteICE
                          : loc.choiceListEditChoices,
                    ),
                  ),
                  if (store.isCreatingItems.value)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: OutlinedButton.icon(
                        onPressed: store.toggleRankedVote,
                        icon: const Icon(Icons.how_to_vote),
                        label: Text(
                          loc.choiceListVoteRanked,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (store.isCreatingItems.value)
            Expanded(
              child: ListView(
                controller: itemsScrollController,
                children: [
                  ...store.items.mapIndexed(
                    (i, e) => Center(
                      key: ValueKey(e),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        alignment: Alignment.center,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 12,
                            ),
                            child: Observer(builder: (context) {
                              return ChoiceInfoForm(
                                choice: e,
                                isExpanded: e.isExpanded.value ??
                                    store.areItemsExpanded.value,
                                onRemove: () {
                                  store.items.removeAt(i);
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            )
          else if (store.isICEVote.value)
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.all(20),
                  child: Observer(builder: (context) {
                    return ICEVotingTable(
                      sortCallback: store.sortCallback,
                      sortIndex: store.sortedTableIndex.value,
                      items: store.sortedTableList.value
                          .map((e) => e.iceAssessment)
                          .toList(),
                    );
                  }),
                ),
              ),
            )
          else
            const Expanded(child: RankedVoting()),
          // reversed to maintain the app bar's shadow
        ].reversed.toList(),
      ),
    );
  }
}
