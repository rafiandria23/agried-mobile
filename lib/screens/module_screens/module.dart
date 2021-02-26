import 'package:agried_mobile/screens.dart';
import 'package:flutter/material.dart';
import 'package:agried_mobile/components.dart';
import 'package:agried_mobile/models.dart';

class ModuleScreen extends StatelessWidget {
  final List<Module> modules;
  final int moduleIndex;

  ModuleScreen({
    Key key,
    @required this.modules,
    @required this.moduleIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modules[moduleIndex].moduleTitle),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'assets/icons/logo.png',
                    ),
                    height: 48.0,
                  ),
                ],
              ),
            ),
            ModuleBase(
              // moduleTitle: modules[moduleIndex].moduleTitle,
              title: modules[moduleIndex].title,
              images: modules[moduleIndex].images,
              content: modules[moduleIndex].content,
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/down_arrows.png'),
              ),
              padding: EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
              ),
              onPressed: () {
                if (modules.length == moduleIndex + 1) {
                  Navigator.pushNamed(context, LandingScreen.route);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleScreen(
                        modules: modules,
                        moduleIndex: moduleIndex + 1,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
