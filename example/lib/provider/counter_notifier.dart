import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
