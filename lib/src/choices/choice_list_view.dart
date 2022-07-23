import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/choices/choices_form.dart';
import 'package:task_voting/src/choices/choices_view.dart';
import 'package:task_voting/src/choices/ice_voting.dart';
import 'package:task_voting/src/choices/ranked_voting.dart';
import 'package:task_voting/src/choices/voting_choices_store.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/tasks/tasks_tab_view.dart';
import 'package:task_voting/src/util/disposable.dart';
import 'package:task_voting/src/util/routes.dart';

import 'choices_store.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulObserverWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView>
    with SingleTickerProviderStateMixin, DisposableState {
  late AppRouterDelegate routerDelegate;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    routerDelegate = context.ref(AppRouterDelegate.ref);
    tabController = TabController(
      initialIndex: routerDelegate.mainRoute.tab.index,
      length: AppTab.values.length,
      vsync: this,
    );
    changeStateWithUrl();
    routerDelegate.addListener(changeStateWithUrl);
    tabController.addListener(changeUrlWithState);
    disposer.onDispose(() {
      routerDelegate.removeListener(changeStateWithUrl);
      tabController.removeListener(changeUrlWithState);
      tabController.dispose();
    });
  }

  void changeUrlWithState() async {
    final index = tabController.index;
    final RouteInfo info;
    switch (AppTab.values[index]) {
      case AppTab.tasks:
        final store = context.ref(TaskProjectsStore.ref);
        info = await store
            .setUp()
            .then((_) => store.selectedStore.value.routeInfo);
        break;
      case AppTab.votes:
        final store = context.ref(VotingChoicesStore.ref);
        info = await store
            .setUp()
            .then((_) => store.selectedStore.routeInfo.value);
        break;
    }
    routerDelegate.changeCurrentTab(info);
  }

  void changeStateWithUrl() async {
    final route = routerDelegate.mainRoute;
    if (route is TaskRouteInfo) {
      final store = context.ref(TaskProjectsStore.ref);
      await store.setRouteInfo(route);
    } else if (route is VoteRouteInfo) {
      final store = context.ref(VotingChoicesStore.ref);
      await store.setRouteInfo(route);
    }
    if (routerDelegate.mainRoute == route) {
      tabController.animateTo(route.tab.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final routerDelegate = context.ref(AppRouterDelegate.ref);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(loc.appTitle),
            const SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text(loc.choiceListTitle),
                  ),
                  Tab(
                    child: Text(loc.tasksTitle),
                  ),
                ],
              ),
            ),
            // TextButton(
            //   onPressed: ,
            //   style: TextButton.styleFrom(
            //     shape: RoundedRectangleBorder(

            //     ),

            //   )
            //       routerDelegate.currentTab.isTasks ? selectedBorder : null,

            //   child: Text('Tasks'),
            // ),
            // InkWell(
            //   onTap: () {
            //     routerDelegate.changeTab(AppTab.votes);
            //   },
            //   customBorder:
            //       routerDelegate.currentTab.isVotes ? selectedBorder : null,
            //   child: Text('Votes'),
            // ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.

              routerDelegate.setNewRoutePath(SpecRouteInfo.settingsInfo);
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
      body: TabBarView(
        controller: tabController,
        children: const [
          ChoicesForm(),
          TasksTabView(),
        ],
      ),
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

