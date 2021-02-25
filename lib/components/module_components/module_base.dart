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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: images
              .map((image) => Image(
                    image: image,
                  ))
              .toList(),
        ),
        Text(title),
        Text(content),
      ],
    );
  }
}
