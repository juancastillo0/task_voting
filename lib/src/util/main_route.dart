import 'package:task_voting/src/choices/choice_list_view.dart';
import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/choices/voting_choices_store.dart';
import 'package:task_voting/src/polls/polls_list_view.dart';
import 'package:task_voting/src/polls/polls_store.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/tasks/tasks_tab_view.dart';
import 'package:task_voting/src/util/disposable.dart';
import 'package:task_voting/src/util/routes.dart';

class MainRouteView extends StatefulObserverWidget {
  const MainRouteView({super.key});

  @override
  State<MainRouteView> createState() => _MainRouteViewState();
}

class _MainRouteViewState extends State<MainRouteView>
    with SingleTickerProviderStateMixin, DisposableState {
  late AppRouterDelegate routerDelegate;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    routerDelegate = context.ref(AppRouterDelegate.ref);
    tabController = TabController(
      initialIndex: routerDelegate.mainRoute.tab.index,
      length: AppTab.values.length,
      vsync: this,
    );
    changeStateWithUrl();
    routerDelegate.addListener(changeStateWithUrl);
    tabController.addListener(changeUrlWithState);
    disposer.onDispose(() {
      routerDelegate.removeListener(changeStateWithUrl);
      tabController.removeListener(changeUrlWithState);
      tabController.dispose();
    });
  }

  void changeUrlWithState() async {
    final index = tabController.index;
    final RouteInfo info;
    switch (AppTab.values[index]) {
      case AppTab.tasks:
        final store = context.ref(TaskProjectsStore.ref);
        info = await store
            .setUp()
            .then((_) => store.selectedStore.value.routeInfo);
        break;
      case AppTab.votes:
        final store = context.ref(VotingChoicesStore.ref);
        info = await store
            .setUp()
            .then((_) => store.selectedStore.routeInfo.value);
        break;
      case AppTab.polls:
        final store = context.ref(PollsStore.ref);
        info = await store.setUp().then((_) => store.routeInfo.value);
        break;
    }
    routerDelegate.changeCurrentTab(info);
  }

  void changeStateWithUrl() async {
    final route = routerDelegate.mainRoute;
    if (route is TaskRouteInfo) {
      final store = context.ref(TaskProjectsStore.ref);
      await store.setRouteInfo(route);
    } else if (route is VoteRouteInfo) {
      final store = context.ref(VotingChoicesStore.ref);
      await store.setRouteInfo(route);
    } else if (route is PollsRouteInfo) {
      final store = context.ref(PollsStore.ref);
      await store.setRouteInfo(route);
    }
    if (routerDelegate.mainRoute == route) {
      tabController.animateTo(route.tab.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final routerDelegate = context.ref(AppRouterDelegate.ref);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(loc.appTitle),
            const SizedBox(width: 20),
            SizedBox(
              width: 320,
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text(loc.pollsTitle),
                  ),
                  Tab(
                    child: Text(loc.choiceListTitle),
                  ),
                  Tab(
                    child: Text(loc.tasksTitle),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              routerDelegate.setNewRoutePath(SpecRouteInfo.settingsInfo);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          PollsListView(),
          ChoicesForm(),
          TasksTabView(),
        ],
      ),
    );
  }
}
