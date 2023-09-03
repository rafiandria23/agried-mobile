import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final AssetImage backgroundImage;
  final Widget title;
  final VoidCallback onTap;

  HomeCard(
      {Key? key,
      required this.backgroundImage,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 150.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image(
                    image: backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 20.0,
                    right: 20.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: title,
                ),
              ],
            ),
          ),
        ));
  }
}
