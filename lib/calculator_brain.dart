import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = 0.0;
  String _overWeightTip = "You have higher than a normal body weight. Try to exercise more";
  String _underWeightTip = "You have lower than a normal body weight. Try to eat more healthy food";
  String _normalWeightTip = "You have normal body weight, Keep it up";

  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  String calculateBMI() {
    return ((this.weight) / pow(this.height / 100, 2)).toStringAsFixed(1);
  }

  String getResult() {
    _bmi = ((this.weight) / pow(this.height / 100, 2));
    return _bmi >= 25 ? "OVERWEIGHT" : (_bmi > 18.5 ? "NORMAL" : "UNDERWEIGHT");
  }

  String getTip() {
    _bmi = ((this.weight) / pow(this.height / 100, 2));

    return _bmi >= 25
        ? "$_overWeightTip"
        : (_bmi > 18.5 ? "$_normalWeightTip" : "$_underWeightTip");
  }
}
