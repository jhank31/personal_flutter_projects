import 'package:components_ideas/core/app_life_cycle_listener/listener/app_life_cycle_listener.dart';
import 'package:components_ideas/core/dependency_injection/dependency_injector.dart';
import 'package:components_ideas/core/router/app_router.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:components_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return DependencyInjector(
      child: AppLifeCycleListener(
        child: _RouterWidget(
          appRouter: appRouter,
        ),
      ),
    );
  }
}

class _RouterWidget extends StatelessWidget {
  const _RouterWidget({required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: state.theme,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
