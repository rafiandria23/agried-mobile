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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              // height: ResponsiveFlutter.of(context).verticalScale(100.0),
              child: Image(
                image: backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              // padding: EdgeInsets.only(
              //   left: ResponsiveFlutter.of(context).moderateScale(10.0),
              //   top: ResponsiveFlutter.of(context).moderateScale(12.0),
              //   right: ResponsiveFlutter.of(context).moderateScale(10.0),
              //   bottom: ResponsiveFlutter.of(context).moderateScale(0.0),
              // ),
              width: MediaQuery.of(context).size.width,
              child: title,
            ),
          ],
        ),
      ),
    );
  }
}
