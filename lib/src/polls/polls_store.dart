import 'dart:collection';

import 'package:api_client/__generated__/schema.schema.gql.dart';
import 'package:api_client/api/__generated__/poll.data.gql.dart';
import 'package:api_client/api/__generated__/poll.req.gql.dart';
import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';

import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/settings/settings_controller.dart';
import 'package:task_voting/src/settings/settings_service.dart';
import 'package:task_voting/src/util/prelude.dart';
import 'package:task_voting/src/util/routes.dart';
import 'package:task_voting/src/util/string.dart';

enum PollsView {
  recent,
  polls,
  votes,
  create,
}

class PollsStore with DisposableWithSetUp, StoreSerde {
  PollsStore(
    this.rootStore, {
    String? name,
  }) : name = name ?? randomKey();

  @override
  final String name;

  final RootStore rootStore;

  static final ref = Ref(
    reCreate: false,
    (root) => PollsStore(root),
  );

  ApiClient get apiClient =>
      rootStore.getGlobal<SettingsController>().apiClient!;

  @override
  Future<void> performSetUp() async {
    final settings = rootStore.getGlobal<SettingsController>();
    if (settings.apiClient == null) return;

    _updateUserInfo();
    settings.addListener(_updateUserInfo);
    disposer.onDispose(() => settings.removeListener(_updateUserInfo));

    try {
      await HiveCollectionKey.pollsStoreCollection.get(name, valueToEdit: this);

      // TODO: computeRanked();
    } catch (e, s) {
      print('$e $s');
      if (AppPlatform.kDebugMode) {
        return;
      }
    }

    disposer.onDispose(autorun(
      name: 'persist',
      delay: 3000,
      (r) {
        StoreSerde.iterateStoreObservables(this);
        HiveCollectionKey.pollsStoreCollection.set(name, this);
      },
    ));
  }

  void _updateUserInfo() {
    final settings = rootStore.getGlobal<SettingsController>();
    final user = settings.user!;
    final userPolls = BuiltMap.of(Map.fromIterables(
        user.polls.map((p) => p.poll.id.toString()), user.polls));
    if (BuiltMap(polls) != userPolls) {
      polls.set(userPolls.toMap());
    }
    final userPollsWithVotes = BuiltMap.of(Map.fromIterables(
        user.pollsWithVotes.map((p) => p.poll.id.toString()),
        user.pollsWithVotes));
    if (BuiltMap(pollsWithVotes) != userPollsWithVotes) {
      pollsWithVotes.set(userPollsWithVotes.toMap());
    }
  }

  final polls =
      ObsMap<GFullOwnerPoll>('polls', serde: typeSerdeGFullPoll.map());
  static final typeSerdeGFullPoll = Serde<GFullOwnerPoll>(
    fromJson: (json) =>
        GgetUserData_getUser_polls.fromJson(json as Map<String, dynamic>)!,
    toJson: (value) => value?.toJson(),
  );

  final pollsWithVotes = ObsMap<GFullPollUser>(
    'pollsWithVotes',
    serde: typeSerdeGFullPollUser.map(),
  );
  static final typeSerdeGFullPollUser = Serde<GFullPollUser>(
    fromJson: (json) => GgetUserData_getUser_pollsWithVotes.fromJson(
        json as Map<String, dynamic>)!,
    toJson: (value) => value?.toJson(),
  );

  late final pollList = Computed<List<UIPoll>>(() {
    return switch (view.value) {
      PollsView.polls => polls.values
          .map((e) => UIPoll(e.poll, null, e))
          .toList(growable: false),
      PollsView.votes => pollsWithVotes.values
          .map((e) => UIPoll(e.poll, e.userVotes, null))
          .toList(growable: false),
      PollsView.recent => SplayTreeMap<DateAndKey, UIPoll>.fromIterable(
          polls.values
              .map(
                (e) => MapEntry(
                  DateAndKey(
                    e.poll.id.toString(),
                    DateTime.parse(e.poll.createdAt.value),
                  ),
                  UIPoll(e.poll, null, e),
                ),
              )
              .followedBy(
                pollsWithVotes.values.map(
                  (e) => MapEntry(
                    DateAndKey(
                      e.poll.id.toString(),
                      DateTime.parse(
                        e.userVotes.map((v) => v.vote.createdAt.value).fold(
                              e.poll.createdAt.value,
                              (p, e) => p.compareTo(e) <= 0 ? p : e,
                            ),
                      ),
                    ),
                    UIPoll(e.poll, e.userVotes, null),
                  ),
                ),
              ),
          key: (e) => e.key,
          value: (e) => e.value,
        ).values.toList(growable: false),
      PollsView.create => [],
    };
  });

