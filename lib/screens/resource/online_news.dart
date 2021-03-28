import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class OnlineNewsScreen extends StatefulWidget {
  final String title;
  final String url;

  OnlineNewsScreen({
    Key key,
    @required this.title,
    @required this.url,
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

  bool _loading = true;

  _OnlineNewsScreenState({
    @required this.title,
    @required this.url,
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
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
            fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: _loading ? LinearProgressIndicator() : SizedBox(),
        ),
      ),
      body: WebView(
        initialUrl: url,
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
