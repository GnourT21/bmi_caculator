import 'package:flutter/material.dart';
import 'dart:math';

class BmiCaculatorProvider with ChangeNotifier {
  double _height = 170;
  double _weight = 40;
  int _age = 14;
  double _bmi = 0.0;

  double get height => _height;
  double get weight => _weight;
  int get age => _age;

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  String caculatorBMI() {
    _bmi = _weight / pow(_height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over_weight';
    } else if (_bmi > 18) {
      return 'Normal';
    }
    return 'Under_weight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body _weight. Try to practice more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body _weight. Congratulation!';
    }
    return 'You have a lower than normal body _weight. You should eat more!';
  }

  void increment() {
    _weight++;
    notifyListeners();
  }

  void decrement() {
    _weight--;
    notifyListeners();
  }

  void ageIncrement() {
    _age++;
    notifyListeners();
  }

  void ageDecrement() {
    _age--;
    notifyListeners();
  }
}
