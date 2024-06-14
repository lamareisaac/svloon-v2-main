import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetPage extends StatefulWidget {
  final String title;
  final String selectedUrl;

  WebViewWidgetPage({required this.title, required this.selectedUrl});

  @override
  State<WebViewWidgetPage> createState() => _WebViewWidgetPageState();
}

class _WebViewWidgetPageState extends State<WebViewWidgetPage> {
  bool isLoading = true;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
