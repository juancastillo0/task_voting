// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task._(
      id: json['id'] as String?,
    )
      ..parentTaskId = json['parentTaskId'] as String?
      ..name = json['name'] as String
      ..description = json['description'] as String
      ..minDuration = Duration(microseconds: json['minDuration'] as int)
      ..maxDuration = Duration(microseconds: json['maxDuration'] as int)
      ..deliveryDate = json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String)
      ..showFieldsOwn = json['showFieldsOwn'] as bool
      ..minWeight = json['minWeight'] as int
      ..maxWeight = json['maxWeight'] as int
      ..tagIds =
          const ObservableSetStringConverter().fromJson(json['tagIds'] as List);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'parentTaskId': instance.parentTaskId,
      'name': instance.name,
      'description': instance.description,
      'minDuration': instance.minDuration.inMicroseconds,
      'maxDuration': instance.maxDuration.inMicroseconds,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'showFieldsOwn': instance.showFieldsOwn,
      'minWeight': instance.minWeight,
      'maxWeight': instance.maxWeight,
      'id': instance.id,
      'tagIds': const ObservableSetStringConverter().toJson(instance.tagIds),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on _Task, Store {
  Computed<List<TaskTag>>? _$tagsComputed;

  @override
  List<TaskTag> get tags => (_$tagsComputed ??=
          Computed<List<TaskTag>>(() => super.tags, name: '_Task.tags'))
      .value;
  Computed<int>? _$priorityComputed;

  @override
  int get priority => (_$priorityComputed ??=
          Computed<int>(() => super.priority, name: '_Task.priority'))
      .value;

  late final _$parentTaskIdAtom =
      Atom(name: '_Task.parentTaskId', context: context);

  @override
  String? get parentTaskId {
    _$parentTaskIdAtom.reportRead();
    return super.parentTaskId;
  }

  @override
  set parentTaskId(String? value) {
    _$parentTaskIdAtom.reportWrite(value, super.parentTaskId, () {
      super.parentTaskId = value;
    });
  }

  late final _$nameAtom = Atom(name: '_Task.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_Task.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$minDurationAtom =
      Atom(name: '_Task.minDuration', context: context);

  @override
  Duration get minDuration {
    _$minDurationAtom.reportRead();
    return super.minDuration;
  }

  @override
  set minDuration(Duration value) {
    _$minDurationAtom.reportWrite(value, super.minDuration, () {
      super.minDuration = value;
    });
  }

  late final _$maxDurationAtom =
      Atom(name: '_Task.maxDuration', context: context);

  @override
  Duration get maxDuration {
    _$maxDurationAtom.reportRead();
    return super.maxDuration;
  }

  @override
  set maxDuration(Duration value) {
    _$maxDurationAtom.reportWrite(value, super.maxDuration, () {
      super.maxDuration = value;
    });
  }

  late final _$deliveryDateAtom =
      Atom(name: '_Task.deliveryDate', context: context);

  @override
  DateTime? get deliveryDate {
    _$deliveryDateAtom.reportRead();
    return super.deliveryDate;
  }

  @override
  set deliveryDate(DateTime? value) {
    _$deliveryDateAtom.reportWrite(value, super.deliveryDate, () {
      super.deliveryDate = value;
    });
  }

  late final _$showFieldsOwnAtom =
      Atom(name: '_Task.showFieldsOwn', context: context);

  @override
  bool get showFieldsOwn {
    _$showFieldsOwnAtom.reportRead();
    return super.showFieldsOwn;
  }

  @override
  set showFieldsOwn(bool value) {
    _$showFieldsOwnAtom.reportWrite(value, super.showFieldsOwn, () {
      super.showFieldsOwn = value;
    });
  }

  late final _$minWeightAtom = Atom(name: '_Task.minWeight', context: context);

  @override
  int get minWeight {
    _$minWeightAtom.reportRead();
    return super.minWeight;
  }

  @override
  set minWeight(int value) {
    _$minWeightAtom.reportWrite(value, super.minWeight, () {
      super.minWeight = value;
    });
  }

  late final _$maxWeightAtom = Atom(name: '_Task.maxWeight', context: context);

  @override
  int get maxWeight {
    _$maxWeightAtom.reportRead();
    return super.maxWeight;
  }

  @override
  set maxWeight(int value) {
    _$maxWeightAtom.reportWrite(value, super.maxWeight, () {
      super.maxWeight = value;
    });
  }

  late final _$tagIdsAtom = Atom(name: '_Task.tagIds', context: context);

  @override
  ObservableSet<String> get tagIds {
    _$tagIdsAtom.reportRead();
    return super.tagIds;
  }

  @override
  set tagIds(ObservableSet<String> value) {
    _$tagIdsAtom.reportWrite(value, super.tagIds, () {
      super.tagIds = value;
    });
  }

  late final _$_TaskActionController =
      ActionController(name: '_Task', context: context);

  @override
  void selectTag(TaskTag tag) {
    final _$actionInfo =
        _$_TaskActionController.startAction(name: '_Task.selectTag');
    try {
      return super.selectTag(tag);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
parentTaskId: ${parentTaskId},
name: ${name},
description: ${description},
minDuration: ${minDuration},
maxDuration: ${maxDuration},
deliveryDate: ${deliveryDate},
showFieldsOwn: ${showFieldsOwn},
minWeight: ${minWeight},
maxWeight: ${maxWeight},
tagIds: ${tagIds},
tags: ${tags},
priority: ${priority}
    ''';
  }
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

enum TaskField {
  minDuration,
  maxDuration,
  minWeight,
  maxWeight,

  $global
}

class TaskValidationFields {
  const TaskValidationFields(this.errorsMap);
  final Map<TaskField, List<ValidaError>> errorsMap;

  List<ValidaError>? get minDuration => errorsMap[TaskField.minDuration];
  List<ValidaError>? get maxDuration => errorsMap[TaskField.maxDuration];
  List<ValidaError>? get minWeight => errorsMap[TaskField.minWeight];
  List<ValidaError>? get maxWeight => errorsMap[TaskField.maxWeight];
  List<ValidaError>? get $global => errorsMap[TaskField.$global];
}

class TaskValidation extends Validation<Task, TaskField> {
  TaskValidation(this.errorsMap, this.value)
      : fields = TaskValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<TaskField, List<ValidaError>> errorsMap;
  @override
  final Task value;
  @override
  final TaskValidationFields fields;

  /// Validates [value] and returns a [TaskValidation] with the errors found as a result
  factory TaskValidation.fromValue(Task value) => spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: GlobalValidateFunc(
      function: _globalValidate,
      field: TaskField.$global,
    ),
    validationFactory: TaskValidation.new,
    getField: _getField,
    fieldsMap: {
      TaskField.minDuration: ValidaDuration(
          comp: ValidaComparison(
              moreEq: CompVal(Duration(minutes: 5)),
              lessEq: CompVal.list(
                  [CompVal(Duration(days: 4)), CompVal.ref('maxDuration')]))),
      TaskField.maxDuration: ValidaDuration(
          comp: ValidaComparison(
              moreEq: CompVal(Duration(minutes: 5)),
              lessEq: CompVal(Duration(days: 4)))),
      TaskField.minWeight: ValidaNum(
          comp: ValidaComparison(
              moreEq: CompVal(0),
              lessEq: CompVal.list([CompVal(100), CompVal.ref('maxWeight')]))),
      TaskField.maxWeight: ValidaNum(
          comp: ValidaComparison(moreEq: CompVal(0), lessEq: CompVal(100))),
    },
  );

  static List<ValidaError> _globalValidate(Task value) => [
        ...value._validateTask(),
      ];

  static Object? _getField(Task value, String field) {
    switch (field) {
      case 'tasksStore':
        return value.tasksStore;
      case 'id':
        return value.id;
      case 'root':
        return value.root;
      case 'tagIds':
        return value.tagIds;
      case 'parentTaskId':
        return value.parentTaskId;
      case 'name':
        return value.name;
      case 'description':
        return value.description;
      case 'minDuration':
        return value.minDuration;
      case 'maxDuration':
        return value.maxDuration;
      case 'deliveryDate':
        return value.deliveryDate;
      case 'showFieldsOwn':
        return value.showFieldsOwn;
      case 'validation':
        return value.validation;
      case 'minWeight':
        return value.minWeight;
      case 'maxWeight':
        return value.maxWeight;
      case 'tags':
        return value.tags;
      case 'priority':
        return value.priority;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}
