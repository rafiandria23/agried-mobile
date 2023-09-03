import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineReportingScreen extends StatefulWidget {
  final String reportURL;

  OnlineReportingScreen({
    Key? key,
    required this.reportURL,
  }) : super(key: key);

  @override
  _OnlineReportingScreenState createState() => _OnlineReportingScreenState(
    reportURL: reportURL,
  );
}

class _OnlineReportingScreenState extends State<OnlineReportingScreen> {
  final String reportURL;
  late WebViewController webViewController;

  late int _progress;

  _OnlineReportingScreenState({
    required this.reportURL,
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
    webViewController.loadRequest(Uri.parse(reportURL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Online Reporting',
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
