import 'package:flutter/material.dart';

class KnowledgeSharingScreen extends StatefulWidget {
  KnowledgeSharingScreen({Key key}) : super(key: key);

  static const String route = '/resources/knowledge-sharing';

  @override
  _KnowledgeSharingScreenState createState() => _KnowledgeSharingScreenState();
}

class _KnowledgeSharingScreenState extends State<KnowledgeSharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knowledge Sharing'),
      ),
    );
  }
}
