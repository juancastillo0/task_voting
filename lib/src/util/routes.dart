import 'package:flutter/foundation.dart';
import 'package:stack_portal/stack_portal.dart' hide Ref;
import 'package:task_voting/src/choices/choices_store.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/polls/polls_store.dart';
import 'package:task_voting/src/settings/settings_view.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';
import 'package:task_voting/src/util/disposable.dart';

import '../choices/choice_list_view.dart';

// ignore: constant_identifier_names
const ROUTE = 'route';

enum AppRoute {
  main,
  settings,
}

enum AppTab {
  polls,
  votes,
  tasks,
}

extension ExtAppTab on AppTab {
  bool get isVotes => this == AppTab.votes;
  bool get isTasks => this == AppTab.tasks;
}

// mixin QueryParam<T> {
//   String get name;
// }

// class QueryParamString with QueryParam<String> {
//   @override
//   final String name;

//   QueryParamString(this.name);
// }

@immutable
mixin RouteInfo<T extends RouteInfo<T>> {
  RouteSpec<T> get routeSpec;

  T merge(T other);

  Map<String, String> get queryParams;

  AppRoute get route => routeSpec.route;

  Uri get url {
    final queryParams = this.queryParams;
    return Uri(
      queryParameters: queryParams.containsKey(ROUTE)
          ? queryParams
          : {ROUTE: route.name, ...queryParams},
    );
  }

  static final specs = <RouteSpec<RouteInfo>>[
    TaskRouteInfo.spec,
    VoteRouteInfo.spec,
    PollsRouteInfo.spec,
    SpecRouteInfo.settingsSpec,
  ];

  static RouteInfo? fromUrl(Uri url) {
    Uri mappedUrl = url;
    if (!url.queryParameters.containsKey(ROUTE)) {
      mappedUrl = url.replace(queryParameters: {
        ...url.queryParametersAll,
        ROUTE: url.path,
      });
    }

    for (final spec in specs.where((s) => s.matches(mappedUrl))) {
      final info = spec.parse(url);
      if (info != null) return info;
    }
    return null;
  }

  @override
  bool operator ==(Object? other) =>
      other is RouteInfo &&
      runtimeType == other.runtimeType &&
      url.toString() == other.url.toString();

  @override
  int get hashCode => Object.hash(runtimeType, url.toString());
}

abstract class RouteSpec<T extends RouteInfo<T>> {
  Map<String, String> get requiredParams;
  AppRoute get route;
  List<RouteInfo> get baseStack;
  T? parse(Uri url);
  Widget build(BuildContext context, T routeInfo);

  T get defaultRouteInfo => parse(Uri(queryParameters: requiredParams))!;
  bool matches(Uri url) =>
      url.queryParameters[ROUTE] == route.name &&
      requiredParams.entries
          .every((e) => url.queryParameters[e.key] == e.value);
}

class RouteSpecValue<T extends RouteInfo<T>> extends RouteSpec<T> {
  @override
  final AppRoute route;
  @override
  final Map<String, String> requiredParams;
  @override
  final List<RouteInfo> baseStack;

  final Widget Function(BuildContext, T) builder;
  final T? Function(Uri) parser;
  // final T Function(RootStore) getCurrent;

  RouteSpecValue({
    required this.route,
    required this.requiredParams,
    required this.builder,
    required this.parser,
    // required this.getCurrent,
    this.baseStack = const [],
  });

  @override
  T? parse(Uri url) {
    return parser(url);
  }

  @override
  Widget build(BuildContext context, T routeInfo) {
    return builder(context, routeInfo);
  }
}

class SpecRouteInfo with RouteInfo<SpecRouteInfo> {
  @override
  final RouteSpec<SpecRouteInfo> routeSpec;

  const SpecRouteInfo._(this.routeSpec);

  @override
  SpecRouteInfo merge(SpecRouteInfo other) {
    return SpecRouteInfo._(other.routeSpec);
  }

  @override
  Map<String, String> get queryParams =>
      {ROUTE: routeSpec.route.name, ...routeSpec.requiredParams};

  static final SpecRouteInfo settingsInfo = SpecRouteInfo._(settingsSpec);
  static final settingsSpec = RouteSpecValue(
    route: AppRoute.settings,
    requiredParams: {},
    builder: (context, info) => const SettingsView(),
    // getCurrent: (root) => root.ref(TasksStore.ref).routeInfo,
    parser: (url) => settingsInfo,
    baseStack: [VoteRouteInfo.spec.defaultRouteInfo],
  );
}

mixin MainRouteInfo<T extends MainRouteInfo<T>> on RouteInfo<T> {
  AppTab get tab;
}

