import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/util/converters.dart';
import 'package:task_voting/src/util/root_store.dart';
import 'package:task_voting/src/util/string.dart';
import 'package:valida/valida.dart';

part 'task_model.g.dart';

@Valida(nullableErrorLists: true)
@JsonSerializable(constructor: '_')
class Task extends _Task with _$Task {
  Task(this.tasksStore, {String? id}) : id = id ?? randomKey();

  Task._({String? id}) : id = id ?? randomKey();

  @override
  @JsonKey(ignore: true)
  late final TasksStore tasksStore;

  @override
  RootStore get root => tasksStore.root;

  @override
  final String id;

  @override
  @ObservableSetStringConverter()
  ObservableSet<String> get tagIds;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
  Map<String, Object?> toJson() => _$TaskToJson(this);
}

abstract class _Task with Store {
  TasksStore get tasksStore;

  RootStore get root;

  String get id;

  @observable
  String? parentTaskId;

  @observable
  String name = '';

  @observable
  String description = '';

  @ValidaDuration(
    comp: ValidaComparison(
      moreEq: CompVal(Duration(minutes: 5)),
      lessEq: CompVal.list([
        CompVal(Duration(days: 4)),
        CompVal.ref('maxDuration'),
      ]),
    ),
  )
  @observable
  Duration minDuration = const Duration(hours: 2);

  @ValidaDuration(
    comp: ValidaComparison(
      moreEq: CompVal(Duration(minutes: 5)),
      lessEq: CompVal(Duration(days: 4)),
    ),
  )
  @observable
  Duration maxDuration = const Duration(hours: 6);

  @observable
  DateTime? deliveryDate;

  @observable
  bool showFieldsOwn = true;

  @ValidaFunction()
  List<ValidaError> _validateTask() {
    final tasksSameName = tasksStore.tasks.where(
      (t) => t.name == name,
    );
    return [
      if (tasksSameName.length > 1)
        ValidaError(
          errorCode: 'Task.duplicateName',
          message: 'Can\'t have tasks with duplicate names: "${name}"',
          property: 'name',
          value: name,
        )
    ];
  }

  late final validation = Computed<TaskValidation>(() {
    return TaskValidation.fromValue(this as Task);
  }, name: 'validation');

  @ValidaNum(
    comp: ValidaComparison(
      moreEq: CompVal(0),
      lessEq: CompVal.list([CompVal(100), CompVal.ref('maxWeight')]),
    ),
  )
  @observable
  int minWeight = 21;

  @ValidaNum(
    comp: ValidaComparison(
      moreEq: CompVal(0),
      lessEq: CompVal(100),
    ),
  )
  @observable
  int maxWeight = 34;

  @observable
  ObservableSet<String> tagIds = ObservableSet();

  @action
  void selectTag(TaskTag tag) {
    if (!tagIds.remove(tag.key)) {
      tagIds.add(tag.key);
    }
  }

  @computed
  List<TaskTag> get tags {
    final tagsMap = tasksStore.tagsMap;
    return tagIds
        .map<TaskTag?>((e) => tagsMap[e])
        .whereType<TaskTag>()
        .toList();
  }

  @computed
  int get priority {
    final meanWeight = (minWeight + maxWeight) / 2;
    final meanMillis =
        (minDuration.inMilliseconds + maxDuration.inMilliseconds) / 2;

    double uncertainty = (maxWeight - minWeight) / meanWeight;
    final uncertaintyMillis =
        (maxDuration.inMilliseconds - minDuration.inMilliseconds) / meanMillis;
    uncertainty += uncertaintyMillis;
    final p = meanWeight +
        10 / uncertainty +
        const Duration(days: 7 * 2).inMilliseconds / meanMillis;
    return p.round();
  }
}

class ObservableListTaskConverter
    implements JsonConverter<ObservableList<Task>, List<Object?>> {
  const ObservableListTaskConverter();
  @override
  ObservableList<Task> fromJson(List<Object?> json) => ObservableList<Task>.of(
      json.map((t) => Task.fromJson((t as Map).cast())));

  @override
  List<Object?> toJson(ObservableList<Task> object) =>
      object.map((t) => t.toJson()).toList();
}
