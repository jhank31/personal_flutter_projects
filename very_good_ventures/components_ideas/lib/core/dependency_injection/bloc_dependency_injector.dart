import 'package:components_ideas/core/router/bloc/routes_bloc.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template bloc_dependency_injector}
/// Esta clase es donde se inyectan los BLoCs necesarios para la aplicación.
/// {@endtemplate}

class BlocDependencyInjector extends StatelessWidget {
  const BlocDependencyInjector({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(const BlocThemeInitEvent()),
        ),
        BlocProvider(
          create: (context) => RoutesBloc()..add(const RoutesInitEvent()),
        ),
      ],
      child: child,
    );
  }
}
