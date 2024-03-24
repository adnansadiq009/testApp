import 'package:flutter/cupertino.dart';

class IntroProvider with ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}