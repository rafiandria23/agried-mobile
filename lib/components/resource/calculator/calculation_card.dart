import 'package:flutter/material.dart';
import 'package:agried/models.dart';

class CalculationCard extends StatelessWidget {
  final Calculation calculation;

  CalculationCard({
    Key? key,
    required this.calculation,
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
          // ResponsiveFlutter.of(context).moderateScale(24.0),
          24.0,
        ),
        // height: ResponsiveFlutter.of(context).verticalScale(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              calculation.fertilizer.name ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: ResponsiveFlutter.of(context).fontSize(
                //   2.5,
                // ),
              ),
            ),
            Text(
              calculation.fertilizer.nutrient,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey[500],
                // fontSize: ResponsiveFlutter.of(context).fontSize(
                //   1.5,
                // ),
              ),
            ),
            Text(
              '${calculation.result} ${calculation.unit.unit}',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: ResponsiveFlutter.of(context).fontSize(
                //   2.5,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