class _ChoicesFormState extends State<ChoicesForm> with DisposableState {
  late ChoicesStore store;
  final itemsScrollController = ScrollController();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    context.ref(VotingChoicesStore.ref).setUp().then((value) {
      if (!mounted) return;
      disposer.onDispose(reaction<ChoicesStore>(
        fireImmediately: true,
        (_) => context.ref(ChoicesStore.ref),
        (value) {
          store = value;
          loading = true;
          store.setUp().then((_) {
            if (mounted) {
              setState(() {
                loading = false;
              });
            }
          });
          if (mounted) setState(() {});
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final loc = AppLocalizations.of(context)!;
    final isInList = store.view.value == ChoicesView.list;

    return Provider(
      value: store,
      child: Column(
        // reversed to maintain the app bar's shadow
        verticalDirection: VerticalDirection.up,
        children: [
          Material(
            elevation: 1,
            color: Theme.of(context).colorScheme.surface,
            surfaceTintColor: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(builder: (context, box) {
                return Observer(builder: (context) {
                  final Iterable<Widget> additionalItems;
                  if (!isInList) {
                    additionalItems = [];
                  } else {
                    final buttons = [
                      OutlinedButton.icon(
                        key: const Key('toggleIsEditingItems'),
                        onPressed: store.toggleIsEditingItems,
                        icon: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: store.isEditingItems.value
                              ? const Icon(Icons.edit_off, size: 20)
                              : const Icon(Icons.edit, size: 20),
                        ),
                        label: Text(
                          store.isEditingItems.value
                              ? loc.choiceListViewItems
                              : loc.choiceListEditItems,
                        ),
                      ),
                      if (store.isEditingItems.value)
                        OutlinedButton.icon(
                          key: const Key('toggleAreItemsExpanded'),
                          onPressed: store.toggleAreItemsExpanded,
                          icon: store.areItemsExpanded.value
                              ? const Icon(Icons.keyboard_arrow_up)
                              : const Icon(Icons.keyboard_arrow_down),
                          label: Text(
                            store.areItemsExpanded.value
                                ? loc.choiceListCollapseItems
                                : loc.choiceListExpandItems,
                          ),
                        ),
                      OutlinedButton.icon(
                        key: const Key('addChoice'),
                        onPressed: store.addChoice,
                        icon: const Icon(Icons.add),
                        label: Text(loc.choiceListAddChoice),
                      ),
                      OutlinedButton.icon(
                        key: const Key('toggleRankedVote'),
                        onPressed: store.toggleRankedVote,
                        icon: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.how_to_vote, size: 20),
                        ),
                        label: Text(
                          loc.choiceListVoteRanked,
                        ),
                      ),
                    ];
                    if (box.maxWidth < 670) {
                      additionalItems = [
                        DropdownButton<Object?>(
                          // isDense: true,
                          isDense: true,
                          // isExpanded: true,

                          items: buttons.mapIndexed(
                            (i, e) {
                              return DropdownMenuItem(
                                value: i,
                                key: e.key,
                                onTap: e.onPressed,
                                child: e.child!,
                              );
                            },
                          ).toList(),
                          value: null,
                          onChanged: (_) {},
                          hint: Text(loc.choiceListShowOptions),
                        ),
                        const SizedBox(width: 10),
                      ];
                    } else {
                      additionalItems = buttons.expand(
                        (e) sync* {
                          yield e;
                          yield const SizedBox(width: 10);
                        },
                      );
                    }
                  }

                  return Row(
                    children: [
                      const Spacer(),
                      if (isInList) ...additionalItems,
                      OutlinedButton.icon(
                        onPressed: isInList
                            ? store.toggleICEVote
                            : store.toggleIsCreatingItems,
                        icon: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: isInList
                              ? const Icon(Icons.how_to_vote, size: 20)
                              : const Icon(Icons.edit, size: 20),
                        ),
                        label: Text(
                          isInList
                              ? loc.choiceListVoteICE
                              : loc.choiceListEditChoices,
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     const SizedBox(width: 6),
                      //     const Icon(Icons.how_to_vote, size: 20),
                      //     const Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 6.0),
                      //       child: Text('Vote'),
                      //     ),
                      //     ButtonBar(
                      //       buttonHeight: 20,
                      //       buttonMinWidth: 40,
                      //       layoutBehavior: ButtonBarLayoutBehavior.padded,
                      //       buttonPadding: EdgeInsets.zero,
                      //       children: [
                      //         TextButton(
                      //           child: Text('ICE'),
                      //           onPressed: () {},
                      //         ),
                      //         TextButton(
                      //           child: Text('Ranked'),
                      //           onPressed: () {},
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  );
                });
              }),
            ),
          ),
          if (isInList)
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
                              if (!store.isEditingItems.value) {
                                return ChoiceInfo(choice: e);
                              }
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
          else if (store.view.value == ChoicesView.ice)
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Observer(builder: (context) {
                    return ICEVotingTable(
                      sortCallback: store.sortCallback,
                      sortIndex: store.sortedTableIndex.value,
                      items: store.sortedTableList.value,
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
