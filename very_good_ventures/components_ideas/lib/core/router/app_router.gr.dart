// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:components_ideas/presentation/countdown/countdown_page.dart'
    as _i1;
import 'package:components_ideas/presentation/counter/counter_page.dart' as _i2;
import 'package:components_ideas/presentation/home/home_page.dart' as _i3;
import 'package:components_ideas/presentation/host/host_page.dart' as _i4;
import 'package:components_ideas/presentation/my_account/my_account_page.dart'
    as _i6;
import 'package:components_ideas/presentation/scope_home_navigation/scope_home_navigation_page.dart'
    as _i7;
import 'package:components_ideas/presentation/theme/theme_page.dart' as _i8;
import 'package:components_ideas/utils/helpers/logs/ui/logs_page.dart' as _i5;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.CountdownPage]
class CountdownRoute extends _i9.PageRouteInfo<CountdownRouteArgs> {
  CountdownRoute({
    DateTime? targetDateTime,
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CountdownRoute.name,
          args: CountdownRouteArgs(
            targetDateTime: targetDateTime,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CountdownRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountdownRouteArgs>(
          orElse: () => const CountdownRouteArgs());
      return _i1.CountdownPage(
        targetDateTime: args.targetDateTime,
        key: args.key,
      );
    },
  );
}

class CountdownRouteArgs {
  const CountdownRouteArgs({
    this.targetDateTime,
    this.key,
  });

  final DateTime? targetDateTime;

  final _i10.Key? key;

  @override
  String toString() {
    return 'CountdownRouteArgs{targetDateTime: $targetDateTime, key: $key}';
  }
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i9.PageRouteInfo<void> {
  const CounterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CounterPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HostPage]
class HostRoute extends _i9.PageRouteInfo<void> {
  const HostRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HostRoute.name,
          initialChildren: children,
        );

  static const String name = 'HostRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HostPage();
    },
  );
}

/// generated route for
/// [_i5.LogsPage]
class LogsRoute extends _i9.PageRouteInfo<void> {
  const LogsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LogsPage();
    },
  );
}

/// generated route for
/// [_i6.MyAccountPage]
class MyAccountRoute extends _i9.PageRouteInfo<void> {
  const MyAccountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyAccountPage();
    },
  );
}

/// generated route for
/// [_i7.ScopeHomeNavigationPage]
class ScopeHomeNavigationRoute extends _i9.PageRouteInfo<void> {
  const ScopeHomeNavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ScopeHomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScopeHomeNavigationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.ScopeHomeNavigationPage();
    },
  );
}

/// generated route for
/// [_i8.ThemePage]
class ThemeRoute extends _i9.PageRouteInfo<void> {
  const ThemeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.ThemePage();
    },
  );
}
