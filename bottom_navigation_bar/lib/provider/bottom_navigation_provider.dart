import 'package:flutter/material.dart';

class BottomNavigationProider with ChangeNotifier {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  

  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;
  void setIndex(int index) {
    _currentIndex = index;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }
}
