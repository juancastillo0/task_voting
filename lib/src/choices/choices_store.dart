import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:task_voting/src/choices/choice_model.dart';

import 'package:task_voting/src/notifiers/app_notifier.dart';
import 'package:task_voting/src/choices/voting_choices_store.dart';
import 'package:task_voting/src/settings/settings_service.dart';
import 'package:task_voting/src/util/prelude.dart';
import 'package:task_voting/src/util/string.dart';

typedef Id = String;

class ChoicesStore with DisposableWithSetUp, StoreSerde {
  ChoicesStore(
    this.rootStore, {
    String? name,
  }) : name = name ?? randomKey() {
    addChoice();
  }
  @override
  final String name;

  final RootStore rootStore;

  static final ref = Ref(
    reCreate: true,
    (root) => root.ref(VotingChoicesStore.ref).selectedStore,
  );

  @override
  Future<void> performSetUp() async {
    disposer.onDispose(
      reaction<Set<Id>>(
        name: 'cleanSimpleVotes',
        fireImmediately: true,
        equals: (p0, p1) =>
            p0 == p1 ||
            (p0?.length == p1?.length && p0!.difference(p1!).isEmpty),
        (_) => items.map((element) => element.id).toSet(),
        (keys) {
          // simpleVotes.oneVsOne.removeWhere(
          //   (e) => !keys.contains(e.loser) || !keys.contains(e.winner),
          // );
          simpleVotes.sortedBestIds.removeWhere(
            (k, _) => !keys.contains(k),
          );
          simpleVotes.sortedWorseIds.removeWhere(
            (k, _) => !keys.contains(k),
          );
          simpleVotes.oneVsOneMap.removeWhere(
            (k, _) => !keys.contains(k),
          );
          simpleVotes.oneVsOneMap.forEach((key, value) {
            value.removeWhere(
              (k) => !keys.contains(k),
            );
          });
        },
      ),
    );

    try {
      await HiveCollectionKey.choicesStoreCollection
          .get(name, valueToEdit: this);

      computeRanked();
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
        HiveCollectionKey.choicesStoreCollection.set(name, this);
      },
    ));
  }

  final items = ObsList<ChoiceModel>(
    'items',
    serde: ChoiceModel.typeSerde.list(),
  );
  final simpleVotes = VotingState('simpleVotes');
  final iceMaxValuePerVote = Obs('iceMaxValuePerVote', 100);
  final rankedIsNumeric = Obs('rankedIsNumeric', true);

  final areItemsExpanded = Obs('areItemsExpanded', true);
  final isICEVote = Obs('isICEVote', true);
  final isViewingItems = Obs('isViewingItems', true);
  final isEditingItems = Obs('isEditingItems', true);

  final sortedRaked = Obs<List<ChoiceModel>>('sortedRaked', []);
  final sortedTableIndex = Obs<int?>('sortedTableIndex', null);

  @override
  late final serdeProperties = [
    items,
    simpleVotes,
    iceMaxValuePerVote,
    rankedIsNumeric,
    areItemsExpanded,
    isICEVote,
    isViewingItems,
    isEditingItems,
    sortedTableIndex,
  ];

  late final sortedTableList = Computed<List<ChoiceModel>>(
    name: 'sortedTableList',
    () {
      final index = sortedTableIndex.value;
      if (index == null) return items;
      Comparable field(ChoiceModel a) {
        switch (index.abs()) {
          case 1:
            return a.iceAssessment.impact.value;
          case 2:
            return a.iceAssessment.confidence.value;
          case 3:
            return a.iceAssessment.easiness.value;
          case 4:
            return a.iceAssessment.urgency.value;
          case 5:
            return a.iceAssessment.points.value;
          default:
            return a.iceAssessment.points.value;
        }
      }

      final comp = index < 0 ? -1 : 1;
      return [...items]..sort(
          (a, b) => comp * field(a).compareTo(field(b)),
        );
    },
  );

  void computeRanked() {
    final list = [...items]..sort(
        (a, b) {
          final pointsDelta = b.rankingPoints.value - a.rankingPoints.value;
          return pointsDelta == 0
              ? simpleVotes.oneVsOneComp(a.id, b.id)
              : pointsDelta;
        },
      );
    sortedRaked.set(list);
  }

  void onReorder(int i1, int i2) {
    runInAction(name: 'onReorder', () {
      final sortedRank = sortedRaked.value;
      if (i2 > sortedRank.length) return;
      final it1 = sortedRank[i1];
      final it2 = sortedRank[i2 == sortedRank.length ? i2 - 1 : i2];
      it1.rankingPoints.set(it2.rankingPoints.value);
      simpleVotes.addOneVsOne(lower: it1.id, greater: it2.id);
      computeRanked();
    });
  }

  void sortCallback(int index, bool ascending) {
    final newValue = ascending
        ? sortedTableIndex.value == -index
            ? null
            : index
        : -index;
    sortedTableIndex.set(newValue);
  }

  void addChoice() {
    items.add(ChoiceModel());
  }

  void toggleIsCreatingItems() {
    isViewingItems.set(!isViewingItems.value);
  }

  void toggleIsEditingItems() {
    isEditingItems.set(!isEditingItems.value);
  }

  void toggleICEVote() {
    toggleIsCreatingItems();
    isICEVote.set(true);
  }

  void toggleRankedVote() {
    computeRanked();
    toggleIsCreatingItems();
    isICEVote.set(false);
  }

  late final toggleAreItemsExpanded = Action(
    name: 'toggleAreItemsExpanded',
    () {
      for (final element in items) {
        element.isExpanded.set(null);
      }
      areItemsExpanded.set(!areItemsExpanded.value);
    },
  );
}

