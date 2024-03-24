import 'package:flutter/cupertino.dart';

class DashboardProvider with ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}