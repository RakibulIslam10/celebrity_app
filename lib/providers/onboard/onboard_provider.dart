
import 'package:flutter/cupertino.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void nextPage(PageController pageController) {
    if (_currentPage < 2) {
      _currentPage++;
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}