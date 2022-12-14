import 'dart:async';

import 'package:flutter/widgets.dart';

import 'ajanuw_route.dart';
import 'ajanuw_route_observer.dart';

abstract class AjanuwNavigatorBase {
  Route<T> onGenerateRoute<T>(RouteSettings settings);
  RouteFactory forRoot(List<AjanuwRoute> configRoutes);
  List<Route<dynamic>> history = [];

  final _routeListener = StreamController<AjanuwRouteObserverData>();
  get _routeListener$ => _routeListener.stream.asBroadcastStream();

  NavigatorObserver get navigatorObserver => AjanuwRouteObserver(_routeListener);

  AjanuwNavigatorBase({
    bool printHistory = false,
    bool more = false,
  }) {
    _routeListener$.listen((AjanuwRouteObserverData observer) {
      switch (observer.type) {
        case AjanuwRouteObserverType.didPush:
          history.add(observer.to!);
          break;
        case AjanuwRouteObserverType.didReplace:
          final Route<dynamic> oldRoute = history.last;
          final int index = history.length - 1;
          assert(index >= 0);
          assert(history.indexOf(oldRoute) == index);
          history[index] = observer.to!;
          break;
        case AjanuwRouteObserverType.didPop:
          if (history.length > 1) {
            history.removeLast();
          }
          break;
        case AjanuwRouteObserverType.didRemove:
          Route<dynamic> to = observer.to!;
          if (to != null) {
            if (to.settings.name != history.last.settings.name) {
              history.removeLast();
            }
          } else {
            // pushNamedAndRemoveUntil('/', (_) => false)
            // 当返回false的时候to就为null

            // 先push在remove，跳过最后一个
            int _index = history.length - 2;
            if (_index >= 0) {
              history.removeAt(_index);
            }
          }
          break;
        default:
      }
      if (printHistory) {
        if (more) {
          print(history);
        } else {
          print(history.map((r) => r.settings.name));
        }
      }
    });
  }

  /// ```dart
  /// // example
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return MaterialApp(
  ///       navigatorKey: router.navigatorKey,
  ///     );
  ///   }
  /// }
  /// ```
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// 导航控制器
  ///
  /// ```dart
  /// router.navigator.pushNamed('/home');
  /// ```
  NavigatorState? get navigator => navigatorKey.currentState;

  Route<T> _findRoute<T>(String routeName, Object arguments) {
    final RouteSettings settings = RouteSettings(
      name: routeName,
      arguments: arguments,
    );
    return onGenerateRoute<T>(settings);
  }

  /// history is: [/users /home]
  ///
  /// pushNamed('/new')
  ///
  /// history is: [/users /home /new]
  Future<Object?> pushNamed<T extends Object>(
    String routeName, {
    Object? arguments,
    bool allowNull = true,
  }) {
    if (allowNull) {
      Route<T> route = _findRoute(routeName, arguments!);
      return route != null ? navigator!.push<T>(route) : Future.value(null);
    } else {
      return navigator!.pushNamed(routeName, arguments: arguments);
    }
  }

  /// history is: [/users /home]
  ///
  /// pushReplacementNamed('/new')
  ///
  /// history is: [/users /new]
  Future<Object?> pushReplacementNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
    bool allowNull = true,
  }) {
    if (allowNull) {
      Route<T> route = _findRoute(routeName, arguments!);
      return route != null
          ? navigator!.pushReplacement<T, TO>(
              route,
              result: result,
            )
          : Future.value(null);
    } else {
      return navigator!.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );
    }
  }

  /// history is: [/users /home]
  ///
  /// popAndPushNamed('/new')
  ///
  /// history is: [/users]
  ///
  /// history is: [/users /new]
  Future<Object?> popAndPushNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
    bool allowNull = true,
  }) {
    if (allowNull) {
      Route<T> route = _findRoute(routeName, arguments!);
      if (route != null) {
        pop<TO>(result!);
        return navigator!.pushNamed<T>(routeName, arguments: arguments);
      } else {
        return Future.value(null);
      }
    } else {
      return navigator!.popAndPushNamed(
        routeName,
        result: result,
        arguments: arguments,
      );
    }
  }

  /// Example 1:
  ///
  /// history is: [/users /home]
  ///
  /// pushNamedAndRemoveUntil('/new', (_) => false)
  ///
  /// history is: [/new]
  ///
  ///
  /// Example 2:
  ///
  /// history is: [/users /home /new]
  ///
  /// pushNamedAndRemoveUntil('/users', ModalRoute.withName('/home'))
  ///
  /// history is: [/users /home /users]
  Future<Object?> pushNamedAndRemoveUntil<T extends Object>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
    bool allowNull = true,
  }) {
    if (allowNull) {
      Route<T> route = _findRoute(newRouteName, arguments!);
      return route != null ? navigator!.pushAndRemoveUntil<T>(route, predicate) : Future.value(null);
    } else {
      return navigator!.pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
        arguments: arguments,
      );
    }
  }

  Future Function<T extends Object?>(Route<T> route) get push => navigator!.push;

  Future<T?> Function<T extends Object?, TO extends Object?>(Route<T> newRoute, {TO result}) get pushReplacement =>
      navigator!.pushReplacement;

  Future<T?> Function<T extends Object?>(Route<T> newRoute, bool Function(Route<dynamic>) predicate) get pushAndRemoveUntil =>
      navigator!.pushAndRemoveUntil;

  void Function<T extends Object?>({required Route<dynamic> oldRoute, required Route<T> newRoute}) get replace =>
      navigator!.replace;

  void Function<T extends Object?>({required Route<dynamic> anchorRoute, required Route<T> newRoute}) get replaceRouteBelow =>
      navigator!.replaceRouteBelow;

  bool Function() get canPop => navigator!.canPop;

  Future<bool> Function<T extends Object?>([T result]) get maybePop => navigator!.maybePop;

  void pop<T extends Object>([T? result]) => navigator!.pop<T>(result);

  void Function(bool Function(Route<dynamic>) predicate) get popUntil => navigator!.popUntil;

  void Function(Route<dynamic> route) get removeRoute => navigator!.removeRoute;

  void Function(Route<dynamic> anchorRoute) get removeRouteBelow => navigator!.removeRouteBelow;

  dispose() {
    _routeListener.close();
  }
}
