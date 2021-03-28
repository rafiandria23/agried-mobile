import 'package:agried/screens.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/models.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key}) : super(key: key);

  static const String route = '/resources/calculator';

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  BuildContext _scaffoldContext;

  List<CalculatorUnit> units = [
    CalculatorUnit(name: 'in kg', unit: 'kg'),
    CalculatorUnit(name: 'in g', unit: 'g'),
    CalculatorUnit(name: 'in lb', unit: 'lb'),
  ];
  CalculatorUnit _selectedUnit;

  final TextEditingController nController = TextEditingController();
  final TextEditingController phosphateController = TextEditingController();
  final TextEditingController potashController = TextEditingController();
  final TextEditingController znController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController feController = TextEditingController();
  final TextEditingController mnController = TextEditingController();
  final TextEditingController cuController = TextEditingController();
  final TextEditingController moController = TextEditingController();
  final TextEditingController ciController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _CalculatorScreenState() {
    this._selectedUnit = this.units[0];
  }

  void _toggleKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  double _convertUnit(double val, String fromUnit, String toUnit) {
    switch (fromUnit) {
      case 'kg':
        switch (toUnit) {
          case 'g':
            return val * 1000;

          case 'lb':
            return val * 2.2046;
        }
        break;

      case 'g':
        switch (toUnit) {
          case 'kg':
            return val / 1000;

          case 'lb':
            return val * 0.0022046;
        }
        break;

      case 'lb':
        switch (toUnit) {
          case 'kg':
            return val / 2.2046;

          case 'g':
            return val / 0.0022046;
        }
        break;
    }

    return 0.0;
  }

  void _onChangeUnit(CalculatorUnit unit) {
    setState(() {
      nController.text = nController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(nController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      phosphateController.text = phosphateController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(phosphateController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      potashController.text = potashController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(potashController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      znController.text = znController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(znController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      bController.text = bController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(bController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      feController.text = feController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(feController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      mnController.text = mnController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(mnController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      cuController.text = cuController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(cuController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      moController.text = moController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(moController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();
      ciController.text = ciController.text.isEmpty
          ? null
          : _convertUnit(
              double.parse(ciController.text),
              _selectedUnit.unit,
              unit.unit,
            ).toString();

      _selectedUnit = unit;
    });
  }

  String _validator(String val) {
    if (val.isNotEmpty && double.parse(val) <= 0) {
      return 'Enter a valid value';
    }

    return null;
  }

  Card _renderMajorNutrientsCard(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

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
            Text(
              'Major nutrients',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Nitrogen (N)
            Text(
              'Nitrogen (N)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              autofocus: true,
              controller: nController,
              decoration: InputDecoration(
                labelText: 'Enter N',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Phosphate
            Text(
              'Phosphate',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: phosphateController,
              decoration: InputDecoration(
                labelText: 'Enter phosphate',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Potash
            Text(
              'Potash',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: potashController,
              decoration: InputDecoration(
                labelText: 'Enter potash',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
          ],
        ),
      ),
    );
  }

  Card _renderMicroNutrientsCard(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding:
            EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text(
              'Micro nutrients',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Zinc (Zn)
            Text(
              'Zinc (Zn)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: znController,
              decoration: InputDecoration(
                labelText: 'Enter Zn',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Boron (B)
            Text(
              'Boron (B)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: bController,
              decoration: InputDecoration(
                labelText: 'Enter B',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Iron (Fe)
            Text(
              'Iron (Fe)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: feController,
              decoration: InputDecoration(
                labelText: 'Enter Fe',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Manganese (Mn)
            Text(
              'Manganese (Mn)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: mnController,
              decoration: InputDecoration(
                labelText: 'Enter Mn',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Copper (Cu)
            Text(
              'Copper (Cu)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: cuController,
              decoration: InputDecoration(
                labelText: 'Enter Cu',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Molybdenum (Mo)
            Text(
              'Molybdenum (Mo)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: moController,
              decoration: InputDecoration(
                labelText: 'Enter Mo',
              ),
              validator: _validator,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onEditingComplete: () => node.nextFocus(),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(12.0),
            ),

            // Chlorine (CI)
            Text(
              'Chlorine (CI)',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.4),
              ),
            ),
            TextFormField(
              controller: ciController,
              decoration: InputDecoration(
                labelText: 'Enter CI',
              ),
              validator: _validator,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (_) => node.unfocus(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    CalculatorNutrients nutrients = CalculatorNutrients(
      n: nController.text.isEmpty ? null : double.parse(nController.text),
      phosphate: phosphateController.text.isEmpty
          ? null
          : double.parse(phosphateController.text),
      potash: potashController.text.isEmpty
          ? null
          : double.parse(potashController.text),
      zn: znController.text.isEmpty ? null : double.parse(znController.text),
      b: bController.text.isEmpty ? null : double.parse(bController.text),
      fe: feController.text.isEmpty ? null : double.parse(feController.text),
      mn: mnController.text.isEmpty ? null : double.parse(mnController.text),
      cu: cuController.text.isEmpty ? null : double.parse(cuController.text),
      mo: moController.text.isEmpty ? null : double.parse(moController.text),
      ci: ciController.text.isEmpty ? null : double.parse(ciController.text),
    );

    List<double> nutrientValues =
        nutrients.toMap().entries.map((nutrient) => nutrient.value).toList();

    if (_formKey.currentState.validate() &&
        nutrientValues.any((nutrient) => nutrient != null && nutrient > 0)) {
      Navigator.pushNamed(
        context,
        CalculatorFertilizerGradeSelector.route,
        arguments: {
          'unit': _selectedUnit,
          'nutrients': nutrients,
        },
      );
    } else {
      createSnackbar("Can't continue with empty fields");
    }
  }

  void createSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(_scaffoldContext).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter nutrients ',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
              ),
            ),
            DropdownButton(
              underline: SizedBox(),
              iconEnabledColor: Colors.white,
              dropdownColor: Colors.blue,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
              ),
              value: _selectedUnit,
              items: units
                  .map(
                    (CalculatorUnit choice) => DropdownMenuItem(
                      value: choice,
                      child: Text(
                        choice.name,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: _onChangeUnit,
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          _scaffoldContext = context;

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _toggleKeyboard(context);
            },
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: EdgeInsets.all(
                  ResponsiveFlutter.of(context).moderateScale(8.0),
                ),
                children: <Widget>[
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(8.0),
                  ),
                  _renderMajorNutrientsCard(context),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(8.0),
                  ),
                  _renderMicroNutrientsCard(context),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(8.0),
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
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(8.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
