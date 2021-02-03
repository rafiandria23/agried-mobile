import 'package:flutter/material.dart';

class ModulesScreen extends StatefulWidget {
  ModulesScreen({Key key}) : super(key: key);

  static const String route = '/modules';

  @override
  _ModulesScreenState createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
      ),
      body: Center(
        child: Text('THIS IS MODULES'),
      ),
    );
  }
}
