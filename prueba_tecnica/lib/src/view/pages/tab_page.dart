import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/src/config/preferences/preferences.dart';
import 'package:prueba_tecnica/src/provider/provider.dart';
import 'package:prueba_tecnica/src/shared/widgets/widgets.dart';
import 'package:prueba_tecnica/src/view/pages.dart';

class TabPage extends StatelessWidget {
  const TabPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = Preferencias();
    final bottomNavigationBarProvider =
        Provider.of<CustomBottomNavigationBarProvider>(
      context,
    );
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: prefs.isDarkTheme == false
                ? const Icon(
                    Icons.light_mode_outlined,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.white,
                  ),
            onPressed: () async {
              themeProvider.themeMode =
                  themeProvider.themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 7, 80, 59),
        centerTitle: true,
        title: const Text(
          'QuickCash',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: bottomNavigationBarProvider.pageController,
        children: const [
          TransactionPage(),
          MyTransactionsPage(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
