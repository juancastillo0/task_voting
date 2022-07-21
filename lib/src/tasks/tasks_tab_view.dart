import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/tasks/calendar_view.dart';
import 'package:task_voting/src/tasks/tags_dialog.dart';
import 'package:task_voting/src/tasks/task_view.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/util/disposable.dart';

class TasksTabView extends StatefulObserverWidget {
  const TasksTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksTabView> createState() => _TasksTabViewState();
}

class _TasksTabViewState extends State<TasksTabView> with DisposableState {
  bool isLoading = true;
  late TasksStore store;

  @override
  void initState() {
    super.initState();
    context.ref(TaskProjectsStore.ref).setUp().then((value) {
      if (!mounted) return;
      disposer.onDispose(autorun((_) {
        setState(() {
          isLoading = false;
          store = context.ref(TasksStore.ref);
        });
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final sortedList = store.sortedTasks;
    final titleStyle = Theme.of(context).textTheme.subtitle2;
    final loc = AppLocalizations.of(context)!;

    String locTaskSort(TaskSort? sort) {
      if (sort == null) return loc.tasksSortNone;
      switch (sort) {
        case TaskSort.date:
          return loc.tasksSortDate;
        case TaskSort.priority:
          return loc.tasksSortPriority;
        case TaskSort.weight:
          return loc.tasksSortWeight;
        case TaskSort.duration:
          return loc.tasksSortDuration;
      }
    }

    String locTaskView(TaskView view) {
      switch (view) {
        case TaskView.list:
          return loc.tasksViewList;
        case TaskView.sequence:
          return loc.tasksViewSequence;
        case TaskView.week:
          return loc.tasksViewWeek;
        case TaskView.month:
          return loc.tasksViewMonth;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FocusTraversalGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${loc.tasksTitle} (${store.tasks.length})',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          store.addTask();
                        },
                        icon: const Icon(Icons.add),
                        label: Text(loc.tasksCreateTask),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(loc.tasksView, style: titleStyle),
                      ButtonBar(
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          ...TaskView.values.map(
                            (v) => TextButton(
                              onPressed: v == store.view
                                  ? null
                                  : () {
                                      store.view = v;
                                    },
                              child: Text(locTaskView(v)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(loc.tasksSortBy, style: titleStyle),
                      ButtonBar(
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          ...[...TaskSort.values, null].map(
                            (v) => TextButton(
                              onPressed: v == store.sortedBy
                                  ? null
                                  : () {
                                      store.sortedBy = v;
                                    },
                              child: Text(locTaskSort(v)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 8),
                          Text(loc.tasksReversed, style: titleStyle),
                          Switch(
                            value: store.sortReversed,
                            onChanged: (_) {
                              store.sortReversed = !store.sortReversed;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),
                    Text(loc.tasksUncertainty, style: titleStyle),
                    Switch(
                      value: store.useUncertainty,
                      onChanged: (_) {
                        store.useUncertainty = !store.useUncertainty;
                      },
                    ),
                  ],
                ),
              ],
            ),
            const TaskTagsFilterRow(),
            const SizedBox(height: 6),
            Expanded(
              child: store.view == TaskView.list
                  ? ListView.builder(
                      itemCount: sortedList.length,
                      // controller: scrollController,
                      itemBuilder: (context, index) {
                        final task = sortedList[index];
                        return FocusTraversalGroup(
                          key: ValueKey(task),
                          child: Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TaskItem(task: task),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const TasksCalendarView(),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTagsFilterRow extends StatelessObserverWidget {
  const TaskTagsFilterRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.ref(TasksStore.ref);
    final loc = context.loc;

    return Row(
      children: [
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  children: [
                    TaskTagList(
                      selected: store.selectedTagKeys,
                      onSelect: store.toggleTagForFilter,
                      onDelete: store.deleteTag,
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
          child: Text(loc.tasksEditFilterTags),
        ),
        if (store.selectedTagKeys.isEmpty)
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(loc.tasksNoTags),
          )
        else
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    key: const Key('clearAll'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    child: Chip(
                      onDeleted: store.clearAllSelectedTags,
                      label: Text(loc.tasksClearFilterTags),
                    ),
                  ),
                  ...store.selectedTags.map(
                    (e) => Padding(
                      key: Key(e.key),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: Chip(
                        onDeleted: () {
                          store.toggleTagForFilter(e);
                        },
                        label: Text(e.name),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
