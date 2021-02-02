import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard(
      {@required this.backgroundImage,
      @required this.title,
      @required this.onPressed});

  final AssetImage backgroundImage;
  final Widget title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image(image: backgroundImage, fit: BoxFit.fill),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
    );
  }
}
