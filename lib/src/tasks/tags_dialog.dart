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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            key: Key(store.editingTag.key),
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Tag Name')),
                  initialValue: store.editingTag.name,
                  onChanged: (text) {
                    store.editingTag.name = text;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  if (store.editingTagError.isNotEmpty) {
                    // TODO: extract
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(store.editingTagError)),
                    );
                  } else {
                    store.addTag();
                    onSelect(store.tags.last);
                  }
                },
                child: Text('Add Tag'),
              )
            ],
          ),
          if (store.filteredTags.isEmpty)
            Container(
              padding: const EdgeInsets.all(18.0),
              // width: 100,
              child: Text(
                "No tags found for search query",
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
                    child: Text(isSelected ? 'Remove' : 'Add'),
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
