



import 'package:flutter/cupertino.dart';

class BottomNavigationBarIndex extends ChangeNotifier {
  var currentIndex = 0;
  indexChanger(int index) {
    currentIndex = index;
    notifyListeners();
  }
}