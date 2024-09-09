import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<UsernameCubit>()),
      BlocProvider(create: (_) => getIt<RouterSimpleCubit>()),
      BlocProvider(create: (_) => getIt<CounterCubit>()),
      BlocProvider(create: (_) => getIt<ThemeCubit>()),
      BlocProvider(create: (_) => getIt<GuestBloc>()),
      BlocProvider(create: (_) => getIt<PokemonBloc>()),
      BlocProvider(create: (_) => getIt<GeolocationCubit>()),
      BlocProvider(create: (_) => getIt<HistoricLocationBloc>()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: context.watch<RouterSimpleCubit>().state,
      theme: AppTheme(isDarkmode: themeCubit.isDarkmode).getTheme(),
    );
  }
}
