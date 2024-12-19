import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';

/// {@template app_router}
/// The router for the application.
/// {@endtemplate}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: CountdownRoute.page),
  ];
}
