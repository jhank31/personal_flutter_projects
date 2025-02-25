import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';

/// {@template app_router}
/// The router for the application.
/// {@endtemplate}

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// Ruta inicial de la aplicación que contiene los tabs del NavBar
        /// y las rutas que hay dentro de cada tab
        AutoRoute(
          page: HostRoute.page,
          initial: true,
          children: [
            AutoRoute(
              /// Se debe crear un windget que retorne un AutoRouter
              /// para poder mostrar el navBar en la parte inferior
              /// de la pantalla sin importar la pantalla a la que se navege
              ///? siempre y cuando se navegue a una pantalla que este dentro
              ///?              |
              ///? del children v
              page: ScopeHomeNavigationRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: CountdownRoute.page),
                AutoRoute(page: ThemeRoute.page),
                AutoRoute(page: CounterRoute.page),
              ],
            ),
            AutoRoute(page: MyAccountRoute.page),
          ],
        ),
        AutoRoute(page: LogsRoute.page),
      ];
}
