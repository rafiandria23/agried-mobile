import 'package:flutter/material.dart';
import 'package:agried/models.dart';
import 'package:agried/constants.dart';
import 'package:agried/screens.dart';

class CalculatorFertilizerGradeSelector extends StatefulWidget {
  CalculatorFertilizerGradeSelector({Key? key}) : super(key: key);

  static const String route = '/resources/calculator/fertilizer-grade-selector';

  @override
  _CalculatorFertilizerGradeSelectorState createState() =>
      _CalculatorFertilizerGradeSelectorState();
}

class _CalculatorFertilizerGradeSelectorState
    extends State<CalculatorFertilizerGradeSelector> {
  late CalculatorNutrients _nutrients;
  late CalculatorUnit _unit;

  // Selected Major Nutrients
  late CalculatorFertilizerGrade _selectedNpkFertilizer;
  late CalculatorFertilizerGrade _selectedNitrogenousFertilizer;
  late CalculatorFertilizerGrade _selectedPotassicFertilizer;

  // Selected Micro Nutrients
  late CalculatorFertilizerGrade _selectedZincFertilizer;
  late CalculatorFertilizerGrade _selectedBoronFertilizer;
  late CalculatorFertilizerGrade _selectedIronFertilizer;
  late CalculatorFertilizerGrade _selectedManganeseFertilizer;
  late CalculatorFertilizerGrade _selectedCopperFertilizer;
  late CalculatorFertilizerGrade _selectedMolybdenumFertilizer;
  late CalculatorFertilizerGrade _selectedChlorideFertilizer;

  _CalculatorFertilizerGradeSelectorState() {
    // Major Nutrients
    this._selectedNpkFertilizer = CalculatorConstants.npkFertilizers[0];
    this._selectedNitrogenousFertilizer =
        CalculatorConstants.nitrogenousFertilizers[0];
    this._selectedPotassicFertilizer =
        CalculatorConstants.potassicFertilizers[0];

    // Micro Nutrients
    this._selectedZincFertilizer = CalculatorConstants.zincFertilizers[0];
    this._selectedBoronFertilizer = CalculatorConstants.boronFertilizers[0];
    this._selectedIronFertilizer = CalculatorConstants.ironFertilizers[0];
    this._selectedManganeseFertilizer =
        CalculatorConstants.manganeseFertilizers[0];
    this._selectedCopperFertilizer = CalculatorConstants.copperFertilizers[0];
    this._selectedMolybdenumFertilizer =
        CalculatorConstants.molybdenumFertilizers[0];
    this._selectedChlorideFertilizer =
        CalculatorConstants.chlorideFertilizers[0];
  }

  Card _renderMajorNutrientsFertilizersCard(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(
            // ResponsiveFlutter.of(context).moderateScale(20.0),
            20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text(
              'Fertilizers of major nutrients',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
                // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                ),

            // NPK fertilizer (Phosphate)
            if (_nutrients.phosphate > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NPK fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          iconEnabledColor: Colors.blue,
                          value: _selectedNpkFertilizer,
                          items: CalculatorConstants.npkFertilizers
                              .map(
                                (CalculatorFertilizerGrade npkFertilizer) =>
                                    DropdownMenuItem(
                                  value: npkFertilizer,
                                  child: Text(
                                    npkFertilizer.label,
                                    style: TextStyle(
                                        // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                        ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged:
                              (CalculatorFertilizerGrade? npkFertilizer) {
                            if (npkFertilizer != null) {
                              setState(() {
                                _selectedNpkFertilizer = npkFertilizer;
                              });
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Nitrogeneous fertilizer
            if (_nutrients.n > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nitrogeneous fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedNitrogenousFertilizer,
                        items: CalculatorConstants.nitrogenousFertilizers
                            .map(
                              (CalculatorFertilizerGrade
                                      nitrogenousFertilizer) =>
                                  DropdownMenuItem(
                                value: nitrogenousFertilizer,
                                child: Text(
                                  nitrogenousFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? nitrogenousFertilizer) {
                          if (nitrogenousFertilizer != null) {
                            setState(() {
                              _selectedNitrogenousFertilizer =
                                  nitrogenousFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Potassic fertilizer
            if (_nutrients.potash > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Potassic fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedPotassicFertilizer,
                        items: CalculatorConstants.potassicFertilizers
                            .map(
                              (CalculatorFertilizerGrade potassicFertilizer) =>
                                  DropdownMenuItem(
                                value: potassicFertilizer,
                                child: Text(
                                  potassicFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? potassicFertilizer) {
                          if (potassicFertilizer != null) {
                            setState(() {
                              _selectedPotassicFertilizer = potassicFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Card _renderMicroNutrientsFertilizersCard(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(
            // ResponsiveFlutter.of(context).moderateScale(20.0),
            20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text(
              'Fertilizers of micro nutrients',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
                // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                ),

            // Zinc fertilizer
            if (_nutrients.zn > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Zinc fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedZincFertilizer,
                        items: CalculatorConstants.zincFertilizers
                            .map(
                              (CalculatorFertilizerGrade zincFertilizer) =>
                                  DropdownMenuItem(
                                value: zincFertilizer,
                                child: Text(
                                  zincFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (CalculatorFertilizerGrade? zincFertilizer) {
                          if (zincFertilizer != null) {
                            setState(() {
                              _selectedZincFertilizer = zincFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Boron fertilizer
            if (_nutrients.b > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Boron fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedBoronFertilizer,
                        items: CalculatorConstants.boronFertilizers
                            .map(
                              (CalculatorFertilizerGrade boronFertilizer) =>
                                  DropdownMenuItem(
                                value: boronFertilizer,
                                child: Text(
                                  boronFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? boronFertilizer) {
                          if (boronFertilizer != null) {
                            setState(() {
                              _selectedBoronFertilizer = boronFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Iron fertilizer
            if (_nutrients.fe > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Iron fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedIronFertilizer,
                        items: CalculatorConstants.ironFertilizers
                            .map(
                              (CalculatorFertilizerGrade ironFertilizer) =>
                                  DropdownMenuItem(
                                value: ironFertilizer,
                                child: Text(
                                  ironFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (CalculatorFertilizerGrade? ironFertilizer) {
                          if (ironFertilizer != null) {
                            setState(() {
                              _selectedIronFertilizer = ironFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Manganese fertilizer
            if (_nutrients.mn > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Manganese fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedManganeseFertilizer,
                        items: CalculatorConstants.manganeseFertilizers
                            .map(
                              (CalculatorFertilizerGrade manganeseFertilizer) =>
                                  DropdownMenuItem(
                                value: manganeseFertilizer,
                                child: Text(
                                  manganeseFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? manganeseFertilizer) {
                          if (manganeseFertilizer != null) {
                            setState(() {
                              _selectedManganeseFertilizer =
                                  manganeseFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Copper fertilizer
            if (_nutrients.cu > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Copper fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedCopperFertilizer,
                        items: CalculatorConstants.copperFertilizers
                            .map(
                              (CalculatorFertilizerGrade copperFertilizer) =>
                                  DropdownMenuItem(
                                value: copperFertilizer,
                                child: Text(
                                  copperFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? copperFertilizer) {
                          if (copperFertilizer != null) {
                            setState(() {
                              _selectedCopperFertilizer = copperFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Molybdenum fertilizer
            if (_nutrients.mo > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Molybdenum fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedMolybdenumFertilizer,
                        items: CalculatorConstants.molybdenumFertilizers
                            .map(
                              (CalculatorFertilizerGrade
                                      molybdenumFertilizer) =>
                                  DropdownMenuItem(
                                value: molybdenumFertilizer,
                                child: Text(
                                  molybdenumFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? molybdenumFertilizer) {
                          if (molybdenumFertilizer != null) {
                            setState(() {
                              _selectedMolybdenumFertilizer =
                                  molybdenumFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),

            // Chloride fertilizer
            if (_nutrients.ci > 0)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Chloride fertilizer',
                    style: TextStyle(
                      // fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(10.0),
                      ),
                  Container(
                    padding: EdgeInsets.only(
                        // left: ResponsiveFlutter.of(context).moderateScale(16.0),
                        ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        value: _selectedChlorideFertilizer,
                        items: CalculatorConstants.chlorideFertilizers
                            .map(
                              (CalculatorFertilizerGrade chlorideFertilizer) =>
                                  DropdownMenuItem(
                                value: chlorideFertilizer,
                                child: Text(
                                  chlorideFertilizer.label,
                                  style: TextStyle(
                                      // fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged:
                            (CalculatorFertilizerGrade? chlorideFertilizer) {
                          if (chlorideFertilizer != null) {
                            setState(() {
                              _selectedChlorideFertilizer = chlorideFertilizer;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: ResponsiveFlutter.of(context).verticalScale(14.0),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    List<Calculation> calculations = [];

    _nutrients.toMap().forEach((String nutrientKey, double nutrientVal) {
      if (nutrientVal > 0) {
        switch (nutrientKey) {
          case 'n':
            calculations.add(
              Calculation(
                fertilizer: _selectedNitrogenousFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'phosphate':
            calculations.add(
              Calculation(
                fertilizer: _selectedNpkFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'potash':
            calculations.add(
              Calculation(
                fertilizer: _selectedPotassicFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'zn':
            calculations.add(
              Calculation(
                fertilizer: _selectedZincFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'b':
            calculations.add(
              Calculation(
                fertilizer: _selectedBoronFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'fe':
            calculations.add(
              Calculation(
                fertilizer: _selectedIronFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'mn':
            calculations.add(
              Calculation(
                fertilizer: _selectedManganeseFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'cu':
            calculations.add(
              Calculation(
                fertilizer: _selectedCopperFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'mo':
            calculations.add(
              Calculation(
                fertilizer: _selectedMolybdenumFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;

          case 'ci':
            calculations.add(
              Calculation(
                fertilizer: _selectedChlorideFertilizer,
                unit: _unit,
                result: nutrientVal,
              ),
            );
            break;
        }
      }
    });

    Navigator.pushNamed(
      context,
      CalculationScreen.route,
      arguments: {
        'calculations': calculations,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    _nutrients = arguments['nutrients'];
    _unit = arguments['unit'];

    bool renderMajorCard =
        _nutrients.n > 0 || _nutrients.phosphate > 0 || _nutrients.potash > 0;

    bool renderMicroCard = _nutrients.zn > 0 ||
        _nutrients.b > 0 ||
        _nutrients.fe > 0 ||
        _nutrients.mn > 0 ||
        _nutrients.cu > 0 ||
        _nutrients.mo > 0 ||
        _nutrients.ci > 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select fertilizer grades',
          style: TextStyle(
              // fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
              ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(
            // ResponsiveFlutter.of(context).moderateScale(8.0),
            8.0),
        children: <Widget>[
          if (renderMajorCard) _renderMajorNutrientsFertilizersCard(context),
          SizedBox(
              // height: ResponsiveFlutter.of(context).verticalScale(8.0),
              ),
          if (renderMicroCard) _renderMicroNutrientsFertilizersCard(context),
          SizedBox(
              // height: ResponsiveFlutter.of(context).verticalScale(12.0),
              ),
          SizedBox(
            // height: ResponsiveFlutter.of(context).verticalScale(30.0),
            child: ElevatedButton(
              onPressed: () {
                _handleSubmit(context);
              },
              child: Text(
                'Next'.toUpperCase(),
                style: TextStyle(
                    // fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
