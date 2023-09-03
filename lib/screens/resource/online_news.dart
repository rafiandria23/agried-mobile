import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  int _progress = 0;

  _OnlineNewsScreenState({
    required this.title,
    required this.url,
  });

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progress = progress;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            print(
              'Current: ${url}\nRequest: ${request.url}\nResult: ${url.compareTo(request.url)}\nisMainFrame: ${request.isMainFrame}',
            );

            if (request.isMainFrame && url.compareTo(request.url) != 0) {
              launchUrl(
                Uri.parse(request.url),
                mode: LaunchMode.externalApplication,
              );
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.fade,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              webViewController.reload();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: _progress != 100
              ? LinearProgressIndicator(value: _progress / 100)
              : SizedBox(),
        ),
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
