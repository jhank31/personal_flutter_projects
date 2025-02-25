import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';
import 'package:components_ideas/presentation/host/widgets/navbar_with_scaffold.dart';
import 'package:flutter/material.dart';

class HostView extends StatelessWidget {
  const HostView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ScopeHomeNavigationRoute(),
        MyAccountRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return NavBarWithScaffold(tabsRouter: tabsRouter, child: child);
      },
    );
  }
}
