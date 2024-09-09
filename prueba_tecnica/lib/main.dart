import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/firebase_options.dart';
import 'package:prueba_tecnica/src/config/preferences/preferences.dart';
import 'package:prueba_tecnica/src/config/routes/app_router.dart';
import 'package:prueba_tecnica/src/config/theme/app_theme.dart';
import 'package:prueba_tecnica/src/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferencias();
  await prefs.initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CustomBottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => MyDataProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final prefs = Preferencias();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
      theme: AppTheme(themeMode: prefs.isDarkTheme).getTheme(),
      darkTheme: AppTheme(themeMode: prefs.isDarkTheme).getTheme(),
      themeMode: themeProvider.themeMode,
    );
  }
}