class VotingState with StoreSerde {
  @override
  final String name;

  VotingState(this.name);

  final sortedBestIds = ObsMap<int>('sortedBestIds');
  final sortedWorseIds = ObsMap<int>('sortedWorseIds');
  // final oneVsOne = ObsList<OneVsOne>('oneVsOne');
  final oneVsOneMap = ObsMap<ObservableSet<Id>>(
    'oneVsOneMap',
    serde: Serde<ObservableSet<Id>>(
      fromJson: (a) => ObservableSet.of((a as Iterable).cast<Id>()),
      toJson: (v) => v?.toList(),
    ).map(),
  );

  void addOneVsOne({required Id lower, required Id greater}) {
    runInAction(name: 'addOneVsOne', () {
      oneVsOneMap.putIfAbsent(lower, ObservableSet.new).add(greater);
      oneVsOneMap[greater]?.remove(lower);
    });
  }

  int oneVsOneComp(Id a, Id b) {
    return oneVsOneMap[a]?.contains(b) == true
        ? -1
        : oneVsOneMap[b]?.contains(a) == true
            ? 1
            : 0;
  }

  @override
  late final List<ToJson> serdeProperties = [
    sortedBestIds,
    sortedWorseIds,
    // oneVsOne,
    oneVsOneMap,
  ];
}

class VotingAssessment {
  final VotingState easiness;
  final VotingState impact;
  final VotingState confidence;
  final VotingState urgency;

  VotingAssessment({
    required this.easiness,
    required this.impact,
    required this.confidence,
    required this.urgency,
  });
}

class ItemICEAssessment with StoreSerde {
  @override
  final String name;

  final Obs<int> easiness;
  final Obs<int> impact;
  final Obs<int> confidence;
  final Obs<int> urgency;

  late final points = Computed(
    name: 'points',
    () => easiness.value + impact.value + confidence.value + urgency.value,
  );

  ItemICEAssessment(
    this.name, {
    int easiness = 0,
    int impact = 0,
    int confidence = 0,
    int urgency = 0,
  })  : easiness = Obs('easiness', easiness),
        impact = Obs('impact', impact),
        confidence = Obs('confidence', confidence),
        urgency = Obs('urgency', urgency);

  @override
  late final List<ToJson> serdeProperties = [
    easiness,
    impact,
    confidence,
    urgency,
  ];
}

class OneVsOne {
  final Id winner;
  final Id loser;

  OneVsOne({
    required this.winner,
    required this.loser,
  });
}
