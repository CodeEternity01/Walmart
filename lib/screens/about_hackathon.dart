import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutHackathon extends StatelessWidget {
  const AboutHackathon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        body: WebViewWidget(controller: WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams()
        )..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse('https://walmart.converge.tech/content/converge/en_in/sparkathon.html'))

        ),
    );
  }
}