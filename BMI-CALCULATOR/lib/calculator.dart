import 'dart:math';

class Calculator {
  Calculator({required this.weight, required this.height});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'Higher than normal range ..(18.5 – 24.9).., exercise more';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight (18.5 – 24.9), Good job!';
    } else {
      return 'You have lower range than normal ..(18.5 – 24.9).., eat and exercise more';
    }
  }
}
