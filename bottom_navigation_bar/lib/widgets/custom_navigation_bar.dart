import 'package:bottom_navigation_bar/provider/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProider>(context);
    return BottomNavigationBar(
      currentIndex: provider.currentIndex,
      onTap: (index) {
        provider.setIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Page 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Page 2',
        ),
      ],
    );
  }
}
