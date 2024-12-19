import 'package:components_ideas/core/dependency_injection/dependency_injector.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:components_ideas/features/countdown/countdown_page.dart';
import 'package:components_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: state.theme,
            home: CountdownPage(
              targetDateTime: DateTime.now().add(const Duration(seconds: 10)),
            ),
          );
        },
      ),
    );
  }
}
