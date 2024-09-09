import 'package:bottom_navigation_bar/pages/page1.dart';
import 'package:bottom_navigation_bar/pages/page2.dart';
import 'package:bottom_navigation_bar/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProider>(context);
    return Scaffold(
      body: PageView(
        controller: provider.pageController,
        children: const [Page1(), Page2()],
      ),
    );
  }
}
