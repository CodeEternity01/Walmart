import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutHackathon extends StatefulWidget {
  const AboutHackathon({super.key});

  @override
  _AboutHackathonState createState() => _AboutHackathonState();
}

class _AboutHackathonState extends State<AboutHackathon> {
  bool isLoading = true;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    const platformParams = PlatformWebViewControllerCreationParams();
    _controller = WebViewController.fromPlatformCreationParams(platformParams)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        
      )
      ..loadRequest(
        Uri.parse('https://walmart.converge.tech/content/converge/en_in/sparkathon.html'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Hackathon'),
        backgroundColor: const Color(0xFF0071CE),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
