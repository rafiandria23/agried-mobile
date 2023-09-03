import 'package:agried/models.dart';

class Calculation {
  CalculatorFertilizerGrade fertilizer;
  CalculatorUnit unit;
  double result;

  Calculation({
    required this.fertilizer,
    required this.unit,
    required this.result,
  });
}
