import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard(
      {Key key,
      @required this.backgroundImage,
      @required this.title,
      @required this.onTap})
      : super(key: key);

  final AssetImage backgroundImage;
  final Widget title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   semanticContainer: true,
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     decoration: BoxDecoration(
    //         image: DecorationImage(image: backgroundImage, fit: BoxFit.fill)),
    //     child: title,
    //   ),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    //   elevation: 5,
    // );

    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
