import 'package:mobx/mobx.dart';
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/settings/settings_service.dart';

import '../notifiers/app_notifier.dart';
import '../util/prelude.dart';

class VotingChoicesStore with DisposableWithSetUp {
  final RootStore root;
  final stores = ObsList<ChoicesStore>('stores');

  final _selectedStoreIndex = Obs('selectedStoreIndex', 0);

  VotingChoicesStore(this.root);

  @override
  Future<void> performSetUp() async {
    final collection = HiveCollectionKey.choicesStoreCollection;
    final keys = await collection.keys();
    print('keys $keys');

    final List<ChoicesStore?> values = await Future.wait(
      keys.reversed.map(
        (key) => collection.get(
          key,
          valueToEdit: ChoicesStore(root, name: key),
        ),
      ),
    );

    stores.addAll(values.whereType<ChoicesStore>());
  }

  static final ref = Ref(reCreate: false, (root) => VotingChoicesStore(root));

  ChoicesStore get selectedStore {
    return runInAction(name: 'selectedStore', () {
      final index = _selectedStoreIndex.value;
      if (index < stores.length) {
        return stores[index];
      } else if (stores.isNotEmpty) {
        _selectedStoreIndex.set(0);
        return stores[0];
      } else {
        return create();
      }
    });
  }

  ChoicesStore create() {
    final value = ChoicesStore(root);
    stores.add(value);
    _selectedStoreIndex.set(stores.length - 1);
    return value;
  }
}
