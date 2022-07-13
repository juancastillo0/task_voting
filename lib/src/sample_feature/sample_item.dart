import 'package:file_system_access/file_system_access.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import 'package:task_voting/src/notifiers/app_notifier.dart';

/// A placeholder class that represents an entity or model.
class SampleItem {
  const SampleItem(this.id);

  final Id id;

  final String title = '';
  final String? image = null;
  final String? description = null;

  final List<String>? additionalImages = null;
  final List<String>? pros = null;
  final List<String>? cons = null;
}

typedef Id = int;

class Disposer implements Disposable {
  List<void Function()> _disposeCallbacks = [];
  bool isDisposed = false;

  void onDispose(void Function() callback) {
    _disposeCallbacks.add(callback);
  }

  @override
  Disposer get disposer => this;

  @override
  void dispose() {
    if (isDisposed) return;
    isDisposed = true;
    while (_disposeCallbacks.isNotEmpty) {
      final prev = _disposeCallbacks;
      _disposeCallbacks = [];
      for (final c in prev) {
        c();
      }
    }
  }
}

mixin Disposable {
  final disposer = Disposer();

  @mustCallSuper
  void dispose() {
    disposer.dispose();
  }
}

class ChoicesStore with Disposable {
  ChoicesStore() {
    _setUp();
    addChoice();
  }

  void _setUp() {
    disposer.onDispose(
      reaction<Set<int>>(
        (_) => items.map((element) => element.id).toSet(),
        (keys) {
          simpleVotes.oneVsOne.removeWhere(
            (e) => !keys.contains(e.loser) || !keys.contains(e.winner),
          );
          simpleVotes.sortedBestIds.removeWhere(
            (k, _) => !keys.contains(k),
          );
          simpleVotes.sortedWorseIds.removeWhere(
            (k, _) => !keys.contains(k),
          );
        },
        equals: (p0, p1) =>
            p0 == p1 ||
            (p0?.length == p1?.length && p0!.difference(p1!).isEmpty),
      ),
    );
  }

  int _maxId = 0;

  final items = ObservableList<SampleItemEditable>();
  final simpleVotes = VotingState();
  final areItemsExpanded = Obs('areItemsExpanded', true);
  final isICEVote = Obs('isICEVote', true);
  final isCreatingItems = Obs('isCreatingItems', true);

  late final sortedRaked = Obs<List<SampleItemEditable>>('sortedRaked', []);

  void computeRanked() {
    final list = [...items]..sort(
        (a, b) => b.rankingPoints.value - a.rankingPoints.value,
      );
    sortedRaked.set(list);
  }

  final sortedTableIndex = Obs<int?>('sortedTableIndex', null);

  late final sortedTableList =
      Computed<List<SampleItemEditable>>(name: 'sortedTableList', () {
    final index = sortedTableIndex.value;
    if (index == null) return items;
    Comparable field(SampleItemEditable a) {
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
  });

  void sortCallback(int index, bool ascending) {
    final newValue = ascending
        ? sortedTableIndex.value == -index
            ? null
            : index
        : -index;
    print('index $index ascending $ascending newValue $newValue');
    sortedTableIndex.set(newValue);
  }

  void addChoice() {
    items.add(SampleItemEditable(++_maxId));
  }

  void toggleIsCreatingItems() {
    isCreatingItems.set(!isCreatingItems.value);
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

class SampleItemEditable {
  SampleItemEditable(this.id);

  final Id id;

  final Obs<String> title = Obs('title', '');
  final Obs<ImageValue?> image = Obs('image', null);
  final Obs<String?> description = Obs('description', null);

  final Obs<List<ImageValue>?> additionalImages = Obs('additionalImages', null);
  final ObservableList<String> pros = ObservableList(name: 'pros');
  final ObservableList<String> cons = ObservableList(name: 'cons');

  final isExpanded = Obs<bool?>('areItemsExpanded', null);

  late final iceAssessment = ItemICEAssessment(info: this);
  final rankingPoints = Obs('rankingPoints', 0);

  void selectImages() async {
    final images = await FileSystem.instance.showOpenFilePicker(
      multiple: true,
      types: const [
        FilePickerAcceptType(
          description: 'Images',
          accept: {
            'image/*': ['*']
          },
        )
      ],
    );
    runInAction(name: 'selectImage', () {
      if (images.isNotEmpty) {
        image.set(ImageValue(file: images.first));
        if (images.length > 1) {
          additionalImages.set(
            images.skip(1).map((e) => ImageValue(file: e)).toList(),
          );
        } else {
          additionalImages.set(null);
        }
      }
    });
  }

  void removeImages() {
    image.set(null);
    additionalImages.set(null);
  }
}

class ImageValue {
  final String? url;
  final FileSystemFileHandle? file;

  ImageValue({
    this.url,
    this.file,
  });
}

class VotingState {
  final sortedBestIds = ObservableMap<Id, int>();
  final sortedWorseIds = ObservableMap<Id, int>();
  final oneVsOne = ObservableList<OneVsOne>();

  VotingState();
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

class ItemICEAssessment {
  final SampleItemEditable info;
  final Obs<int> easiness;
  final Obs<int> impact;
  final Obs<int> confidence;
  final Obs<int> urgency;

  late final points = Computed(
    name: 'points',
    () => easiness.value + impact.value + confidence.value + urgency.value,
  );

  ItemICEAssessment({
    required this.info,
    int easiness = 0,
    int impact = 0,
    int confidence = 0,
    int urgency = 0,
  })  : easiness = Obs('easiness', easiness),
        impact = Obs('impact', impact),
        confidence = Obs('confidence', confidence),
        urgency = Obs('urgency', urgency);
}

class OneVsOne {
  final Id winner;
  final Id loser;

  OneVsOne({
    required this.winner,
    required this.loser,
  });
}
