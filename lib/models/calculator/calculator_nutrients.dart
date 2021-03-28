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
    this.n,
    this.phosphate,
    this.potash,
    this.zn,
    this.b,
    this.fe,
    this.mn,
    this.cu,
    this.mo,
    this.ci,
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
