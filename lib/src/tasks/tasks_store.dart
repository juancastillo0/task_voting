import 'dart:convert' show jsonEncode;

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:task_voting/src/settings/settings_service.dart';
import 'package:task_voting/src/tasks/task_model.dart';
import 'package:task_voting/src/util/converters.dart';
import 'package:task_voting/src/util/disposable.dart';
import 'package:task_voting/src/util/root_store.dart';
import 'package:task_voting/src/util/routes.dart';
import 'package:task_voting/src/util/string.dart';

part 'tasks_store.g.dart';

class TaskProjectsStore with DisposableWithSetUp {
  TaskProjectsStore(this.root);

  final RootStore root;
  final stores = ObservableMap<String, TasksStore>();

  static const ref = Ref(TaskProjectsStore.new, reCreate: false);

  final _selectedStoreId = Observable(name: 'selectedStoreId', '');

  late final selectedStore = Computed(() => stores[_selectedStoreId.value]!);

  @override
  Future<void> performSetUp() async {
    final collection = HiveCollectionKey.tasksStoreCollection;
    final keys = await collection.keys();

    final List<TasksStore?> values = await Future.wait(
      keys.map(
        (e) => collection.get(e, valueToEdit: TasksStore(root, id: e)),
      ),
    );
    runInAction(name: 'setUp', () {
      final toAdd = values.whereType<TasksStore>().toList();
      for (final store in toAdd) {
        for (final task in store.tasks) {
          task.tasksStore = store;
        }
        for (final task in store.tasksReferences.values.expand((e) => e)) {
          task.tasksStore = store;
        }
      }
      stores.addEntries(toAdd.map((e) => MapEntry(e.id, e)));
      if (toAdd.isEmpty) {
        final value = TasksStore(root);
        stores[value.id] = value;
      }
      stores.values.forEach(_setUpStore);
      _selectedStoreId.value = stores.keys.first;
    });
    final router = root.ref(AppRouterDelegate.ref);
    disposer.onDispose(reaction<TaskRouteInfo>(
      (_) => selectedStore.value.routeInfo,
      router.changeCurrentTab,
    ));
  }

  void _setUpStore(TasksStore store) {
    final collection = HiveCollectionKey.tasksStoreCollection;
    store.disposer.onDispose(
      autorun(name: 'persistTasksStore-${store.id}', delay: 3000, (_) {
        jsonEncode(store);
        return collection.set(store.id, store);
      }),
    );
  }

  Future<void> setRouteInfo(TaskRouteInfo route) async {
    await setUp();
    runInAction(name: 'setRouteInfo', () {
      if (stores.containsKey(route.projectId)) {
        _selectedStoreId.value = route.projectId!;
      }
      final selectedStore = this.selectedStore.value;
      if (route.view != null) {
        selectedStore.view = route.view!;
      }
      if (route.sort != null) {
        // TODO: set null sort?
        selectedStore.sortedBy = route.sort!;
      }
      if (route.reversed != null) {
        selectedStore.sortReversed = route.reversed!;
      }
    });
  }
}

@JsonSerializable(constructor: '_')
class TasksStore extends _TasksStore with _$TasksStore, Disposable {
  TasksStore(this.root, {String? id}) : id = id ?? randomKey();

  TasksStore._({String? id}) : id = id ?? randomKey();

  @override
  final String id;

  @JsonKey(ignore: true)
  @override
  late final RootStore root;

  static final ref = Ref(
    reCreate: true,
    (root) => root.ref(TaskProjectsStore.ref).selectedStore.value,
  );

  @override
  @ObservableListTaskConverter()
  ObservableList<Task> get tasks;
  @override
  @ObservableListTaskTagConverter()
  ObservableList<TaskTag> get tags;
  @override
  @_ObservableSubtaskReferencesConverter()
  ObservableMap<String, ObservableList<Task>> get tasksReferences;
  @override
  @ObservableSetStringConverter()
  ObservableSet<String> get selectedTagKeys;

  factory TasksStore.fromJson(Map json) => _$TasksStoreFromJson(json.cast());
  Map<String, Object?> toJson() => _$TasksStoreToJson(this);
}

abstract class _TasksStore with Store {
  RootStore get root;
  String get id;

  ObservableList<Task> tasks = ObservableList();
  ObservableList<TaskTag> tags = ObservableList();
  ObservableMap<String, ObservableList<Task>> tasksReferences = ObservableMap();
  ObservableSet<String> selectedTagKeys = ObservableSet();

  @computed
  TaskRouteInfo get routeInfo => TaskRouteInfo(
        sort: sortedBy,
        view: view,
        reversed: sortReversed,
        projectId: id,
      );

  @computed
  List<Task> get tasksWithSelectedTags => selectedTagKeys.isEmpty
      ? tasks
      : tasks
          .where((task) => task.tagIds.any(selectedTagKeys.contains))
          .toList();

  @computed
  List<Task> get sortedTasks {
    if (sortedBy == null) return tasksWithSelectedTags;
    return [...tasksWithSelectedTags]..sort(sorter);
  }

  @computed
  int Function(Task, Task) get sorter {
    final fn = sorterFor(sortedBy);
    if (sortReversed) return (a, b) => -fn(a, b);
    return fn;
  }

