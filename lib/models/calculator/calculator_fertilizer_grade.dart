import 'package:flutter/material.dart';

class CalculatorFertilizerGrade {
  String name;
  String label;
  String nutrient;

  double Function(double input) calculate;

  CalculatorFertilizerGrade({
    this.name,
    @required this.label,
    @required this.nutrient,
    this.calculate,
  });
}
