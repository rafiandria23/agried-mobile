import 'package:flutter/material.dart';

class ReportingScreen extends StatefulWidget {
  ReportingScreen({Key key}) : super(key: key);

  static const String route = '/reporting';

  @override
  _ReportingScreenState createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting'),
      ),
      body: Center(
        child: Text('THIS IS REPORTING'),
      ),
    );
  }
}
