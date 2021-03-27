import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineReportingScreen extends StatefulWidget {
  final String reportURL;

  OnlineReportingScreen({
    Key key,
    @required this.reportURL,
  }) : super(key: key);

  @override
  _OnlineReportingScreenState createState() => _OnlineReportingScreenState(
        reportURL: reportURL,
      );
}

class _OnlineReportingScreenState extends State<OnlineReportingScreen> {
  final String reportURL;

  _OnlineReportingScreenState({
    @required this.reportURL,
  });

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Online Reporting',
        ),
      ),
      body: WebView(
        initialUrl: reportURL,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
