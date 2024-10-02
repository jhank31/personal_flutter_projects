import 'package:e_commers_app/core/configs/routes/app_routes.dart';
import 'package:e_commers_app/core/theme/app_theme.dart';
import 'package:e_commers_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit()..appStarted(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'E-coomerce',
        theme: AppTheme.appTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
