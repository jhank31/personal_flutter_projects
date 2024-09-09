import 'package:flutter/material.dart';

class CustomBottomNavigationBarProvider with ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  set currentIndex(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    _currentIndex = index;

    notifyListeners();
  }
}
