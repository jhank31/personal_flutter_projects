import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';
import 'package:components_ideas/core/router/bloc/routes_bloc.dart';
import 'package:components_ideas/utils/helpers/logs/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarWithScaffold extends StatelessWidget {
  const NavBarWithScaffold({
    required this.tabsRouter,
    required this.child,
    super.key,
  });

  final TabsRouter tabsRouter;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    const logs = Logger(tag: 'NavBarWithScaffold');
    final routesBloc = context.read<RoutesBloc>();
    return Scaffold(
      body: child,
      bottomNavigationBar: BlocListener<RoutesBloc, RoutesState>(
        listener: (context, state) {
          switch (state) {
            case RoutesNewRoutNavBarState():
              _validateRoute(context, state, routesBloc);
          }
        },
        child: BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'My Account',
            ),
          ],
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
            context.read<RoutesBloc>().add(
                  RoutesChangedNavBarEvent(currentIdNavBar: index),
                );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logs
            ..info('Navegando a la ruta LogsRoute')
            ..critical('Navegando a la ruta LogsRoute');
          context.router.push(const LogsRoute());
        },
        child: const Icon(Icons.bug_report),
      ),
    );
  }

  void _validateRoute(
    BuildContext context,
    RoutesNewRoutNavBarState state,
    RoutesBloc routesBloc,
  ) {
    /// funcion para validar la ruta actual y determinar si se debe
    /// navegar a la ruta HomeRoute o no
    switch (state.currentIdNavBar) {
      case 0:
        if (state.routeName != HomeRoute.name &&
            state.currentIdNavBar == state.lastIdNavBar) {
          routesBloc.navigationHelper(
            routeName: HomeRoute.name,
            onNavigate: () {
              context.router.replaceAll(
                [
                  const HomeRoute(),
                ],
              );
            },
          );
        }
    }
  }
}
