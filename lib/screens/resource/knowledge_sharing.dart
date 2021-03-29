import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowledgeSharingScreen extends StatefulWidget {
  KnowledgeSharingScreen({Key key}) : super(key: key);

  static const String route = '/resources/knowledge-sharing';

  @override
  _KnowledgeSharingScreenState createState() => _KnowledgeSharingScreenState();
}

class _KnowledgeSharingScreenState extends State<KnowledgeSharingScreen> {
  bool _loading = true;

  static const String URL = 'https://www.wur.nl/en/Library.htm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knowledge Sharing'),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: _loading ? LinearProgressIndicator() : SizedBox(),
        ),
      ),
      body: WebView(
        initialUrl: URL,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String finished) {
          setState(() {
            _loading = false;
          });
        },
      ),
    );
  }
}
