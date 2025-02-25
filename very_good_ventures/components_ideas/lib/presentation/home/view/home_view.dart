import 'package:auto_route/auto_route.dart';
import 'package:components_ideas/core/router/app_router.gr.dart';
import 'package:components_ideas/core/router/bloc/routes_bloc.dart';
import 'package:components_ideas/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                spacing: 15,
                children: [
                  ListTile(
                    title: const Text('Cuenta regresiva'),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    leading: const Icon(Icons.timer),
                    onTap: () => context.read<RoutesBloc>().navigationHelper(
                          routeName: CountdownRoute.name,
                          onNavigate: () => context.router.push(
                            CountdownRoute(
                              targetDateTime: DateTime.now().add(
                                const Duration(seconds: 30),
                              ),
                            ),
                          ),
                        ),
                  ),
                  ListTile(
                    title: const Text('Cambiar tema'),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    leading: const Icon(Icons.palette_rounded),
                    onTap: () => context.read<RoutesBloc>().navigationHelper(
                          routeName: ThemeRoute.name,
                          onNavigate: () => context.router.push(
                            const ThemeRoute(),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