  static int Function(Task, Task) sorterFor(TaskSort? sortedBy) {
    if (sortedBy == null) return (a, b) => 0;

    switch (sortedBy) {
      case TaskSort.priority:
        return (a, b) {
          return b.priority - a.priority;
        };
      case TaskSort.duration:
        return (a, b) {
          return (a.minDuration.inMilliseconds + a.maxDuration.inMilliseconds) -
              (b.minDuration.inMilliseconds + b.maxDuration.inMilliseconds);
        };
      case TaskSort.weight:
        return (a, b) {
          return (b.minWeight + b.maxWeight) - (a.minWeight + a.maxWeight);
        };
      case TaskSort.date:
        return (a, b) {
          return (a.deliveryDate?.millisecondsSinceEpoch ?? 1e14.round()) -
              (b.deliveryDate?.millisecondsSinceEpoch ?? 1e14.round());
        };
    }
  }

  @computed
  List<TaskTag> get selectedTags {
    final map = tagsMap;
    return selectedTagKeys.map((t) => map[t]!).toList();
  }

  @computed
  List<TaskTag> get filteredTags {
    if (editingTag.name.trim().isEmpty) return tags;
    return tags.where((tag) => tag.name.contains(editingTag.name)).toList();
  }

  @observable
  double hoursPerDay = 5.0;

  @observable
  TaskSort? sortedBy;
  @observable
  bool sortReversed = false;

  @observable
  TaskView view = TaskView.list;

  @observable
  bool useUncertainty = false;

  @computed
  Map<String, TaskTag> get tagsMap =>
      Map.fromEntries(tags.map((t) => MapEntry(t.key, t)));

  @observable
  TaskTag editingTag = TaskTag();

  @computed
  EditingTagError? get editingTagError {
    final name = editingTag.name.trim();
    if (name.isEmpty) return EditingTagError.empty;
    return tags.any((tag) => tag.name == name)
        ? EditingTagError.notUnique
        : null;
  }

  @action
  void addTask() {
    tasks.add(Task(this as TasksStore));
  }

  @action
  void addTag() {
    if (editingTagError != null) return;
    editingTag.name = editingTag.name.trim();
    tags.add(editingTag);
    editingTag = TaskTag();
  }

  @action
  void clearAllSelectedTags() {
    selectedTagKeys.clear();
  }

  @action
  void toggleTagForFilter(TaskTag tag) {
    if (!selectedTagKeys.remove(tag.key)) {
      selectedTagKeys.add(tag.key);
    }
  }

  @action
  void deleteTag(TaskTag tag) {
    selectedTagKeys.remove(tag.key);
    tags.remove(tag);
    for (final task
        in tasks.followedBy(tasksReferences.values.expand((e) => e))) {
      task.tagIds.remove(tag.key);
    }
  }

  @action
  bool removeTask(
    Task task, {
    bool removeChildren = true,
  }) {
    final children = tasksReferences[task.id];
    if (children != null) {
      for (final child in children) {
        if (removeChildren) {
          removeTask(child, removeChildren: true);
        }
        child.parentTaskId = null;
      }
    }

    if (task.parentTaskId != null) {
      final children = tasksReferences.update(
        task.parentTaskId!,
        (value) {
          value.remove(task);
          return value;
        },
      );
      if (children.isEmpty) {
        tasksReferences.remove(task.parentTaskId);
      }
    }
    return tasks.remove(task);
  }

  @action
  Task addChildTask(Task parentTask) {
    final childTask = Task(this as TasksStore);
    childTask.parentTaskId = parentTask.id;

    tasksReferences.update(
      parentTask.id,
      (value) {
        value.add(childTask);
        return value;
      },
      ifAbsent: () => ObservableList.of([childTask]),
    );
    // tasks.add(childTask);

    return childTask;
  }

  List<Task> childTasks(Task parentTask) =>
      tasksReferences[parentTask.id] ?? [];
}

class TaskController {
  final TasksStore store;
  final Task task;
  final childTasks = ObservableList<Task>();

  TaskController(
    this.store,
    this.task,
  );
}

enum TaskView {
  list,
  sequence,
  week,
  month,
}

enum TaskSort {
  priority,
  weight,
  date,
  duration,
}

enum EditingTagError {
  empty,
  notUnique,
}

@JsonSerializable()
class TaskTag extends _TaskTag with _$TaskTag {
  TaskTag({String? key}) : key = key ?? randomKey();

  @override
  final String key;

  factory TaskTag.fromJson(Map json) => _$TaskTagFromJson(json.cast());
  Map<String, Object?> toJson() => _$TaskTagToJson(this);
}

abstract class _TaskTag with Store {
  String get key;

  @observable
  String name = '';
}

class ObservableListTaskTagConverter
    implements JsonConverter<ObservableList<TaskTag>, List<Object?>> {
  const ObservableListTaskTagConverter();
  @override
  ObservableList<TaskTag> fromJson(List<Object?> json) =>
      ObservableList<TaskTag>.of(
          json.map((v) => TaskTag.fromJson((v as Map).cast())));

  @override
  List<Object?> toJson(ObservableList<TaskTag> object) =>
      object.map((t) => t.toJson()).toList();
}

class _ObservableSubtaskReferencesConverter
    implements
        JsonConverter<ObservableMap<String, ObservableList<Task>>,
            Map<String, Object?>> {
  const _ObservableSubtaskReferencesConverter();
  @override
  ObservableMap<String, ObservableList<Task>> fromJson(
    Map<String, Object?> json,
  ) =>
      ObservableMap<String, ObservableList<Task>>.of(
        json.map((k, v) => MapEntry(
              k,
              const ObservableListTaskConverter().fromJson((v as List).cast()),
            )),
      );

  @override
  Map<String, Object?> toJson(
          ObservableMap<String, ObservableList<Task>> object) =>
      object.map((k, v) => MapEntry(
            k,
            v.map((e) => e.toJson()).toList(),
          ));
}
