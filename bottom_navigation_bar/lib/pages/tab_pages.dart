import 'package:bottom_navigation_bar/widgets/custom_navigation_bar.dart';
import 'package:bottom_navigation_bar/pages/home_page.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('App prueba'),
      ),
      body: const Center(
        child: HomePage(),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
