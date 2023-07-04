import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineNewsScreen extends StatefulWidget {
  final String title;
  final String url;

  OnlineNewsScreen({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  _OnlineNewsScreenState createState() => _OnlineNewsScreenState(
        title: title,
        url: url,
      );
}

class _OnlineNewsScreenState extends State<OnlineNewsScreen> {
  final String title;
  final String url;
  late WebViewController webViewController;

  late int _progress;

  _OnlineNewsScreenState({
    required this.title,
    required this.url,
  });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
            // fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
          ),
        ),
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
