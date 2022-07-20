import 'package:flutter/foundation.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/util/disposable.dart';

enum AppRoute {
  main,
  settings,
}

enum AppTab {
  votes,
  tasks,
}

extension ExtAppTab on AppTab {
  bool get isVotes => this == AppTab.votes;
  bool get isTasks => this == AppTab.tasks;
}

@immutable
class RouteInfo {
  final AppTab tab;
  final AppRoute route;

  const RouteInfo({
    required this.tab,
    required this.route,
  });

  RouteInfo copyWith({
    AppTab? tab,
    AppRoute? route,
  }) =>
      RouteInfo(
        route: route ?? this.route,
        tab: tab ?? this.tab,
      );

  Uri get url {
    final queryParams = [
      if (route != AppRoute.main) 'route=${route.name}',
      if (route == AppRoute.main) 'tab=${tab.name}',
    ];
    return Uri.parse(
      '/${queryParams.isEmpty ? '' : '?'}${queryParams.join('&')}',
    );
  }

  factory RouteInfo.fromUrl(Uri url) {
    T _parseParam<T extends Enum>(String name, List<T> values, T defaultValue) {
      final tab = url.queryParameters[name];
      return values.firstWhere(
        (t) => t.name == tab,
        orElse: () => defaultValue,
      );
    }

    return RouteInfo(
      tab: _parseParam('tab', AppTab.values, AppTab.votes),
      route: _parseParam('route', AppRoute.values, AppRoute.main),
    );
  }

  @override
  bool operator ==(Object? other) =>
      other is RouteInfo && tab == other.tab && route == other.route;

  @override
  int get hashCode => Object.hash(tab, route);
}

class AppRouteInformationParser extends RouteInformationParser<RouteInfo> {
  const AppRouteInformationParser();

  @override
  Future<RouteInfo> parseRouteInformation(RouteInformation routeInformation) {
    final url = Uri.parse(routeInformation.location ?? '/');
    final info = RouteInfo.fromUrl(url);
    return SynchronousFuture(info);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteInfo configuration) {
    return RouteInformation(
      location: configuration.url.toString(),
      state: null,
    );
  }
}

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with ChangeNotifier, Disposable {
  final RootStore root;

  final navigationStack = <RouteInfo>[
    const RouteInfo(route: AppRoute.main, tab: AppTab.votes),
  ];

  // Navigator
  // PopNavigatorRouterDelegateMixin
  // currentConfiguration;
  final navigatorKey = GlobalKey<NavigatorState>();

  AppTab get currentTab => navigationStack.reversed
      .firstWhere((info) => info.route == AppRoute.main)
      .tab;

  void changeTab(AppTab tab) {
    final index = navigationStack.lastIndexWhere(
      (info) => info.route == AppRoute.main,
    );
    navigationStack[index] = navigationStack[index].copyWith(tab: tab);
    notifyListeners();
  }

  @override
  RouteInfo? get currentConfiguration =>
      navigationStack.isEmpty ? null : navigationStack.last;

  AppRouterDelegate(this.root);

  static const ref = Ref(reCreate: false, AppRouterDelegate.new);

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
          notifyListeners();

          return true;
        },
        pages: [
          ...navigationStack.map(
            (info) => MaterialPage(
              key: ValueKey(info),
              child: SizedBox(),
              arguments: null,
              name: info.url.toString(),
              fullscreenDialog: false,
              maintainState: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<bool> popRoute() {
    navigationStack.removeLast();
    notifyListeners();
    return SynchronousFuture(navigationStack.isEmpty);
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) {
    navigationStack.add(configuration);
    notifyListeners();
    return SynchronousFuture(null);
  }
}
