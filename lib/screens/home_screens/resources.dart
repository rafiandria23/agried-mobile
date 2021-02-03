import 'package:flutter/material.dart';

class ResourcesScreen extends StatefulWidget {
  ResourcesScreen({Key key}) : super(key: key);

  static const String route = '/resources';

  @override
  _ResourcesScreenState createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: Center(
        child: Text('THIS IS RESOURCES'),
      ),
    );
  }
}
