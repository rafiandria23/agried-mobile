class CalculatorNutrients {
  // Major
  double n;
  double phosphate;
  double potash;

  // Macro
  double zn;
  double b;
  double fe;
  double mn;
  double cu;
  double mo;
  double ci;

  CalculatorNutrients({
    required this.n,
    required this.phosphate,
    required this.potash,
    required this.zn,
    required this.b,
    required this.fe,
    required this.mn,
    required this.cu,
    required this.mo,
    required this.ci,
  });

  Map<String, double> toMap() {
    return {
      'n': n,
      'phosphate': phosphate,
      'potash': potash,
      'zn': zn,
      'b': b,
      'fe': fe,
      'mn': mn,
      'cu': cu,
      'mo': mo,
      'ci': ci,
    };
  }
}