class TaskRouteInfo
    with RouteInfo<TaskRouteInfo>, MainRouteInfo<TaskRouteInfo> {
  final TaskSort? sort;
  final TaskView? view;
  final bool? reversed;
  final String? projectId;

  TaskRouteInfo({
    required this.sort,
    required this.view,
    required this.reversed,
    required this.projectId,
  });

  @override
  RouteSpec<TaskRouteInfo> get routeSpec => spec;

  static final spec = RouteSpecValue(
    route: AppRoute.main,
    requiredParams: {'tab': AppTab.tasks.name},
    builder: (context, info) => const SampleItemListView(),
    // getCurrent: (root) => root.ref(TasksStore.ref).routeInfo,
    parser: (url) {
      if (url.queryParameters['tab'] != AppTab.tasks.name) {
        return null;
      }
      return TaskRouteInfo(
        projectId: url.queryParameters['projectId'],
        reversed: url.queryParameters['reversed'] == null
            ? null
            : url.queryParameters['reversed'] == 'true',
        sort: TaskSort.values.firstWhereOrNull(
            (element) => element.name == url.queryParameters['sort']),
        view: TaskView.values.firstWhereOrNull(
            (element) => element.name == url.queryParameters['view']),
      );
    },
  );

  @override
  AppTab get tab => AppTab.tasks;

  @override
  Map<String, String> get queryParams {
    return {
      ROUTE: route.name,
      'tab': tab.name,
      if (projectId != null) 'projectId': projectId!,
      if (view != null) 'view': view!.name,
      if (sort != null) 'sort': sort!.name,
      if (reversed != null) 'reversed': reversed.toString(),
    };
  }

  @override
  TaskRouteInfo merge(TaskRouteInfo other) {
    return TaskRouteInfo(
      sort: other.sort ?? sort,
      view: other.view ?? view,
      reversed: other.reversed ?? reversed,
      projectId: other.projectId ?? projectId,
    );
  }
}

class VoteRouteInfo
    with RouteInfo<VoteRouteInfo>, MainRouteInfo<VoteRouteInfo> {
  final int? sortedTableIndex;
  final ChoicesView? view;
  final bool? expanded;
  final bool? editing;
  final String? projectId;

  VoteRouteInfo({
    required this.sortedTableIndex,
    required this.view,
    required this.expanded,
    required this.editing,
    required this.projectId,
  });

  @override
  RouteSpec<VoteRouteInfo> get routeSpec => spec;

  static final spec = RouteSpecValue(
    route: AppRoute.main,
    requiredParams: {'tab': AppTab.votes.name},
    builder: (context, info) => const SampleItemListView(),
    // getCurrent: (root) => root.ref(TasksStore.ref).routeInfo,
    parser: (url) {
      if (url.queryParameters['tab'] != AppTab.votes.name) {
        return null;
      }
      return VoteRouteInfo(
        projectId: url.queryParameters['projectId'],
        expanded: url.queryParameters['expanded'] == null
            ? null
            : url.queryParameters['expanded'] == 'true',
        editing: url.queryParameters['editing'] == null
            ? null
            : url.queryParameters['editing'] == 'true',
        sortedTableIndex:
            int.tryParse(url.queryParameters['sortedTableIndex'] ?? ''),
        view: ChoicesView.values.firstWhereOrNull(
            (element) => element.name == url.queryParameters['view']),
      );
    },
  );

  @override
  AppTab get tab => AppTab.votes;

  @override
  Map<String, String> get queryParams {
    return {
      ROUTE: route.name,
      'tab': tab.name,
      if (projectId != null) 'projectId': projectId!,
      if (view != null) 'view': view!.name,
      if (editing != null) 'editing': editing.toString(),
      if (sortedTableIndex != null)
        'sortedTableIndex': sortedTableIndex!.toString(),
      if (expanded != null) 'expanded': expanded.toString(),
    };
  }

  @override
  VoteRouteInfo merge(VoteRouteInfo other) {
    return VoteRouteInfo(
      sortedTableIndex: other.sortedTableIndex ?? sortedTableIndex,
      view: other.view ?? view,
      expanded: other.expanded ?? expanded,
      editing: other.editing ?? editing,
      projectId: other.projectId ?? projectId,
    );
  }
}

