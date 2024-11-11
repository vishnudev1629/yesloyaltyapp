import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));
  }

  @override
  Widget build(BuildContext context) {
    final String broushureurl =
        ModalRoute.of(context)!.settings.arguments.toString();
    
    // Load the broushureurl once the controller is initialized
    controller.loadRequest(Uri.parse(broushureurl));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            HomeAppBar(
              onBackTap: () async {
                Navigator.of(context).pop();
              },
              isthereQr: false,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
