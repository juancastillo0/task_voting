// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksStore _$TasksStoreFromJson(Map<String, dynamic> json) => TasksStore._(
      id: json['id'] as String?,
    )
      ..hoursPerDay = (json['hoursPerDay'] as num).toDouble()
      ..sortedBy = $enumDecodeNullable(_$TaskSortEnumMap, json['sortedBy'])
      ..sortReversed = json['sortReversed'] as bool
      ..view = $enumDecode(_$TaskViewEnumMap, json['view'])
      ..useUncertainty = json['useUncertainty'] as bool
      ..editingTag =
          TaskTag.fromJson(json['editingTag'] as Map<String, dynamic>)
      ..tasks =
          const ObservableListTaskConverter().fromJson(json['tasks'] as List)
      ..tags =
          const ObservableListTaskTagConverter().fromJson(json['tags'] as List)
      ..tasksReferences = const _ObservableSubtaskReferencesConverter()
          .fromJson(json['tasksReferences'] as Map<String, Object?>)
      ..selectedTagKeys = const ObservableSetStringConverter()
          .fromJson(json['selectedTagKeys'] as List);

Map<String, dynamic> _$TasksStoreToJson(TasksStore instance) =>
    <String, dynamic>{
      'hoursPerDay': instance.hoursPerDay,
      'sortedBy': _$TaskSortEnumMap[instance.sortedBy],
      'sortReversed': instance.sortReversed,
      'view': _$TaskViewEnumMap[instance.view]!,
      'useUncertainty': instance.useUncertainty,
      'editingTag': instance.editingTag,
      'id': instance.id,
      'tasks': const ObservableListTaskConverter().toJson(instance.tasks),
      'tags': const ObservableListTaskTagConverter().toJson(instance.tags),
      'tasksReferences': const _ObservableSubtaskReferencesConverter()
          .toJson(instance.tasksReferences),
      'selectedTagKeys':
          const ObservableSetStringConverter().toJson(instance.selectedTagKeys),
    };

const _$TaskSortEnumMap = {
  TaskSort.priority: 'priority',
  TaskSort.weight: 'weight',
  TaskSort.date: 'date',
  TaskSort.duration: 'duration',
};

const _$TaskViewEnumMap = {
  TaskView.list: 'list',
  TaskView.sequence: 'sequence',
  TaskView.week: 'week',
  TaskView.month: 'month',
};

TaskTag _$TaskTagFromJson(Map<String, dynamic> json) => TaskTag(
      key: json['key'] as String?,
    )..name = json['name'] as String;

