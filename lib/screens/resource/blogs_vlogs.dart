import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogsVlogsScreen extends StatefulWidget {
  BlogsVlogsScreen({Key? key}) : super(key: key);

  static const String route = '/resources/blogs-vlogs';

  @override
  _BlogsVlogsScreenState createState() => _BlogsVlogsScreenState();
}

class _BlogsVlogsScreenState extends State<BlogsVlogsScreen> {
  static const String URL = 'https://agrieducate.com/blog';

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
        title: Text('Blogs / Vlogs'),
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
