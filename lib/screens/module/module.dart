import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:agried/screens.dart';
import 'package:agried/components.dart';
import 'package:agried/models.dart';

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
            ModuleBase(
              title: modules[moduleIndex].title,
              images: modules[moduleIndex].images,
              content: modules[moduleIndex].content,
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(16.0),
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/down_arrows.png'),
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
