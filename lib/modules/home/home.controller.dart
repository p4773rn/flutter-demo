import 'package:demo_recorder/modules/navigation/navigation.config.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  NavigationItemId _navigationItemIndex = NavigationItemId.values.first;

  NavigationItemId get navigationItemIndex => _navigationItemIndex;

  void setIndex(NavigationItemId value) {
    _navigationItemIndex = value;
    notifyListeners();
  }
}
