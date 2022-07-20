import 'package:stack_portal/fields.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/tasks/tags_dialog.dart';
import 'package:task_voting/src/tasks/task_model.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';

class TaskItem extends StatelessObserverWidget {
  const TaskItem({
    Key? key,
    required this.task,
    this.showFields,
  }) : super(key: key);

  final Task task;
  final bool? showFields;

  @override
  Widget build(BuildContext context) {
    final store = context.ref(TasksStore.ref);
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;
    final _showFields =
        task.showFieldsOwn && showFields == null || showFields == true;

    final validation = task.validation.value;
    return Theme(
      data: theme.copyWith(
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          errorStyle: const TextStyle(height: 0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.drag_indicator),
                  IconButton(
                    onPressed: () {
                      task.showFieldsOwn = !task.showFieldsOwn;
                    },
                    icon: AnimatedRotation(
                      turns: _showFields ? 0.5 : 0.75,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInCubic,
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  store.removeTask(task);
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: ErrorOverlay(
                  error: (() {
                    final err = validation.errorsMap[TaskField.$global]
                        ?.map((e) => e.message)
                        .join();
                    return err?.isNotEmpty == true ? err : null;
                  })(),
                  child: TextFormField(
                    initialValue: task.name,
                    decoration: InputDecoration(
                      errorText: (() {
                        return validation
                                    .errorsMap[TaskField.$global]?.isNotEmpty ==
                                true
                            ? ''
                            : null;
                      })(),
                      errorMaxLines: 2,
                      labelText: loc.tasksTaskName,
                    ),
                    onChanged: (name) {
                      task.name = name;
                    },
                  ),
                ),
              ),
              SizedBox(
                  width: 100,
                  child: IntInput(
                    label: loc.tasksTaskMinWeight,
                    value: task.minWeight,
                    error: (() {
                      if (validation.fields.minWeight == null) return null;
                      final err = validation.fields.minWeight!
                          .map((e) => e.message)
                          .join(', ');
                      return err.isEmpty ? null : err;
                    })(),
                    onChanged: (v) {
                      if (v != null) {
                        task.minWeight = v;
                      }
                    },
                  )
                  // TextFormField(
                  //   initialValue: task.minWeight.toString(),
                  //   decoration: InputDecoration(
                  //     errorText: (() {
                  //       final err = validation.fields.minWeight
                  //           .map((e) => e.message)
                  //           .join();
                  //       return err.isEmpty ? null : err;
                  //     })(),
                  //     errorMaxLines: 2,
                  //     labelText: 'minWeight',
                  //   ),
                  //   onChanged: (minWeight) {
                  //     final v = int.tryParse(minWeight);
                  //     if (v != null) {
                  //       task.minWeight = v;
                  //     }
                  //   },
                  // ),
                  ),
              SizedBox(
                width: 80,
                child: TextFormField(
                  initialValue: task.maxWeight.toString(),
                  decoration: InputDecoration(
                    errorText: (() {
                      if (validation.fields.maxWeight == null) return null;
                      final err = validation.fields.maxWeight!
                          .map((e) => e.message)
                          .join();
                      return err.isEmpty ? null : err;
                    })(),
                    errorMaxLines: 2,
                    labelText: loc.tasksTaskMaxWeight,
                  ),
                  validator: (v) {
                    if (v != null) {
                      final p = int.tryParse(v);
                      return p == null ? 'invalid integer' : null;
                    }
                  },
                  onChanged: (maxWeight) {
                    final v = int.tryParse(maxWeight);
                    if (v != null) {
                      task.maxWeight = v;
                    }
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(
                    builder: (context) {
                      return DurationInputButton(
                        title: loc.tasksTaskMinDuration,
                        duration: task.minDuration,
                        onChanged: (dur) {
                          task.minDuration = dur;
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  Observer(
                    builder: (context) {
                      return DurationInputButton(
                        title: loc.tasksTaskMaxDuration,
                        duration: task.maxDuration,
                        onChanged: (dur) {
                          task.maxDuration = dur;
                        },
                      );
                    },
                  ),
                ],
              ),
              Observer(
                builder: (context) {
                  return DateInput(
                    title: loc.tasksTaskDueDate,
                    date: task.deliveryDate,
                    firstDate: DateTime.now().add(const Duration(days: -1)),
                    lastDate: DateTime.now().add(const Duration(days: 366)),
                    onChanged: OnChange.opt((result) {
                      task.deliveryDate = result;
                    }),
                  );
                },
              ),
              SizedBox(
                width: 400,
                height: 80,
                child: TextFormField(
                  initialValue: task.description,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    labelText: loc.tasksTaskDescription,
                  ),
                  onChanged: (description) {
                    task.description = description;
                  },
                ),
              ),
              SizedBox(
                width: 400,
                height: 80,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                TaskTagList(
                                  selected: task.tagIds,
                                  onSelect: task.selectTag,
                                ),
                                Align(
                                  child: OutlinedButton(
                                    onPressed: Navigator.of(context).pop,
                                    child: Text(loc.close),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(loc.tasksEditTags),
                    ),
                    if (task.tags.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(loc.tasksNoTags),
                      )
                    else
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...task.tags.map(
                                (e) => Padding(
                                  key: Key(e.key),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: Chip(
                                    label: Text(e.name),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
          Observer(builder: (context) {
            final error = validation.errorsMap.entries
                .where((e) => e.value.isNotEmpty)
                .map((e) => e.value)
                .join(',');
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              switchInCurve: Curves.easeInQuad,
              switchOutCurve: Curves.easeOutQuad,
              transitionBuilder: (child, animation) => SizeTransition(
                sizeFactor: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              child: error.isEmpty
                  ? const SizedBox()
                  : Center(
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 100),
                        color: Theme.of(context)
                            .colorScheme
                            .error
                            .withOpacity(0.1),
                        padding: const EdgeInsets.all(18.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          error,
                        ),
                      ),
                    ),
            );
          }),
          if (task.parentTaskId == null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          loc.tasksSubtasks,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            store.addChildTask(task);
                          },
                          child: Text(loc.add),
                        )
                      ],
                    ),
                    Observer(
                      builder: (context) {
                        final childTasks = store.childTasks(task);
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ...childTasks.map(
                                (e) => TaskItem(
                                  task: e,
                                  showFields: false,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
