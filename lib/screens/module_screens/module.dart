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
        child: Column(
          children: <Widget>[
            ModuleBase(
              // moduleTitle: modules[moduleIndex].moduleTitle,
              title: modules[moduleIndex].title,
              images: modules[moduleIndex].images,
              content: modules[moduleIndex].content,
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              padding: EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
              ),
              color: Colors.blue,
              textColor: Colors.white,
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
              child: Text(
                'Sign In'.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
