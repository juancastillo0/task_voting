import 'package:mobx/mobx.dart';
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/settings/settings_service.dart';
import 'package:task_voting/src/util/routes.dart';

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
    final router = root.ref(AppRouterDelegate.ref);
    disposer.onDispose(reaction<VoteRouteInfo>(
      (_) => selectedStore.routeInfo.value,
      router.changeCurrentTab,
    ));
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

  Future<void> setRouteInfo(VoteRouteInfo route) async {
    await setUp();
    runInAction(name: 'setRouteInfo', () {
      if (route.projectId != null) {
        final index =
            stores.indexWhere((element) => element.name == route.projectId);
        if (index != -1) _selectedStoreIndex.set(index);
      }
      final selectedStore = this.selectedStore;
      if (route.sortedTableIndex != null) {
        selectedStore.sortedTableIndex.set(route.sortedTableIndex!);
      }
      if (route.view != null) {
        selectedStore.view.set(route.view!);
      }
      if (route.expanded != null) {
        selectedStore.areItemsExpanded.set(route.expanded!);
      }
      if (route.editing != null) {
        selectedStore.isEditingItems.set(route.editing!);
      }
    });
  }
}
