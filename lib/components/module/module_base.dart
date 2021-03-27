import 'package:flutter/material.dart';

class ModuleBase extends StatelessWidget {
  ModuleBase({
    Key key,
    @required this.title,
    // @required this.moduleTitle,
    @required this.images,
    @required this.content,
  });

  final String title;
  // final String moduleTitle;
  final List<AssetImage> images;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images
              .map((image) => Image(
                    image: image,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / images.length,
                  ))
              .toList(),
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
