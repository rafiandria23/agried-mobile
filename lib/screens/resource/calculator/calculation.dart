import 'package:flutter/material.dart';
import 'package:agried/models.dart';
import 'package:agried/components.dart';

class CalculationScreen extends StatefulWidget {
  CalculationScreen({Key? key}) : super(key: key);

  static const String route = '/resources/calculator/calculations';

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  List<Calculation>? _calculations;

  void _handleBack(BuildContext context) {
    Navigator.of(context).popUntil(
      (Route<dynamic> route) => route.settings.name == '/resources/calculator',
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    _calculations = arguments['calculations'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculations'),
        leading: IconButton(
          icon: Icon(
            Theme.of(context).platform == TargetPlatform.iOS
                ? Icons.arrow_back_ios
                : Icons.arrow_back,
          ),
          onPressed: () {
            _handleBack(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          // ResponsiveFlutter.of(context).moderateScale(8.0),
          8.0
        ),
        children: _calculations!.map((Calculation calculation) => CalculationCard(
                  calculation: calculation,
                ))
            .toList(),
      ),
    );
  }
}
