import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ModuleBase extends StatelessWidget {
  ModuleBase({
    Key key,
    @required this.title,
    @required this.images,
    @required this.content,
  }) : super(key: key);

  final String title;
  final List<AssetImage> images;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images
              .map(
                (image) => Image(
                  image: image,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width / images.length,
                ),
              )
              .toList(),
        ),
        Padding(
          padding: EdgeInsets.all(
            ResponsiveFlutter.of(context).moderateScale(16.0),
          ),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ResponsiveFlutter.of(context).verticalScale(16.0),
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
