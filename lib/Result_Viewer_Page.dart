import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResultsViewer extends StatefulWidget {
  @override
  _ResultsViewerState createState() => _ResultsViewerState();
}

class _ResultsViewerState extends State<ResultsViewer> {
  final String resultsUrl =
      'https://collegeadmissions.gndu.ac.in/studentArea/GNDUEXAMRESULT.aspx';
  bool isLoading = true;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(resultsUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Examination Results"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Column(
        children: [
          if (isLoading)
            LinearProgressIndicator(
              backgroundColor: Colors.blue.shade100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
            ),
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
