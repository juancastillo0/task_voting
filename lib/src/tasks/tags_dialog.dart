import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';

class TaskTagList extends StatelessObserverWidget {
  const TaskTagList({
    Key? key,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  final Set<String> selected;
  final void Function(TaskTag tag) onSelect;

  @override
  Widget build(BuildContext context) {
    final store = context.ref(TasksStore.ref);
    final loc = context.loc;

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
                    onSelect(store.tags.last);
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
              final isSelected = selected.contains(tag.key);
              return Row(
                key: Key(tag.key),
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(tag.name),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onSelect(tag);
                    },
                    child: Text(isSelected ? loc.remove : loc.add),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
