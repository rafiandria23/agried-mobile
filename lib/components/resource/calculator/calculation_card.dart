import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/models.dart';

class CalculationCard extends StatelessWidget {
  final Calculation calculation;

  CalculationCard({
    Key key,
    @required this.calculation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(
          ResponsiveFlutter.of(context).moderateScale(16.0),
        ),
        height: ResponsiveFlutter.of(context).verticalScale(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(calculation.fertilizer.name),
            Text(calculation.fertilizer.nutrient),
            Text('${calculation.result} ${calculation.unit.unit}'),
          ],
        ),
      ),
    );
  }
}
