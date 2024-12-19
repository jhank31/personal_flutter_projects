// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:components_ideas/presentation/countdown/countdown_page.dart'
    as _i1;
import 'package:components_ideas/presentation/home/home_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.CountdownPage]
class CountdownRoute extends _i3.PageRouteInfo<CountdownRouteArgs> {
  CountdownRoute({
    required DateTime targetDateTime,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CountdownRoute.name,
          args: CountdownRouteArgs(
            targetDateTime: targetDateTime,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CountdownRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountdownRouteArgs>();
      return _i1.CountdownPage(
        targetDateTime: args.targetDateTime,
        key: args.key,
      );
    },
  );
}

class CountdownRouteArgs {
  const CountdownRouteArgs({
    required this.targetDateTime,
    this.key,
  });

  final DateTime targetDateTime;

  final _i4.Key? key;

  @override
  String toString() {
    return 'CountdownRouteArgs{targetDateTime: $targetDateTime, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}