  // final simpleVotes = VotingState('simpleVotes');
  final view = Obs(
    'view',
    PollsView.polls,
    serde: Serde<PollsView>(
      fromJson: (obj) => PollsView.values.byName(obj as String),
      toJson: (val) => val?.name,
    ),
  );
  final isCreatingPoll = Obs('isCreatingPoll', false);
  final areItemsExpanded = Obs('areItemsExpanded', false);
  final pollInsert = Obs('pollInsert', _emptyPoll);
  static final _emptyPoll = GPollInsert(
    (u) => u
      ..title = ''
      ..body = '',
  );
  final selectedPollId = Obs<int?>('selectedPollId', null);
  late final selectedPoll = Computed<GFullOwnerPoll?>(
      name: 'selectedPoll', () => polls[selectedPollId.value?.toString()]);

  void updatePollForm(void Function(GPollInsertBuilder u) func) {
    pollInsert.set(pollInsert.value.rebuild(func));
  }

  bool get isInList =>
      view.value != PollsView.create && selectedPoll.value == null;

  @override
  late final serdeProperties = [
    polls,
    pollsWithVotes,
    view,
    isCreatingPoll,
    areItemsExpanded,
    pollInsert,
    selectedPollId,
  ];

  late final routeInfo = Computed(
    () => PollsRouteInfo(
      selectedPoll: selectedPoll.value?.poll.id,
      view: view.value,
      expanded: areItemsExpanded.value,
      editing: isCreatingPoll.value,
      projectId: name,
    ),
  );

  void startCreatingPoll() {
    isCreatingPoll.set(true);
    view.set(PollsView.create);
    // pollInsert.set(GPollInsert());
  }

  void startCreatingOptions() {
    isCreatingPoll.set(true);
  }

  void goBackToPollList() {
    isCreatingPoll.set(false);
    selectedPollId.set(null);
    view.set(PollsView.polls);
  }

  void selectPoll(int pollId) {
    selectedPollId.set(pollId);
  }

  void clearPoll() {
    pollInsert.set(_emptyPoll);
  }

  void duplicatePoll() {
    startCreatingPoll();
    final s = selectedPoll.value!.poll;
    pollInsert.set(GPollInsert(
      (u) => u
        ..body = s.body
        // TODO: ..options = s.options.toBuilder()
        ..id = s.id
        ..title = s.title
        ..subtitle = s.subtitle
        ..body = s.body
        ..pollKind = s.pollKind
        ..formJsonSchema = s.formJsonSchema,
    ));
  }

  void createPoll() async {
    final insertPollsResponse = await apiClient.requestNoCacheThrow(
        GinsertPollReq((u) => u..vars.insert = pollInsert.value.toBuilder()));
    final poll = insertPollsResponse.insertPoll;
    polls[poll.poll.id.toString()] = poll;
    clearPoll();
    goBackToPollList();

    // (GPollInsertBuilder()
    //   ..userId = 1
    //   ..title = 'fefs'
    //   ..body = 'fefs'
    //   ..options.addAll([
    //     GPollOptionInsert((u) => u..description = 'option 1'),
    //   ])),
  }

  void createOption() async {
    final addPollOptionsResponse =
        await apiClient.requestNoCache(GaddPollOptionsReq((u) => u.vars
          ..pollId = selectedPoll.value!.poll.id
          ..options.addAll([
            GPollOptionInsert((u) => u
              ..priority = 4
              ..description = 'option 2'),
            GPollOptionInsert((u) => u
              ..priority = 2
              ..description = 'option 3'),
          ])));
  }

  Future<void> setRouteInfo(PollsRouteInfo route) async {
    await setUp();
    runInAction(name: 'setRouteInfo', () {
      // TODO:
      // if (route.projectId != null) {
      //   final index =
      //       stores.indexWhere((element) => element.name == route.projectId);
      //   if (index != -1) _selectedStoreIndex.set(index);
      // }
      final selectedStore = this;
      if (route.selectedPoll != null) {
        final found = polls[route.selectedPoll.toString()];
        if (found != null) selectedStore.selectedPollId.set(found.poll.id);
      }
      if (route.view != null) {
        selectedStore.view.set(route.view!);
      }
      if (route.expanded != null) {
        selectedStore.areItemsExpanded.set(route.expanded!);
      }
      if (route.editing != null) {
        selectedStore.isCreatingPoll.set(route.editing!);
      }
    });
  }

  void deletePoll(GFullPoll poll) {}
}

class DateAndKey implements Comparable<DateAndKey> {
  final String key;
  final DateTime date;

  DateAndKey(this.key, this.date);

  @override
  int compareTo(DateAndKey other) {
    final comp = date.compareTo(other.date);
    return comp != 0 ? comp : key.compareTo(other.key);
  }
}

class UIPoll {
  final GFullPoll poll;
  final BuiltList<GFullPollUserVote>? voter;
  final GFullOwnerPoll? ownerPoll;

  UIPoll(this.poll, this.voter, this.ownerPoll);
}
