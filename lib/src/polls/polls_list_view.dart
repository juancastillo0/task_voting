import 'dart:convert';

import 'package:api_client/api/__generated__/poll.data.gql.dart';
import 'package:intl/intl.dart';
import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/util/disposable.dart';

import 'polls_store.dart';

class PollsListView extends StatefulObserverWidget {
  const PollsListView({
    super.key,
  });

  @override
  State<PollsListView> createState() => _PollsListViewState();
}

class _PollsListViewState extends State<PollsListView> with DisposableState {
  late PollsStore store;
  final itemsScrollController = ScrollController();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    context.ref(PollsStore.ref).setUp().then((value) {
      if (!mounted) return;
      disposer.onDispose(reaction<PollsStore>(
        fireImmediately: true,
        (_) => context.ref(PollsStore.ref),
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
    final isInList = store.isInList;

    String locPollsView(PollsView sort) {
      switch (sort) {
        case PollsView.recent:
          return loc.pollsTabRecent;
        case PollsView.polls:
          return loc.pollsTabPolls;
        case PollsView.votes:
          return loc.pollsTabVotes;
        case PollsView.create:
          return loc.pollsTabCreate;
      }
    }

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
                  final view = store.view.value;
                  final Iterable<Widget> additionalItems;

                  final buttons = [
                    // OutlinedButton.icon(
                    //   key: const Key('toggleIsEditingItems'),
                    //   onPressed: store.toggleIsEditingItems,
                    //   icon: Padding(
                    //     padding: const EdgeInsets.all(2.0),
                    //     child: store.isEditingItems.value
                    //         ? const Icon(Icons.edit_off, size: 20)
                    //         : const Icon(Icons.edit, size: 20),
                    //   ),
                    //   label: Text(
                    //     store.isEditingItems.value
                    //         ? loc.choiceListViewItems
                    //         : loc.choiceListEditItems,
                    //   ),
                    // ),
                    // if (store.isEditingItems.value)
                    //   OutlinedButton.icon(
                    //     key: const Key('toggleAreItemsExpanded'),
                    //     onPressed: store.toggleAreItemsExpanded,
                    //     icon: store.areItemsExpanded.value
                    //         ? const Icon(Icons.keyboard_arrow_up)
                    //         : const Icon(Icons.keyboard_arrow_down),
                    //     label: Text(
                    //       store.areItemsExpanded.value
                    //           ? loc.choiceListCollapseItems
                    //           : loc.choiceListExpandItems,
                    //     ),
                    //   ),
                    if (view != PollsView.create)
                      OutlinedButton.icon(
                        key: const Key('startCreatingPoll'),
                        onPressed: store.startCreatingPoll,
                        icon: const Icon(Icons.add),
                        label: Text(loc.pollsNew),
                      ),
                    // if (view != PollsView.create)
                    //   OutlinedButton.icon(
                    //     key: const Key('startCreatingOptions'),
                    //     onPressed: store.startCreatingOptions,
                    //     icon: const Icon(Icons.add),
                    //     label: Text(loc.pollsCreate),
                    //   ),
                    if (view == PollsView.create)
                      OutlinedButton.icon(
                        key: const Key('createPoll'),
                        onPressed: store.createPoll,
                        icon: const Icon(Icons.add),
                        label: Text(loc.pollsCreate),
                      ),
                    if (store.selectedPoll.value != null &&
                        view != PollsView.create)
                      OutlinedButton.icon(
                        key: const Key('duplicatePoll'),
                        onPressed: store.duplicatePoll,
                        icon: const Icon(Icons.add),
                        label: Text(loc.pollsDuplicate),
                      ),
                    if (view == PollsView.create)
                      OutlinedButton.icon(
                        key: const Key('goBackToPollList'),
                        onPressed: store.goBackToPollList,
                        icon: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.how_to_vote, size: 20),
                        ),
                        label: Text(loc.pollsGoToList),
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

                  return Row(
                    children: [
                      const Spacer(),
                      ...additionalItems,
                      // OutlinedButton.icon(
                      //   onPressed: isInList
                      //       ? store.toggleICEVote
                      //       : store.toggleIsCreatingItems,
                      //   icon: Padding(
                      //     padding: const EdgeInsets.all(2.0),
                      //     child: isInList
                      //         ? const Icon(Icons.how_to_vote, size: 20)
                      //         : const Icon(Icons.edit, size: 20),
                      //   ),
                      //   label: Text(
                      //     isInList
                      //         ? loc.choiceListVoteICE
                      //         : loc.choiceListEditPolls,
                      //   ),
                      // ),
                    ],
                  );
                });
              }),
            ),
          ),
          if (isInList)
            Expanded(
              child: Column(
                children: [
                  ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      ...PollsView.values.map(
                        (v) => TextButton(
                          onPressed: v == store.view.value
                              ? null
                              : () {
                                  store.view.set(v);
                                },
                          child: Text(locPollsView(v)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Observer(builder: (context) {
                      final list = store.pollList.value;
                      if (list.isEmpty) {
                        return const Center(child: Text('No Polls'));
                      }
                      return ListView(
                        controller: itemsScrollController,
                        children: [
                          ...list.mapIndexed(
                            (i, e) => Center(
                              key: ValueKey(e),
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 600),
                                alignment: Alignment.center,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0,
                                      vertical: 12,
                                    ),
                                    child: Observer(builder: (context) {
                                      // if (!store.isEditingItems.value) {
                                      //   return ChoiceInfo(choice: e);
                                      // }
                                      return PollInfo(
                                        poll: e.key,
                                        isExpanded: // e.isExpanded.value ??
                                            store.areItemsExpanded.value,
                                        // onRemove: () {
                                        //   store.items.removeAt(i);
                                        // },
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            )
          else
            const Expanded(child: PollInfoForm()),
          // reversed to maintain the app bar's shadow
        ].reversed.toList(),
      ),
    );
  }
}

class PollInfo extends StatelessObserverWidget {
  const PollInfo({
    super.key,
    required this.poll,
    required this.isExpanded,
  });

  final GFullPoll poll;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final store = context.ref(PollsStore.ref);
    final loc = AppLocalizations.of(context)!;
    final createdAtFormat = DateFormat.yMMMMd(loc.localeName).add_jm();
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(poll.title, style: Theme.of(context).textTheme.headlineMedium),
              OutlinedButton.icon(
                key: const Key('selectPoll'),
                onPressed: () => store.selectPoll(poll),
                icon: const Icon(Icons.edit),
                label: Text(loc.pollsEdit),
              ),
            ],
          ),
          Text(
            poll.subtitle ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text('Kind: ${poll.pollKind}'),
          const SizedBox(height: 10),
          Text(poll.body),
          const SizedBox(height: 10),
          if (poll.formJsonSchema != null)
            Text('Form Json Schema: ${poll.formJsonSchema}'),
          Text('Number of Options: ${poll.options.length}'),
          const SizedBox(height: 10),
          Row(
            children: [
              OutlinedButton.icon(
                key: const Key('deletePoll'),
                onPressed: () {
                  showSimpleAlertDialog(
                    context,
                    Text(loc.pollsConfirmDelete),
                    onAccept: () => store.deletePoll(poll),
                  );
                },
                icon: const Icon(Icons.delete),
                label: Text(loc.pollsDelete),
              ),
              const Spacer(),
              Text(createdAtFormat.format(
                DateTime.parse(poll.createdAt.value),
              )),
            ],
          ),
          // OutlinedButton.icon(
          //   key: const Key('duplicatePoll'),
          //   onPressed: store.duplicatePoll,
          //   icon: const Icon(Icons.add),
          //   label: Text(loc.choiceListAddChoice),
          // ),
        ],
      ),
    );
  }
}

class PollInfoForm extends StatelessObserverWidget {
  const PollInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final store = context.ref(PollsStore.ref);
    final poll = store.pollInsert.value;

    return SizedBox(
      width: 450,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: loc.pollsFieldTitle),
            initialValue: poll.title,
            onChanged: (v) {
              store.updatePollForm((u) => u.title = v.trim());
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: loc.pollsFieldSubtitle),
            initialValue: poll.subtitle,
            maxLines: 2,
            onChanged: (v) {
              store.updatePollForm((u) => u.subtitle = v.trim());
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: loc.pollsFieldBody),
            initialValue: poll.body,
            maxLines: 10,
            onChanged: (v) {
              store.updatePollForm((u) => u.body = v.trim());
            },
          ),
          TextFormField(
            decoration:
                InputDecoration(labelText: loc.pollsFieldFormJsonSchema),
            initialValue: poll.formJsonSchema,
            maxLines: 3,
            onChanged: (v) {
              store.updatePollForm((u) => u.formJsonSchema = v.trim());
            },
            validator: (value) {
              try {
                jsonDecode(value!);
                return null;
              } catch (e) {
                return e.toString();
              }
            },
          ),
          // TODO: Text('Poll Kind: ${poll.pollKind}'),
          // Text(poll.createdAt.toString()),
          // Text('Number of Options: ${poll.options.length}'),
          // OutlinedButton.icon(
          //   key: const Key('createPoll'),
          //   onPressed: store.createPoll,
          //   icon: const Icon(Icons.add),
          //   label: Text(loc.choiceListAddChoice),
          // ),
        ].expand((e) sync* {
          yield const SizedBox(height: 10);
          yield e;
        }).toList(growable: false),
      ),
    );
  }
}