Map<String, dynamic> _$TaskTagToJson(TaskTag instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStore, Store {
  Computed<List<Task>>? _$tasksWithSelectedTagsComputed;

  @override
  List<Task> get tasksWithSelectedTags => (_$tasksWithSelectedTagsComputed ??=
          Computed<List<Task>>(() => super.tasksWithSelectedTags,
              name: '_TasksStore.tasksWithSelectedTags'))
      .value;
  Computed<List<Task>>? _$sortedTasksComputed;

  @override
  List<Task> get sortedTasks =>
      (_$sortedTasksComputed ??= Computed<List<Task>>(() => super.sortedTasks,
              name: '_TasksStore.sortedTasks'))
          .value;
  Computed<int Function(Task, Task)>? _$sorterComputed;

  @override
  int Function(Task, Task) get sorter => (_$sorterComputed ??=
          Computed<int Function(Task, Task)>(() => super.sorter,
              name: '_TasksStore.sorter'))
      .value;
  Computed<List<TaskTag>>? _$selectedTagsComputed;

  @override
  List<TaskTag> get selectedTags => (_$selectedTagsComputed ??=
          Computed<List<TaskTag>>(() => super.selectedTags,
              name: '_TasksStore.selectedTags'))
      .value;
  Computed<List<TaskTag>>? _$filteredTagsComputed;

  @override
  List<TaskTag> get filteredTags => (_$filteredTagsComputed ??=
          Computed<List<TaskTag>>(() => super.filteredTags,
              name: '_TasksStore.filteredTags'))
      .value;
  Computed<Map<String, TaskTag>>? _$tagsMapComputed;

  @override
  Map<String, TaskTag> get tagsMap =>
      (_$tagsMapComputed ??= Computed<Map<String, TaskTag>>(() => super.tagsMap,
              name: '_TasksStore.tagsMap'))
          .value;
  Computed<EditingTagError?>? _$editingTagErrorComputed;

  @override
  EditingTagError? get editingTagError => (_$editingTagErrorComputed ??=
          Computed<EditingTagError?>(() => super.editingTagError,
              name: '_TasksStore.editingTagError'))
      .value;

  late final _$hoursPerDayAtom =
      Atom(name: '_TasksStore.hoursPerDay', context: context);

  @override
  double get hoursPerDay {
    _$hoursPerDayAtom.reportRead();
    return super.hoursPerDay;
  }

  @override
  set hoursPerDay(double value) {
    _$hoursPerDayAtom.reportWrite(value, super.hoursPerDay, () {
      super.hoursPerDay = value;
    });
  }

  late final _$sortedByAtom =
      Atom(name: '_TasksStore.sortedBy', context: context);

  @override
  TaskSort? get sortedBy {
    _$sortedByAtom.reportRead();
    return super.sortedBy;
  }

  @override
  set sortedBy(TaskSort? value) {
    _$sortedByAtom.reportWrite(value, super.sortedBy, () {
      super.sortedBy = value;
    });
  }

  late final _$sortReversedAtom =
      Atom(name: '_TasksStore.sortReversed', context: context);

  @override
  bool get sortReversed {
    _$sortReversedAtom.reportRead();
    return super.sortReversed;
  }

  @override
  set sortReversed(bool value) {
    _$sortReversedAtom.reportWrite(value, super.sortReversed, () {
      super.sortReversed = value;
    });
  }

  late final _$viewAtom = Atom(name: '_TasksStore.view', context: context);

  @override
  TaskView get view {
    _$viewAtom.reportRead();
    return super.view;
  }

  @override
  set view(TaskView value) {
    _$viewAtom.reportWrite(value, super.view, () {
      super.view = value;
    });
  }

  late final _$useUncertaintyAtom =
      Atom(name: '_TasksStore.useUncertainty', context: context);

  @override
  bool get useUncertainty {
    _$useUncertaintyAtom.reportRead();
    return super.useUncertainty;
  }

  @override
  set useUncertainty(bool value) {
    _$useUncertaintyAtom.reportWrite(value, super.useUncertainty, () {
      super.useUncertainty = value;
    });
  }

  late final _$editingTagAtom =
      Atom(name: '_TasksStore.editingTag', context: context);

  @override
  TaskTag get editingTag {
    _$editingTagAtom.reportRead();
    return super.editingTag;
  }

  @override
  set editingTag(TaskTag value) {
    _$editingTagAtom.reportWrite(value, super.editingTag, () {
      super.editingTag = value;
    });
  }

  late final _$_TasksStoreActionController =
      ActionController(name: '_TasksStore', context: context);

  @override
  void addTask() {
    final _$actionInfo =
        _$_TasksStoreActionController.startAction(name: '_TasksStore.addTask');
    try {
      return super.addTask();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTag() {
    final _$actionInfo =
        _$_TasksStoreActionController.startAction(name: '_TasksStore.addTag');
    try {
      return super.addTag();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllSelectedTags() {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.clearAllSelectedTags');
    try {
      return super.clearAllSelectedTags();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTagForFilter(TaskTag tag) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.toggleTagForFilter');
    try {
      return super.toggleTagForFilter(tag);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTag(TaskTag tag) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.deleteTag');
    try {
      return super.deleteTag(tag);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool removeTask(Task task, {bool removeChildren = true}) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.removeTask');
    try {
      return super.removeTask(task, removeChildren: removeChildren);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Task addChildTask(Task parentTask) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.addChildTask');
    try {
      return super.addChildTask(parentTask);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hoursPerDay: ${hoursPerDay},
sortedBy: ${sortedBy},
sortReversed: ${sortReversed},
view: ${view},
useUncertainty: ${useUncertainty},
editingTag: ${editingTag},
tasksWithSelectedTags: ${tasksWithSelectedTags},
sortedTasks: ${sortedTasks},
sorter: ${sorter},
selectedTags: ${selectedTags},
filteredTags: ${filteredTags},
tagsMap: ${tagsMap},
editingTagError: ${editingTagError}
    ''';
  }
}

mixin _$TaskTag on _TaskTag, Store {
  late final _$nameAtom = Atom(name: '_TaskTag.name', context: context);

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

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
