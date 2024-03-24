import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{
  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;
  set setPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}