import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';

class TaskTagList extends StatefulObserverWidget {
  const TaskTagList({
    Key? key,
    required this.selected,
    required this.onSelect,
    this.onDelete,
  }) : super(key: key);

  final Set<String> selected;
  final void Function(TaskTag tag) onSelect;
  final void Function(TaskTag tag)? onDelete;

  @override
  State<TaskTagList> createState() => _TaskTagListState();
}

class _TaskTagListState extends State<TaskTagList> {
  final Observable<ObservableSet<String>?> deleting = Observable(null);

  @override
  Widget build(BuildContext context) {
    final store = context.ref(TasksStore.ref);
    final loc = context.loc;

    void toggleDelete() {
      if (deleting.value == null) {
        deleting.value = ObservableSet();
      } else {
        final map = store.tagsMap;
        for (final d in deleting.value!) {
          final tag = map[d];
          if (tag != null) {
            widget.onDelete!(tag);
          }
        }
        deleting.value = null;
      }
    }

    String errorString(EditingTagError editingTagError) {
      switch (editingTagError) {
        case EditingTagError.empty:
          return loc.tasksTagErrorEmpty;
        case EditingTagError.notUnique:
          return loc.tasksTagErrorNotUnique(store.editingTag.name);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            key: Key(store.editingTag.key),
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(label: Text(loc.tasksTagName)),
                  initialValue: store.editingTag.name,
                  onChanged: (text) {
                    store.editingTag.name = text;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  final editingTagError = store.editingTagError;
                  if (editingTagError != null) {
                    context.showSnackBar(
                      errorString(editingTagError),
                      isError: true,
                    );
                  } else {
                    store.addTag();
                    widget.onSelect(store.tags.last);
                  }
                },
                child: Text(loc.tasksAddTag),
              )
            ],
          ),
          if (store.filteredTags.isEmpty)
            Container(
              padding: const EdgeInsets.all(18.0),
              width: 250,
              child: Text(
                loc.tasksNoTagsFound,
                textAlign: TextAlign.center,
              ),
            )
          else
            const SizedBox(height: 10),
          ...store.filteredTags.map(
            (tag) {
              final isSelected = widget.selected.contains(tag.key);
              return Row(
                key: Key(tag.key),
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(tag.name),
                    ),
                  ),
                  if (deleting.value != null)
                    Checkbox(
                      value: deleting.value!.contains(tag.key),
                      onChanged: (_) {
                        if (!deleting.value!.remove(tag.key)) {
                          deleting.value!.add(tag.key);
                        }
                      },
                    )
                  else
                    TextButton(
                      onPressed: () {
                        widget.onSelect(tag);
                      },
                      child: Text(isSelected ? loc.remove : loc.add),
                    ),
                ],
              );
            },
          ),
          if (widget.onDelete != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (deleting.value != null)
                    TextButton(
                      key: const Key('cancel'),
                      onPressed: () {
                        deleting.value = null;
                      },
                      child: Text(loc.cancel),
                    ),
                  TextButton(
                    key: const Key('delete'),
                    onPressed:
                        deleting.value == null || deleting.value!.isNotEmpty
                            ? toggleDelete
                            : null,
                    child: Text(loc.delete),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