class PollsRouteInfo
    with RouteInfo<PollsRouteInfo>, MainRouteInfo<PollsRouteInfo> {
  final int? selectedPoll;
  final PollsView? view;
  final bool? expanded;
  final bool? editing;
  final String? projectId;

  PollsRouteInfo({
    required this.selectedPoll,
    required this.view,
    required this.expanded,
    required this.editing,
    required this.projectId,
  });

  @override
  RouteSpec<PollsRouteInfo> get routeSpec => spec;

  static final spec = RouteSpecValue(
    route: AppRoute.main,
    requiredParams: {'tab': _tab.name},
    builder: (context, info) => const SampleItemListView(),
    // getCurrent: (root) => root.ref(TasksStore.ref).routeInfo,
    parser: (url) {
      if (url.queryParameters['tab'] != _tab.name) {
        return null;
      }
      return PollsRouteInfo(
        projectId: url.queryParameters['projectId'],
        expanded: url.queryParameters['expanded'] == null
            ? null
            : url.queryParameters['expanded'] == 'true',
        editing: url.queryParameters['editing'] == null
            ? null
            : url.queryParameters['editing'] == 'true',
        selectedPoll: int.tryParse(url.queryParameters['selectedPoll'] ?? ''),
        view: PollsView.values.firstWhereOrNull(
            (element) => element.name == url.queryParameters['view']),
      );
    },
  );

  static AppTab get _tab => AppTab.polls;

  @override
  AppTab get tab => _tab;

  @override
  Map<String, String> get queryParams {
    return {
      ROUTE: route.name,
      'tab': tab.name,
      if (projectId != null) 'projectId': projectId!,
      if (view != null) 'view': view!.name,
      if (editing != null) 'editing': editing.toString(),
      if (selectedPoll != null) 'selectedPoll': selectedPoll!.toString(),
      if (expanded != null) 'expanded': expanded.toString(),
    };
  }

  @override
  PollsRouteInfo merge(PollsRouteInfo other) {
    return PollsRouteInfo(
      selectedPoll: other.selectedPoll ?? selectedPoll,
      view: other.view ?? view,
      expanded: other.expanded ?? expanded,
      editing: other.editing ?? editing,
      projectId: other.projectId ?? projectId,
    );
  }
}

class AppRouteInformationParser extends RouteInformationParser<RouteInfo> {
  const AppRouteInformationParser();

  @override
  Future<RouteInfo> parseRouteInformation(RouteInformation routeInformation) {
    final url = routeInformation.uri;
    final info = RouteInfo.fromUrl(url) ?? VoteRouteInfo.spec.defaultRouteInfo;
    return SynchronousFuture(info);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInfo configuration) {
    return RouteInformation(
      uri: configuration.url,
      state: null,
    );
  }
}

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with ChangeNotifier, Disposable {
  final RootStore root;

  final navigationStack = ObservableList<RouteInfo>();

  // PopNavigatorRouterDelegateMixin
  final navigatorKey = GlobalKey<NavigatorState>();

  AppRouterDelegate(this.root) {
    disposer.onDispose(navigationStack.observe((_) {
      notifyListeners();
    }));
  }

  static const ref = Ref(reCreate: false, AppRouterDelegate.new);

  MainRouteInfo get mainRoute => currentByType<MainRouteInfo>()!;

  T? currentByType<T extends RouteInfo<dynamic>>() =>
      navigationStack.lastWhereOrNull((info) => info is T) as T?;

  RouteInfo? currentByRoute(AppRoute route) =>
      navigationStack.reversed.lastWhereOrNull((info) => info.route == route);

  void changeCurrentTab(RouteInfo routeInfo) {
    final index = navigationStack.lastIndexWhere(
      (info) => info.route == routeInfo.route,
    );
    navigationStack[index] = routeInfo;
  }

  @override
  RouteInfo? get currentConfiguration =>
      navigationStack.isEmpty ? null : navigationStack.last;

  @override
  Widget build(BuildContext context) {
    return Provider(
      value: this,
      child: Navigator(
        key: navigatorKey,
        onPopPage: (route, result) {
          if (!route.didPop(result) || navigationStack.isEmpty) {
            return false;
          }
          navigationStack.removeLast();

          return true;
        },
        pages: [
          ...navigationStack.mapIndexed(
            (i, info) {
              return MaterialPage(
                key: ValueKey('$i-${info.route.name}'),
                child: Provider<RouteInfo>(
                  value: info,
                  child: GlobalStack(
                    child: Observer(builder: (context) {
                      return info.routeSpec.build(context, info);
                    }),
                  ),
                ),
                arguments: null,
                name: info.url.toString(),
                fullscreenDialog: false,
                maintainState: true,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Future<void> setInitialRoutePath(RouteInfo configuration) {
    navigationStack.addAll(configuration.routeSpec.baseStack);
    return super.setInitialRoutePath(configuration);
  }

  @override
  Future<bool> popRoute() {
    if (navigationStack.isNotEmpty) {
      navigationStack.removeLast();
    }
    return SynchronousFuture(navigationStack.isEmpty);
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) {
    if (navigationStack.length > 1 &&
        navigationStack[navigationStack.length - 2] == configuration) {
      // back from web browser
      navigationStack.removeLast();
    } else if (currentConfiguration?.route == configuration.route) {
      // change url in web browser to a new tab in the same route
      changeCurrentTab(configuration);
    } else {
      // TODO: Should we perform a push of base pages? with configuration.routeSpec.baseStack
      navigationStack.add(configuration);
    }
    return SynchronousFuture(null);
  }
}
