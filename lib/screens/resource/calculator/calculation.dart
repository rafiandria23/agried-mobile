import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/models.dart';
import 'package:agried/components.dart';

class CalculationScreen extends StatefulWidget {
  CalculationScreen({Key key}) : super(key: key);

  static const String route = '/resources/calculator/calculations';

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  List<Calculation> _calculations;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    _calculations = arguments['calculations'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculations'),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          ResponsiveFlutter.of(context).moderateScale(8.0),
        ),
        children: _calculations
            .map((Calculation calculation) => CalculationCard(
                  calculation: calculation,
                ))
            .toList(),
      ),
    );
  }
}
