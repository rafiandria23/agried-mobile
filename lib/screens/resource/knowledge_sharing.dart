import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowledgeSharingScreen extends StatefulWidget {
  KnowledgeSharingScreen({Key? key}) : super(key: key);

  static const String route = '/resources/knowledge-sharing';

  @override
  _KnowledgeSharingScreenState createState() => _KnowledgeSharingScreenState();
}

class _KnowledgeSharingScreenState extends State<KnowledgeSharingScreen> {
  static const String URL = 'https://www.wur.nl/en/Library.htm';

  late WebViewController webViewController;

  int _progress = 0;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController();
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          setState(() {
            _progress = progress;
          });
        },
      ),
    );
    webViewController.loadRequest(Uri.parse(URL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knowledge Sharing'),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: LinearProgressIndicator(
            value: _progress / 100,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue,
            ),
          ),
        ),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
