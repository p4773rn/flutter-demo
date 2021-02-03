import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int _index = 0;

  get index => _index;
  set index(value) {
    _index = value;
    notifyListeners();
  }
}