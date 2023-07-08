import 'package:flutter/material.dart';

class ModuleBase extends StatelessWidget {
  ModuleBase({
    Key? key,
    required this.title,
    required this.images,
    required this.content,
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
            16.0,
          ),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                content,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
