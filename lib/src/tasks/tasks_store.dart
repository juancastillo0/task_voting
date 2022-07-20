import 'package:mobx/mobx.dart';
import 'package:task_voting/src/tasks/task_model.dart';
import 'package:task_voting/src/util/disposable.dart';
import 'package:task_voting/src/util/root_store.dart';
import 'package:task_voting/src/util/string.dart';

part 'tasks_store.g.dart';

class TasksStore extends _TasksStore with _$TasksStore, Disposable {
  TasksStore(this.root);
  @override
  final RootStore root;

  static const ref = Ref(TasksStore.new);
}

abstract class _TasksStore with Store {
  RootStore get root;

  final tasks = ObservableList<Task>();
  final tags = ObservableList<TaskTag>();
  final tasksReferences = ObservableMap<String, ObservableList<Task>>();

  final selectedTagKeys = ObservableSet<String>();

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
  String get editingTagError {
    final name = editingTag.name.trim();
    // TODO: localize
    if (name.isEmpty) return 'Tag name should not be empty.';
    return tags.any((tag) => tag.name == name)
        ? 'Tag name "${name}" should be unique.'
        : '';
  }

  @action
  void addTask() {
    tasks.add(Task(this as TasksStore));
  }

  @action
  void addTag() {
    if (editingTagError.isNotEmpty) return;
    editingTag.name = editingTag.name.trim();
    tags.add(editingTag);
    editingTag = TaskTag();
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

class TaskTag extends _TaskTag with _$TaskTag {}

abstract class _TaskTag with Store {
  _TaskTag({String? key}) : key = key ?? randomString(32);

  final String key;

  @observable
  String name = '';
}
