import 'package:flutter/material.dart';

class PrivateSectorScreen extends StatefulWidget {
  PrivateSectorScreen({Key key}) : super(key: key);

  static const String route = '/private_sector';

  @override
  _PrivateSectorScreenState createState() => _PrivateSectorScreenState();
}

class _PrivateSectorScreenState extends State<PrivateSectorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Private Sector'),
      ),
      body: Center(
        child: Text('THIS IS PRIVATE SECTOR'),
      ),
    );
  }
}
