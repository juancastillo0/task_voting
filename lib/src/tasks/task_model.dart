// import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/util/root_store.dart';
import 'package:task_voting/src/util/string.dart';
import 'package:valida/valida.dart';

part 'task_model.g.dart';

@Valida(nullableErrorLists: true)
// @JsonSerializable()
class Task extends _Task with _$Task {
  Task(this.root, {String? id}) : id = id ?? randomString(32);

  final RootStore root;

  @override
  final String id;

  // factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
  // Map<String, Object?> toJson() => _$TaskToJson(this);
}

abstract class _Task with Store {
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
    final tasksSameName = root.ref(TasksStore.ref).tasks.where(
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
}
