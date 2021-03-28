import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried_mobile/models.dart';
import 'package:agried_mobile/constants.dart';

class CalculatorFertilizerGradeSelector extends StatefulWidget {
  CalculatorFertilizerGradeSelector({Key key}) : super(key: key);

  static const String route = '/resources/calculator/fertilizer-grade-selector';

  @override
  _CalculatorFertilizerGradeSelectorState createState() =>
      _CalculatorFertilizerGradeSelectorState();
}

class _CalculatorFertilizerGradeSelectorState
    extends State<CalculatorFertilizerGradeSelector> {
  CalculatorNutrients _nutrients;

  // Selected Major Nutrients
  CalculatorFertilizerGrade _selectedNpkFertilizer;
  CalculatorFertilizerGrade _selectedNitrogenousFertilizer;
  CalculatorFertilizerGrade _selectedPotassicFertilizer;

  // Selected Micro Nutrients
  CalculatorFertilizerGrade _selectedZincFertilizer;
  CalculatorFertilizerGrade _selectedBoronFertilizer;
  CalculatorFertilizerGrade _selectedIronFertilizer;
  CalculatorFertilizerGrade _selectedManganeseFertilizer;
  CalculatorFertilizerGrade _selectedCopperFertilizer;
  CalculatorFertilizerGrade _selectedMolybdenumFertilizer;
  CalculatorFertilizerGrade _selectedChlorideFertilizer;

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
          ResponsiveFlutter.of(context).moderateScale(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text('Fertilizers of major nutrients'),

            // NPK fertilizer (Phosphate)
            if (_nutrients.phosphate != null && _nutrients.phosphate > 0)
              Column(
                children: <Widget>[
                  Text('NPK fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedNpkFertilizer,
                    items: CalculatorConstants.npkFertilizers
                        .map(
                          (CalculatorFertilizerGrade npkFertilizer) =>
                              DropdownMenuItem(
                            value: npkFertilizer,
                            child: Text(
                              npkFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade npkFertilizer) {
                      setState(() {
                        _selectedNpkFertilizer = npkFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Nitrogeneous fertilizer
            if (_nutrients.n != null && _nutrients.n > 0)
              Column(
                children: <Widget>[
                  Text('Nitrogeneous fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedNitrogenousFertilizer,
                    items: CalculatorConstants.nitrogenousFertilizers
                        .map(
                          (CalculatorFertilizerGrade nitrogenousFertilizer) =>
                              DropdownMenuItem(
                            value: nitrogenousFertilizer,
                            child: Text(
                              nitrogenousFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged:
                        (CalculatorFertilizerGrade nitrogenousFertilizer) {
                      setState(() {
                        _selectedNitrogenousFertilizer = nitrogenousFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Potassic fertilizer
            if (_nutrients.potash != null && _nutrients.potash > 0)
              Column(
                children: <Widget>[
                  Text('Potassic fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedPotassicFertilizer,
                    items: CalculatorConstants.potassicFertilizers
                        .map(
                          (CalculatorFertilizerGrade potassicFertilizer) =>
                              DropdownMenuItem(
                            value: potassicFertilizer,
                            child: Text(
                              potassicFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade potassicFertilizer) {
                      setState(() {
                        _selectedPotassicFertilizer = potassicFertilizer;
                      });
                    },
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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          ResponsiveFlutter.of(context).moderateScale(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text('Fertilizers of micro nutrients'),

            // Zinc fertilizer
            if (_nutrients.zn != null && _nutrients.zn > 0)
              Column(
                children: <Widget>[
                  Text('Zinc fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedZincFertilizer,
                    items: CalculatorConstants.zincFertilizers
                        .map(
                          (CalculatorFertilizerGrade zincFertilizer) =>
                              DropdownMenuItem(
                            value: zincFertilizer,
                            child: Text(
                              zincFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade zincFertilizer) {
                      setState(() {
                        _selectedZincFertilizer = zincFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Boron fertilizer
            if (_nutrients.b != null && _nutrients.b > 0)
              Column(
                children: <Widget>[
                  Text('Boron fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedBoronFertilizer,
                    items: CalculatorConstants.boronFertilizers
                        .map(
                          (CalculatorFertilizerGrade boronFertilizer) =>
                              DropdownMenuItem(
                            value: boronFertilizer,
                            child: Text(
                              boronFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade boronFertilizer) {
                      setState(() {
                        _selectedBoronFertilizer = boronFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Iron fertilizer
            if (_nutrients.fe != null && _nutrients.fe > 0)
              Column(
                children: <Widget>[
                  Text('Iron fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedIronFertilizer,
                    items: CalculatorConstants.ironFertilizers
                        .map(
                          (CalculatorFertilizerGrade ironFertilizer) =>
                              DropdownMenuItem(
                            value: ironFertilizer,
                            child: Text(
                              ironFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade ironFertilizer) {
                      setState(() {
                        _selectedIronFertilizer = ironFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Manganese fertilizer
            if (_nutrients.mn != null && _nutrients.mn > 0)
              Column(
                children: <Widget>[
                  Text('Manganese fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedManganeseFertilizer,
                    items: CalculatorConstants.manganeseFertilizers
                        .map(
                          (CalculatorFertilizerGrade manganeseFertilizer) =>
                              DropdownMenuItem(
                            value: manganeseFertilizer,
                            child: Text(
                              manganeseFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade manganeseFertilizer) {
                      setState(() {
                        _selectedManganeseFertilizer = manganeseFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Copper fertilizer
            if (_nutrients.cu != null && _nutrients.cu > 0)
              Column(
                children: <Widget>[
                  Text('Copper fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedCopperFertilizer,
                    items: CalculatorConstants.copperFertilizers
                        .map(
                          (CalculatorFertilizerGrade copperFertilizer) =>
                              DropdownMenuItem(
                            value: copperFertilizer,
                            child: Text(
                              copperFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade copperFertilizer) {
                      setState(() {
                        _selectedCopperFertilizer = copperFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Molybdenum fertilizer
            if (_nutrients.mo != null && _nutrients.mo > 0)
              Column(
                children: <Widget>[
                  Text('Molybdenum fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedMolybdenumFertilizer,
                    items: CalculatorConstants.molybdenumFertilizers
                        .map(
                          (CalculatorFertilizerGrade molybdenumFertilizer) =>
                              DropdownMenuItem(
                            value: molybdenumFertilizer,
                            child: Text(
                              molybdenumFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged:
                        (CalculatorFertilizerGrade molybdenumFertilizer) {
                      setState(() {
                        _selectedMolybdenumFertilizer = molybdenumFertilizer;
                      });
                    },
                  ),
                ],
              ),

            // Chloride fertilizer
            if (_nutrients.ci != null && _nutrients.ci > 0)
              Column(
                children: <Widget>[
                  Text('Chloride fertilizer'),
                  DropdownButton(
                    underline: SizedBox(),
                    iconEnabledColor: Colors.blue,
                    value: _selectedChlorideFertilizer,
                    items: CalculatorConstants.chlorideFertilizers
                        .map(
                          (CalculatorFertilizerGrade chlorideFertilizer) =>
                              DropdownMenuItem(
                            value: chlorideFertilizer,
                            child: Text(
                              chlorideFertilizer.label,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (CalculatorFertilizerGrade chlorideFertilizer) {
                      setState(() {
                        _selectedChlorideFertilizer = chlorideFertilizer;
                      });
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    // Navigator.pushNamed
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    _nutrients = arguments['nutrients'];

    bool renderMajorCard = (_nutrients.n != null && _nutrients.n > 0) ||
        (_nutrients.phosphate != null && _nutrients.phosphate > 0) ||
        (_nutrients.potash != null && _nutrients.potash > 0);

    bool renderMicroCard = (_nutrients.zn != null && _nutrients.zn > 0) ||
        (_nutrients.b != null && _nutrients.b > 0) ||
        (_nutrients.fe != null && _nutrients.fe > 0) ||
        (_nutrients.mn != null && _nutrients.mn > 0) ||
        (_nutrients.cu != null && _nutrients.cu > 0) ||
        (_nutrients.mo != null && _nutrients.mo > 0) ||
        (_nutrients.ci != null && _nutrients.ci > 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select fertilizer grades',
          style: TextStyle(
            fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          ResponsiveFlutter.of(context).moderateScale(8.0),
        ),
        children: <Widget>[
          if (renderMajorCard) _renderMajorNutrientsFertilizersCard(context),
          SizedBox(
            height: ResponsiveFlutter.of(context).verticalScale(8.0),
          ),
          if (renderMicroCard) _renderMicroNutrientsFertilizersCard(context),
          SizedBox(
            height: ResponsiveFlutter.of(context).verticalScale(12.0),
          ),
          SizedBox(
            height: ResponsiveFlutter.of(context).verticalScale(30.0),
            child: ElevatedButton(
              onPressed: () {
                _handleSubmit(context);
              },
              child: Text(
                'Next'.toUpperCase(),
                style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
