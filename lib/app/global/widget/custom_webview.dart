
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';



class CustomWebView extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: "https://amarkarigor.com/api/Payment/request_api_hosted",
          
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
        
          ),
        ],
      ),
    );
  }
}
