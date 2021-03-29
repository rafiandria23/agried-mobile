import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogsVlogsScreen extends StatefulWidget {
  BlogsVlogsScreen({Key key}) : super(key: key);

  static const String route = '/resources/blogs-vlogs';

  @override
  _BlogsVlogsScreenState createState() => _BlogsVlogsScreenState();
}

class _BlogsVlogsScreenState extends State<BlogsVlogsScreen> {
  bool _loading = true;

  static const String URL = 'https://agrieducate.com/blog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs / Vlogs'),
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
